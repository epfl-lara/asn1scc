; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52774 () Bool)

(assert start!52774)

(declare-fun b!244626 () Bool)

(declare-fun e!169560 () Bool)

(declare-fun e!169566 () Bool)

(assert (=> b!244626 (= e!169560 (not e!169566))))

(declare-fun res!204483 () Bool)

(assert (=> b!244626 (=> res!204483 e!169566)))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!244626 (= res!204483 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((array!13393 0))(
  ( (array!13394 (arr!6860 (Array (_ BitVec 32) (_ BitVec 8))) (size!5873 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10668 0))(
  ( (BitStream!10669 (buf!6345 array!13393) (currentByte!11723 (_ BitVec 32)) (currentBit!11718 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17841 0))(
  ( (Unit!17842) )
))
(declare-datatypes ((tuple2!21000 0))(
  ( (tuple2!21001 (_1!11422 Unit!17841) (_2!11422 BitStream!10668)) )
))
(declare-fun lt!381239 () tuple2!21000)

(declare-fun lt!381220 () tuple2!21000)

(declare-fun lt!381223 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244626 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381223)))

(declare-fun lt!381222 () Unit!17841)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10668 array!13393 (_ BitVec 64)) Unit!17841)

(assert (=> b!244626 (= lt!381222 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381239)) lt!381223))))

(declare-datatypes ((tuple2!21002 0))(
  ( (tuple2!21003 (_1!11423 BitStream!10668) (_2!11423 Bool)) )
))
(declare-fun lt!381229 () tuple2!21002)

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-datatypes ((tuple2!21004 0))(
  ( (tuple2!21005 (_1!11424 BitStream!10668) (_2!11424 BitStream!10668)) )
))
(declare-fun lt!381233 () tuple2!21004)

(declare-fun checkBitsLoopPure!0 (BitStream!10668 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21002)

(assert (=> b!244626 (= lt!381229 (checkBitsLoopPure!0 (_1!11424 lt!381233) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!10668)

(assert (=> b!244626 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381228 () Unit!17841)

(assert (=> b!244626 (= lt!381228 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6345 (_2!11422 lt!381239)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10668) tuple2!21002)

(assert (=> b!244626 (= (_2!11423 (readBitPure!0 (_1!11424 lt!381233))) bit!26)))

(declare-fun lt!381234 () tuple2!21004)

(declare-fun reader!0 (BitStream!10668 BitStream!10668) tuple2!21004)

(assert (=> b!244626 (= lt!381234 (reader!0 (_2!11422 lt!381220) (_2!11422 lt!381239)))))

(assert (=> b!244626 (= lt!381233 (reader!0 thiss!1005 (_2!11422 lt!381239)))))

(declare-fun e!169561 () Bool)

(assert (=> b!244626 e!169561))

(declare-fun res!204486 () Bool)

(assert (=> b!244626 (=> (not res!204486) (not e!169561))))

(declare-fun lt!381230 () tuple2!21002)

(declare-fun lt!381227 () tuple2!21002)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244626 (= res!204486 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381230))) (currentByte!11723 (_1!11423 lt!381230)) (currentBit!11718 (_1!11423 lt!381230))) (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381227))) (currentByte!11723 (_1!11423 lt!381227)) (currentBit!11718 (_1!11423 lt!381227)))))))

(declare-fun lt!381224 () Unit!17841)

(declare-fun lt!381237 () BitStream!10668)

(declare-fun readBitPrefixLemma!0 (BitStream!10668 BitStream!10668) Unit!17841)

(assert (=> b!244626 (= lt!381224 (readBitPrefixLemma!0 lt!381237 (_2!11422 lt!381239)))))

(assert (=> b!244626 (= lt!381227 (readBitPure!0 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005))))))

(assert (=> b!244626 (= lt!381230 (readBitPure!0 lt!381237))))

