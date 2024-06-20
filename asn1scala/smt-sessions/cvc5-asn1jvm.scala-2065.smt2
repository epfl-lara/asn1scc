; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52448 () Bool)

(assert start!52448)

(declare-fun b!241555 () Bool)

(declare-fun e!167438 () Bool)

(declare-fun e!167435 () Bool)

(assert (=> b!241555 (= e!167438 e!167435)))

(declare-fun res!201648 () Bool)

(assert (=> b!241555 (=> (not res!201648) (not e!167435))))

(declare-datatypes ((array!13259 0))(
  ( (array!13260 (arr!6796 (Array (_ BitVec 32) (_ BitVec 8))) (size!5809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10540 0))(
  ( (BitStream!10541 (buf!6275 array!13259) (currentByte!11638 (_ BitVec 32)) (currentBit!11633 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20616 0))(
  ( (tuple2!20617 (_1!11230 BitStream!10540) (_2!11230 Bool)) )
))
(declare-fun lt!377056 () tuple2!20616)

(declare-fun bit!26 () Bool)

(declare-datatypes ((Unit!17701 0))(
  ( (Unit!17702) )
))
(declare-datatypes ((tuple2!20618 0))(
  ( (tuple2!20619 (_1!11231 Unit!17701) (_2!11231 BitStream!10540)) )
))
(declare-fun lt!377057 () tuple2!20618)

(assert (=> b!241555 (= res!201648 (and (= (_2!11230 lt!377056) bit!26) (= (_1!11230 lt!377056) (_2!11231 lt!377057))))))

(declare-fun thiss!1005 () BitStream!10540)

(declare-fun readBitPure!0 (BitStream!10540) tuple2!20616)

(declare-fun readerFrom!0 (BitStream!10540 (_ BitVec 32) (_ BitVec 32)) BitStream!10540)

(assert (=> b!241555 (= lt!377056 (readBitPure!0 (readerFrom!0 (_2!11231 lt!377057) (currentBit!11633 thiss!1005) (currentByte!11638 thiss!1005))))))

(declare-fun b!241556 () Bool)

(declare-fun e!167433 () Bool)

(assert (=> b!241556 (= e!167433 e!167438)))

(declare-fun res!201651 () Bool)

(assert (=> b!241556 (=> (not res!201651) (not e!167438))))

(declare-fun lt!377058 () (_ BitVec 64))

(declare-fun lt!377055 () (_ BitVec 64))

(assert (=> b!241556 (= res!201651 (= lt!377058 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377055)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241556 (= lt!377058 (bitIndex!0 (size!5809 (buf!6275 (_2!11231 lt!377057))) (currentByte!11638 (_2!11231 lt!377057)) (currentBit!11633 (_2!11231 lt!377057))))))

(assert (=> b!241556 (= lt!377055 (bitIndex!0 (size!5809 (buf!6275 thiss!1005)) (currentByte!11638 thiss!1005) (currentBit!11633 thiss!1005)))))

(declare-fun b!241557 () Bool)

(assert (=> b!241557 (= e!167435 (= (bitIndex!0 (size!5809 (buf!6275 (_1!11230 lt!377056))) (currentByte!11638 (_1!11230 lt!377056)) (currentBit!11633 (_1!11230 lt!377056))) lt!377058))))

(declare-fun b!241558 () Bool)

(declare-fun res!201653 () Bool)

(declare-fun e!167434 () Bool)

(assert (=> b!241558 (=> (not res!201653) (not e!167434))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241558 (= res!201653 (bvslt from!289 nBits!297))))

(declare-fun b!241559 () Bool)

(declare-fun res!201654 () Bool)

(assert (=> b!241559 (=> (not res!201654) (not e!167438))))

(declare-fun isPrefixOf!0 (BitStream!10540 BitStream!10540) Bool)

(assert (=> b!241559 (= res!201654 (isPrefixOf!0 thiss!1005 (_2!11231 lt!377057)))))

(declare-fun b!241560 () Bool)

(assert (=> b!241560 (= e!167434 (not true))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241560 (validate_offset_bits!1 ((_ sign_extend 32) (size!5809 (buf!6275 (_2!11231 lt!377057)))) ((_ sign_extend 32) (currentByte!11638 (_2!11231 lt!377057))) ((_ sign_extend 32) (currentBit!11633 (_2!11231 lt!377057))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377054 () Unit!17701)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10540 BitStream!10540 (_ BitVec 64) (_ BitVec 64)) Unit!17701)

(assert (=> b!241560 (= lt!377054 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11231 lt!377057) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241560 e!167433))

(declare-fun res!201649 () Bool)

(assert (=> b!241560 (=> (not res!201649) (not e!167433))))

(assert (=> b!241560 (= res!201649 (= (size!5809 (buf!6275 thiss!1005)) (size!5809 (buf!6275 (_2!11231 lt!377057)))))))

(declare-fun appendBit!0 (BitStream!10540 Bool) tuple2!20618)

(assert (=> b!241560 (= lt!377057 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241561 () Bool)

(declare-fun res!201650 () Bool)

(assert (=> b!241561 (=> (not res!201650) (not e!167434))))

(assert (=> b!241561 (= res!201650 (validate_offset_bits!1 ((_ sign_extend 32) (size!5809 (buf!6275 thiss!1005))) ((_ sign_extend 32) (currentByte!11638 thiss!1005)) ((_ sign_extend 32) (currentBit!11633 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!201652 () Bool)

(assert (=> start!52448 (=> (not res!201652) (not e!167434))))

(assert (=> start!52448 (= res!201652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52448 e!167434))

(assert (=> start!52448 true))

(declare-fun e!167436 () Bool)

(declare-fun inv!12 (BitStream!10540) Bool)

(assert (=> start!52448 (and (inv!12 thiss!1005) e!167436)))

(declare-fun b!241562 () Bool)

(declare-fun array_inv!5550 (array!13259) Bool)

(assert (=> b!241562 (= e!167436 (array_inv!5550 (buf!6275 thiss!1005)))))

(assert (= (and start!52448 res!201652) b!241561))

(assert (= (and b!241561 res!201650) b!241558))

(assert (= (and b!241558 res!201653) b!241560))

(assert (= (and b!241560 res!201649) b!241556))

(assert (= (and b!241556 res!201651) b!241559))

(assert (= (and b!241559 res!201654) b!241555))

(assert (= (and b!241555 res!201648) b!241557))

(assert (= start!52448 b!241562))

(declare-fun m!364223 () Bool)

(assert (=> b!241555 m!364223))

(assert (=> b!241555 m!364223))

(declare-fun m!364225 () Bool)

(assert (=> b!241555 m!364225))

(declare-fun m!364227 () Bool)

(assert (=> b!241556 m!364227))

(declare-fun m!364229 () Bool)

(assert (=> b!241556 m!364229))

(declare-fun m!364231 () Bool)

(assert (=> b!241562 m!364231))

(declare-fun m!364233 () Bool)

(assert (=> start!52448 m!364233))

(declare-fun m!364235 () Bool)

(assert (=> b!241561 m!364235))

(declare-fun m!364237 () Bool)

(assert (=> b!241560 m!364237))

(declare-fun m!364239 () Bool)

(assert (=> b!241560 m!364239))

(declare-fun m!364241 () Bool)

(assert (=> b!241560 m!364241))

(declare-fun m!364243 () Bool)

(assert (=> b!241557 m!364243))

(declare-fun m!364245 () Bool)

(assert (=> b!241559 m!364245))

(push 1)

(assert (not b!241557))

(assert (not b!241560))

(assert (not b!241561))

(assert (not b!241555))

(assert (not b!241562))

(assert (not b!241556))

(assert (not b!241559))

(assert (not start!52448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

