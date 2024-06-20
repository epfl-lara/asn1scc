; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52452 () Bool)

(assert start!52452)

(declare-fun b!241603 () Bool)

(declare-fun res!201695 () Bool)

(declare-fun e!167472 () Bool)

(assert (=> b!241603 (=> (not res!201695) (not e!167472))))

(declare-datatypes ((array!13263 0))(
  ( (array!13264 (arr!6798 (Array (_ BitVec 32) (_ BitVec 8))) (size!5811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10544 0))(
  ( (BitStream!10545 (buf!6277 array!13263) (currentByte!11640 (_ BitVec 32)) (currentBit!11635 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10544)

(declare-datatypes ((Unit!17705 0))(
  ( (Unit!17706) )
))
(declare-datatypes ((tuple2!20624 0))(
  ( (tuple2!20625 (_1!11234 Unit!17705) (_2!11234 BitStream!10544)) )
))
(declare-fun lt!377084 () tuple2!20624)

(declare-fun isPrefixOf!0 (BitStream!10544 BitStream!10544) Bool)

(assert (=> b!241603 (= res!201695 (isPrefixOf!0 thiss!1005 (_2!11234 lt!377084)))))

(declare-fun b!241604 () Bool)

(declare-fun e!167474 () Bool)

(assert (=> b!241604 (= e!167472 e!167474)))

(declare-fun res!201692 () Bool)

(assert (=> b!241604 (=> (not res!201692) (not e!167474))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20626 0))(
  ( (tuple2!20627 (_1!11235 BitStream!10544) (_2!11235 Bool)) )
))
(declare-fun lt!377086 () tuple2!20626)

(assert (=> b!241604 (= res!201692 (and (= (_2!11235 lt!377086) bit!26) (= (_1!11235 lt!377086) (_2!11234 lt!377084))))))

(declare-fun readBitPure!0 (BitStream!10544) tuple2!20626)

(declare-fun readerFrom!0 (BitStream!10544 (_ BitVec 32) (_ BitVec 32)) BitStream!10544)

(assert (=> b!241604 (= lt!377086 (readBitPure!0 (readerFrom!0 (_2!11234 lt!377084) (currentBit!11635 thiss!1005) (currentByte!11640 thiss!1005))))))

(declare-fun b!241605 () Bool)

(declare-fun lt!377088 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241605 (= e!167474 (= (bitIndex!0 (size!5811 (buf!6277 (_1!11235 lt!377086))) (currentByte!11640 (_1!11235 lt!377086)) (currentBit!11635 (_1!11235 lt!377086))) lt!377088))))

(declare-fun b!241606 () Bool)

(declare-fun res!201693 () Bool)

(declare-fun e!167473 () Bool)

(assert (=> b!241606 (=> (not res!201693) (not e!167473))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241606 (= res!201693 (bvslt from!289 nBits!297))))

(declare-fun b!241607 () Bool)

(declare-fun e!167469 () Bool)

(declare-fun array_inv!5552 (array!13263) Bool)

(assert (=> b!241607 (= e!167469 (array_inv!5552 (buf!6277 thiss!1005)))))

(declare-fun b!241608 () Bool)

(declare-fun res!201694 () Bool)

(assert (=> b!241608 (=> (not res!201694) (not e!167473))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241608 (= res!201694 (validate_offset_bits!1 ((_ sign_extend 32) (size!5811 (buf!6277 thiss!1005))) ((_ sign_extend 32) (currentByte!11640 thiss!1005)) ((_ sign_extend 32) (currentBit!11635 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!201691 () Bool)

(assert (=> start!52452 (=> (not res!201691) (not e!167473))))

(assert (=> start!52452 (= res!201691 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52452 e!167473))

(assert (=> start!52452 true))

(declare-fun inv!12 (BitStream!10544) Bool)

(assert (=> start!52452 (and (inv!12 thiss!1005) e!167469)))

(declare-fun b!241609 () Bool)

(declare-fun e!167470 () Bool)

(assert (=> b!241609 (= e!167470 e!167472)))

(declare-fun res!201696 () Bool)

(assert (=> b!241609 (=> (not res!201696) (not e!167472))))

(declare-fun lt!377085 () (_ BitVec 64))

(assert (=> b!241609 (= res!201696 (= lt!377088 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377085)))))

(assert (=> b!241609 (= lt!377088 (bitIndex!0 (size!5811 (buf!6277 (_2!11234 lt!377084))) (currentByte!11640 (_2!11234 lt!377084)) (currentBit!11635 (_2!11234 lt!377084))))))

(assert (=> b!241609 (= lt!377085 (bitIndex!0 (size!5811 (buf!6277 thiss!1005)) (currentByte!11640 thiss!1005) (currentBit!11635 thiss!1005)))))

(declare-fun b!241610 () Bool)

(assert (=> b!241610 (= e!167473 (not true))))

(assert (=> b!241610 (validate_offset_bits!1 ((_ sign_extend 32) (size!5811 (buf!6277 (_2!11234 lt!377084)))) ((_ sign_extend 32) (currentByte!11640 (_2!11234 lt!377084))) ((_ sign_extend 32) (currentBit!11635 (_2!11234 lt!377084))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377087 () Unit!17705)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10544 BitStream!10544 (_ BitVec 64) (_ BitVec 64)) Unit!17705)

(assert (=> b!241610 (= lt!377087 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11234 lt!377084) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241610 e!167470))

(declare-fun res!201690 () Bool)

(assert (=> b!241610 (=> (not res!201690) (not e!167470))))

(assert (=> b!241610 (= res!201690 (= (size!5811 (buf!6277 thiss!1005)) (size!5811 (buf!6277 (_2!11234 lt!377084)))))))

(declare-fun appendBit!0 (BitStream!10544 Bool) tuple2!20624)

(assert (=> b!241610 (= lt!377084 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52452 res!201691) b!241608))

(assert (= (and b!241608 res!201694) b!241606))

(assert (= (and b!241606 res!201693) b!241610))

(assert (= (and b!241610 res!201690) b!241609))

(assert (= (and b!241609 res!201696) b!241603))

(assert (= (and b!241603 res!201695) b!241604))

(assert (= (and b!241604 res!201692) b!241605))

(assert (= start!52452 b!241607))

(declare-fun m!364271 () Bool)

(assert (=> b!241610 m!364271))

(declare-fun m!364273 () Bool)

(assert (=> b!241610 m!364273))

(declare-fun m!364275 () Bool)

(assert (=> b!241610 m!364275))

(declare-fun m!364277 () Bool)

(assert (=> b!241609 m!364277))

(declare-fun m!364279 () Bool)

(assert (=> b!241609 m!364279))

(declare-fun m!364281 () Bool)

(assert (=> b!241607 m!364281))

(declare-fun m!364283 () Bool)

(assert (=> b!241605 m!364283))

(declare-fun m!364285 () Bool)

(assert (=> b!241604 m!364285))

(assert (=> b!241604 m!364285))

(declare-fun m!364287 () Bool)

(assert (=> b!241604 m!364287))

(declare-fun m!364289 () Bool)

(assert (=> start!52452 m!364289))

(declare-fun m!364291 () Bool)

(assert (=> b!241603 m!364291))

(declare-fun m!364293 () Bool)

(assert (=> b!241608 m!364293))

(push 1)

(assert (not b!241604))

(assert (not start!52452))

(assert (not b!241607))

(assert (not b!241603))

(assert (not b!241605))

(assert (not b!241608))

(assert (not b!241609))

(assert (not b!241610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