(assert (=> b!244626 (= lt!381237 (BitStream!10669 (buf!6345 (_2!11422 lt!381220)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(declare-fun e!169568 () Bool)

(assert (=> b!244626 e!169568))

(declare-fun res!204484 () Bool)

(assert (=> b!244626 (=> (not res!204484) (not e!169568))))

(declare-fun isPrefixOf!0 (BitStream!10668 BitStream!10668) Bool)

(assert (=> b!244626 (= res!204484 (isPrefixOf!0 thiss!1005 (_2!11422 lt!381239)))))

(declare-fun lt!381238 () Unit!17841)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10668 BitStream!10668 BitStream!10668) Unit!17841)

(assert (=> b!244626 (= lt!381238 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11422 lt!381220) (_2!11422 lt!381239)))))

(declare-fun e!169567 () Bool)

(assert (=> b!244626 e!169567))

(declare-fun res!204487 () Bool)

(assert (=> b!244626 (=> (not res!204487) (not e!169567))))

(assert (=> b!244626 (= res!204487 (= (size!5873 (buf!6345 (_2!11422 lt!381220))) (size!5873 (buf!6345 (_2!11422 lt!381239)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10668 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21000)

(assert (=> b!244626 (= lt!381239 (appendNBitsLoop!0 (_2!11422 lt!381220) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244626 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381223)))

(assert (=> b!244626 (= lt!381223 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!381236 () Unit!17841)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10668 BitStream!10668 (_ BitVec 64) (_ BitVec 64)) Unit!17841)

(assert (=> b!244626 (= lt!381236 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11422 lt!381220) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169558 () Bool)

(assert (=> b!244626 e!169558))

(declare-fun res!204485 () Bool)

(assert (=> b!244626 (=> (not res!204485) (not e!169558))))

(assert (=> b!244626 (= res!204485 (= (size!5873 (buf!6345 thiss!1005)) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(declare-fun appendBit!0 (BitStream!10668 Bool) tuple2!21000)

(assert (=> b!244626 (= lt!381220 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244627 () Bool)

(declare-fun res!204489 () Bool)

(declare-fun e!169559 () Bool)

(assert (=> b!244627 (=> (not res!204489) (not e!169559))))

(assert (=> b!244627 (= res!204489 (isPrefixOf!0 (_2!11422 lt!381220) (_2!11422 lt!381239)))))

(declare-fun b!244628 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244628 (= e!169568 (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381239)))))))

(declare-fun b!244629 () Bool)

(declare-fun lt!381231 () tuple2!21002)

(declare-fun lt!381235 () tuple2!21004)

(assert (=> b!244629 (= e!169559 (not (or (not (_2!11423 lt!381231)) (not (= (_1!11423 lt!381231) (_2!11424 lt!381235))))))))

(assert (=> b!244629 (= lt!381231 (checkBitsLoopPure!0 (_1!11424 lt!381235) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!381221 () (_ BitVec 64))

(assert (=> b!244629 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381221)))

(declare-fun lt!381240 () Unit!17841)

(assert (=> b!244629 (= lt!381240 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381239)) lt!381221))))

(assert (=> b!244629 (= lt!381235 (reader!0 (_2!11422 lt!381220) (_2!11422 lt!381239)))))

(declare-fun b!244630 () Bool)

(assert (=> b!244630 (= e!169561 (= (_2!11423 lt!381230) (_2!11423 lt!381227)))))

(declare-fun b!244631 () Bool)

(declare-fun e!169562 () Bool)

(declare-fun lt!381225 () tuple2!21002)

(declare-fun lt!381232 () (_ BitVec 64))

(assert (=> b!244631 (= e!169562 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381225))) (currentByte!11723 (_1!11423 lt!381225)) (currentBit!11718 (_1!11423 lt!381225))) lt!381232))))

(declare-fun b!244632 () Bool)

(declare-fun res!204481 () Bool)

(assert (=> b!244632 (=> (not res!204481) (not e!169560))))

(assert (=> b!244632 (= res!204481 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244633 () Bool)

(declare-fun e!169563 () Bool)

(declare-fun array_inv!5614 (array!13393) Bool)

(assert (=> b!244633 (= e!169563 (array_inv!5614 (buf!6345 thiss!1005)))))

(declare-fun b!244634 () Bool)

(declare-fun res!204490 () Bool)

(declare-fun e!169565 () Bool)

(assert (=> b!244634 (=> (not res!204490) (not e!169565))))

(assert (=> b!244634 (= res!204490 (isPrefixOf!0 thiss!1005 (_2!11422 lt!381220)))))

(declare-fun b!244635 () Bool)

(assert (=> b!244635 (= e!169558 e!169565)))

(declare-fun res!204488 () Bool)

(assert (=> b!244635 (=> (not res!204488) (not e!169565))))

(declare-fun lt!381226 () (_ BitVec 64))

(assert (=> b!244635 (= res!204488 (= lt!381232 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!381226)))))

(assert (=> b!244635 (= lt!381232 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))))))

(assert (=> b!244635 (= lt!381226 (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(declare-fun b!244636 () Bool)

(declare-fun res!204482 () Bool)

(assert (=> b!244636 (=> (not res!204482) (not e!169560))))

(assert (=> b!244636 (= res!204482 (bvslt from!289 nBits!297))))

(declare-fun b!244637 () Bool)

(declare-fun res!204480 () Bool)

(assert (=> b!244637 (=> (not res!204480) (not e!169568))))

(assert (=> b!244637 (= res!204480 (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(declare-fun b!244638 () Bool)

(assert (=> b!244638 (= e!169565 e!169562)))

(declare-fun res!204479 () Bool)

(assert (=> b!244638 (=> (not res!204479) (not e!169562))))

(assert (=> b!244638 (= res!204479 (and (= (_2!11423 lt!381225) bit!26) (= (_1!11423 lt!381225) (_2!11422 lt!381220))))))

(declare-fun readerFrom!0 (BitStream!10668 (_ BitVec 32) (_ BitVec 32)) BitStream!10668)

(assert (=> b!244638 (= lt!381225 (readBitPure!0 (readerFrom!0 (_2!11422 lt!381220) (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005))))))

(declare-fun b!244639 () Bool)

(assert (=> b!244639 (= e!169566 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11424 lt!381234)))) ((_ sign_extend 32) (currentByte!11723 (_1!11424 lt!381234))) ((_ sign_extend 32) (currentBit!11718 (_1!11424 lt!381234))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun res!204492 () Bool)

(assert (=> start!52774 (=> (not res!204492) (not e!169560))))

(assert (=> start!52774 (= res!204492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52774 e!169560))

(assert (=> start!52774 true))

(declare-fun inv!12 (BitStream!10668) Bool)

(assert (=> start!52774 (and (inv!12 thiss!1005) e!169563)))

(declare-fun b!244640 () Bool)

(assert (=> b!244640 (= e!169567 e!169559)))

(declare-fun res!204491 () Bool)

(assert (=> b!244640 (=> (not res!204491) (not e!169559))))

(assert (=> b!244640 (= res!204491 (= (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381239))) (currentByte!11723 (_2!11422 lt!381239)) (currentBit!11718 (_2!11422 lt!381239))) (bvadd (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))) lt!381221)))))

(assert (=> b!244640 (= lt!381221 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!52774 res!204492) b!244632))

(assert (= (and b!244632 res!204481) b!244636))

(assert (= (and b!244636 res!204482) b!244626))

(assert (= (and b!244626 res!204485) b!244635))

(assert (= (and b!244635 res!204488) b!244634))

(assert (= (and b!244634 res!204490) b!244638))

(assert (= (and b!244638 res!204479) b!244631))

(assert (= (and b!244626 res!204487) b!244640))

(assert (= (and b!244640 res!204491) b!244627))

(assert (= (and b!244627 res!204489) b!244629))

(assert (= (and b!244626 res!204484) b!244637))

(assert (= (and b!244637 res!204480) b!244628))

(assert (= (and b!244626 res!204486) b!244630))

(assert (= (and b!244626 (not res!204483)) b!244639))

(assert (= start!52774 b!244633))

(declare-fun m!368711 () Bool)

(assert (=> b!244633 m!368711))

(declare-fun m!368713 () Bool)

(assert (=> b!244628 m!368713))

(declare-fun m!368715 () Bool)

(assert (=> b!244639 m!368715))

(declare-fun m!368717 () Bool)

(assert (=> b!244634 m!368717))

(declare-fun m!368719 () Bool)

(assert (=> b!244638 m!368719))

(assert (=> b!244638 m!368719))

(declare-fun m!368721 () Bool)

(assert (=> b!244638 m!368721))

(declare-fun m!368723 () Bool)

(assert (=> b!244635 m!368723))

(declare-fun m!368725 () Bool)

(assert (=> b!244635 m!368725))

(declare-fun m!368727 () Bool)

(assert (=> b!244627 m!368727))

(declare-fun m!368729 () Bool)

(assert (=> b!244640 m!368729))

(assert (=> b!244640 m!368723))

(declare-fun m!368731 () Bool)

(assert (=> start!52774 m!368731))

(declare-fun m!368733 () Bool)

(assert (=> b!244629 m!368733))

(declare-fun m!368735 () Bool)

(assert (=> b!244629 m!368735))

(declare-fun m!368737 () Bool)

(assert (=> b!244629 m!368737))

(declare-fun m!368739 () Bool)

(assert (=> b!244629 m!368739))

(declare-fun m!368741 () Bool)

(assert (=> b!244626 m!368741))

(declare-fun m!368743 () Bool)

(assert (=> b!244626 m!368743))

(declare-fun m!368745 () Bool)

(assert (=> b!244626 m!368745))

(declare-fun m!368747 () Bool)

(assert (=> b!244626 m!368747))

(declare-fun m!368749 () Bool)

(assert (=> b!244626 m!368749))

(declare-fun m!368751 () Bool)

(assert (=> b!244626 m!368751))

(declare-fun m!368753 () Bool)

(assert (=> b!244626 m!368753))

(declare-fun m!368755 () Bool)

(assert (=> b!244626 m!368755))

(declare-fun m!368757 () Bool)

(assert (=> b!244626 m!368757))

(declare-fun m!368759 () Bool)

(assert (=> b!244626 m!368759))

(declare-fun m!368761 () Bool)

(assert (=> b!244626 m!368761))

(declare-fun m!368763 () Bool)

(assert (=> b!244626 m!368763))

(declare-fun m!368765 () Bool)

(assert (=> b!244626 m!368765))

(declare-fun m!368767 () Bool)

(assert (=> b!244626 m!368767))

(declare-fun m!368769 () Bool)

(assert (=> b!244626 m!368769))

(assert (=> b!244626 m!368739))

(declare-fun m!368771 () Bool)

(assert (=> b!244626 m!368771))

(declare-fun m!368773 () Bool)

(assert (=> b!244626 m!368773))

(declare-fun m!368775 () Bool)

(assert (=> b!244626 m!368775))

(declare-fun m!368777 () Bool)

(assert (=> b!244631 m!368777))

(declare-fun m!368779 () Bool)

(assert (=> b!244637 m!368779))

(declare-fun m!368781 () Bool)

(assert (=> b!244632 m!368781))

(check-sat (not b!244635) (not b!244628) (not b!244631) (not b!244639) (not b!244629) (not b!244632) (not b!244634) (not b!244627) (not b!244633) (not b!244626) (not b!244640) (not b!244637) (not start!52774) (not b!244638))
(check-sat)
(get-model)

(declare-fun d!81924 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81924 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11424 lt!381234)))) ((_ sign_extend 32) (currentByte!11723 (_1!11424 lt!381234))) ((_ sign_extend 32) (currentBit!11718 (_1!11424 lt!381234))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11424 lt!381234)))) ((_ sign_extend 32) (currentByte!11723 (_1!11424 lt!381234))) ((_ sign_extend 32) (currentBit!11718 (_1!11424 lt!381234)))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun bs!20733 () Bool)

(assert (= bs!20733 d!81924))

(declare-fun m!368855 () Bool)

(assert (=> bs!20733 m!368855))

(assert (=> b!244639 d!81924))

(declare-fun d!81926 () Bool)

(assert (=> d!81926 (= (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381239)))) (and (bvsge (currentBit!11718 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11718 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11723 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381239)))) (and (= (currentBit!11718 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381239))))))))))

(assert (=> b!244628 d!81926))

(declare-fun d!81928 () Bool)

(declare-datatypes ((tuple2!21012 0))(
  ( (tuple2!21013 (_1!11428 Bool) (_2!11428 BitStream!10668)) )
))
(declare-fun lt!381306 () tuple2!21012)

(declare-fun readBit!0 (BitStream!10668) tuple2!21012)

(assert (=> d!81928 (= lt!381306 (readBit!0 (readerFrom!0 (_2!11422 lt!381220) (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005))))))

(assert (=> d!81928 (= (readBitPure!0 (readerFrom!0 (_2!11422 lt!381220) (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005))) (tuple2!21003 (_2!11428 lt!381306) (_1!11428 lt!381306)))))

(declare-fun bs!20734 () Bool)

(assert (= bs!20734 d!81928))

(assert (=> bs!20734 m!368719))

(declare-fun m!368857 () Bool)

(assert (=> bs!20734 m!368857))

(assert (=> b!244638 d!81928))

(declare-fun d!81930 () Bool)

(declare-fun e!169604 () Bool)

(assert (=> d!81930 e!169604))

(declare-fun res!204538 () Bool)

(assert (=> d!81930 (=> (not res!204538) (not e!169604))))

