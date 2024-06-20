; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52476 () Bool)

(assert start!52476)

(declare-fun res!202065 () Bool)

(declare-fun e!167779 () Bool)

(assert (=> start!52476 (=> (not res!202065) (not e!167779))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52476 (= res!202065 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52476 e!167779))

(assert (=> start!52476 true))

(declare-datatypes ((array!13287 0))(
  ( (array!13288 (arr!6810 (Array (_ BitVec 32) (_ BitVec 8))) (size!5823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10568 0))(
  ( (BitStream!10569 (buf!6289 array!13287) (currentByte!11652 (_ BitVec 32)) (currentBit!11647 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10568)

(declare-fun e!167780 () Bool)

(declare-fun inv!12 (BitStream!10568) Bool)

(assert (=> start!52476 (and (inv!12 thiss!1005) e!167780)))

(declare-fun b!242011 () Bool)

(declare-fun res!202069 () Bool)

(assert (=> b!242011 (=> (not res!202069) (not e!167779))))

(assert (=> b!242011 (= res!202069 (bvslt from!289 nBits!297))))

(declare-fun b!242012 () Bool)

(declare-fun e!167777 () Bool)

(declare-datatypes ((tuple2!20688 0))(
  ( (tuple2!20689 (_1!11266 BitStream!10568) (_2!11266 Bool)) )
))
(declare-fun lt!377445 () tuple2!20688)

(declare-datatypes ((tuple2!20690 0))(
  ( (tuple2!20691 (_1!11267 BitStream!10568) (_2!11267 BitStream!10568)) )
))
(declare-fun lt!377440 () tuple2!20690)

(assert (=> b!242012 (= e!167777 (not (or (not (_2!11266 lt!377445)) (not (= (_1!11266 lt!377445) (_2!11267 lt!377440))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10568 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20688)

(assert (=> b!242012 (= lt!377445 (checkBitsLoopPure!0 (_1!11267 lt!377440) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17729 0))(
  ( (Unit!17730) )
))
(declare-datatypes ((tuple2!20692 0))(
  ( (tuple2!20693 (_1!11268 Unit!17729) (_2!11268 BitStream!10568)) )
))
(declare-fun lt!377441 () tuple2!20692)

(declare-fun lt!377437 () tuple2!20692)

(declare-fun lt!377438 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242012 (validate_offset_bits!1 ((_ sign_extend 32) (size!5823 (buf!6289 (_2!11268 lt!377441)))) ((_ sign_extend 32) (currentByte!11652 (_2!11268 lt!377437))) ((_ sign_extend 32) (currentBit!11647 (_2!11268 lt!377437))) lt!377438)))

(declare-fun lt!377446 () Unit!17729)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10568 array!13287 (_ BitVec 64)) Unit!17729)

(assert (=> b!242012 (= lt!377446 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11268 lt!377437) (buf!6289 (_2!11268 lt!377441)) lt!377438))))

(declare-fun reader!0 (BitStream!10568 BitStream!10568) tuple2!20690)

(assert (=> b!242012 (= lt!377440 (reader!0 (_2!11268 lt!377437) (_2!11268 lt!377441)))))

(declare-fun b!242013 () Bool)

(declare-fun e!167773 () Bool)

(assert (=> b!242013 (= e!167773 e!167777)))

(declare-fun res!202071 () Bool)

(assert (=> b!242013 (=> (not res!202071) (not e!167777))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242013 (= res!202071 (= (bitIndex!0 (size!5823 (buf!6289 (_2!11268 lt!377441))) (currentByte!11652 (_2!11268 lt!377441)) (currentBit!11647 (_2!11268 lt!377441))) (bvadd (bitIndex!0 (size!5823 (buf!6289 (_2!11268 lt!377437))) (currentByte!11652 (_2!11268 lt!377437)) (currentBit!11647 (_2!11268 lt!377437))) lt!377438)))))

(assert (=> b!242013 (= lt!377438 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242014 () Bool)

(declare-fun e!167772 () Bool)

(declare-fun lt!377448 () tuple2!20688)

(declare-fun lt!377447 () (_ BitVec 64))

(assert (=> b!242014 (= e!167772 (= (bitIndex!0 (size!5823 (buf!6289 (_1!11266 lt!377448))) (currentByte!11652 (_1!11266 lt!377448)) (currentBit!11647 (_1!11266 lt!377448))) lt!377447))))

(declare-fun b!242015 () Bool)

(declare-fun e!167774 () Bool)

(assert (=> b!242015 (= e!167779 (not e!167774))))

(declare-fun res!202070 () Bool)

(assert (=> b!242015 (=> res!202070 e!167774)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242015 (= res!202070 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5823 (buf!6289 (_2!11268 lt!377437)))) ((_ sign_extend 32) (currentByte!11652 thiss!1005)) ((_ sign_extend 32) (currentBit!11647 thiss!1005)))))))

(declare-fun e!167775 () Bool)

(assert (=> b!242015 e!167775))

(declare-fun res!202066 () Bool)

(assert (=> b!242015 (=> (not res!202066) (not e!167775))))

(declare-fun isPrefixOf!0 (BitStream!10568 BitStream!10568) Bool)

(assert (=> b!242015 (= res!202066 (isPrefixOf!0 thiss!1005 (_2!11268 lt!377441)))))

(declare-fun lt!377442 () Unit!17729)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10568 BitStream!10568 BitStream!10568) Unit!17729)

(assert (=> b!242015 (= lt!377442 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11268 lt!377437) (_2!11268 lt!377441)))))

(assert (=> b!242015 e!167773))

(declare-fun res!202063 () Bool)

(assert (=> b!242015 (=> (not res!202063) (not e!167773))))

(assert (=> b!242015 (= res!202063 (= (size!5823 (buf!6289 (_2!11268 lt!377437))) (size!5823 (buf!6289 (_2!11268 lt!377441)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10568 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20692)

(assert (=> b!242015 (= lt!377441 (appendNBitsLoop!0 (_2!11268 lt!377437) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242015 (validate_offset_bits!1 ((_ sign_extend 32) (size!5823 (buf!6289 (_2!11268 lt!377437)))) ((_ sign_extend 32) (currentByte!11652 (_2!11268 lt!377437))) ((_ sign_extend 32) (currentBit!11647 (_2!11268 lt!377437))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377436 () Unit!17729)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10568 BitStream!10568 (_ BitVec 64) (_ BitVec 64)) Unit!17729)

(assert (=> b!242015 (= lt!377436 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11268 lt!377437) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167771 () Bool)

(assert (=> b!242015 e!167771))

(declare-fun res!202064 () Bool)

(assert (=> b!242015 (=> (not res!202064) (not e!167771))))

(assert (=> b!242015 (= res!202064 (= (size!5823 (buf!6289 thiss!1005)) (size!5823 (buf!6289 (_2!11268 lt!377437)))))))

(declare-fun appendBit!0 (BitStream!10568 Bool) tuple2!20692)

(assert (=> b!242015 (= lt!377437 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242016 () Bool)

(declare-fun res!202072 () Bool)

(assert (=> b!242016 (=> (not res!202072) (not e!167779))))

(assert (=> b!242016 (= res!202072 (validate_offset_bits!1 ((_ sign_extend 32) (size!5823 (buf!6289 thiss!1005))) ((_ sign_extend 32) (currentByte!11652 thiss!1005)) ((_ sign_extend 32) (currentBit!11647 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242017 () Bool)

(declare-fun res!202067 () Bool)

(declare-fun e!167778 () Bool)

(assert (=> b!242017 (=> (not res!202067) (not e!167778))))

(assert (=> b!242017 (= res!202067 (isPrefixOf!0 thiss!1005 (_2!11268 lt!377437)))))

(declare-fun b!242018 () Bool)

(assert (=> b!242018 (= e!167774 true)))

(declare-fun lt!377444 () tuple2!20688)

(declare-fun readBitPure!0 (BitStream!10568) tuple2!20688)

(assert (=> b!242018 (= lt!377444 (readBitPure!0 (BitStream!10569 (buf!6289 (_2!11268 lt!377441)) (currentByte!11652 thiss!1005) (currentBit!11647 thiss!1005))))))

(declare-fun lt!377443 () tuple2!20688)

(assert (=> b!242018 (= lt!377443 (readBitPure!0 (BitStream!10569 (buf!6289 (_2!11268 lt!377437)) (currentByte!11652 thiss!1005) (currentBit!11647 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242018 (invariant!0 (currentBit!11647 thiss!1005) (currentByte!11652 thiss!1005) (size!5823 (buf!6289 (_2!11268 lt!377441))))))

(declare-fun b!242019 () Bool)

(declare-fun res!202073 () Bool)

(assert (=> b!242019 (=> (not res!202073) (not e!167777))))

(assert (=> b!242019 (= res!202073 (isPrefixOf!0 (_2!11268 lt!377437) (_2!11268 lt!377441)))))

(declare-fun b!242020 () Bool)

(assert (=> b!242020 (= e!167778 e!167772)))

(declare-fun res!202074 () Bool)

(assert (=> b!242020 (=> (not res!202074) (not e!167772))))

(assert (=> b!242020 (= res!202074 (and (= (_2!11266 lt!377448) bit!26) (= (_1!11266 lt!377448) (_2!11268 lt!377437))))))

(declare-fun readerFrom!0 (BitStream!10568 (_ BitVec 32) (_ BitVec 32)) BitStream!10568)

(assert (=> b!242020 (= lt!377448 (readBitPure!0 (readerFrom!0 (_2!11268 lt!377437) (currentBit!11647 thiss!1005) (currentByte!11652 thiss!1005))))))

(declare-fun b!242021 () Bool)

(declare-fun res!202068 () Bool)

(assert (=> b!242021 (=> res!202068 e!167774)))

(declare-fun arrayBitRangesEq!0 (array!13287 array!13287 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242021 (= res!202068 (not (arrayBitRangesEq!0 (buf!6289 (_2!11268 lt!377437)) (buf!6289 (_2!11268 lt!377441)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5823 (buf!6289 (_2!11268 lt!377437))) (currentByte!11652 thiss!1005) (currentBit!11647 thiss!1005))))))))

(declare-fun b!242022 () Bool)

(declare-fun array_inv!5564 (array!13287) Bool)

(assert (=> b!242022 (= e!167780 (array_inv!5564 (buf!6289 thiss!1005)))))

(declare-fun b!242023 () Bool)

(assert (=> b!242023 (= e!167775 (invariant!0 (currentBit!11647 thiss!1005) (currentByte!11652 thiss!1005) (size!5823 (buf!6289 (_2!11268 lt!377437)))))))

(declare-fun b!242024 () Bool)

(assert (=> b!242024 (= e!167771 e!167778)))

(declare-fun res!202062 () Bool)

(assert (=> b!242024 (=> (not res!202062) (not e!167778))))

(declare-fun lt!377439 () (_ BitVec 64))

(assert (=> b!242024 (= res!202062 (= lt!377447 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377439)))))

(assert (=> b!242024 (= lt!377447 (bitIndex!0 (size!5823 (buf!6289 (_2!11268 lt!377437))) (currentByte!11652 (_2!11268 lt!377437)) (currentBit!11647 (_2!11268 lt!377437))))))

(assert (=> b!242024 (= lt!377439 (bitIndex!0 (size!5823 (buf!6289 thiss!1005)) (currentByte!11652 thiss!1005) (currentBit!11647 thiss!1005)))))

(assert (= (and start!52476 res!202065) b!242016))

(assert (= (and b!242016 res!202072) b!242011))

(assert (= (and b!242011 res!202069) b!242015))

(assert (= (and b!242015 res!202064) b!242024))

(assert (= (and b!242024 res!202062) b!242017))

(assert (= (and b!242017 res!202067) b!242020))

(assert (= (and b!242020 res!202074) b!242014))

(assert (= (and b!242015 res!202063) b!242013))

(assert (= (and b!242013 res!202071) b!242019))

(assert (= (and b!242019 res!202073) b!242012))

(assert (= (and b!242015 res!202066) b!242023))

(assert (= (and b!242015 (not res!202070)) b!242021))

(assert (= (and b!242021 (not res!202068)) b!242018))

(assert (= start!52476 b!242022))

(declare-fun m!364707 () Bool)

(assert (=> b!242012 m!364707))

(declare-fun m!364709 () Bool)

(assert (=> b!242012 m!364709))

(declare-fun m!364711 () Bool)

(assert (=> b!242012 m!364711))

(declare-fun m!364713 () Bool)

(assert (=> b!242012 m!364713))

(declare-fun m!364715 () Bool)

(assert (=> b!242016 m!364715))

(declare-fun m!364717 () Bool)

(assert (=> b!242017 m!364717))

(declare-fun m!364719 () Bool)

(assert (=> b!242021 m!364719))

(declare-fun m!364721 () Bool)

(assert (=> b!242021 m!364721))

(declare-fun m!364723 () Bool)

(assert (=> b!242013 m!364723))

(declare-fun m!364725 () Bool)

(assert (=> b!242013 m!364725))

(assert (=> b!242024 m!364725))

(declare-fun m!364727 () Bool)

(assert (=> b!242024 m!364727))

(declare-fun m!364729 () Bool)

(assert (=> b!242018 m!364729))

(declare-fun m!364731 () Bool)

(assert (=> b!242018 m!364731))

(declare-fun m!364733 () Bool)

(assert (=> b!242018 m!364733))

(declare-fun m!364735 () Bool)

(assert (=> b!242020 m!364735))

(assert (=> b!242020 m!364735))

(declare-fun m!364737 () Bool)

(assert (=> b!242020 m!364737))

(declare-fun m!364739 () Bool)

(assert (=> b!242022 m!364739))

(declare-fun m!364741 () Bool)

(assert (=> b!242015 m!364741))

(declare-fun m!364743 () Bool)

(assert (=> b!242015 m!364743))

(declare-fun m!364745 () Bool)

(assert (=> b!242015 m!364745))

(declare-fun m!364747 () Bool)

(assert (=> b!242015 m!364747))

(declare-fun m!364749 () Bool)

(assert (=> b!242015 m!364749))

(declare-fun m!364751 () Bool)

(assert (=> b!242015 m!364751))

(declare-fun m!364753 () Bool)

(assert (=> b!242015 m!364753))

(declare-fun m!364755 () Bool)

(assert (=> b!242019 m!364755))

(declare-fun m!364757 () Bool)

(assert (=> b!242023 m!364757))

(declare-fun m!364759 () Bool)

(assert (=> start!52476 m!364759))

(declare-fun m!364761 () Bool)

(assert (=> b!242014 m!364761))

(push 1)

(assert (not b!242021))

(assert (not b!242014))

(assert (not b!242024))

(assert (not b!242012))

(assert (not b!242020))

(assert (not b!242019))

(assert (not b!242016))

(assert (not start!52476))

(assert (not b!242018))

(assert (not b!242015))

(assert (not b!242013))

(assert (not b!242017))

(assert (not b!242022))

(assert (not b!242023))

(check-sat)

