; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52374 () Bool)

(assert start!52374)

(declare-fun res!201294 () Bool)

(declare-fun e!167073 () Bool)

(assert (=> start!52374 (=> (not res!201294) (not e!167073))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52374 (= res!201294 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52374 e!167073))

(assert (=> start!52374 true))

(declare-datatypes ((array!13203 0))(
  ( (array!13204 (arr!6770 (Array (_ BitVec 32) (_ BitVec 8))) (size!5783 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10488 0))(
  ( (BitStream!10489 (buf!6249 array!13203) (currentByte!11609 (_ BitVec 32)) (currentBit!11604 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10488)

(declare-fun e!167074 () Bool)

(declare-fun inv!12 (BitStream!10488) Bool)

(assert (=> start!52374 (and (inv!12 thiss!982) e!167074)))

(declare-fun b!241119 () Bool)

(declare-fun res!201292 () Bool)

(assert (=> b!241119 (=> (not res!201292) (not e!167073))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241119 (= res!201292 (validate_offset_bits!1 ((_ sign_extend 32) (size!5783 (buf!6249 thiss!982))) ((_ sign_extend 32) (currentByte!11609 thiss!982)) ((_ sign_extend 32) (currentBit!11604 thiss!982)) nBits!288))))

(declare-fun b!241120 () Bool)

(declare-fun e!167072 () Bool)

(declare-datatypes ((tuple2!20544 0))(
  ( (tuple2!20545 (_1!11194 BitStream!10488) (_2!11194 Bool)) )
))
(declare-fun lt!376751 () tuple2!20544)

(declare-datatypes ((tuple2!20546 0))(
  ( (tuple2!20547 (_1!11195 BitStream!10488) (_2!11195 BitStream!10488)) )
))
(declare-fun lt!376747 () tuple2!20546)

(assert (=> b!241120 (= e!167072 (not (or (not (_2!11194 lt!376751)) (not (= (_1!11194 lt!376751) (_2!11195 lt!376747))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10488 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20544)

(assert (=> b!241120 (= lt!376751 (checkBitsLoopPure!0 (_1!11195 lt!376747) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17667 0))(
  ( (Unit!17668) )
))
(declare-datatypes ((tuple2!20548 0))(
  ( (tuple2!20549 (_1!11196 Unit!17667) (_2!11196 BitStream!10488)) )
))
(declare-fun lt!376748 () tuple2!20548)

(assert (=> b!241120 (validate_offset_bits!1 ((_ sign_extend 32) (size!5783 (buf!6249 (_2!11196 lt!376748)))) ((_ sign_extend 32) (currentByte!11609 thiss!982)) ((_ sign_extend 32) (currentBit!11604 thiss!982)) nBits!288)))

(declare-fun lt!376744 () Unit!17667)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10488 array!13203 (_ BitVec 64)) Unit!17667)

(assert (=> b!241120 (= lt!376744 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6249 (_2!11196 lt!376748)) nBits!288))))

(declare-fun reader!0 (BitStream!10488 BitStream!10488) tuple2!20546)

(assert (=> b!241120 (= lt!376747 (reader!0 thiss!982 (_2!11196 lt!376748)))))

(declare-fun b!241121 () Bool)

(declare-fun res!201291 () Bool)

(assert (=> b!241121 (=> (not res!201291) (not e!167072))))

(declare-fun isPrefixOf!0 (BitStream!10488 BitStream!10488) Bool)

(assert (=> b!241121 (= res!201291 (isPrefixOf!0 thiss!982 (_2!11196 lt!376748)))))

(declare-fun b!241122 () Bool)

(declare-fun array_inv!5524 (array!13203) Bool)

(assert (=> b!241122 (= e!167074 (array_inv!5524 (buf!6249 thiss!982)))))

(declare-fun b!241123 () Bool)

(declare-fun res!201293 () Bool)

(assert (=> b!241123 (=> (not res!201293) (not e!167072))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241123 (= res!201293 (= (bitIndex!0 (size!5783 (buf!6249 (_2!11196 lt!376748))) (currentByte!11609 (_2!11196 lt!376748)) (currentBit!11604 (_2!11196 lt!376748))) (bvadd (bitIndex!0 (size!5783 (buf!6249 thiss!982)) (currentByte!11609 thiss!982) (currentBit!11604 thiss!982)) nBits!288)))))

(declare-fun b!241124 () Bool)

(declare-fun lt!376743 () tuple2!20544)

(declare-fun lt!376746 () tuple2!20546)

(assert (=> b!241124 (= e!167073 (not (and (_2!11194 lt!376743) (= (_1!11194 lt!376743) (_2!11195 lt!376746)))))))

(assert (=> b!241124 (= lt!376743 (checkBitsLoopPure!0 (_1!11195 lt!376746) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241124 (validate_offset_bits!1 ((_ sign_extend 32) (size!5783 (buf!6249 (_2!11196 lt!376748)))) ((_ sign_extend 32) (currentByte!11609 thiss!982)) ((_ sign_extend 32) (currentBit!11604 thiss!982)) nBits!288)))

(declare-fun lt!376752 () Unit!17667)

(assert (=> b!241124 (= lt!376752 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6249 (_2!11196 lt!376748)) nBits!288))))

(assert (=> b!241124 (= lt!376746 (reader!0 thiss!982 (_2!11196 lt!376748)))))

(declare-fun lt!376749 () Bool)

(assert (=> b!241124 (= lt!376749 (isPrefixOf!0 thiss!982 (_2!11196 lt!376748)))))

(declare-fun lt!376745 () (_ BitVec 64))

(assert (=> b!241124 (= lt!376745 (bitIndex!0 (size!5783 (buf!6249 (_2!11196 lt!376748))) (currentByte!11609 (_2!11196 lt!376748)) (currentBit!11604 (_2!11196 lt!376748))))))

(declare-fun lt!376750 () (_ BitVec 64))

(assert (=> b!241124 (= lt!376750 (bitIndex!0 (size!5783 (buf!6249 thiss!982)) (currentByte!11609 thiss!982) (currentBit!11604 thiss!982)))))

(assert (=> b!241124 e!167072))

(declare-fun res!201290 () Bool)

(assert (=> b!241124 (=> (not res!201290) (not e!167072))))

(assert (=> b!241124 (= res!201290 (= (size!5783 (buf!6249 thiss!982)) (size!5783 (buf!6249 (_2!11196 lt!376748)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10488 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20548)

(assert (=> b!241124 (= lt!376748 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!52374 res!201294) b!241119))

(assert (= (and b!241119 res!201292) b!241124))

(assert (= (and b!241124 res!201290) b!241123))

(assert (= (and b!241123 res!201293) b!241121))

(assert (= (and b!241121 res!201291) b!241120))

(assert (= start!52374 b!241122))

(declare-fun m!363813 () Bool)

(assert (=> start!52374 m!363813))

(declare-fun m!363815 () Bool)

(assert (=> b!241122 m!363815))

(declare-fun m!363817 () Bool)

(assert (=> b!241120 m!363817))

(declare-fun m!363819 () Bool)

(assert (=> b!241120 m!363819))

(declare-fun m!363821 () Bool)

(assert (=> b!241120 m!363821))

(declare-fun m!363823 () Bool)

(assert (=> b!241120 m!363823))

(declare-fun m!363825 () Bool)

(assert (=> b!241124 m!363825))

(declare-fun m!363827 () Bool)

(assert (=> b!241124 m!363827))

(declare-fun m!363829 () Bool)

(assert (=> b!241124 m!363829))

(assert (=> b!241124 m!363823))

(declare-fun m!363831 () Bool)

(assert (=> b!241124 m!363831))

(declare-fun m!363833 () Bool)

(assert (=> b!241124 m!363833))

(assert (=> b!241124 m!363819))

(assert (=> b!241124 m!363821))

(declare-fun m!363835 () Bool)

(assert (=> b!241119 m!363835))

(assert (=> b!241121 m!363825))

(assert (=> b!241123 m!363829))

(assert (=> b!241123 m!363831))

(check-sat (not b!241122) (not start!52374) (not b!241120) (not b!241121) (not b!241119) (not b!241123) (not b!241124))