(assert (=> d!81930 (= res!204538 (invariant!0 (currentBit!11718 (_2!11422 lt!381220)) (currentByte!11723 (_2!11422 lt!381220)) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(assert (=> d!81930 (= (readerFrom!0 (_2!11422 lt!381220) (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005)) (BitStream!10669 (buf!6345 (_2!11422 lt!381220)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(declare-fun b!244688 () Bool)

(assert (=> b!244688 (= e!169604 (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(assert (= (and d!81930 res!204538) b!244688))

(declare-fun m!368859 () Bool)

(assert (=> d!81930 m!368859))

(assert (=> b!244688 m!368779))

(assert (=> b!244638 d!81930))

(declare-fun d!81932 () Bool)

(declare-fun res!204546 () Bool)

(declare-fun e!169609 () Bool)

(assert (=> d!81932 (=> (not res!204546) (not e!169609))))

(assert (=> d!81932 (= res!204546 (= (size!5873 (buf!6345 (_2!11422 lt!381220))) (size!5873 (buf!6345 (_2!11422 lt!381239)))))))

(assert (=> d!81932 (= (isPrefixOf!0 (_2!11422 lt!381220) (_2!11422 lt!381239)) e!169609)))

(declare-fun b!244695 () Bool)

(declare-fun res!204545 () Bool)

(assert (=> b!244695 (=> (not res!204545) (not e!169609))))

(assert (=> b!244695 (= res!204545 (bvsle (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))) (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381239))) (currentByte!11723 (_2!11422 lt!381239)) (currentBit!11718 (_2!11422 lt!381239)))))))

(declare-fun b!244696 () Bool)

(declare-fun e!169610 () Bool)

(assert (=> b!244696 (= e!169609 e!169610)))

(declare-fun res!204547 () Bool)

(assert (=> b!244696 (=> res!204547 e!169610)))

(assert (=> b!244696 (= res!204547 (= (size!5873 (buf!6345 (_2!11422 lt!381220))) #b00000000000000000000000000000000))))

(declare-fun b!244697 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13393 array!13393 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244697 (= e!169610 (arrayBitRangesEq!0 (buf!6345 (_2!11422 lt!381220)) (buf!6345 (_2!11422 lt!381239)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220)))))))

(assert (= (and d!81932 res!204546) b!244695))

(assert (= (and b!244695 res!204545) b!244696))

(assert (= (and b!244696 (not res!204547)) b!244697))

(assert (=> b!244695 m!368723))

(assert (=> b!244695 m!368729))

(assert (=> b!244697 m!368723))

(assert (=> b!244697 m!368723))

(declare-fun m!368861 () Bool)

(assert (=> b!244697 m!368861))

(assert (=> b!244627 d!81932))

(declare-fun d!81934 () Bool)

(assert (=> d!81934 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 thiss!1005))))))

(declare-fun bs!20735 () Bool)

(assert (= bs!20735 d!81934))

(declare-fun m!368863 () Bool)

(assert (=> bs!20735 m!368863))

(assert (=> start!52774 d!81934))

(declare-fun d!81936 () Bool)

(assert (=> d!81936 (= (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381220)))) (and (bvsge (currentBit!11718 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11718 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11723 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381220)))) (and (= (currentBit!11718 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11723 thiss!1005) (size!5873 (buf!6345 (_2!11422 lt!381220))))))))))

(assert (=> b!244637 d!81936))

(declare-fun d!81938 () Bool)

(declare-fun lt!381307 () tuple2!21012)

(assert (=> d!81938 (= lt!381307 (readBit!0 (_1!11424 lt!381233)))))

(assert (=> d!81938 (= (readBitPure!0 (_1!11424 lt!381233)) (tuple2!21003 (_2!11428 lt!381307) (_1!11428 lt!381307)))))

(declare-fun bs!20736 () Bool)

(assert (= bs!20736 d!81938))

(declare-fun m!368865 () Bool)

(assert (=> bs!20736 m!368865))

(assert (=> b!244626 d!81938))

(declare-fun d!81940 () Bool)

(declare-fun res!204549 () Bool)

(declare-fun e!169611 () Bool)

(assert (=> d!81940 (=> (not res!204549) (not e!169611))))

(assert (=> d!81940 (= res!204549 (= (size!5873 (buf!6345 thiss!1005)) (size!5873 (buf!6345 (_2!11422 lt!381239)))))))

(assert (=> d!81940 (= (isPrefixOf!0 thiss!1005 (_2!11422 lt!381239)) e!169611)))

(declare-fun b!244698 () Bool)

(declare-fun res!204548 () Bool)

(assert (=> b!244698 (=> (not res!204548) (not e!169611))))

(assert (=> b!244698 (= res!204548 (bvsle (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)) (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381239))) (currentByte!11723 (_2!11422 lt!381239)) (currentBit!11718 (_2!11422 lt!381239)))))))

(declare-fun b!244699 () Bool)

(declare-fun e!169612 () Bool)

(assert (=> b!244699 (= e!169611 e!169612)))

(declare-fun res!204550 () Bool)

(assert (=> b!244699 (=> res!204550 e!169612)))

(assert (=> b!244699 (= res!204550 (= (size!5873 (buf!6345 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!244700 () Bool)

(assert (=> b!244700 (= e!169612 (arrayBitRangesEq!0 (buf!6345 thiss!1005) (buf!6345 (_2!11422 lt!381239)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005))))))

(assert (= (and d!81940 res!204549) b!244698))

(assert (= (and b!244698 res!204548) b!244699))

(assert (= (and b!244699 (not res!204550)) b!244700))

(assert (=> b!244698 m!368725))

(assert (=> b!244698 m!368729))

(assert (=> b!244700 m!368725))

(assert (=> b!244700 m!368725))

(declare-fun m!368867 () Bool)

(assert (=> b!244700 m!368867))

(assert (=> b!244626 d!81940))

(declare-fun d!81942 () Bool)

(declare-fun lt!381308 () tuple2!21012)

(assert (=> d!81942 (= lt!381308 (readBit!0 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005))))))

(assert (=> d!81942 (= (readBitPure!0 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005))) (tuple2!21003 (_2!11428 lt!381308) (_1!11428 lt!381308)))))

(declare-fun bs!20737 () Bool)

(assert (= bs!20737 d!81942))

(declare-fun m!368869 () Bool)

(assert (=> bs!20737 m!368869))

(assert (=> b!244626 d!81942))

(declare-fun d!81944 () Bool)

(declare-fun lt!381309 () tuple2!21012)

(assert (=> d!81944 (= lt!381309 (readBit!0 lt!381237))))

(assert (=> d!81944 (= (readBitPure!0 lt!381237) (tuple2!21003 (_2!11428 lt!381309) (_1!11428 lt!381309)))))

(declare-fun bs!20738 () Bool)

(assert (= bs!20738 d!81944))

(declare-fun m!368871 () Bool)

(assert (=> bs!20738 m!368871))

(assert (=> b!244626 d!81944))

(declare-fun b!244711 () Bool)

(declare-fun e!169618 () Unit!17841)

(declare-fun Unit!17845 () Unit!17841)

(assert (=> b!244711 (= e!169618 Unit!17845)))

(declare-fun b!244712 () Bool)

(declare-fun res!204557 () Bool)

(declare-fun e!169617 () Bool)

(assert (=> b!244712 (=> (not res!204557) (not e!169617))))

(declare-fun lt!381357 () tuple2!21004)

(assert (=> b!244712 (= res!204557 (isPrefixOf!0 (_1!11424 lt!381357) thiss!1005))))

(declare-fun b!244713 () Bool)

(declare-fun lt!381361 () Unit!17841)

(assert (=> b!244713 (= e!169618 lt!381361)))

(declare-fun lt!381352 () (_ BitVec 64))

