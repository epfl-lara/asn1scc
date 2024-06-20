; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52440 () Bool)

(assert start!52440)

(declare-fun b!241459 () Bool)

(declare-fun res!201566 () Bool)

(declare-fun e!167361 () Bool)

(assert (=> b!241459 (=> (not res!201566) (not e!167361))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241459 (= res!201566 (bvslt from!289 nBits!297))))

(declare-fun b!241460 () Bool)

(declare-fun e!167364 () Bool)

(declare-datatypes ((array!13251 0))(
  ( (array!13252 (arr!6792 (Array (_ BitVec 32) (_ BitVec 8))) (size!5805 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10532 0))(
  ( (BitStream!10533 (buf!6271 array!13251) (currentByte!11634 (_ BitVec 32)) (currentBit!11629 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20600 0))(
  ( (tuple2!20601 (_1!11222 BitStream!10532) (_2!11222 Bool)) )
))
(declare-fun lt!376997 () tuple2!20600)

(declare-fun lt!376996 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241460 (= e!167364 (= (bitIndex!0 (size!5805 (buf!6271 (_1!11222 lt!376997))) (currentByte!11634 (_1!11222 lt!376997)) (currentBit!11629 (_1!11222 lt!376997))) lt!376996))))

(declare-fun b!241461 () Bool)

(assert (=> b!241461 (= e!167361 (not true))))

(declare-fun lt!376995 () (_ BitVec 64))

(declare-datatypes ((Unit!17693 0))(
  ( (Unit!17694) )
))
(declare-datatypes ((tuple2!20602 0))(
  ( (tuple2!20603 (_1!11223 Unit!17693) (_2!11223 BitStream!10532)) )
))
(declare-fun lt!376994 () tuple2!20602)

(assert (=> b!241461 (= lt!376995 (bitIndex!0 (size!5805 (buf!6271 (_2!11223 lt!376994))) (currentByte!11634 (_2!11223 lt!376994)) (currentBit!11629 (_2!11223 lt!376994))))))

(declare-fun lt!376998 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10532)

(assert (=> b!241461 (= lt!376998 (bitIndex!0 (size!5805 (buf!6271 thiss!1005)) (currentByte!11634 thiss!1005) (currentBit!11629 thiss!1005)))))

(declare-fun e!167365 () Bool)

(assert (=> b!241461 e!167365))

(declare-fun res!201569 () Bool)

(assert (=> b!241461 (=> (not res!201569) (not e!167365))))

(assert (=> b!241461 (= res!201569 (= (size!5805 (buf!6271 thiss!1005)) (size!5805 (buf!6271 (_2!11223 lt!376994)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10532 Bool) tuple2!20602)

(assert (=> b!241461 (= lt!376994 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241462 () Bool)

(declare-fun e!167362 () Bool)

(assert (=> b!241462 (= e!167362 e!167364)))

(declare-fun res!201570 () Bool)

(assert (=> b!241462 (=> (not res!201570) (not e!167364))))

(assert (=> b!241462 (= res!201570 (and (= (_2!11222 lt!376997) bit!26) (= (_1!11222 lt!376997) (_2!11223 lt!376994))))))

(declare-fun readBitPure!0 (BitStream!10532) tuple2!20600)

(declare-fun readerFrom!0 (BitStream!10532 (_ BitVec 32) (_ BitVec 32)) BitStream!10532)

(assert (=> b!241462 (= lt!376997 (readBitPure!0 (readerFrom!0 (_2!11223 lt!376994) (currentBit!11629 thiss!1005) (currentByte!11634 thiss!1005))))))

(declare-fun res!201568 () Bool)

(assert (=> start!52440 (=> (not res!201568) (not e!167361))))

(assert (=> start!52440 (= res!201568 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52440 e!167361))

(assert (=> start!52440 true))

(declare-fun e!167363 () Bool)

(declare-fun inv!12 (BitStream!10532) Bool)

(assert (=> start!52440 (and (inv!12 thiss!1005) e!167363)))

(declare-fun b!241463 () Bool)

(declare-fun res!201567 () Bool)

(assert (=> b!241463 (=> (not res!201567) (not e!167362))))

(declare-fun isPrefixOf!0 (BitStream!10532 BitStream!10532) Bool)

(assert (=> b!241463 (= res!201567 (isPrefixOf!0 thiss!1005 (_2!11223 lt!376994)))))

(declare-fun b!241464 () Bool)

(assert (=> b!241464 (= e!167365 e!167362)))

(declare-fun res!201565 () Bool)

(assert (=> b!241464 (=> (not res!201565) (not e!167362))))

(declare-fun lt!376993 () (_ BitVec 64))

(assert (=> b!241464 (= res!201565 (= lt!376996 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376993)))))

(assert (=> b!241464 (= lt!376996 (bitIndex!0 (size!5805 (buf!6271 (_2!11223 lt!376994))) (currentByte!11634 (_2!11223 lt!376994)) (currentBit!11629 (_2!11223 lt!376994))))))

(assert (=> b!241464 (= lt!376993 (bitIndex!0 (size!5805 (buf!6271 thiss!1005)) (currentByte!11634 thiss!1005) (currentBit!11629 thiss!1005)))))

(declare-fun b!241465 () Bool)

(declare-fun array_inv!5546 (array!13251) Bool)

(assert (=> b!241465 (= e!167363 (array_inv!5546 (buf!6271 thiss!1005)))))

(declare-fun b!241466 () Bool)

(declare-fun res!201564 () Bool)

(assert (=> b!241466 (=> (not res!201564) (not e!167361))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241466 (= res!201564 (validate_offset_bits!1 ((_ sign_extend 32) (size!5805 (buf!6271 thiss!1005))) ((_ sign_extend 32) (currentByte!11634 thiss!1005)) ((_ sign_extend 32) (currentBit!11629 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!52440 res!201568) b!241466))

(assert (= (and b!241466 res!201564) b!241459))

(assert (= (and b!241459 res!201566) b!241461))

(assert (= (and b!241461 res!201569) b!241464))

(assert (= (and b!241464 res!201565) b!241463))

(assert (= (and b!241463 res!201567) b!241462))

(assert (= (and b!241462 res!201570) b!241460))

(assert (= start!52440 b!241465))

(declare-fun m!364131 () Bool)

(assert (=> b!241461 m!364131))

(declare-fun m!364133 () Bool)

(assert (=> b!241461 m!364133))

(declare-fun m!364135 () Bool)

(assert (=> b!241461 m!364135))

(declare-fun m!364137 () Bool)

(assert (=> b!241462 m!364137))

(assert (=> b!241462 m!364137))

(declare-fun m!364139 () Bool)

(assert (=> b!241462 m!364139))

(assert (=> b!241464 m!364131))

(assert (=> b!241464 m!364133))

(declare-fun m!364141 () Bool)

(assert (=> b!241460 m!364141))

(declare-fun m!364143 () Bool)

(assert (=> b!241466 m!364143))

(declare-fun m!364145 () Bool)

(assert (=> b!241463 m!364145))

(declare-fun m!364147 () Bool)

(assert (=> b!241465 m!364147))

(declare-fun m!364149 () Bool)

(assert (=> start!52440 m!364149))

(push 1)

(assert (not start!52440))

(assert (not b!241463))

(assert (not b!241462))

(assert (not b!241466))

(assert (not b!241461))

(assert (not b!241464))

(assert (not b!241465))

(assert (not b!241460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

