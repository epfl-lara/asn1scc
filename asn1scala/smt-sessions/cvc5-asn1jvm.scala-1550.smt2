; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43596 () Bool)

(assert start!43596)

(declare-fun b!206186 () Bool)

(declare-fun e!140997 () Bool)

(declare-datatypes ((array!10379 0))(
  ( (array!10380 (arr!5491 (Array (_ BitVec 32) (_ BitVec 8))) (size!4561 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8230 0))(
  ( (BitStream!8231 (buf!5066 array!10379) (currentByte!9584 (_ BitVec 32)) (currentBit!9579 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17612 0))(
  ( (tuple2!17613 (_1!9461 BitStream!8230) (_2!9461 Bool)) )
))
(declare-fun lt!322375 () tuple2!17612)

(declare-fun lt!322385 () tuple2!17612)

(assert (=> b!206186 (= e!140997 (= (_2!9461 lt!322375) (_2!9461 lt!322385)))))

(declare-fun b!206187 () Bool)

(declare-fun res!172871 () Bool)

(declare-fun e!141003 () Bool)

(assert (=> b!206187 (=> res!172871 e!141003)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!322386 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!8230)

(declare-datatypes ((Unit!14716 0))(
  ( (Unit!14717) )
))
(declare-datatypes ((tuple2!17614 0))(
  ( (tuple2!17615 (_1!9462 Unit!14716) (_2!9462 BitStream!8230)) )
))
(declare-fun lt!322383 () tuple2!17614)

(declare-fun lt!322379 () (_ BitVec 64))

(assert (=> b!206187 (= res!172871 (or (not (= (size!4561 (buf!5066 (_2!9462 lt!322383))) (size!4561 (buf!5066 thiss!1204)))) (not (= lt!322379 (bvsub (bvadd lt!322386 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206188 () Bool)

(declare-fun res!172867 () Bool)

(assert (=> b!206188 (=> res!172867 e!141003)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206188 (= res!172867 (not (invariant!0 (currentBit!9579 (_2!9462 lt!322383)) (currentByte!9584 (_2!9462 lt!322383)) (size!4561 (buf!5066 (_2!9462 lt!322383))))))))

(declare-fun b!206189 () Bool)

(declare-fun res!172868 () Bool)

(declare-fun e!141006 () Bool)

(assert (=> b!206189 (=> (not res!172868) (not e!141006))))

(assert (=> b!206189 (= res!172868 (invariant!0 (currentBit!9579 thiss!1204) (currentByte!9584 thiss!1204) (size!4561 (buf!5066 thiss!1204))))))

(declare-fun b!206190 () Bool)

(declare-fun e!141004 () Bool)

(assert (=> b!206190 (= e!141004 (invariant!0 (currentBit!9579 thiss!1204) (currentByte!9584 thiss!1204) (size!4561 (buf!5066 (_2!9462 lt!322383)))))))

(declare-fun b!206191 () Bool)

(declare-fun res!172862 () Bool)

(declare-fun e!141005 () Bool)

(assert (=> b!206191 (=> (not res!172862) (not e!141005))))

(declare-fun lt!322376 () tuple2!17614)

(declare-fun isPrefixOf!0 (BitStream!8230 BitStream!8230) Bool)

(assert (=> b!206191 (= res!172862 (isPrefixOf!0 thiss!1204 (_2!9462 lt!322376)))))

(declare-fun res!172870 () Bool)

(assert (=> start!43596 (=> (not res!172870) (not e!141006))))

(assert (=> start!43596 (= res!172870 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43596 e!141006))

(assert (=> start!43596 true))

(declare-fun e!141001 () Bool)

(declare-fun inv!12 (BitStream!8230) Bool)

(assert (=> start!43596 (and (inv!12 thiss!1204) e!141001)))

(declare-fun b!206192 () Bool)

(declare-fun res!172859 () Bool)

(assert (=> b!206192 (=> (not res!172859) (not e!141006))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206192 (= res!172859 (validate_offset_bits!1 ((_ sign_extend 32) (size!4561 (buf!5066 thiss!1204))) ((_ sign_extend 32) (currentByte!9584 thiss!1204)) ((_ sign_extend 32) (currentBit!9579 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206193 () Bool)

(declare-fun e!141000 () Bool)

(declare-fun lt!322377 () tuple2!17612)

(declare-fun lt!322374 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206193 (= e!141000 (= (bitIndex!0 (size!4561 (buf!5066 (_1!9461 lt!322377))) (currentByte!9584 (_1!9461 lt!322377)) (currentBit!9579 (_1!9461 lt!322377))) lt!322374))))

(declare-fun b!206194 () Bool)

(declare-fun e!140999 () Bool)

(assert (=> b!206194 (= e!141006 (not e!140999))))

(declare-fun res!172874 () Bool)

(assert (=> b!206194 (=> res!172874 e!140999)))

(declare-fun lt!322380 () (_ BitVec 64))

(assert (=> b!206194 (= res!172874 (not (= lt!322380 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322386))))))

(assert (=> b!206194 (= lt!322380 (bitIndex!0 (size!4561 (buf!5066 (_2!9462 lt!322376))) (currentByte!9584 (_2!9462 lt!322376)) (currentBit!9579 (_2!9462 lt!322376))))))

(assert (=> b!206194 (= lt!322386 (bitIndex!0 (size!4561 (buf!5066 thiss!1204)) (currentByte!9584 thiss!1204) (currentBit!9579 thiss!1204)))))

(declare-fun e!140998 () Bool)

(assert (=> b!206194 e!140998))

(declare-fun res!172863 () Bool)

(assert (=> b!206194 (=> (not res!172863) (not e!140998))))

(assert (=> b!206194 (= res!172863 (= (size!4561 (buf!5066 thiss!1204)) (size!4561 (buf!5066 (_2!9462 lt!322376)))))))

(declare-fun lt!322373 () Bool)

(declare-fun appendBit!0 (BitStream!8230 Bool) tuple2!17614)

(assert (=> b!206194 (= lt!322376 (appendBit!0 thiss!1204 lt!322373))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206194 (= lt!322373 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206195 () Bool)

(declare-fun array_inv!4302 (array!10379) Bool)

(assert (=> b!206195 (= e!141001 (array_inv!4302 (buf!5066 thiss!1204)))))

(declare-fun b!206196 () Bool)

(assert (=> b!206196 (= e!140998 e!141005)))

(declare-fun res!172873 () Bool)

(assert (=> b!206196 (=> (not res!172873) (not e!141005))))

(declare-fun lt!322381 () (_ BitVec 64))

(assert (=> b!206196 (= res!172873 (= lt!322374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322381)))))

(assert (=> b!206196 (= lt!322374 (bitIndex!0 (size!4561 (buf!5066 (_2!9462 lt!322376))) (currentByte!9584 (_2!9462 lt!322376)) (currentBit!9579 (_2!9462 lt!322376))))))

(assert (=> b!206196 (= lt!322381 (bitIndex!0 (size!4561 (buf!5066 thiss!1204)) (currentByte!9584 thiss!1204) (currentBit!9579 thiss!1204)))))

(declare-fun b!206197 () Bool)

(declare-fun res!172864 () Bool)

(assert (=> b!206197 (=> res!172864 e!141003)))

(assert (=> b!206197 (= res!172864 (not (isPrefixOf!0 (_2!9462 lt!322376) (_2!9462 lt!322383))))))

(declare-fun b!206198 () Bool)

(assert (=> b!206198 (= e!141005 e!141000)))

(declare-fun res!172869 () Bool)

(assert (=> b!206198 (=> (not res!172869) (not e!141000))))

(assert (=> b!206198 (= res!172869 (and (= (_2!9461 lt!322377) lt!322373) (= (_1!9461 lt!322377) (_2!9462 lt!322376))))))

(declare-fun readBitPure!0 (BitStream!8230) tuple2!17612)

(declare-fun readerFrom!0 (BitStream!8230 (_ BitVec 32) (_ BitVec 32)) BitStream!8230)

(assert (=> b!206198 (= lt!322377 (readBitPure!0 (readerFrom!0 (_2!9462 lt!322376) (currentBit!9579 thiss!1204) (currentByte!9584 thiss!1204))))))

(declare-fun b!206199 () Bool)

(assert (=> b!206199 (= e!141003 (= (size!4561 (buf!5066 thiss!1204)) (size!4561 (buf!5066 (_2!9462 lt!322383)))))))

(declare-datatypes ((tuple2!17616 0))(
  ( (tuple2!17617 (_1!9463 BitStream!8230) (_2!9463 BitStream!8230)) )
))
(declare-fun lt!322384 () tuple2!17616)

(assert (=> b!206199 (= (_2!9461 (readBitPure!0 (_1!9463 lt!322384))) lt!322373)))

(declare-fun lt!322388 () tuple2!17616)

(declare-fun reader!0 (BitStream!8230 BitStream!8230) tuple2!17616)

(assert (=> b!206199 (= lt!322388 (reader!0 (_2!9462 lt!322376) (_2!9462 lt!322383)))))

(assert (=> b!206199 (= lt!322384 (reader!0 thiss!1204 (_2!9462 lt!322383)))))

(assert (=> b!206199 e!140997))

(declare-fun res!172866 () Bool)

(assert (=> b!206199 (=> (not res!172866) (not e!140997))))

(assert (=> b!206199 (= res!172866 (= (bitIndex!0 (size!4561 (buf!5066 (_1!9461 lt!322375))) (currentByte!9584 (_1!9461 lt!322375)) (currentBit!9579 (_1!9461 lt!322375))) (bitIndex!0 (size!4561 (buf!5066 (_1!9461 lt!322385))) (currentByte!9584 (_1!9461 lt!322385)) (currentBit!9579 (_1!9461 lt!322385)))))))

(declare-fun lt!322387 () Unit!14716)

(declare-fun lt!322382 () BitStream!8230)

(declare-fun readBitPrefixLemma!0 (BitStream!8230 BitStream!8230) Unit!14716)

(assert (=> b!206199 (= lt!322387 (readBitPrefixLemma!0 lt!322382 (_2!9462 lt!322383)))))

(assert (=> b!206199 (= lt!322385 (readBitPure!0 (BitStream!8231 (buf!5066 (_2!9462 lt!322383)) (currentByte!9584 thiss!1204) (currentBit!9579 thiss!1204))))))

(assert (=> b!206199 (= lt!322375 (readBitPure!0 lt!322382))))

(assert (=> b!206199 e!141004))

(declare-fun res!172860 () Bool)

(assert (=> b!206199 (=> (not res!172860) (not e!141004))))

(assert (=> b!206199 (= res!172860 (invariant!0 (currentBit!9579 thiss!1204) (currentByte!9584 thiss!1204) (size!4561 (buf!5066 (_2!9462 lt!322376)))))))

(assert (=> b!206199 (= lt!322382 (BitStream!8231 (buf!5066 (_2!9462 lt!322376)) (currentByte!9584 thiss!1204) (currentBit!9579 thiss!1204)))))

(declare-fun b!206200 () Bool)

(assert (=> b!206200 (= e!140999 e!141003)))

(declare-fun res!172872 () Bool)

(assert (=> b!206200 (=> res!172872 e!141003)))

(assert (=> b!206200 (= res!172872 (not (= lt!322379 (bvsub (bvsub (bvadd lt!322380 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206200 (= lt!322379 (bitIndex!0 (size!4561 (buf!5066 (_2!9462 lt!322383))) (currentByte!9584 (_2!9462 lt!322383)) (currentBit!9579 (_2!9462 lt!322383))))))

(assert (=> b!206200 (isPrefixOf!0 thiss!1204 (_2!9462 lt!322383))))

(declare-fun lt!322378 () Unit!14716)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8230 BitStream!8230 BitStream!8230) Unit!14716)

(assert (=> b!206200 (= lt!322378 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9462 lt!322376) (_2!9462 lt!322383)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8230 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17614)

(assert (=> b!206200 (= lt!322383 (appendBitsLSBFirstLoopTR!0 (_2!9462 lt!322376) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206201 () Bool)

(declare-fun res!172865 () Bool)

(assert (=> b!206201 (=> res!172865 e!141003)))

(assert (=> b!206201 (= res!172865 (not (isPrefixOf!0 thiss!1204 (_2!9462 lt!322376))))))

(declare-fun b!206202 () Bool)

(declare-fun res!172861 () Bool)

(assert (=> b!206202 (=> (not res!172861) (not e!141006))))

(assert (=> b!206202 (= res!172861 (not (= i!590 nBits!348)))))

(assert (= (and start!43596 res!172870) b!206192))

(assert (= (and b!206192 res!172859) b!206189))

(assert (= (and b!206189 res!172868) b!206202))

(assert (= (and b!206202 res!172861) b!206194))

(assert (= (and b!206194 res!172863) b!206196))

(assert (= (and b!206196 res!172873) b!206191))

(assert (= (and b!206191 res!172862) b!206198))

(assert (= (and b!206198 res!172869) b!206193))

(assert (= (and b!206194 (not res!172874)) b!206200))

(assert (= (and b!206200 (not res!172872)) b!206188))

(assert (= (and b!206188 (not res!172867)) b!206187))

(assert (= (and b!206187 (not res!172871)) b!206197))

(assert (= (and b!206197 (not res!172864)) b!206201))

(assert (= (and b!206201 (not res!172865)) b!206199))

(assert (= (and b!206199 res!172860) b!206190))

(assert (= (and b!206199 res!172866) b!206186))

(assert (= start!43596 b!206195))

(declare-fun m!317733 () Bool)

(assert (=> b!206199 m!317733))

(declare-fun m!317735 () Bool)

(assert (=> b!206199 m!317735))

(declare-fun m!317737 () Bool)

(assert (=> b!206199 m!317737))

(declare-fun m!317739 () Bool)

(assert (=> b!206199 m!317739))

(declare-fun m!317741 () Bool)

(assert (=> b!206199 m!317741))

(declare-fun m!317743 () Bool)

(assert (=> b!206199 m!317743))

(declare-fun m!317745 () Bool)

(assert (=> b!206199 m!317745))

(declare-fun m!317747 () Bool)

(assert (=> b!206199 m!317747))

(declare-fun m!317749 () Bool)

(assert (=> b!206199 m!317749))

(declare-fun m!317751 () Bool)

(assert (=> b!206190 m!317751))

(declare-fun m!317753 () Bool)

(assert (=> b!206191 m!317753))

(declare-fun m!317755 () Bool)

(assert (=> b!206195 m!317755))

(declare-fun m!317757 () Bool)

(assert (=> b!206196 m!317757))

(declare-fun m!317759 () Bool)

(assert (=> b!206196 m!317759))

(declare-fun m!317761 () Bool)

(assert (=> b!206193 m!317761))

(declare-fun m!317763 () Bool)

(assert (=> b!206200 m!317763))

(declare-fun m!317765 () Bool)

(assert (=> b!206200 m!317765))

(declare-fun m!317767 () Bool)

(assert (=> b!206200 m!317767))

(declare-fun m!317769 () Bool)

(assert (=> b!206200 m!317769))

(declare-fun m!317771 () Bool)

(assert (=> b!206188 m!317771))

(assert (=> b!206201 m!317753))

(declare-fun m!317773 () Bool)

(assert (=> b!206189 m!317773))

(assert (=> b!206194 m!317757))

(assert (=> b!206194 m!317759))

(declare-fun m!317775 () Bool)

(assert (=> b!206194 m!317775))

(declare-fun m!317777 () Bool)

(assert (=> b!206198 m!317777))

(assert (=> b!206198 m!317777))

(declare-fun m!317779 () Bool)

(assert (=> b!206198 m!317779))

(declare-fun m!317781 () Bool)

(assert (=> b!206192 m!317781))

(declare-fun m!317783 () Bool)

(assert (=> start!43596 m!317783))

(declare-fun m!317785 () Bool)

(assert (=> b!206197 m!317785))

(push 1)