(assert (=> b!244713 (= lt!381352 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!381355 () (_ BitVec 64))

(assert (=> b!244713 (= lt!381355 (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13393 array!13393 (_ BitVec 64) (_ BitVec 64)) Unit!17841)

(assert (=> b!244713 (= lt!381361 (arrayBitRangesEqSymmetric!0 (buf!6345 thiss!1005) (buf!6345 (_2!11422 lt!381239)) lt!381352 lt!381355))))

(assert (=> b!244713 (arrayBitRangesEq!0 (buf!6345 (_2!11422 lt!381239)) (buf!6345 thiss!1005) lt!381352 lt!381355)))

(declare-fun b!244714 () Bool)

(declare-fun res!204559 () Bool)

(assert (=> b!244714 (=> (not res!204559) (not e!169617))))

(assert (=> b!244714 (= res!204559 (isPrefixOf!0 (_2!11424 lt!381357) (_2!11422 lt!381239)))))

(declare-fun lt!381358 () (_ BitVec 64))

(declare-fun lt!381368 () (_ BitVec 64))

(declare-fun b!244715 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10668 (_ BitVec 64)) BitStream!10668)

(assert (=> b!244715 (= e!169617 (= (_1!11424 lt!381357) (withMovedBitIndex!0 (_2!11424 lt!381357) (bvsub lt!381368 lt!381358))))))

(assert (=> b!244715 (or (= (bvand lt!381368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381358 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381368 lt!381358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244715 (= lt!381358 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381239))) (currentByte!11723 (_2!11422 lt!381239)) (currentBit!11718 (_2!11422 lt!381239))))))

(assert (=> b!244715 (= lt!381368 (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(declare-fun d!81946 () Bool)

(assert (=> d!81946 e!169617))

(declare-fun res!204558 () Bool)

(assert (=> d!81946 (=> (not res!204558) (not e!169617))))

(assert (=> d!81946 (= res!204558 (isPrefixOf!0 (_1!11424 lt!381357) (_2!11424 lt!381357)))))

(declare-fun lt!381364 () BitStream!10668)

(assert (=> d!81946 (= lt!381357 (tuple2!21005 lt!381364 (_2!11422 lt!381239)))))

(declare-fun lt!381350 () Unit!17841)

(declare-fun lt!381367 () Unit!17841)

(assert (=> d!81946 (= lt!381350 lt!381367)))

(assert (=> d!81946 (isPrefixOf!0 lt!381364 (_2!11422 lt!381239))))

(assert (=> d!81946 (= lt!381367 (lemmaIsPrefixTransitive!0 lt!381364 (_2!11422 lt!381239) (_2!11422 lt!381239)))))

(declare-fun lt!381369 () Unit!17841)

(declare-fun lt!381363 () Unit!17841)

(assert (=> d!81946 (= lt!381369 lt!381363)))

(assert (=> d!81946 (isPrefixOf!0 lt!381364 (_2!11422 lt!381239))))

(assert (=> d!81946 (= lt!381363 (lemmaIsPrefixTransitive!0 lt!381364 thiss!1005 (_2!11422 lt!381239)))))

(declare-fun lt!381366 () Unit!17841)

(assert (=> d!81946 (= lt!381366 e!169618)))

(declare-fun c!11467 () Bool)

(assert (=> d!81946 (= c!11467 (not (= (size!5873 (buf!6345 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!381365 () Unit!17841)

(declare-fun lt!381353 () Unit!17841)

(assert (=> d!81946 (= lt!381365 lt!381353)))

(assert (=> d!81946 (isPrefixOf!0 (_2!11422 lt!381239) (_2!11422 lt!381239))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10668) Unit!17841)

(assert (=> d!81946 (= lt!381353 (lemmaIsPrefixRefl!0 (_2!11422 lt!381239)))))

(declare-fun lt!381359 () Unit!17841)

(declare-fun lt!381362 () Unit!17841)

(assert (=> d!81946 (= lt!381359 lt!381362)))

(assert (=> d!81946 (= lt!381362 (lemmaIsPrefixRefl!0 (_2!11422 lt!381239)))))

(declare-fun lt!381360 () Unit!17841)

(declare-fun lt!381356 () Unit!17841)

(assert (=> d!81946 (= lt!381360 lt!381356)))

(assert (=> d!81946 (isPrefixOf!0 lt!381364 lt!381364)))

(assert (=> d!81946 (= lt!381356 (lemmaIsPrefixRefl!0 lt!381364))))

(declare-fun lt!381354 () Unit!17841)

(declare-fun lt!381351 () Unit!17841)

(assert (=> d!81946 (= lt!381354 lt!381351)))

(assert (=> d!81946 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81946 (= lt!381351 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81946 (= lt!381364 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(assert (=> d!81946 (isPrefixOf!0 thiss!1005 (_2!11422 lt!381239))))

(assert (=> d!81946 (= (reader!0 thiss!1005 (_2!11422 lt!381239)) lt!381357)))

(assert (= (and d!81946 c!11467) b!244713))

(assert (= (and d!81946 (not c!11467)) b!244711))

(assert (= (and d!81946 res!204558) b!244712))

(assert (= (and b!244712 res!204557) b!244714))

(assert (= (and b!244714 res!204559) b!244715))

(declare-fun m!368873 () Bool)

(assert (=> d!81946 m!368873))

(declare-fun m!368875 () Bool)

(assert (=> d!81946 m!368875))

(declare-fun m!368877 () Bool)

(assert (=> d!81946 m!368877))

(declare-fun m!368879 () Bool)

(assert (=> d!81946 m!368879))

(declare-fun m!368881 () Bool)

(assert (=> d!81946 m!368881))

(declare-fun m!368883 () Bool)

(assert (=> d!81946 m!368883))

(declare-fun m!368885 () Bool)

(assert (=> d!81946 m!368885))

(assert (=> d!81946 m!368763))

(declare-fun m!368887 () Bool)

(assert (=> d!81946 m!368887))

(declare-fun m!368889 () Bool)

(assert (=> d!81946 m!368889))

(declare-fun m!368891 () Bool)

(assert (=> d!81946 m!368891))

(declare-fun m!368893 () Bool)

(assert (=> b!244712 m!368893))

(declare-fun m!368895 () Bool)

(assert (=> b!244715 m!368895))

(assert (=> b!244715 m!368729))

(assert (=> b!244715 m!368725))

(assert (=> b!244713 m!368725))

(declare-fun m!368897 () Bool)

(assert (=> b!244713 m!368897))

(declare-fun m!368899 () Bool)

(assert (=> b!244713 m!368899))

(declare-fun m!368901 () Bool)

(assert (=> b!244714 m!368901))

(assert (=> b!244626 d!81946))

(declare-fun b!244725 () Bool)

(declare-fun res!204570 () Bool)

(declare-fun e!169624 () Bool)

(assert (=> b!244725 (=> (not res!204570) (not e!169624))))

(declare-fun lt!381388 () tuple2!21000)

(assert (=> b!244725 (= res!204570 (isPrefixOf!0 (_2!11422 lt!381220) (_2!11422 lt!381388)))))

(declare-fun d!81948 () Bool)

(assert (=> d!81948 e!169624))

(declare-fun res!204571 () Bool)

(assert (=> d!81948 (=> (not res!204571) (not e!169624))))

(assert (=> d!81948 (= res!204571 (= (size!5873 (buf!6345 (_2!11422 lt!381220))) (size!5873 (buf!6345 (_2!11422 lt!381388)))))))

(declare-fun choose!51 (BitStream!10668 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21000)

(assert (=> d!81948 (= lt!381388 (choose!51 (_2!11422 lt!381220) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81948 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81948 (= (appendNBitsLoop!0 (_2!11422 lt!381220) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!381388)))

(declare-fun b!244727 () Bool)

(declare-fun e!169623 () Bool)

(declare-fun lt!381392 () (_ BitVec 64))

(assert (=> b!244727 (= e!169623 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381392))))

(declare-fun b!244726 () Bool)

(declare-fun lt!381393 () tuple2!21002)

(declare-fun lt!381391 () tuple2!21004)

(assert (=> b!244726 (= e!169624 (and (_2!11423 lt!381393) (= (_1!11423 lt!381393) (_2!11424 lt!381391))))))

(assert (=> b!244726 (= lt!381393 (checkBitsLoopPure!0 (_1!11424 lt!381391) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!381386 () Unit!17841)

(declare-fun lt!381389 () Unit!17841)

(assert (=> b!244726 (= lt!381386 lt!381389)))

(assert (=> b!244726 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381388)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381392)))

(assert (=> b!244726 (= lt!381389 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381388)) lt!381392))))

(assert (=> b!244726 e!169623))

(declare-fun res!204568 () Bool)

(assert (=> b!244726 (=> (not res!204568) (not e!169623))))

(assert (=> b!244726 (= res!204568 (and (= (size!5873 (buf!6345 (_2!11422 lt!381220))) (size!5873 (buf!6345 (_2!11422 lt!381388)))) (bvsge lt!381392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244726 (= lt!381392 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244726 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244726 (= lt!381391 (reader!0 (_2!11422 lt!381220) (_2!11422 lt!381388)))))

(declare-fun b!244724 () Bool)

(declare-fun res!204569 () Bool)

(assert (=> b!244724 (=> (not res!204569) (not e!169624))))

(declare-fun lt!381387 () (_ BitVec 64))

(declare-fun lt!381390 () (_ BitVec 64))

(assert (=> b!244724 (= res!204569 (= (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381388))) (currentByte!11723 (_2!11422 lt!381388)) (currentBit!11718 (_2!11422 lt!381388))) (bvadd lt!381390 lt!381387)))))

(assert (=> b!244724 (or (not (= (bvand lt!381390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381387 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!381390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!381390 lt!381387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244724 (= lt!381387 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244724 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244724 (= lt!381390 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))))))

(assert (= (and d!81948 res!204571) b!244724))

(assert (= (and b!244724 res!204569) b!244725))

(assert (= (and b!244725 res!204570) b!244726))

(assert (= (and b!244726 res!204568) b!244727))

(declare-fun m!368903 () Bool)

(assert (=> b!244724 m!368903))

(assert (=> b!244724 m!368723))

(declare-fun m!368905 () Bool)

(assert (=> b!244725 m!368905))

(declare-fun m!368907 () Bool)

(assert (=> b!244727 m!368907))

(declare-fun m!368909 () Bool)

(assert (=> d!81948 m!368909))

(declare-fun m!368911 () Bool)

(assert (=> b!244726 m!368911))

(declare-fun m!368913 () Bool)

(assert (=> b!244726 m!368913))

(declare-fun m!368915 () Bool)

(assert (=> b!244726 m!368915))

(declare-fun m!368917 () Bool)

(assert (=> b!244726 m!368917))

(assert (=> b!244626 d!81948))

(declare-fun d!81950 () Bool)

(declare-fun e!169627 () Bool)

(assert (=> d!81950 e!169627))

(declare-fun res!204576 () Bool)

(assert (=> d!81950 (=> (not res!204576) (not e!169627))))

(declare-fun lt!381409 () (_ BitVec 64))

(declare-fun lt!381411 () (_ BitVec 64))

(declare-fun lt!381408 () (_ BitVec 64))

(assert (=> d!81950 (= res!204576 (= lt!381409 (bvsub lt!381411 lt!381408)))))

(assert (=> d!81950 (or (= (bvand lt!381411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381411 lt!381408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81950 (= lt!381408 (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381230)))) ((_ sign_extend 32) (currentByte!11723 (_1!11423 lt!381230))) ((_ sign_extend 32) (currentBit!11718 (_1!11423 lt!381230)))))))

(declare-fun lt!381406 () (_ BitVec 64))

(declare-fun lt!381407 () (_ BitVec 64))

(assert (=> d!81950 (= lt!381411 (bvmul lt!381406 lt!381407))))

(assert (=> d!81950 (or (= lt!381406 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381407 (bvsdiv (bvmul lt!381406 lt!381407) lt!381406)))))

(assert (=> d!81950 (= lt!381407 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81950 (= lt!381406 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381230)))))))

(assert (=> d!81950 (= lt!381409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11723 (_1!11423 lt!381230))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11718 (_1!11423 lt!381230)))))))

(assert (=> d!81950 (invariant!0 (currentBit!11718 (_1!11423 lt!381230)) (currentByte!11723 (_1!11423 lt!381230)) (size!5873 (buf!6345 (_1!11423 lt!381230))))))

(assert (=> d!81950 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381230))) (currentByte!11723 (_1!11423 lt!381230)) (currentBit!11718 (_1!11423 lt!381230))) lt!381409)))

(declare-fun b!244732 () Bool)

(declare-fun res!204577 () Bool)

(assert (=> b!244732 (=> (not res!204577) (not e!169627))))

(assert (=> b!244732 (= res!204577 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381409))))

(declare-fun b!244733 () Bool)

(declare-fun lt!381410 () (_ BitVec 64))

(assert (=> b!244733 (= e!169627 (bvsle lt!381409 (bvmul lt!381410 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244733 (or (= lt!381410 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381410 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381410)))))

(assert (=> b!244733 (= lt!381410 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381230)))))))

(assert (= (and d!81950 res!204576) b!244732))

(assert (= (and b!244732 res!204577) b!244733))

(declare-fun m!368919 () Bool)

(assert (=> d!81950 m!368919))

(declare-fun m!368921 () Bool)

(assert (=> d!81950 m!368921))

(assert (=> b!244626 d!81950))

(declare-fun b!244734 () Bool)

(declare-fun e!169629 () Unit!17841)

(declare-fun Unit!17846 () Unit!17841)

(assert (=> b!244734 (= e!169629 Unit!17846)))

(declare-fun b!244735 () Bool)

(declare-fun res!204578 () Bool)

(declare-fun e!169628 () Bool)

(assert (=> b!244735 (=> (not res!204578) (not e!169628))))

(declare-fun lt!381419 () tuple2!21004)

(assert (=> b!244735 (= res!204578 (isPrefixOf!0 (_1!11424 lt!381419) (_2!11422 lt!381220)))))

(declare-fun b!244736 () Bool)

(declare-fun lt!381423 () Unit!17841)

(assert (=> b!244736 (= e!169629 lt!381423)))

(declare-fun lt!381414 () (_ BitVec 64))

(assert (=> b!244736 (= lt!381414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!381417 () (_ BitVec 64))

(assert (=> b!244736 (= lt!381417 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))))))

(assert (=> b!244736 (= lt!381423 (arrayBitRangesEqSymmetric!0 (buf!6345 (_2!11422 lt!381220)) (buf!6345 (_2!11422 lt!381239)) lt!381414 lt!381417))))

(assert (=> b!244736 (arrayBitRangesEq!0 (buf!6345 (_2!11422 lt!381239)) (buf!6345 (_2!11422 lt!381220)) lt!381414 lt!381417)))

(declare-fun b!244737 () Bool)

(declare-fun res!204580 () Bool)

(assert (=> b!244737 (=> (not res!204580) (not e!169628))))

(assert (=> b!244737 (= res!204580 (isPrefixOf!0 (_2!11424 lt!381419) (_2!11422 lt!381239)))))

(declare-fun lt!381420 () (_ BitVec 64))

(declare-fun b!244738 () Bool)

(declare-fun lt!381430 () (_ BitVec 64))

(assert (=> b!244738 (= e!169628 (= (_1!11424 lt!381419) (withMovedBitIndex!0 (_2!11424 lt!381419) (bvsub lt!381430 lt!381420))))))

(assert (=> b!244738 (or (= (bvand lt!381430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381430 lt!381420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244738 (= lt!381420 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381239))) (currentByte!11723 (_2!11422 lt!381239)) (currentBit!11718 (_2!11422 lt!381239))))))

(assert (=> b!244738 (= lt!381430 (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))))))

