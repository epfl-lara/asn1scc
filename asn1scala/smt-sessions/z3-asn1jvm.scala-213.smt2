; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4272 () Bool)

(assert start!4272)

(declare-fun res!15533 () Bool)

(declare-fun e!11303 () Bool)

(assert (=> start!4272 (=> (not res!15533) (not e!11303))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4272 (= res!15533 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4272 e!11303))

(assert (=> start!4272 true))

(declare-datatypes ((array!1171 0))(
  ( (array!1172 (arr!926 (Array (_ BitVec 32) (_ BitVec 8))) (size!497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!864 0))(
  ( (BitStream!865 (buf!815 array!1171) (currentByte!2024 (_ BitVec 32)) (currentBit!2019 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!864)

(declare-fun e!11302 () Bool)

(declare-fun inv!12 (BitStream!864) Bool)

(assert (=> start!4272 (and (inv!12 thiss!1917) e!11302)))

(declare-fun b!17604 () Bool)

(declare-fun res!15532 () Bool)

(assert (=> b!17604 (=> (not res!15532) (not e!11303))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17604 (= res!15532 (validate_offset_bits!1 ((_ sign_extend 32) (size!497 (buf!815 thiss!1917))) ((_ sign_extend 32) (currentByte!2024 thiss!1917)) ((_ sign_extend 32) (currentBit!2019 thiss!1917)) nBits!604))))

(declare-fun b!17605 () Bool)

(declare-datatypes ((tuple2!2056 0))(
  ( (tuple2!2057 (_1!1092 array!1171) (_2!1092 BitStream!864)) )
))
(declare-fun lt!25372 () tuple2!2056)

(assert (=> b!17605 (= e!11303 (not (or (not (= (currentByte!2024 thiss!1917) (size!497 (buf!815 (_2!1092 lt!25372))))) (= (currentBit!2019 (_2!1092 lt!25372)) #b00000000000000000000000000000000))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17605 (invariant!0 (currentBit!2019 (_2!1092 lt!25372)) (currentByte!2024 (_2!1092 lt!25372)) (size!497 (buf!815 (_2!1092 lt!25372))))))

(declare-fun readBits!0 (BitStream!864 (_ BitVec 64)) tuple2!2056)

(assert (=> b!17605 (= lt!25372 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17606 () Bool)

(declare-fun array_inv!467 (array!1171) Bool)

(assert (=> b!17606 (= e!11302 (array_inv!467 (buf!815 thiss!1917)))))

(assert (= (and start!4272 res!15533) b!17604))

(assert (= (and b!17604 res!15532) b!17605))

(assert (= start!4272 b!17606))

(declare-fun m!23927 () Bool)

(assert (=> start!4272 m!23927))

(declare-fun m!23929 () Bool)

(assert (=> b!17604 m!23929))

(declare-fun m!23931 () Bool)

(assert (=> b!17605 m!23931))

(declare-fun m!23933 () Bool)

(assert (=> b!17605 m!23933))

(declare-fun m!23935 () Bool)

(assert (=> b!17606 m!23935))

(check-sat (not b!17605) (not b!17604) (not b!17606) (not start!4272))
(check-sat)
(get-model)

(declare-fun d!5796 () Bool)

(assert (=> d!5796 (= (invariant!0 (currentBit!2019 (_2!1092 lt!25372)) (currentByte!2024 (_2!1092 lt!25372)) (size!497 (buf!815 (_2!1092 lt!25372)))) (and (bvsge (currentBit!2019 (_2!1092 lt!25372)) #b00000000000000000000000000000000) (bvslt (currentBit!2019 (_2!1092 lt!25372)) #b00000000000000000000000000001000) (bvsge (currentByte!2024 (_2!1092 lt!25372)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2024 (_2!1092 lt!25372)) (size!497 (buf!815 (_2!1092 lt!25372)))) (and (= (currentBit!2019 (_2!1092 lt!25372)) #b00000000000000000000000000000000) (= (currentByte!2024 (_2!1092 lt!25372)) (size!497 (buf!815 (_2!1092 lt!25372))))))))))

(assert (=> b!17605 d!5796))

(declare-fun b!17651 () Bool)

(declare-fun res!15577 () Bool)

(declare-fun e!11320 () Bool)

(assert (=> b!17651 (=> (not res!15577) (not e!11320))))

(declare-fun lt!25438 () (_ BitVec 64))

(declare-fun lt!25446 () tuple2!2056)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!17651 (= res!15577 (= (bvadd lt!25438 nBits!604) (bitIndex!0 (size!497 (buf!815 (_2!1092 lt!25446))) (currentByte!2024 (_2!1092 lt!25446)) (currentBit!2019 (_2!1092 lt!25446)))))))

(assert (=> b!17651 (or (not (= (bvand lt!25438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!25438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!25438 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17651 (= lt!25438 (bitIndex!0 (size!497 (buf!815 thiss!1917)) (currentByte!2024 thiss!1917) (currentBit!2019 thiss!1917)))))

(declare-fun b!17652 () Bool)

(declare-fun res!15579 () Bool)

(assert (=> b!17652 (=> (not res!15579) (not e!11320))))

(assert (=> b!17652 (= res!15579 (bvsle (currentByte!2024 thiss!1917) (currentByte!2024 (_2!1092 lt!25446))))))

(declare-fun d!5804 () Bool)

(assert (=> d!5804 e!11320))

(declare-fun res!15574 () Bool)

(assert (=> d!5804 (=> (not res!15574) (not e!11320))))

(assert (=> d!5804 (= res!15574 (= (buf!815 (_2!1092 lt!25446)) (buf!815 thiss!1917)))))

(declare-datatypes ((Unit!1578 0))(
  ( (Unit!1579) )
))
(declare-datatypes ((tuple3!116 0))(
  ( (tuple3!117 (_1!1094 Unit!1578) (_2!1094 BitStream!864) (_3!64 array!1171)) )
))
(declare-fun lt!25432 () tuple3!116)

(assert (=> d!5804 (= lt!25446 (tuple2!2057 (_3!64 lt!25432) (_2!1094 lt!25432)))))

(declare-fun readBitsLoop!0 (BitStream!864 (_ BitVec 64) array!1171 (_ BitVec 64) (_ BitVec 64)) tuple3!116)

(assert (=> d!5804 (= lt!25432 (readBitsLoop!0 thiss!1917 nBits!604 (array!1172 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5804 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5804 (= (readBits!0 thiss!1917 nBits!604) lt!25446)))

(declare-fun b!17653 () Bool)

(declare-datatypes ((List!194 0))(
  ( (Nil!191) (Cons!190 (h!309 Bool) (t!944 List!194)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!864 array!1171 (_ BitVec 64) (_ BitVec 64)) List!194)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!864 BitStream!864 (_ BitVec 64)) List!194)

(assert (=> b!17653 (= e!11320 (= (byteArrayBitContentToList!0 (_2!1092 lt!25446) (_1!1092 lt!25446) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1092 lt!25446) thiss!1917 nBits!604)))))

(declare-fun b!17654 () Bool)

(declare-fun res!15578 () Bool)

(assert (=> b!17654 (=> (not res!15578) (not e!11320))))

(assert (=> b!17654 (= res!15578 (invariant!0 (currentBit!2019 (_2!1092 lt!25446)) (currentByte!2024 (_2!1092 lt!25446)) (size!497 (buf!815 (_2!1092 lt!25446)))))))

(declare-fun b!17655 () Bool)

(declare-fun res!15575 () Bool)

(assert (=> b!17655 (=> (not res!15575) (not e!11320))))

(declare-fun lt!25445 () (_ BitVec 64))

(assert (=> b!17655 (= res!15575 (= (size!497 (_1!1092 lt!25446)) ((_ extract 31 0) lt!25445)))))

(assert (=> b!17655 (and (bvslt lt!25445 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!25445 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!25448 () (_ BitVec 64))

(declare-fun lt!25436 () (_ BitVec 64))

(assert (=> b!17655 (= lt!25445 (bvsdiv lt!25448 lt!25436))))

(assert (=> b!17655 (and (not (= lt!25436 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!25448 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!25436 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!17655 (= lt!25436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!25434 () (_ BitVec 64))

(declare-fun lt!25437 () (_ BitVec 64))

(assert (=> b!17655 (= lt!25448 (bvsub lt!25434 lt!25437))))

(assert (=> b!17655 (or (= (bvand lt!25434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!25434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!25434 lt!25437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17655 (= lt!25437 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!25440 () (_ BitVec 64))

(assert (=> b!17655 (= lt!25434 (bvadd nBits!604 lt!25440))))

(assert (=> b!17655 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25440 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!25440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17655 (= lt!25440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!5804 res!15574) b!17651))

(assert (= (and b!17651 res!15577) b!17654))

(assert (= (and b!17654 res!15578) b!17655))

(assert (= (and b!17655 res!15575) b!17652))

(assert (= (and b!17652 res!15579) b!17653))

(declare-fun m!23957 () Bool)

(assert (=> b!17651 m!23957))

(declare-fun m!23963 () Bool)

(assert (=> b!17651 m!23963))

(declare-fun m!23969 () Bool)

(assert (=> d!5804 m!23969))

(declare-fun m!23975 () Bool)

(assert (=> b!17653 m!23975))

(declare-fun m!23981 () Bool)

(assert (=> b!17653 m!23981))

(declare-fun m!23983 () Bool)

(assert (=> b!17654 m!23983))

(assert (=> b!17605 d!5804))

(declare-fun d!5812 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!497 (buf!815 thiss!1917))) ((_ sign_extend 32) (currentByte!2024 thiss!1917)) ((_ sign_extend 32) (currentBit!2019 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!497 (buf!815 thiss!1917))) ((_ sign_extend 32) (currentByte!2024 thiss!1917)) ((_ sign_extend 32) (currentBit!2019 thiss!1917))) nBits!604))))

(declare-fun bs!1659 () Bool)

(assert (= bs!1659 d!5812))

(declare-fun m!23989 () Bool)

(assert (=> bs!1659 m!23989))

(assert (=> b!17604 d!5812))

(declare-fun d!5814 () Bool)

(assert (=> d!5814 (= (array_inv!467 (buf!815 thiss!1917)) (bvsge (size!497 (buf!815 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17606 d!5814))

(declare-fun d!5818 () Bool)

(assert (=> d!5818 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2019 thiss!1917) (currentByte!2024 thiss!1917) (size!497 (buf!815 thiss!1917))))))

(declare-fun bs!1661 () Bool)

(assert (= bs!1661 d!5818))

(declare-fun m!23993 () Bool)

(assert (=> bs!1661 m!23993))

(assert (=> start!4272 d!5818))

(check-sat (not b!17654) (not d!5812) (not b!17653) (not b!17651) (not d!5804) (not d!5818))
