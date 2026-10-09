varying vec3 vWorldPosition; varying vec3 vNormal; varying float vWaveHeight; void main() { vec3 viewDir = normalize(cameraPosition - vWorldPosition); vec3 norm = normalize(vNormal); float fresnel = pow(clamp(1.0 - dot(viewDir, norm), 0.0, 1.0), 3.0); float diff = max(dot(norm, normalize(uSunDirection)), 0.0); vec3 reflectDir = reflect(-normalize(uSunDirection), norm); float spec = pow(max(dot(viewDir, reflectDir), 0.0), 128.0); vec3 waterColor = mix(uDeepColor, uShallowColor, smoothstep(-2.0, 3.0, vWaveHeight)); vec3 finalColor = waterColor * (0.65 + diff * 0.35) + vec3(spec); finalColor = mix(finalColor, vec3(0.5, 0.7, 0.8), fresnel); if (vWaveHeight > 1.8) finalColor = mix(finalColor, uFoamColor, smoothstep(1.8, 2.5, vWaveHeight)); gl_FragColor = vec4(finalColor, 0.92); } ` };
      const h = this.getWaveHeight(object.position.x, object.position.z, time);
      object.position.y = THREE.MathUtils.lerp(object.position.y, h, delta * 4);
      return;
    }
    object.updateMatrixWorld(true);
    const pts = floatPoints.map(pt => {
      const worldPt = pt.clone().applyMatrix4(object.matrixWorld);
      return { worldPt, h: this.getWaveHeight(worldPt.x, worldPt.z, time) };
    });
    const avgHeight = pts.reduce((sum, p) => sum + p.h, 0) / pts.length;
    object.position.y = THREE.MathUtils.lerp(object.position.y, avgHeight, delta * 5);
    if (pts.length >= 4) {
      const pitch = Math.atan2((pts[0].h + pts[1].h) / 2 - (pts[2].h + pts[3].h) / 2, 3);
      const roll = Math.atan2((pts[0].h + pts[2].h) / 2 - (pts[1].h + pts[3].h) / 2, 3);
      object.rotation.x = THREE.MathUtils.lerp(object.rotation.x, pitch, delta * 3);
      object.rotation.z = THREE.MathUtils.lerp(object.rotation.z, roll, delta * 3);
    }
  }
}
    new THREE.MeshStandardMaterial({ color: 0x8b5a2b, roughness: 0.75 })
    );
    mesh.position.set(playerPos.x + Math.cos(angle) * distance, 0, playerPos.z + Math.sin(angle) * distance);
    this.scene.add(mesh);
    this.chests.set(id, { id, mesh, rarity: this.rollRarity() });
  }

  rollRarity() {
    const roll = Math.random();
    if (roll > 0.995) return 'UNIQUE';
    if (roll > 0.98) return 'LEGENDARY';
    if (roll > 0.90) return 'EPIC';
    if (roll > 0.75) return 'RARE';
    if (roll > 0.50) return 'UNCOMMON';
    return 'COMMON';
  }
}
const recipients = [];
  for (const [targetId, target] of players) {
    if (targetId === senderId) continue;
    const distance = Math.hypot(target.x - sender.x, target.z - sender.z);
    if (distance <= RADIO_MAX_DISTANCE) recipients.push({ target, distance });
  }
  recipients.sort((a, b) => a.distance - b.distance);
  for (const { target, distance } of recipients) {
    if (target.ws.readyState === target.ws.OPEN) {
      target.ws.send(JSON.stringify({ type: 'RADIO_ALERT', fromPlayer: senderId, callType, distance: Math.round(distance), message }));
    }
  }
}

console.log('Ocean server running


CREATE TABLE payment_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  player_id UUID NOT NULL REFERENCES players(id) ON DELETE CASCADE,
  store_item_id UUID NOT NULL REFERENCES store_items(id),
  amount NUMERIC(10,2) NOT NULL,
  payment_method VARCHAR(32) NOT NULL,
  status VARCHAR(32) NOT NULL DEFAULT 'PENDING',
  provider_reference VARCHAR(128),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_inventories_player ON inventories(player_id);
CREATE INDEX idx_ships_coords ON ships(pos_x, pos_z);
CREATE INDEX idx_payment_player ON payment_transactions(player_id, created_at DESC);
           updated_at = NOW()
       WHERE id = $3 RETURNING *`,
      [price_egp ?? null, is_active ?? null, req.params.id]
    );
    if (!result.rowCount) return res.status(404).json({ error: 'المورد غير موجود' });
    res.json({ success: true, updatedItem: result.rows[0] });
  } catch {
    res.status(500).json({ error: 'فشل تحديث السعر' });
  }
});

           updated_at = NOW()
       WHERE id = $3 RETURNING *`,
      [price_egp ?? null, is_active ?? null, req.params.id]
    );
    if (!result.rowCount) return res.status(404).json({ error: 'المورد غير موجود' });
    res.json({ success: true, updatedItem: result.rows[0] });
  } catch {
    res.status(500).json({ error: 'فشل تحديث السعر' });
  }
});

export default router;
          <button onClick={onClose} style={styles.cancelBtn}>إلغاء</button>
        </div>
      </div>
    </div>
  );
}

const styles = {
  overlay: { position: 'fixed', inset: 0, backgroundColor: 'rgba(0,0,0,.7)', display: 'flex', alignItems: 'center', justifyContent: 'center', zIndex: 1000 },
  modal: { background: '#132235', color: '#fff', padding: 24, borderRadius: 12, width: 'min(420px, 92vw)', fontFamily: 'sans-serif' },
  methods: { display: 'flex', gap: 8, marginBottom: 16, flexWrap: 'wrap' },
  tab: { flex: 1, padding: 10, background: '#20374f', border: 0, color: '#ccc', cursor: 'pointer', borderRadius: 6 },
  activeTab: { flex: 1, padding: 10, background: '#0088cc', border: 0, color: '#fff', fontWeight: 'bold', borderRadius: 6 },
  actions: { display: 'flex', gap: 10, marginTop: 18 },
  confirmBtn: { flex: 2, padding: 10, background: '#28a745', border: 0, color: '#fff', borderRadius: 6, cursor: 'pointer' },
  cancelBtn: { flex: 1, padding: 10, background: '#6c757d', border: 0, color: '#fff', borderRadius: 6, cursor: 'pointer' }
};