(declare-fun d!81952 () Bool)

(assert (=> d!81952 e!169628))

(declare-fun res!204579 () Bool)

(assert (=> d!81952 (=> (not res!204579) (not e!169628))))

(assert (=> d!81952 (= res!204579 (isPrefixOf!0 (_1!11424 lt!381419) (_2!11424 lt!381419)))))

(declare-fun lt!381426 () BitStream!10668)

(assert (=> d!81952 (= lt!381419 (tuple2!21005 lt!381426 (_2!11422 lt!381239)))))

(declare-fun lt!381412 () Unit!17841)

(declare-fun lt!381429 () Unit!17841)

(assert (=> d!81952 (= lt!381412 lt!381429)))

(assert (=> d!81952 (isPrefixOf!0 lt!381426 (_2!11422 lt!381239))))

(assert (=> d!81952 (= lt!381429 (lemmaIsPrefixTransitive!0 lt!381426 (_2!11422 lt!381239) (_2!11422 lt!381239)))))

(declare-fun lt!381431 () Unit!17841)

(declare-fun lt!381425 () Unit!17841)

(assert (=> d!81952 (= lt!381431 lt!381425)))

(assert (=> d!81952 (isPrefixOf!0 lt!381426 (_2!11422 lt!381239))))

(assert (=> d!81952 (= lt!381425 (lemmaIsPrefixTransitive!0 lt!381426 (_2!11422 lt!381220) (_2!11422 lt!381239)))))

(declare-fun lt!381428 () Unit!17841)

(assert (=> d!81952 (= lt!381428 e!169629)))

(declare-fun c!11468 () Bool)

(assert (=> d!81952 (= c!11468 (not (= (size!5873 (buf!6345 (_2!11422 lt!381220))) #b00000000000000000000000000000000)))))

(declare-fun lt!381427 () Unit!17841)

(declare-fun lt!381415 () Unit!17841)

(assert (=> d!81952 (= lt!381427 lt!381415)))

(assert (=> d!81952 (isPrefixOf!0 (_2!11422 lt!381239) (_2!11422 lt!381239))))

(assert (=> d!81952 (= lt!381415 (lemmaIsPrefixRefl!0 (_2!11422 lt!381239)))))

(declare-fun lt!381421 () Unit!17841)

(declare-fun lt!381424 () Unit!17841)

(assert (=> d!81952 (= lt!381421 lt!381424)))

(assert (=> d!81952 (= lt!381424 (lemmaIsPrefixRefl!0 (_2!11422 lt!381239)))))

(declare-fun lt!381422 () Unit!17841)

(declare-fun lt!381418 () Unit!17841)

(assert (=> d!81952 (= lt!381422 lt!381418)))

(assert (=> d!81952 (isPrefixOf!0 lt!381426 lt!381426)))

(assert (=> d!81952 (= lt!381418 (lemmaIsPrefixRefl!0 lt!381426))))

(declare-fun lt!381416 () Unit!17841)

(declare-fun lt!381413 () Unit!17841)

(assert (=> d!81952 (= lt!381416 lt!381413)))

(assert (=> d!81952 (isPrefixOf!0 (_2!11422 lt!381220) (_2!11422 lt!381220))))

(assert (=> d!81952 (= lt!381413 (lemmaIsPrefixRefl!0 (_2!11422 lt!381220)))))

(assert (=> d!81952 (= lt!381426 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))))))

(assert (=> d!81952 (isPrefixOf!0 (_2!11422 lt!381220) (_2!11422 lt!381239))))

(assert (=> d!81952 (= (reader!0 (_2!11422 lt!381220) (_2!11422 lt!381239)) lt!381419)))

(assert (= (and d!81952 c!11468) b!244736))

(assert (= (and d!81952 (not c!11468)) b!244734))

(assert (= (and d!81952 res!204579) b!244735))

(assert (= (and b!244735 res!204578) b!244737))

(assert (= (and b!244737 res!204580) b!244738))

(assert (=> d!81952 m!368873))

(declare-fun m!368923 () Bool)

(assert (=> d!81952 m!368923))

(declare-fun m!368925 () Bool)

(assert (=> d!81952 m!368925))

(declare-fun m!368927 () Bool)

(assert (=> d!81952 m!368927))

(declare-fun m!368929 () Bool)

(assert (=> d!81952 m!368929))

(declare-fun m!368931 () Bool)

(assert (=> d!81952 m!368931))

(declare-fun m!368933 () Bool)

(assert (=> d!81952 m!368933))

(assert (=> d!81952 m!368727))

(assert (=> d!81952 m!368887))

(declare-fun m!368935 () Bool)

(assert (=> d!81952 m!368935))

(declare-fun m!368937 () Bool)

(assert (=> d!81952 m!368937))

(declare-fun m!368939 () Bool)

(assert (=> b!244735 m!368939))

(declare-fun m!368941 () Bool)

(assert (=> b!244738 m!368941))

(assert (=> b!244738 m!368729))

(assert (=> b!244738 m!368723))

(assert (=> b!244736 m!368723))

(declare-fun m!368943 () Bool)

(assert (=> b!244736 m!368943))

(declare-fun m!368945 () Bool)

(assert (=> b!244736 m!368945))

(declare-fun m!368947 () Bool)

(assert (=> b!244737 m!368947))

(assert (=> b!244626 d!81952))

(declare-fun d!81954 () Bool)

(assert (=> d!81954 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381434 () Unit!17841)

(declare-fun choose!9 (BitStream!10668 array!13393 (_ BitVec 64) BitStream!10668) Unit!17841)

(assert (=> d!81954 (= lt!381434 (choose!9 thiss!1005 (buf!6345 (_2!11422 lt!381239)) (bvsub nBits!297 from!289) (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005))))))

(assert (=> d!81954 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6345 (_2!11422 lt!381239)) (bvsub nBits!297 from!289)) lt!381434)))

(declare-fun bs!20739 () Bool)

(assert (= bs!20739 d!81954))

(assert (=> bs!20739 m!368757))

(declare-fun m!368949 () Bool)

(assert (=> bs!20739 m!368949))

(assert (=> b!244626 d!81954))

(declare-fun d!81956 () Bool)

(assert (=> d!81956 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381223) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220)))) lt!381223))))

(declare-fun bs!20740 () Bool)

(assert (= bs!20740 d!81956))

(declare-fun m!368951 () Bool)

(assert (=> bs!20740 m!368951))

(assert (=> b!244626 d!81956))

