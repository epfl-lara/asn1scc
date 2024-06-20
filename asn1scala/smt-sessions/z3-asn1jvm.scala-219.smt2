; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4518 () Bool)

(assert start!4518)

(declare-fun res!16153 () Bool)

(declare-fun e!11773 () Bool)

(assert (=> start!4518 (=> (not res!16153) (not e!11773))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4518 (= res!16153 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4518 e!11773))

(assert (=> start!4518 true))

(declare-datatypes ((array!1222 0))(
  ( (array!1223 (arr!956 (Array (_ BitVec 32) (_ BitVec 8))) (size!515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!900 0))(
  ( (BitStream!901 (buf!833 array!1222) (currentByte!2084 (_ BitVec 32)) (currentBit!2079 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!900)

(declare-fun e!11775 () Bool)

(declare-fun inv!12 (BitStream!900) Bool)

(assert (=> start!4518 (and (inv!12 thiss!1917) e!11775)))

(declare-fun b!18422 () Bool)

(declare-fun res!16154 () Bool)

(assert (=> b!18422 (=> (not res!16154) (not e!11773))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18422 (= res!16154 (validate_offset_bits!1 ((_ sign_extend 32) (size!515 (buf!833 thiss!1917))) ((_ sign_extend 32) (currentByte!2084 thiss!1917)) ((_ sign_extend 32) (currentBit!2079 thiss!1917)) nBits!604))))

(declare-fun b!18425 () Bool)

(declare-fun array_inv!485 (array!1222) Bool)

(assert (=> b!18425 (= e!11775 (array_inv!485 (buf!833 thiss!1917)))))

(declare-fun b!18424 () Bool)

(declare-fun e!11774 () Bool)

(declare-datatypes ((tuple2!2128 0))(
  ( (tuple2!2129 (_1!1143 array!1222) (_2!1143 BitStream!900)) )
))
(declare-fun lt!26677 () tuple2!2128)

(assert (=> b!18424 (= e!11774 (inv!12 (BitStream!901 (buf!833 (_2!1143 lt!26677)) (currentByte!2084 thiss!1917) (currentBit!2079 thiss!1917))))))

(declare-fun b!18423 () Bool)

(assert (=> b!18423 (= e!11773 (not e!11774))))

(declare-fun res!16152 () Bool)

(assert (=> b!18423 (=> res!16152 e!11774)))

(assert (=> b!18423 (= res!16152 (= (currentByte!2084 thiss!1917) (size!515 (buf!833 (_2!1143 lt!26677)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18423 (invariant!0 (currentBit!2079 (_2!1143 lt!26677)) (currentByte!2084 (_2!1143 lt!26677)) (size!515 (buf!833 (_2!1143 lt!26677))))))

(declare-fun readBits!0 (BitStream!900 (_ BitVec 64)) tuple2!2128)

(assert (=> b!18423 (= lt!26677 (readBits!0 thiss!1917 nBits!604))))

(assert (= (and start!4518 res!16153) b!18422))

(assert (= (and b!18422 res!16154) b!18423))

(assert (= (and b!18423 (not res!16152)) b!18424))

(assert (= start!4518 b!18425))

(declare-fun m!24823 () Bool)

(assert (=> b!18422 m!24823))

(declare-fun m!24825 () Bool)

(assert (=> b!18424 m!24825))

(declare-fun m!24827 () Bool)

(assert (=> b!18423 m!24827))

(declare-fun m!24829 () Bool)

(assert (=> b!18423 m!24829))

(declare-fun m!24831 () Bool)

(assert (=> start!4518 m!24831))

(declare-fun m!24833 () Bool)

(assert (=> b!18425 m!24833))

(check-sat (not b!18423) (not b!18422) (not b!18424) (not start!4518) (not b!18425))
(check-sat)
(get-model)

(declare-fun d!6090 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!515 (buf!833 thiss!1917))) ((_ sign_extend 32) (currentByte!2084 thiss!1917)) ((_ sign_extend 32) (currentBit!2079 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!515 (buf!833 thiss!1917))) ((_ sign_extend 32) (currentByte!2084 thiss!1917)) ((_ sign_extend 32) (currentBit!2079 thiss!1917))) nBits!604))))

(declare-fun bs!1716 () Bool)

(assert (= bs!1716 d!6090))

(declare-fun m!24853 () Bool)

(assert (=> bs!1716 m!24853))

(assert (=> b!18422 d!6090))

(declare-fun d!6096 () Bool)

(assert (=> d!6096 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2079 thiss!1917) (currentByte!2084 thiss!1917) (size!515 (buf!833 thiss!1917))))))

(declare-fun bs!1718 () Bool)

(assert (= bs!1718 d!6096))

(declare-fun m!24857 () Bool)

(assert (=> bs!1718 m!24857))

(assert (=> start!4518 d!6096))

(declare-fun d!6104 () Bool)

(assert (=> d!6104 (= (array_inv!485 (buf!833 thiss!1917)) (bvsge (size!515 (buf!833 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18425 d!6104))

(declare-fun d!6106 () Bool)

(assert (=> d!6106 (= (invariant!0 (currentBit!2079 (_2!1143 lt!26677)) (currentByte!2084 (_2!1143 lt!26677)) (size!515 (buf!833 (_2!1143 lt!26677)))) (and (bvsge (currentBit!2079 (_2!1143 lt!26677)) #b00000000000000000000000000000000) (bvslt (currentBit!2079 (_2!1143 lt!26677)) #b00000000000000000000000000001000) (bvsge (currentByte!2084 (_2!1143 lt!26677)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2084 (_2!1143 lt!26677)) (size!515 (buf!833 (_2!1143 lt!26677)))) (and (= (currentBit!2079 (_2!1143 lt!26677)) #b00000000000000000000000000000000) (= (currentByte!2084 (_2!1143 lt!26677)) (size!515 (buf!833 (_2!1143 lt!26677))))))))))

(assert (=> b!18423 d!6106))

(declare-fun b!18468 () Bool)

(declare-fun res!16201 () Bool)

(declare-fun e!11794 () Bool)

(assert (=> b!18468 (=> (not res!16201) (not e!11794))))

(declare-fun lt!26745 () tuple2!2128)

(assert (=> b!18468 (= res!16201 (invariant!0 (currentBit!2079 (_2!1143 lt!26745)) (currentByte!2084 (_2!1143 lt!26745)) (size!515 (buf!833 (_2!1143 lt!26745)))))))

(declare-fun b!18469 () Bool)

(declare-fun res!16194 () Bool)

(assert (=> b!18469 (=> (not res!16194) (not e!11794))))

(assert (=> b!18469 (= res!16194 (bvsle (currentByte!2084 thiss!1917) (currentByte!2084 (_2!1143 lt!26745))))))

(declare-fun d!6112 () Bool)

(assert (=> d!6112 e!11794))

(declare-fun res!16203 () Bool)

(assert (=> d!6112 (=> (not res!16203) (not e!11794))))

(assert (=> d!6112 (= res!16203 (= (buf!833 (_2!1143 lt!26745)) (buf!833 thiss!1917)))))

(declare-datatypes ((Unit!1632 0))(
  ( (Unit!1633) )
))
(declare-datatypes ((tuple3!146 0))(
  ( (tuple3!147 (_1!1145 Unit!1632) (_2!1145 BitStream!900) (_3!79 array!1222)) )
))
(declare-fun lt!26738 () tuple3!146)

(assert (=> d!6112 (= lt!26745 (tuple2!2129 (_3!79 lt!26738) (_2!1145 lt!26738)))))

(declare-fun readBitsLoop!0 (BitStream!900 (_ BitVec 64) array!1222 (_ BitVec 64) (_ BitVec 64)) tuple3!146)

(assert (=> d!6112 (= lt!26738 (readBitsLoop!0 thiss!1917 nBits!604 (array!1223 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6112 (= (readBits!0 thiss!1917 nBits!604) lt!26745)))

(declare-fun b!18470 () Bool)

(declare-fun res!16196 () Bool)

(assert (=> b!18470 (=> (not res!16196) (not e!11794))))

(declare-fun lt!26740 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18470 (= res!16196 (= (bvadd lt!26740 nBits!604) (bitIndex!0 (size!515 (buf!833 (_2!1143 lt!26745))) (currentByte!2084 (_2!1143 lt!26745)) (currentBit!2079 (_2!1143 lt!26745)))))))

(assert (=> b!18470 (or (not (= (bvand lt!26740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26740 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18470 (= lt!26740 (bitIndex!0 (size!515 (buf!833 thiss!1917)) (currentByte!2084 thiss!1917) (currentBit!2079 thiss!1917)))))

(declare-fun b!18471 () Bool)

(declare-fun res!16199 () Bool)

(assert (=> b!18471 (=> (not res!16199) (not e!11794))))

(declare-fun lt!26741 () (_ BitVec 64))

(assert (=> b!18471 (= res!16199 (= (size!515 (_1!1143 lt!26745)) ((_ extract 31 0) lt!26741)))))

(assert (=> b!18471 (and (bvslt lt!26741 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26741 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26746 () (_ BitVec 64))

(declare-fun lt!26739 () (_ BitVec 64))

(assert (=> b!18471 (= lt!26741 (bvsdiv lt!26746 lt!26739))))

(assert (=> b!18471 (and (not (= lt!26739 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26746 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26739 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18471 (= lt!26739 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26743 () (_ BitVec 64))

(declare-fun lt!26744 () (_ BitVec 64))

(assert (=> b!18471 (= lt!26746 (bvsub lt!26743 lt!26744))))

(assert (=> b!18471 (or (= (bvand lt!26743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26743 lt!26744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18471 (= lt!26744 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26742 () (_ BitVec 64))

(assert (=> b!18471 (= lt!26743 (bvadd nBits!604 lt!26742))))

(assert (=> b!18471 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26742 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18471 (= lt!26742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18472 () Bool)

(declare-datatypes ((List!209 0))(
  ( (Nil!206) (Cons!205 (h!324 Bool) (t!959 List!209)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!900 array!1222 (_ BitVec 64) (_ BitVec 64)) List!209)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!900 BitStream!900 (_ BitVec 64)) List!209)

(assert (=> b!18472 (= e!11794 (= (byteArrayBitContentToList!0 (_2!1143 lt!26745) (_1!1143 lt!26745) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1143 lt!26745) thiss!1917 nBits!604)))))

(assert (= (and d!6112 res!16203) b!18470))

(assert (= (and b!18470 res!16196) b!18468))

(assert (= (and b!18468 res!16201) b!18471))

(assert (= (and b!18471 res!16199) b!18469))

(assert (= (and b!18469 res!16194) b!18472))

(declare-fun m!24860 () Bool)

(assert (=> b!18468 m!24860))

(declare-fun m!24867 () Bool)

(assert (=> d!6112 m!24867))

(declare-fun m!24877 () Bool)

(assert (=> b!18470 m!24877))

(declare-fun m!24883 () Bool)

(assert (=> b!18470 m!24883))

(declare-fun m!24887 () Bool)

(assert (=> b!18472 m!24887))

(declare-fun m!24891 () Bool)

(assert (=> b!18472 m!24891))

(assert (=> b!18423 d!6112))

(declare-fun d!6116 () Bool)

(assert (=> d!6116 (= (inv!12 (BitStream!901 (buf!833 (_2!1143 lt!26677)) (currentByte!2084 thiss!1917) (currentBit!2079 thiss!1917))) (invariant!0 (currentBit!2079 (BitStream!901 (buf!833 (_2!1143 lt!26677)) (currentByte!2084 thiss!1917) (currentBit!2079 thiss!1917))) (currentByte!2084 (BitStream!901 (buf!833 (_2!1143 lt!26677)) (currentByte!2084 thiss!1917) (currentBit!2079 thiss!1917))) (size!515 (buf!833 (BitStream!901 (buf!833 (_2!1143 lt!26677)) (currentByte!2084 thiss!1917) (currentBit!2079 thiss!1917))))))))

(declare-fun bs!1720 () Bool)

(assert (= bs!1720 d!6116))

(declare-fun m!24895 () Bool)

(assert (=> bs!1720 m!24895))

(assert (=> b!18424 d!6116))

(check-sat (not d!6096) (not b!18470) (not d!6116) (not b!18468) (not b!18472) (not d!6112) (not d!6090))
