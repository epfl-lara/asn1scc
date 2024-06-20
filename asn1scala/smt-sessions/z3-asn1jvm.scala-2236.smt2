; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56826 () Bool)

(assert start!56826)

(declare-fun res!218795 () Bool)

(declare-fun e!181814 () Bool)

(assert (=> start!56826 (=> (not res!218795) (not e!181814))))

(declare-datatypes ((array!14462 0))(
  ( (array!14463 (arr!7301 (Array (_ BitVec 32) (_ BitVec 8))) (size!6314 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11550 0))(
  ( (BitStream!11551 (buf!6836 array!14462) (currentByte!12625 (_ BitVec 32)) (currentBit!12620 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11550)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56826 (= res!218795 (validate_offset_bit!0 ((_ sign_extend 32) (size!6314 (buf!6836 thiss!914))) ((_ sign_extend 32) (currentByte!12625 thiss!914)) ((_ sign_extend 32) (currentBit!12620 thiss!914))))))

(assert (=> start!56826 e!181814))

(declare-fun e!181815 () Bool)

(declare-fun inv!12 (BitStream!11550) Bool)

(assert (=> start!56826 (and (inv!12 thiss!914) e!181815)))

(assert (=> start!56826 true))

(declare-fun b!261379 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261379 (= e!181814 (and (not b!187) (let ((bdg!16233 (bvand ((_ sign_extend 24) (select (arr!7301 (buf!6836 thiss!914)) (currentByte!12625 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12620 thiss!914))))))) (and (bvslt bdg!16233 #b00000000000000000000000010000000) (bvslt bdg!16233 #b11111111111111111111111110000000)))))))

(declare-fun b!261380 () Bool)

(declare-fun array_inv!6055 (array!14462) Bool)

(assert (=> b!261380 (= e!181815 (array_inv!6055 (buf!6836 thiss!914)))))

(assert (= (and start!56826 res!218795) b!261379))

(assert (= start!56826 b!261380))

(declare-fun m!391139 () Bool)

(assert (=> start!56826 m!391139))

(declare-fun m!391141 () Bool)

(assert (=> start!56826 m!391141))

(declare-fun m!391143 () Bool)

(assert (=> b!261379 m!391143))

(declare-fun m!391145 () Bool)

(assert (=> b!261379 m!391145))

(declare-fun m!391147 () Bool)

(assert (=> b!261380 m!391147))

(check-sat (not start!56826) (not b!261380))
(check-sat)