(declare-fun b!244748 () Bool)

(declare-fun res!204590 () Bool)

(declare-fun e!169634 () Bool)

(assert (=> b!244748 (=> (not res!204590) (not e!169634))))

(declare-fun lt!381443 () (_ BitVec 64))

(declare-fun lt!381446 () (_ BitVec 64))

(declare-fun lt!381445 () tuple2!21000)

(assert (=> b!244748 (= res!204590 (= (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381445))) (currentByte!11723 (_2!11422 lt!381445)) (currentBit!11718 (_2!11422 lt!381445))) (bvadd lt!381446 lt!381443)))))

(assert (=> b!244748 (or (not (= (bvand lt!381446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381443 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!381446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!381446 lt!381443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244748 (= lt!381443 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!244748 (= lt!381446 (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)))))

(declare-fun b!244750 () Bool)

(declare-fun e!169635 () Bool)

(assert (=> b!244750 (= e!169634 e!169635)))

(declare-fun res!204592 () Bool)

(assert (=> b!244750 (=> (not res!204592) (not e!169635))))

(declare-fun lt!381444 () tuple2!21002)

(assert (=> b!244750 (= res!204592 (and (= (_2!11423 lt!381444) bit!26) (= (_1!11423 lt!381444) (_2!11422 lt!381445))))))

(assert (=> b!244750 (= lt!381444 (readBitPure!0 (readerFrom!0 (_2!11422 lt!381445) (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005))))))

(declare-fun b!244749 () Bool)

(declare-fun res!204591 () Bool)

(assert (=> b!244749 (=> (not res!204591) (not e!169634))))

(assert (=> b!244749 (= res!204591 (isPrefixOf!0 thiss!1005 (_2!11422 lt!381445)))))

(declare-fun b!244751 () Bool)

(assert (=> b!244751 (= e!169635 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381444))) (currentByte!11723 (_1!11423 lt!381444)) (currentBit!11718 (_1!11423 lt!381444))) (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381445))) (currentByte!11723 (_2!11422 lt!381445)) (currentBit!11718 (_2!11422 lt!381445)))))))

(declare-fun d!81958 () Bool)

(assert (=> d!81958 e!169634))

(declare-fun res!204589 () Bool)

(assert (=> d!81958 (=> (not res!204589) (not e!169634))))

(assert (=> d!81958 (= res!204589 (= (size!5873 (buf!6345 thiss!1005)) (size!5873 (buf!6345 (_2!11422 lt!381445)))))))

(declare-fun choose!16 (BitStream!10668 Bool) tuple2!21000)

(assert (=> d!81958 (= lt!381445 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!81958 (validate_offset_bit!0 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005)))))

(assert (=> d!81958 (= (appendBit!0 thiss!1005 bit!26) lt!381445)))

(assert (= (and d!81958 res!204589) b!244748))

(assert (= (and b!244748 res!204590) b!244749))

(assert (= (and b!244749 res!204591) b!244750))

(assert (= (and b!244750 res!204592) b!244751))

(declare-fun m!368953 () Bool)

(assert (=> b!244751 m!368953))

(declare-fun m!368955 () Bool)

(assert (=> b!244751 m!368955))

(declare-fun m!368957 () Bool)

(assert (=> b!244750 m!368957))

(assert (=> b!244750 m!368957))

(declare-fun m!368959 () Bool)

(assert (=> b!244750 m!368959))

(declare-fun m!368961 () Bool)

(assert (=> b!244749 m!368961))

(declare-fun m!368963 () Bool)

(assert (=> d!81958 m!368963))

(declare-fun m!368965 () Bool)

(assert (=> d!81958 m!368965))

(assert (=> b!244748 m!368955))

(assert (=> b!244748 m!368725))

(assert (=> b!244626 d!81958))

(declare-fun d!81960 () Bool)

(assert (=> d!81960 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381223) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220)))) lt!381223))))

(declare-fun bs!20741 () Bool)

(assert (= bs!20741 d!81960))

(declare-fun m!368967 () Bool)

(assert (=> bs!20741 m!368967))

(assert (=> b!244626 d!81960))

(declare-fun d!81962 () Bool)

(declare-fun e!169638 () Bool)

(assert (=> d!81962 e!169638))

(declare-fun res!204595 () Bool)

(assert (=> d!81962 (=> (not res!204595) (not e!169638))))

(declare-fun lt!381456 () tuple2!21002)

(declare-fun lt!381455 () tuple2!21002)

(assert (=> d!81962 (= res!204595 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381456))) (currentByte!11723 (_1!11423 lt!381456)) (currentBit!11718 (_1!11423 lt!381456))) (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381455))) (currentByte!11723 (_1!11423 lt!381455)) (currentBit!11718 (_1!11423 lt!381455)))))))

(declare-fun lt!381457 () Unit!17841)

(declare-fun lt!381458 () BitStream!10668)

(declare-fun choose!50 (BitStream!10668 BitStream!10668 BitStream!10668 tuple2!21002 tuple2!21002 BitStream!10668 Bool tuple2!21002 tuple2!21002 BitStream!10668 Bool) Unit!17841)

(assert (=> d!81962 (= lt!381457 (choose!50 lt!381237 (_2!11422 lt!381239) lt!381458 lt!381456 (tuple2!21003 (_1!11423 lt!381456) (_2!11423 lt!381456)) (_1!11423 lt!381456) (_2!11423 lt!381456) lt!381455 (tuple2!21003 (_1!11423 lt!381455) (_2!11423 lt!381455)) (_1!11423 lt!381455) (_2!11423 lt!381455)))))

(assert (=> d!81962 (= lt!381455 (readBitPure!0 lt!381458))))

(assert (=> d!81962 (= lt!381456 (readBitPure!0 lt!381237))))

(assert (=> d!81962 (= lt!381458 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 lt!381237) (currentBit!11718 lt!381237)))))

(assert (=> d!81962 (invariant!0 (currentBit!11718 lt!381237) (currentByte!11723 lt!381237) (size!5873 (buf!6345 (_2!11422 lt!381239))))))

(assert (=> d!81962 (= (readBitPrefixLemma!0 lt!381237 (_2!11422 lt!381239)) lt!381457)))

(declare-fun b!244754 () Bool)

(assert (=> b!244754 (= e!169638 (= (_2!11423 lt!381456) (_2!11423 lt!381455)))))

(assert (= (and d!81962 res!204595) b!244754))

(declare-fun m!368969 () Bool)

(assert (=> d!81962 m!368969))

(declare-fun m!368971 () Bool)

(assert (=> d!81962 m!368971))

(assert (=> d!81962 m!368753))

(declare-fun m!368973 () Bool)

(assert (=> d!81962 m!368973))

(declare-fun m!368975 () Bool)

(assert (=> d!81962 m!368975))

(declare-fun m!368977 () Bool)

(assert (=> d!81962 m!368977))

(assert (=> b!244626 d!81962))

(declare-fun d!81964 () Bool)

(declare-fun e!169641 () Bool)

(assert (=> d!81964 e!169641))

(declare-fun res!204598 () Bool)

(assert (=> d!81964 (=> (not res!204598) (not e!169641))))

(assert (=> d!81964 (= res!204598 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!381461 () Unit!17841)

(declare-fun choose!27 (BitStream!10668 BitStream!10668 (_ BitVec 64) (_ BitVec 64)) Unit!17841)

(assert (=> d!81964 (= lt!381461 (choose!27 thiss!1005 (_2!11422 lt!381220) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81964 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81964 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11422 lt!381220) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!381461)))

(declare-fun b!244757 () Bool)

(assert (=> b!244757 (= e!169641 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81964 res!204598) b!244757))

(declare-fun m!368979 () Bool)

(assert (=> d!81964 m!368979))

(declare-fun m!368981 () Bool)

(assert (=> b!244757 m!368981))

(assert (=> b!244626 d!81964))

(declare-fun lt!381464 () tuple2!21012)

(declare-fun d!81966 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10668 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21012)

(assert (=> d!81966 (= lt!381464 (checkBitsLoop!0 (_1!11424 lt!381233) nBits!297 bit!26 from!289))))

(assert (=> d!81966 (= (checkBitsLoopPure!0 (_1!11424 lt!381233) nBits!297 bit!26 from!289) (tuple2!21003 (_2!11428 lt!381464) (_1!11428 lt!381464)))))

(declare-fun bs!20742 () Bool)

(assert (= bs!20742 d!81966))

(declare-fun m!368983 () Bool)

(assert (=> bs!20742 m!368983))

(assert (=> b!244626 d!81966))

(declare-fun d!81968 () Bool)

(assert (=> d!81968 (isPrefixOf!0 thiss!1005 (_2!11422 lt!381239))))

(declare-fun lt!381467 () Unit!17841)

(declare-fun choose!30 (BitStream!10668 BitStream!10668 BitStream!10668) Unit!17841)

(assert (=> d!81968 (= lt!381467 (choose!30 thiss!1005 (_2!11422 lt!381220) (_2!11422 lt!381239)))))

(assert (=> d!81968 (isPrefixOf!0 thiss!1005 (_2!11422 lt!381220))))

(assert (=> d!81968 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11422 lt!381220) (_2!11422 lt!381239)) lt!381467)))

(declare-fun bs!20743 () Bool)

(assert (= bs!20743 d!81968))

(assert (=> bs!20743 m!368763))

(declare-fun m!368985 () Bool)

(assert (=> bs!20743 m!368985))

(assert (=> bs!20743 m!368717))

