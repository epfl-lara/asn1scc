; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50932 () Bool)

(assert start!50932)

(declare-fun b!238700 () Bool)

(declare-fun e!164898 () Bool)

(declare-fun e!164895 () Bool)

(assert (=> b!238700 (= e!164898 e!164895)))

(declare-fun res!199529 () Bool)

(assert (=> b!238700 (=> (not res!199529) (not e!164895))))

(declare-datatypes ((array!12738 0))(
  ( (array!12739 (arr!6584 (Array (_ BitVec 32) (_ BitVec 8))) (size!5597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10158 0))(
  ( (BitStream!10159 (buf!6072 array!12738) (currentByte!11258 (_ BitVec 32)) (currentBit!11253 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10158)

(declare-fun lt!373395 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238700 (= res!199529 (validate_offset_bits!1 ((_ sign_extend 32) (size!5597 (buf!6072 thiss!1830))) ((_ sign_extend 32) (currentByte!11258 thiss!1830)) ((_ sign_extend 32) (currentBit!11253 thiss!1830)) lt!373395))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238700 (= lt!373395 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun res!199531 () Bool)

(assert (=> start!50932 (=> (not res!199531) (not e!164898))))

(assert (=> start!50932 (= res!199531 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50932 e!164898))

(assert (=> start!50932 true))

(declare-fun e!164900 () Bool)

(declare-fun inv!12 (BitStream!10158) Bool)

(assert (=> start!50932 (and (inv!12 thiss!1830) e!164900)))

(declare-fun e!164897 () Bool)

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun lt!373392 () (_ BitVec 64))

(declare-datatypes ((tuple2!20182 0))(
  ( (tuple2!20183 (_1!10995 (_ BitVec 64)) (_2!10995 BitStream!10158)) )
))
(declare-fun lt!373394 () tuple2!20182)

(declare-fun b!238701 () Bool)

(assert (=> b!238701 (= e!164897 (and (= (bvlshr (_1!10995 lt!373394) lt!373395) (bvlshr acc!170 lt!373395)) (= (bvand (_1!10995 lt!373394) lt!373392) (_1!10995 lt!373394)) (bvslt i!752 nBits!581) (let ((bdg!14583 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752)))) (or (bvslt bdg!14583 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14583 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun b!238702 () Bool)

(declare-fun res!199528 () Bool)

(assert (=> b!238702 (=> (not res!199528) (not e!164897))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238702 (= res!199528 (= (bitIndex!0 (size!5597 (buf!6072 (_2!10995 lt!373394))) (currentByte!11258 (_2!10995 lt!373394)) (currentBit!11253 (_2!10995 lt!373394))) (bvadd (bitIndex!0 (size!5597 (buf!6072 thiss!1830)) (currentByte!11258 thiss!1830) (currentBit!11253 thiss!1830)) lt!373395)))))

(declare-fun b!238703 () Bool)

(declare-fun array_inv!5338 (array!12738) Bool)

(assert (=> b!238703 (= e!164900 (array_inv!5338 (buf!6072 thiss!1830)))))

(declare-fun b!238704 () Bool)

(declare-fun e!164899 () Bool)

(assert (=> b!238704 (= e!164895 e!164899)))

(declare-fun res!199532 () Bool)

(assert (=> b!238704 (=> (not res!199532) (not e!164899))))

(assert (=> b!238704 (= res!199532 (and (= (bvand acc!170 lt!373392) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238704 (= lt!373392 (onesLSBLong!0 nBits!581))))

(declare-fun b!238705 () Bool)

(declare-fun res!199533 () Bool)

(assert (=> b!238705 (=> (not res!199533) (not e!164895))))

(assert (=> b!238705 (= res!199533 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238706 () Bool)

(assert (=> b!238706 (= e!164899 e!164897)))

(declare-fun res!199530 () Bool)

(assert (=> b!238706 (=> (not res!199530) (not e!164897))))

(assert (=> b!238706 (= res!199530 (= (buf!6072 (_2!10995 lt!373394)) (buf!6072 thiss!1830)))))

(declare-datatypes ((tuple2!20184 0))(
  ( (tuple2!20185 (_1!10996 Bool) (_2!10996 BitStream!10158)) )
))
(declare-fun lt!373393 () tuple2!20184)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20182)

(assert (=> b!238706 (= lt!373394 (readNLeastSignificantBitsLoop!0 (_2!10996 lt!373393) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10996 lt!373393) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10158) tuple2!20184)

(assert (=> b!238706 (= lt!373393 (readBit!0 thiss!1830))))

(assert (= (and start!50932 res!199531) b!238700))

(assert (= (and b!238700 res!199529) b!238705))

(assert (= (and b!238705 res!199533) b!238704))

(assert (= (and b!238704 res!199532) b!238706))

(assert (= (and b!238706 res!199530) b!238702))

(assert (= (and b!238702 res!199528) b!238701))

(assert (= start!50932 b!238703))

(declare-fun m!360789 () Bool)

(assert (=> b!238703 m!360789))

(declare-fun m!360791 () Bool)

(assert (=> b!238706 m!360791))

(declare-fun m!360793 () Bool)

(assert (=> b!238706 m!360793))

(declare-fun m!360795 () Bool)

(assert (=> b!238700 m!360795))

(declare-fun m!360797 () Bool)

(assert (=> b!238702 m!360797))

(declare-fun m!360799 () Bool)

(assert (=> b!238702 m!360799))

(declare-fun m!360801 () Bool)

(assert (=> b!238704 m!360801))

(declare-fun m!360803 () Bool)

(assert (=> start!50932 m!360803))

(declare-fun m!360805 () Bool)

(assert (=> b!238705 m!360805))

(check-sat (not b!238702) (not b!238703) (not b!238700) (not b!238704) (not b!238705) (not b!238706) (not start!50932))
(check-sat)
