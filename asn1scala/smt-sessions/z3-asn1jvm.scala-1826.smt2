; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49100 () Bool)

(assert start!49100)

(declare-fun b!233210 () Bool)

(declare-fun e!160661 () Bool)

(declare-datatypes ((array!12042 0))(
  ( (array!12043 (arr!6272 (Array (_ BitVec 32) (_ BitVec 8))) (size!5285 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9666 0))(
  ( (BitStream!9667 (buf!5826 array!12042) (currentByte!10842 (_ BitVec 32)) (currentBit!10837 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9666)

(declare-fun array_inv!5026 (array!12042) Bool)

(assert (=> b!233210 (= e!160661 (array_inv!5026 (buf!5826 b1!101)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369210 () (_ BitVec 64))

(declare-fun lt!369208 () (_ BitVec 64))

(declare-fun lt!369209 () (_ BitVec 64))

(declare-fun b!233211 () Bool)

(declare-fun e!160664 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9666)

(assert (=> b!233211 (= e!160664 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5285 (buf!5826 b1!101)))) lt!369209) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14402 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10842 b2!99))) ((_ sign_extend 32) (currentBit!10837 b2!99))))) (and (= lt!369210 bdg!14402) (= (bvsub lt!369210 bits!86) lt!369209) (let ((bdg!14403 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5285 (buf!5826 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14403 (bvsub bdg!14402 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14403 bdg!14402) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369208)) (bvslt lt!369208 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!369208 #b1111111111111111111111111111111110000000000000000000000000000000)))))))))

(assert (=> b!233211 (= lt!369209 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10842 b1!101))) ((_ sign_extend 32) (currentBit!10837 b1!101))))))

(declare-fun b!233212 () Bool)

(declare-fun res!195109 () Bool)

(assert (=> b!233212 (=> (not res!195109) (not e!160664))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233212 (= res!195109 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5285 (buf!5826 b1!101))) ((_ sign_extend 32) (currentByte!10842 b1!101)) ((_ sign_extend 32) (currentBit!10837 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233213 () Bool)

(declare-fun e!160660 () Bool)

(assert (=> b!233213 (= e!160660 e!160664)))

(declare-fun res!195113 () Bool)

(assert (=> b!233213 (=> (not res!195113) (not e!160664))))

(assert (=> b!233213 (= res!195113 (bvsle ((_ extract 31 0) lt!369208) bytes!19))))

(assert (=> b!233213 (= lt!369208 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233214 () Bool)

(declare-fun res!195112 () Bool)

(assert (=> b!233214 (=> (not res!195112) (not e!160664))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233214 (= res!195112 (= lt!369210 (bvadd (bitIndex!0 (size!5285 (buf!5826 b1!101)) (currentByte!10842 b1!101) (currentBit!10837 b1!101)) bits!86)))))

(declare-fun res!195110 () Bool)

(declare-fun e!160659 () Bool)

(assert (=> start!49100 (=> (not res!195110) (not e!160659))))

(assert (=> start!49100 (= res!195110 (and (= (size!5285 (buf!5826 b1!101)) (size!5285 (buf!5826 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49100 e!160659))

(declare-fun inv!12 (BitStream!9666) Bool)

(assert (=> start!49100 (and (inv!12 b1!101) e!160661)))

(declare-fun e!160662 () Bool)

(assert (=> start!49100 (and (inv!12 b2!99) e!160662)))

(assert (=> start!49100 true))

(declare-fun b!233209 () Bool)

(assert (=> b!233209 (= e!160659 e!160660)))

(declare-fun res!195111 () Bool)

(assert (=> b!233209 (=> (not res!195111) (not e!160660))))

(assert (=> b!233209 (= res!195111 (bvsle bits!86 lt!369210))))

(assert (=> b!233209 (= lt!369210 (bitIndex!0 (size!5285 (buf!5826 b2!99)) (currentByte!10842 b2!99) (currentBit!10837 b2!99)))))

(declare-fun b!233215 () Bool)

(assert (=> b!233215 (= e!160662 (array_inv!5026 (buf!5826 b2!99)))))

(declare-fun b!233216 () Bool)

(declare-fun res!195114 () Bool)

(assert (=> b!233216 (=> (not res!195114) (not e!160664))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233216 (= res!195114 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5285 (buf!5826 b1!101))) ((_ sign_extend 32) (currentByte!10842 b1!101)) ((_ sign_extend 32) (currentBit!10837 b1!101)) bytes!19))))

(assert (= (and start!49100 res!195110) b!233209))

(assert (= (and b!233209 res!195111) b!233213))

(assert (= (and b!233213 res!195113) b!233216))

(assert (= (and b!233216 res!195114) b!233214))

(assert (= (and b!233214 res!195112) b!233212))

(assert (= (and b!233212 res!195109) b!233211))

(assert (= start!49100 b!233210))

(assert (= start!49100 b!233215))

(declare-fun m!355893 () Bool)

(assert (=> b!233216 m!355893))

(declare-fun m!355895 () Bool)

(assert (=> b!233215 m!355895))

(declare-fun m!355897 () Bool)

(assert (=> b!233212 m!355897))

(declare-fun m!355899 () Bool)

(assert (=> b!233209 m!355899))

(declare-fun m!355901 () Bool)

(assert (=> start!49100 m!355901))

(declare-fun m!355903 () Bool)

(assert (=> start!49100 m!355903))

(declare-fun m!355905 () Bool)

(assert (=> b!233214 m!355905))

(declare-fun m!355907 () Bool)

(assert (=> b!233210 m!355907))

(check-sat (not b!233214) (not b!233212) (not b!233210) (not b!233215) (not start!49100) (not b!233216) (not b!233209))
(check-sat)