(assert (=> b!244626 d!81968))

(declare-fun d!81970 () Bool)

(assert (=> d!81970 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20744 () Bool)

(assert (= bs!20744 d!81970))

(declare-fun m!368987 () Bool)

(assert (=> bs!20744 m!368987))

(assert (=> b!244626 d!81970))

(declare-fun d!81972 () Bool)

(declare-fun e!169642 () Bool)

(assert (=> d!81972 e!169642))

(declare-fun res!204599 () Bool)

(assert (=> d!81972 (=> (not res!204599) (not e!169642))))

(declare-fun lt!381470 () (_ BitVec 64))

(declare-fun lt!381473 () (_ BitVec 64))

(declare-fun lt!381471 () (_ BitVec 64))

(assert (=> d!81972 (= res!204599 (= lt!381471 (bvsub lt!381473 lt!381470)))))

(assert (=> d!81972 (or (= (bvand lt!381473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381473 lt!381470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81972 (= lt!381470 (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381227)))) ((_ sign_extend 32) (currentByte!11723 (_1!11423 lt!381227))) ((_ sign_extend 32) (currentBit!11718 (_1!11423 lt!381227)))))))

(declare-fun lt!381468 () (_ BitVec 64))

(declare-fun lt!381469 () (_ BitVec 64))

(assert (=> d!81972 (= lt!381473 (bvmul lt!381468 lt!381469))))

(assert (=> d!81972 (or (= lt!381468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381469 (bvsdiv (bvmul lt!381468 lt!381469) lt!381468)))))

(assert (=> d!81972 (= lt!381469 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81972 (= lt!381468 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381227)))))))

(assert (=> d!81972 (= lt!381471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11723 (_1!11423 lt!381227))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11718 (_1!11423 lt!381227)))))))

(assert (=> d!81972 (invariant!0 (currentBit!11718 (_1!11423 lt!381227)) (currentByte!11723 (_1!11423 lt!381227)) (size!5873 (buf!6345 (_1!11423 lt!381227))))))

(assert (=> d!81972 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381227))) (currentByte!11723 (_1!11423 lt!381227)) (currentBit!11718 (_1!11423 lt!381227))) lt!381471)))

(declare-fun b!244758 () Bool)

(declare-fun res!204600 () Bool)

(assert (=> b!244758 (=> (not res!204600) (not e!169642))))

(assert (=> b!244758 (= res!204600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381471))))

(declare-fun b!244759 () Bool)

(declare-fun lt!381472 () (_ BitVec 64))

(assert (=> b!244759 (= e!169642 (bvsle lt!381471 (bvmul lt!381472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244759 (or (= lt!381472 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381472 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381472)))))

(assert (=> b!244759 (= lt!381472 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381227)))))))

(assert (= (and d!81972 res!204599) b!244758))

(assert (= (and b!244758 res!204600) b!244759))

(declare-fun m!368989 () Bool)

(assert (=> d!81972 m!368989))

(declare-fun m!368991 () Bool)

(assert (=> d!81972 m!368991))

(assert (=> b!244626 d!81972))

(declare-fun d!81974 () Bool)

(assert (=> d!81974 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381223)))

(declare-fun lt!381474 () Unit!17841)

(assert (=> d!81974 (= lt!381474 (choose!9 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381239)) lt!381223 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220)))))))

(assert (=> d!81974 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381239)) lt!381223) lt!381474)))

(declare-fun bs!20745 () Bool)

(assert (= bs!20745 d!81974))

(assert (=> bs!20745 m!368751))

(declare-fun m!368993 () Bool)

(assert (=> bs!20745 m!368993))

(assert (=> b!244626 d!81974))

(declare-fun d!81976 () Bool)

(declare-fun e!169643 () Bool)

(assert (=> d!81976 e!169643))

(declare-fun res!204601 () Bool)

(assert (=> d!81976 (=> (not res!204601) (not e!169643))))

(declare-fun lt!381477 () (_ BitVec 64))

(declare-fun lt!381478 () (_ BitVec 64))

(declare-fun lt!381480 () (_ BitVec 64))

(assert (=> d!81976 (= res!204601 (= lt!381478 (bvsub lt!381480 lt!381477)))))

(assert (=> d!81976 (or (= (bvand lt!381480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381480 lt!381477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81976 (= lt!381477 (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220)))))))

(declare-fun lt!381475 () (_ BitVec 64))

(declare-fun lt!381476 () (_ BitVec 64))

(assert (=> d!81976 (= lt!381480 (bvmul lt!381475 lt!381476))))

(assert (=> d!81976 (or (= lt!381475 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381476 (bvsdiv (bvmul lt!381475 lt!381476) lt!381475)))))

(assert (=> d!81976 (= lt!381476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81976 (= lt!381475 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(assert (=> d!81976 (= lt!381478 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220)))))))

(assert (=> d!81976 (invariant!0 (currentBit!11718 (_2!11422 lt!381220)) (currentByte!11723 (_2!11422 lt!381220)) (size!5873 (buf!6345 (_2!11422 lt!381220))))))

(assert (=> d!81976 (= (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220))) lt!381478)))

(declare-fun b!244760 () Bool)

(declare-fun res!204602 () Bool)

(assert (=> b!244760 (=> (not res!204602) (not e!169643))))

(assert (=> b!244760 (= res!204602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381478))))

(declare-fun b!244761 () Bool)

(declare-fun lt!381479 () (_ BitVec 64))

(assert (=> b!244761 (= e!169643 (bvsle lt!381478 (bvmul lt!381479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244761 (or (= lt!381479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381479)))))

(assert (=> b!244761 (= lt!381479 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(assert (= (and d!81976 res!204601) b!244760))

(assert (= (and b!244760 res!204602) b!244761))

(assert (=> d!81976 m!368951))

(assert (=> d!81976 m!368859))

(assert (=> b!244635 d!81976))

(declare-fun d!81978 () Bool)

(declare-fun e!169644 () Bool)

(assert (=> d!81978 e!169644))

(declare-fun res!204603 () Bool)

(assert (=> d!81978 (=> (not res!204603) (not e!169644))))

(declare-fun lt!381486 () (_ BitVec 64))

(declare-fun lt!381484 () (_ BitVec 64))

(declare-fun lt!381483 () (_ BitVec 64))

(assert (=> d!81978 (= res!204603 (= lt!381484 (bvsub lt!381486 lt!381483)))))

(assert (=> d!81978 (or (= (bvand lt!381486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381486 lt!381483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81978 (= lt!381483 (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005))))))

(declare-fun lt!381481 () (_ BitVec 64))

(declare-fun lt!381482 () (_ BitVec 64))

(assert (=> d!81978 (= lt!381486 (bvmul lt!381481 lt!381482))))

(assert (=> d!81978 (or (= lt!381481 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381482 (bvsdiv (bvmul lt!381481 lt!381482) lt!381481)))))

(assert (=> d!81978 (= lt!381482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81978 (= lt!381481 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))))))

(assert (=> d!81978 (= lt!381484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11723 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11718 thiss!1005))))))

(assert (=> d!81978 (invariant!0 (currentBit!11718 thiss!1005) (currentByte!11723 thiss!1005) (size!5873 (buf!6345 thiss!1005)))))

(assert (=> d!81978 (= (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)) lt!381484)))

(declare-fun b!244762 () Bool)

(declare-fun res!204604 () Bool)

(assert (=> b!244762 (=> (not res!204604) (not e!169644))))

(assert (=> b!244762 (= res!204604 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381484))))

(declare-fun b!244763 () Bool)

(declare-fun lt!381485 () (_ BitVec 64))

(assert (=> b!244763 (= e!169644 (bvsle lt!381484 (bvmul lt!381485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244763 (or (= lt!381485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381485)))))

(assert (=> b!244763 (= lt!381485 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))))))

(assert (= (and d!81978 res!204603) b!244762))

(assert (= (and b!244762 res!204604) b!244763))

(declare-fun m!368995 () Bool)

(assert (=> d!81978 m!368995))

(assert (=> d!81978 m!368863))

(assert (=> b!244635 d!81978))

(declare-fun d!81980 () Bool)

(declare-fun res!204606 () Bool)

(declare-fun e!169645 () Bool)

(assert (=> d!81980 (=> (not res!204606) (not e!169645))))

(assert (=> d!81980 (= res!204606 (= (size!5873 (buf!6345 thiss!1005)) (size!5873 (buf!6345 (_2!11422 lt!381220)))))))

(assert (=> d!81980 (= (isPrefixOf!0 thiss!1005 (_2!11422 lt!381220)) e!169645)))

(declare-fun b!244764 () Bool)

(declare-fun res!204605 () Bool)

(assert (=> b!244764 (=> (not res!204605) (not e!169645))))

(assert (=> b!244764 (= res!204605 (bvsle (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005)) (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381220))) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220)))))))

(declare-fun b!244765 () Bool)

(declare-fun e!169646 () Bool)

(assert (=> b!244765 (= e!169645 e!169646)))

(declare-fun res!204607 () Bool)

(assert (=> b!244765 (=> res!204607 e!169646)))

(assert (=> b!244765 (= res!204607 (= (size!5873 (buf!6345 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!244766 () Bool)

(assert (=> b!244766 (= e!169646 (arrayBitRangesEq!0 (buf!6345 thiss!1005) (buf!6345 (_2!11422 lt!381220)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5873 (buf!6345 thiss!1005)) (currentByte!11723 thiss!1005) (currentBit!11718 thiss!1005))))))

(assert (= (and d!81980 res!204606) b!244764))

(assert (= (and b!244764 res!204605) b!244765))

(assert (= (and b!244765 (not res!204607)) b!244766))

(assert (=> b!244764 m!368725))

(assert (=> b!244764 m!368723))

(assert (=> b!244766 m!368725))

(assert (=> b!244766 m!368725))

(declare-fun m!368997 () Bool)

(assert (=> b!244766 m!368997))

(assert (=> b!244634 d!81980))

(declare-fun d!81982 () Bool)

(assert (=> d!81982 (= (array_inv!5614 (buf!6345 thiss!1005)) (bvsge (size!5873 (buf!6345 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!244633 d!81982))

(declare-fun d!81984 () Bool)

(assert (=> d!81984 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 thiss!1005))) ((_ sign_extend 32) (currentByte!11723 thiss!1005)) ((_ sign_extend 32) (currentBit!11718 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20746 () Bool)

(assert (= bs!20746 d!81984))

(assert (=> bs!20746 m!368995))

(assert (=> b!244632 d!81984))

(declare-fun d!81986 () Bool)

(declare-fun e!169647 () Bool)

(assert (=> d!81986 e!169647))

(declare-fun res!204608 () Bool)

(assert (=> d!81986 (=> (not res!204608) (not e!169647))))

(declare-fun lt!381489 () (_ BitVec 64))

(declare-fun lt!381492 () (_ BitVec 64))

(declare-fun lt!381490 () (_ BitVec 64))

(assert (=> d!81986 (= res!204608 (= lt!381490 (bvsub lt!381492 lt!381489)))))

(assert (=> d!81986 (or (= (bvand lt!381492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381492 lt!381489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81986 (= lt!381489 (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381225)))) ((_ sign_extend 32) (currentByte!11723 (_1!11423 lt!381225))) ((_ sign_extend 32) (currentBit!11718 (_1!11423 lt!381225)))))))

(declare-fun lt!381487 () (_ BitVec 64))

(declare-fun lt!381488 () (_ BitVec 64))

(assert (=> d!81986 (= lt!381492 (bvmul lt!381487 lt!381488))))

(assert (=> d!81986 (or (= lt!381487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381488 (bvsdiv (bvmul lt!381487 lt!381488) lt!381487)))))

(assert (=> d!81986 (= lt!381488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81986 (= lt!381487 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381225)))))))

(assert (=> d!81986 (= lt!381490 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11723 (_1!11423 lt!381225))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11718 (_1!11423 lt!381225)))))))

(assert (=> d!81986 (invariant!0 (currentBit!11718 (_1!11423 lt!381225)) (currentByte!11723 (_1!11423 lt!381225)) (size!5873 (buf!6345 (_1!11423 lt!381225))))))

(assert (=> d!81986 (= (bitIndex!0 (size!5873 (buf!6345 (_1!11423 lt!381225))) (currentByte!11723 (_1!11423 lt!381225)) (currentBit!11718 (_1!11423 lt!381225))) lt!381490)))

(declare-fun b!244767 () Bool)

(declare-fun res!204609 () Bool)

(assert (=> b!244767 (=> (not res!204609) (not e!169647))))

(assert (=> b!244767 (= res!204609 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381490))))

(declare-fun b!244768 () Bool)

(declare-fun lt!381491 () (_ BitVec 64))

(assert (=> b!244768 (= e!169647 (bvsle lt!381490 (bvmul lt!381491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244768 (or (= lt!381491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381491)))))

(assert (=> b!244768 (= lt!381491 ((_ sign_extend 32) (size!5873 (buf!6345 (_1!11423 lt!381225)))))))

(assert (= (and d!81986 res!204608) b!244767))

(assert (= (and b!244767 res!204609) b!244768))

(declare-fun m!368999 () Bool)

(assert (=> d!81986 m!368999))

(declare-fun m!369001 () Bool)

(assert (=> d!81986 m!369001))

(assert (=> b!244631 d!81986))

(declare-fun d!81988 () Bool)

(declare-fun e!169648 () Bool)

(assert (=> d!81988 e!169648))

(declare-fun res!204610 () Bool)

(assert (=> d!81988 (=> (not res!204610) (not e!169648))))

(declare-fun lt!381496 () (_ BitVec 64))

(declare-fun lt!381498 () (_ BitVec 64))

(declare-fun lt!381495 () (_ BitVec 64))

(assert (=> d!81988 (= res!204610 (= lt!381496 (bvsub lt!381498 lt!381495)))))

(assert (=> d!81988 (or (= (bvand lt!381498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381498 lt!381495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81988 (= lt!381495 (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381239))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381239)))))))

(declare-fun lt!381493 () (_ BitVec 64))

(declare-fun lt!381494 () (_ BitVec 64))

(assert (=> d!81988 (= lt!381498 (bvmul lt!381493 lt!381494))))

(assert (=> d!81988 (or (= lt!381493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381494 (bvsdiv (bvmul lt!381493 lt!381494) lt!381493)))))

(assert (=> d!81988 (= lt!381494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81988 (= lt!381493 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))))))

(assert (=> d!81988 (= lt!381496 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381239))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381239)))))))

(assert (=> d!81988 (invariant!0 (currentBit!11718 (_2!11422 lt!381239)) (currentByte!11723 (_2!11422 lt!381239)) (size!5873 (buf!6345 (_2!11422 lt!381239))))))

(assert (=> d!81988 (= (bitIndex!0 (size!5873 (buf!6345 (_2!11422 lt!381239))) (currentByte!11723 (_2!11422 lt!381239)) (currentBit!11718 (_2!11422 lt!381239))) lt!381496)))

(declare-fun b!244769 () Bool)

(declare-fun res!204611 () Bool)

(assert (=> b!244769 (=> (not res!204611) (not e!169648))))

(assert (=> b!244769 (= res!204611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381496))))

(declare-fun b!244770 () Bool)

(declare-fun lt!381497 () (_ BitVec 64))

(assert (=> b!244770 (= e!169648 (bvsle lt!381496 (bvmul lt!381497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244770 (or (= lt!381497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381497)))))

(assert (=> b!244770 (= lt!381497 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))))))

(assert (= (and d!81988 res!204610) b!244769))

(assert (= (and b!244769 res!204611) b!244770))

(declare-fun m!369003 () Bool)

(assert (=> d!81988 m!369003))

(declare-fun m!369005 () Bool)

(assert (=> d!81988 m!369005))

(assert (=> b!244640 d!81988))

(assert (=> b!244640 d!81976))

(declare-fun lt!381499 () tuple2!21012)

(declare-fun d!81990 () Bool)

(assert (=> d!81990 (= lt!381499 (checkBitsLoop!0 (_1!11424 lt!381235) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81990 (= (checkBitsLoopPure!0 (_1!11424 lt!381235) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21003 (_2!11428 lt!381499) (_1!11428 lt!381499)))))

(declare-fun bs!20747 () Bool)

(assert (= bs!20747 d!81990))

(declare-fun m!369007 () Bool)

(assert (=> bs!20747 m!369007))

(assert (=> b!244629 d!81990))

(declare-fun d!81992 () Bool)

(assert (=> d!81992 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381221) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220)))) lt!381221))))

(declare-fun bs!20748 () Bool)

(assert (= bs!20748 d!81992))

(assert (=> bs!20748 m!368967))

(assert (=> b!244629 d!81992))

(declare-fun d!81994 () Bool)

(assert (=> d!81994 (validate_offset_bits!1 ((_ sign_extend 32) (size!5873 (buf!6345 (_2!11422 lt!381239)))) ((_ sign_extend 32) (currentByte!11723 (_2!11422 lt!381220))) ((_ sign_extend 32) (currentBit!11718 (_2!11422 lt!381220))) lt!381221)))

(declare-fun lt!381500 () Unit!17841)

(assert (=> d!81994 (= lt!381500 (choose!9 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381239)) lt!381221 (BitStream!10669 (buf!6345 (_2!11422 lt!381239)) (currentByte!11723 (_2!11422 lt!381220)) (currentBit!11718 (_2!11422 lt!381220)))))))

(assert (=> d!81994 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11422 lt!381220) (buf!6345 (_2!11422 lt!381239)) lt!381221) lt!381500)))

(declare-fun bs!20749 () Bool)

(assert (= bs!20749 d!81994))

(assert (=> bs!20749 m!368735))

(declare-fun m!369009 () Bool)

(assert (=> bs!20749 m!369009))

(assert (=> b!244629 d!81994))

(assert (=> b!244629 d!81952))

(check-sat (not d!81962) (not b!244727) (not d!81934) (not b!244735) (not d!81944) (not b!244748) (not d!81928) (not b!244725) (not d!81992) (not b!244688) (not d!81924) (not b!244697) (not d!81984) (not b!244714) (not d!81994) (not b!244726) (not d!81956) (not d!81946) (not d!81930) (not b!244738) (not d!81974) (not d!81988) (not d!81942) (not d!81968) (not b!244750) (not d!81990) (not d!81952) (not d!81986) (not b!244713) (not b!244736) (not d!81958) (not d!81960) (not b!244724) (not d!81950) (not b!244751) (not b!244737) (not d!81954) (not b!244764) (not b!244698) (not b!244712) (not d!81972) (not d!81964) (not b!244715) (not d!81966) (not b!244700) (not d!81978) (not d!81976) (not d!81938) (not d!81948) (not b!244749) (not d!81970) (not b!244757) (not b!244766) (not b!244695))
(check-sat)
