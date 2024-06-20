; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52772 () Bool)

(assert start!52772)

(declare-fun b!244581 () Bool)

(declare-fun e!169525 () Bool)

(declare-fun e!169534 () Bool)

(assert (=> b!244581 (= e!169525 (not e!169534))))

(declare-fun res!204446 () Bool)

(assert (=> b!244581 (=> res!204446 e!169534)))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!244581 (= res!204446 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((array!13391 0))(
  ( (array!13392 (arr!6859 (Array (_ BitVec 32) (_ BitVec 8))) (size!5872 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10666 0))(
  ( (BitStream!10667 (buf!6344 array!13391) (currentByte!11722 (_ BitVec 32)) (currentBit!11717 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17839 0))(
  ( (Unit!17840) )
))
(declare-datatypes ((tuple2!20994 0))(
  ( (tuple2!20995 (_1!11419 Unit!17839) (_2!11419 BitStream!10666)) )
))
(declare-fun lt!381165 () tuple2!20994)

(declare-fun lt!381175 () tuple2!20994)

(declare-fun lt!381169 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244581 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381169)))

(declare-fun lt!381174 () Unit!17839)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10666 array!13391 (_ BitVec 64)) Unit!17839)

(assert (=> b!244581 (= lt!381174 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381165)) lt!381169))))

(declare-datatypes ((tuple2!20996 0))(
  ( (tuple2!20997 (_1!11420 BitStream!10666) (_2!11420 BitStream!10666)) )
))
(declare-fun lt!381157 () tuple2!20996)

(declare-datatypes ((tuple2!20998 0))(
  ( (tuple2!20999 (_1!11421 BitStream!10666) (_2!11421 Bool)) )
))
(declare-fun lt!381172 () tuple2!20998)

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10666 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20998)

(assert (=> b!244581 (= lt!381172 (checkBitsLoopPure!0 (_1!11420 lt!381157) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!10666)

(assert (=> b!244581 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381158 () Unit!17839)

(assert (=> b!244581 (= lt!381158 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6344 (_2!11419 lt!381165)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10666) tuple2!20998)

(assert (=> b!244581 (= (_2!11421 (readBitPure!0 (_1!11420 lt!381157))) bit!26)))

(declare-fun lt!381166 () tuple2!20996)

(declare-fun reader!0 (BitStream!10666 BitStream!10666) tuple2!20996)

(assert (=> b!244581 (= lt!381166 (reader!0 (_2!11419 lt!381175) (_2!11419 lt!381165)))))

(assert (=> b!244581 (= lt!381157 (reader!0 thiss!1005 (_2!11419 lt!381165)))))

(declare-fun e!169528 () Bool)

(assert (=> b!244581 e!169528))

(declare-fun res!204440 () Bool)

(assert (=> b!244581 (=> (not res!204440) (not e!169528))))

(declare-fun lt!381176 () tuple2!20998)

(declare-fun lt!381171 () tuple2!20998)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244581 (= res!204440 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381176))) (currentByte!11722 (_1!11421 lt!381176)) (currentBit!11717 (_1!11421 lt!381176))) (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381171))) (currentByte!11722 (_1!11421 lt!381171)) (currentBit!11717 (_1!11421 lt!381171)))))))

(declare-fun lt!381163 () Unit!17839)

(declare-fun lt!381161 () BitStream!10666)

(declare-fun readBitPrefixLemma!0 (BitStream!10666 BitStream!10666) Unit!17839)

(assert (=> b!244581 (= lt!381163 (readBitPrefixLemma!0 lt!381161 (_2!11419 lt!381165)))))

(assert (=> b!244581 (= lt!381171 (readBitPure!0 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005))))))

(assert (=> b!244581 (= lt!381176 (readBitPure!0 lt!381161))))

(assert (=> b!244581 (= lt!381161 (BitStream!10667 (buf!6344 (_2!11419 lt!381175)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(declare-fun e!169535 () Bool)

(assert (=> b!244581 e!169535))

(declare-fun res!204443 () Bool)

(assert (=> b!244581 (=> (not res!204443) (not e!169535))))

(declare-fun isPrefixOf!0 (BitStream!10666 BitStream!10666) Bool)

(assert (=> b!244581 (= res!204443 (isPrefixOf!0 thiss!1005 (_2!11419 lt!381165)))))

(declare-fun lt!381159 () Unit!17839)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10666 BitStream!10666 BitStream!10666) Unit!17839)

(assert (=> b!244581 (= lt!381159 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11419 lt!381175) (_2!11419 lt!381165)))))

(declare-fun e!169532 () Bool)

(assert (=> b!244581 e!169532))

(declare-fun res!204437 () Bool)

(assert (=> b!244581 (=> (not res!204437) (not e!169532))))

(assert (=> b!244581 (= res!204437 (= (size!5872 (buf!6344 (_2!11419 lt!381175))) (size!5872 (buf!6344 (_2!11419 lt!381165)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10666 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20994)

(assert (=> b!244581 (= lt!381165 (appendNBitsLoop!0 (_2!11419 lt!381175) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244581 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381169)))

(assert (=> b!244581 (= lt!381169 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!381160 () Unit!17839)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10666 BitStream!10666 (_ BitVec 64) (_ BitVec 64)) Unit!17839)

(assert (=> b!244581 (= lt!381160 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11419 lt!381175) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169531 () Bool)

(assert (=> b!244581 e!169531))

(declare-fun res!204450 () Bool)

(assert (=> b!244581 (=> (not res!204450) (not e!169531))))

(assert (=> b!244581 (= res!204450 (= (size!5872 (buf!6344 thiss!1005)) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(declare-fun appendBit!0 (BitStream!10666 Bool) tuple2!20994)

(assert (=> b!244581 (= lt!381175 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244582 () Bool)

(declare-fun res!204444 () Bool)

(assert (=> b!244582 (=> (not res!204444) (not e!169525))))

(assert (=> b!244582 (= res!204444 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244583 () Bool)

(declare-fun e!169533 () Bool)

(assert (=> b!244583 (= e!169531 e!169533)))

(declare-fun res!204449 () Bool)

(assert (=> b!244583 (=> (not res!204449) (not e!169533))))

(declare-fun lt!381164 () (_ BitVec 64))

(declare-fun lt!381162 () (_ BitVec 64))

(assert (=> b!244583 (= res!204449 (= lt!381164 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!381162)))))

(assert (=> b!244583 (= lt!381164 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))))))

(assert (=> b!244583 (= lt!381162 (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(declare-fun b!244584 () Bool)

(declare-fun e!169530 () Bool)

(declare-fun array_inv!5613 (array!13391) Bool)

(assert (=> b!244584 (= e!169530 (array_inv!5613 (buf!6344 thiss!1005)))))

(declare-fun b!244585 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244585 (= e!169535 (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381165)))))))

(declare-fun b!244586 () Bool)

(declare-fun res!204442 () Bool)

(assert (=> b!244586 (=> (not res!204442) (not e!169535))))

(assert (=> b!244586 (= res!204442 (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(declare-fun b!244587 () Bool)

(declare-fun e!169529 () Bool)

(assert (=> b!244587 (= e!169532 e!169529)))

(declare-fun res!204445 () Bool)

(assert (=> b!244587 (=> (not res!204445) (not e!169529))))

(declare-fun lt!381168 () (_ BitVec 64))

(assert (=> b!244587 (= res!204445 (= (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381165))) (currentByte!11722 (_2!11419 lt!381165)) (currentBit!11717 (_2!11419 lt!381165))) (bvadd (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))) lt!381168)))))

(assert (=> b!244587 (= lt!381168 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244588 () Bool)

(declare-fun e!169526 () Bool)

(declare-fun lt!381167 () tuple2!20998)

(assert (=> b!244588 (= e!169526 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381167))) (currentByte!11722 (_1!11421 lt!381167)) (currentBit!11717 (_1!11421 lt!381167))) lt!381164))))

(declare-fun b!244589 () Bool)

(declare-fun res!204439 () Bool)

(assert (=> b!244589 (=> (not res!204439) (not e!169533))))

(assert (=> b!244589 (= res!204439 (isPrefixOf!0 thiss!1005 (_2!11419 lt!381175)))))

(declare-fun b!244590 () Bool)

(assert (=> b!244590 (= e!169528 (= (_2!11421 lt!381176) (_2!11421 lt!381171)))))

(declare-fun b!244592 () Bool)

(assert (=> b!244592 (= e!169534 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11420 lt!381166)))) ((_ sign_extend 32) (currentByte!11722 (_1!11420 lt!381166))) ((_ sign_extend 32) (currentBit!11717 (_1!11420 lt!381166))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun b!244593 () Bool)

(declare-fun res!204438 () Bool)

(assert (=> b!244593 (=> (not res!204438) (not e!169529))))

(assert (=> b!244593 (= res!204438 (isPrefixOf!0 (_2!11419 lt!381175) (_2!11419 lt!381165)))))

(declare-fun b!244594 () Bool)

(declare-fun res!204448 () Bool)

(assert (=> b!244594 (=> (not res!204448) (not e!169525))))

(assert (=> b!244594 (= res!204448 (bvslt from!289 nBits!297))))

(declare-fun b!244595 () Bool)

(assert (=> b!244595 (= e!169533 e!169526)))

(declare-fun res!204441 () Bool)

(assert (=> b!244595 (=> (not res!204441) (not e!169526))))

(assert (=> b!244595 (= res!204441 (and (= (_2!11421 lt!381167) bit!26) (= (_1!11421 lt!381167) (_2!11419 lt!381175))))))

(declare-fun readerFrom!0 (BitStream!10666 (_ BitVec 32) (_ BitVec 32)) BitStream!10666)

(assert (=> b!244595 (= lt!381167 (readBitPure!0 (readerFrom!0 (_2!11419 lt!381175) (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005))))))

(declare-fun res!204447 () Bool)

(assert (=> start!52772 (=> (not res!204447) (not e!169525))))

(assert (=> start!52772 (= res!204447 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52772 e!169525))

(assert (=> start!52772 true))

(declare-fun inv!12 (BitStream!10666) Bool)

(assert (=> start!52772 (and (inv!12 thiss!1005) e!169530)))

(declare-fun b!244591 () Bool)

(declare-fun lt!381177 () tuple2!20998)

(declare-fun lt!381170 () tuple2!20996)

(assert (=> b!244591 (= e!169529 (not (or (not (_2!11421 lt!381177)) (not (= (_1!11421 lt!381177) (_2!11420 lt!381170))))))))

(assert (=> b!244591 (= lt!381177 (checkBitsLoopPure!0 (_1!11420 lt!381170) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244591 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381168)))

(declare-fun lt!381173 () Unit!17839)

(assert (=> b!244591 (= lt!381173 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381165)) lt!381168))))

(assert (=> b!244591 (= lt!381170 (reader!0 (_2!11419 lt!381175) (_2!11419 lt!381165)))))

(assert (= (and start!52772 res!204447) b!244582))

(assert (= (and b!244582 res!204444) b!244594))

(assert (= (and b!244594 res!204448) b!244581))

(assert (= (and b!244581 res!204450) b!244583))

(assert (= (and b!244583 res!204449) b!244589))

(assert (= (and b!244589 res!204439) b!244595))

(assert (= (and b!244595 res!204441) b!244588))

(assert (= (and b!244581 res!204437) b!244587))

(assert (= (and b!244587 res!204445) b!244593))

(assert (= (and b!244593 res!204438) b!244591))

(assert (= (and b!244581 res!204443) b!244586))

(assert (= (and b!244586 res!204442) b!244585))

(assert (= (and b!244581 res!204440) b!244590))

(assert (= (and b!244581 (not res!204446)) b!244592))

(assert (= start!52772 b!244584))

(declare-fun m!368639 () Bool)

(assert (=> b!244581 m!368639))

(declare-fun m!368641 () Bool)

(assert (=> b!244581 m!368641))

(declare-fun m!368643 () Bool)

(assert (=> b!244581 m!368643))

(declare-fun m!368645 () Bool)

(assert (=> b!244581 m!368645))

(declare-fun m!368647 () Bool)

(assert (=> b!244581 m!368647))

(declare-fun m!368649 () Bool)

(assert (=> b!244581 m!368649))

(declare-fun m!368651 () Bool)

(assert (=> b!244581 m!368651))

(declare-fun m!368653 () Bool)

(assert (=> b!244581 m!368653))

(declare-fun m!368655 () Bool)

(assert (=> b!244581 m!368655))

(declare-fun m!368657 () Bool)

(assert (=> b!244581 m!368657))

(declare-fun m!368659 () Bool)

(assert (=> b!244581 m!368659))

(declare-fun m!368661 () Bool)

(assert (=> b!244581 m!368661))

(declare-fun m!368663 () Bool)

(assert (=> b!244581 m!368663))

(declare-fun m!368665 () Bool)

(assert (=> b!244581 m!368665))

(declare-fun m!368667 () Bool)

(assert (=> b!244581 m!368667))

(declare-fun m!368669 () Bool)

(assert (=> b!244581 m!368669))

(declare-fun m!368671 () Bool)

(assert (=> b!244581 m!368671))

(declare-fun m!368673 () Bool)

(assert (=> b!244581 m!368673))

(declare-fun m!368675 () Bool)

(assert (=> b!244581 m!368675))

(declare-fun m!368677 () Bool)

(assert (=> b!244589 m!368677))

(declare-fun m!368679 () Bool)

(assert (=> b!244595 m!368679))

(assert (=> b!244595 m!368679))

(declare-fun m!368681 () Bool)

(assert (=> b!244595 m!368681))

(declare-fun m!368683 () Bool)

(assert (=> b!244586 m!368683))

(declare-fun m!368685 () Bool)

(assert (=> b!244588 m!368685))

(declare-fun m!368687 () Bool)

(assert (=> b!244591 m!368687))

(declare-fun m!368689 () Bool)

(assert (=> b!244591 m!368689))

(declare-fun m!368691 () Bool)

(assert (=> b!244591 m!368691))

(assert (=> b!244591 m!368673))

(declare-fun m!368693 () Bool)

(assert (=> b!244587 m!368693))

(declare-fun m!368695 () Bool)

(assert (=> b!244587 m!368695))

(declare-fun m!368697 () Bool)

(assert (=> start!52772 m!368697))

(declare-fun m!368699 () Bool)

(assert (=> b!244584 m!368699))

(declare-fun m!368701 () Bool)

(assert (=> b!244585 m!368701))

(assert (=> b!244583 m!368695))

(declare-fun m!368703 () Bool)

(assert (=> b!244583 m!368703))

(declare-fun m!368705 () Bool)

(assert (=> b!244592 m!368705))

(declare-fun m!368707 () Bool)

(assert (=> b!244582 m!368707))

(declare-fun m!368709 () Bool)

(assert (=> b!244593 m!368709))

(push 1)

(assert (not start!52772))

(assert (not b!244593))

(assert (not b!244588))

(assert (not b!244587))

(assert (not b!244585))

(assert (not b!244582))

(assert (not b!244589))

(assert (not b!244592))

(assert (not b!244591))

(assert (not b!244586))

(assert (not b!244583))

(assert (not b!244595))

(assert (not b!244584))

(assert (not b!244581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81996 () Bool)

(declare-fun e!169651 () Bool)

(assert (=> d!81996 e!169651))

(declare-fun res!204616 () Bool)

(assert (=> d!81996 (=> (not res!204616) (not e!169651))))

(declare-fun lt!381514 () (_ BitVec 64))

(declare-fun lt!381513 () (_ BitVec 64))

(declare-fun lt!381516 () (_ BitVec 64))

(assert (=> d!81996 (= res!204616 (= lt!381514 (bvsub lt!381516 lt!381513)))))

(assert (=> d!81996 (or (= (bvand lt!381516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381516 lt!381513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81996 (= lt!381513 (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381167)))) ((_ sign_extend 32) (currentByte!11722 (_1!11421 lt!381167))) ((_ sign_extend 32) (currentBit!11717 (_1!11421 lt!381167)))))))

(declare-fun lt!381517 () (_ BitVec 64))

(declare-fun lt!381518 () (_ BitVec 64))

(assert (=> d!81996 (= lt!381516 (bvmul lt!381517 lt!381518))))

(assert (=> d!81996 (or (= lt!381517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381518 (bvsdiv (bvmul lt!381517 lt!381518) lt!381517)))))

(assert (=> d!81996 (= lt!381518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81996 (= lt!381517 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381167)))))))

(assert (=> d!81996 (= lt!381514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11722 (_1!11421 lt!381167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11717 (_1!11421 lt!381167)))))))

(assert (=> d!81996 (invariant!0 (currentBit!11717 (_1!11421 lt!381167)) (currentByte!11722 (_1!11421 lt!381167)) (size!5872 (buf!6344 (_1!11421 lt!381167))))))

(assert (=> d!81996 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381167))) (currentByte!11722 (_1!11421 lt!381167)) (currentBit!11717 (_1!11421 lt!381167))) lt!381514)))

(declare-fun b!244775 () Bool)

(declare-fun res!204617 () Bool)

(assert (=> b!244775 (=> (not res!204617) (not e!169651))))

(assert (=> b!244775 (= res!204617 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381514))))

(declare-fun b!244776 () Bool)

(declare-fun lt!381515 () (_ BitVec 64))

(assert (=> b!244776 (= e!169651 (bvsle lt!381514 (bvmul lt!381515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244776 (or (= lt!381515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381515)))))

(assert (=> b!244776 (= lt!381515 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381167)))))))

(assert (= (and d!81996 res!204616) b!244775))

(assert (= (and b!244775 res!204617) b!244776))

(declare-fun m!369011 () Bool)

(assert (=> d!81996 m!369011))

(declare-fun m!369013 () Bool)

(assert (=> d!81996 m!369013))

(assert (=> b!244588 d!81996))

(declare-fun d!81998 () Bool)

(declare-fun e!169652 () Bool)

(assert (=> d!81998 e!169652))

(declare-fun res!204618 () Bool)

(assert (=> d!81998 (=> (not res!204618) (not e!169652))))

(declare-fun lt!381522 () (_ BitVec 64))

(declare-fun lt!381520 () (_ BitVec 64))

(declare-fun lt!381519 () (_ BitVec 64))

(assert (=> d!81998 (= res!204618 (= lt!381520 (bvsub lt!381522 lt!381519)))))

(assert (=> d!81998 (or (= (bvand lt!381522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381522 lt!381519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81998 (= lt!381519 (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381165))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381165)))))))

(declare-fun lt!381523 () (_ BitVec 64))

(declare-fun lt!381524 () (_ BitVec 64))

(assert (=> d!81998 (= lt!381522 (bvmul lt!381523 lt!381524))))

(assert (=> d!81998 (or (= lt!381523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381524 (bvsdiv (bvmul lt!381523 lt!381524) lt!381523)))))

(assert (=> d!81998 (= lt!381524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81998 (= lt!381523 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))))))

(assert (=> d!81998 (= lt!381520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381165))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381165)))))))

(assert (=> d!81998 (invariant!0 (currentBit!11717 (_2!11419 lt!381165)) (currentByte!11722 (_2!11419 lt!381165)) (size!5872 (buf!6344 (_2!11419 lt!381165))))))

(assert (=> d!81998 (= (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381165))) (currentByte!11722 (_2!11419 lt!381165)) (currentBit!11717 (_2!11419 lt!381165))) lt!381520)))

(declare-fun b!244777 () Bool)

(declare-fun res!204619 () Bool)

(assert (=> b!244777 (=> (not res!204619) (not e!169652))))

(assert (=> b!244777 (= res!204619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381520))))

(declare-fun b!244778 () Bool)

(declare-fun lt!381521 () (_ BitVec 64))

(assert (=> b!244778 (= e!169652 (bvsle lt!381520 (bvmul lt!381521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244778 (or (= lt!381521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381521)))))

(assert (=> b!244778 (= lt!381521 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))))))

(assert (= (and d!81998 res!204618) b!244777))

(assert (= (and b!244777 res!204619) b!244778))

(declare-fun m!369015 () Bool)

(assert (=> d!81998 m!369015))

(declare-fun m!369017 () Bool)

(assert (=> d!81998 m!369017))

(assert (=> b!244587 d!81998))

(declare-fun d!82002 () Bool)

(declare-fun e!169653 () Bool)

(assert (=> d!82002 e!169653))

(declare-fun res!204620 () Bool)

(assert (=> d!82002 (=> (not res!204620) (not e!169653))))

(declare-fun lt!381526 () (_ BitVec 64))

(declare-fun lt!381528 () (_ BitVec 64))

(declare-fun lt!381525 () (_ BitVec 64))

(assert (=> d!82002 (= res!204620 (= lt!381526 (bvsub lt!381528 lt!381525)))))

(assert (=> d!82002 (or (= (bvand lt!381528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381528 lt!381525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82002 (= lt!381525 (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175)))))))

(declare-fun lt!381529 () (_ BitVec 64))

(declare-fun lt!381530 () (_ BitVec 64))

(assert (=> d!82002 (= lt!381528 (bvmul lt!381529 lt!381530))))

(assert (=> d!82002 (or (= lt!381529 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381530 (bvsdiv (bvmul lt!381529 lt!381530) lt!381529)))))

(assert (=> d!82002 (= lt!381530 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82002 (= lt!381529 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(assert (=> d!82002 (= lt!381526 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175)))))))

(assert (=> d!82002 (invariant!0 (currentBit!11717 (_2!11419 lt!381175)) (currentByte!11722 (_2!11419 lt!381175)) (size!5872 (buf!6344 (_2!11419 lt!381175))))))

(assert (=> d!82002 (= (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))) lt!381526)))

(declare-fun b!244779 () Bool)

(declare-fun res!204621 () Bool)

(assert (=> b!244779 (=> (not res!204621) (not e!169653))))

(assert (=> b!244779 (= res!204621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381526))))

(declare-fun b!244780 () Bool)

(declare-fun lt!381527 () (_ BitVec 64))

(assert (=> b!244780 (= e!169653 (bvsle lt!381526 (bvmul lt!381527 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244780 (or (= lt!381527 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381527 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381527)))))

(assert (=> b!244780 (= lt!381527 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(assert (= (and d!82002 res!204620) b!244779))

(assert (= (and b!244779 res!204621) b!244780))

(declare-fun m!369019 () Bool)

(assert (=> d!82002 m!369019))

(declare-fun m!369021 () Bool)

(assert (=> d!82002 m!369021))

(assert (=> b!244587 d!82002))

(declare-fun d!82004 () Bool)

(assert (=> d!82004 (= (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381175)))) (and (bvsge (currentBit!11717 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11717 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11722 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381175)))) (and (= (currentBit!11717 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381175))))))))))

(assert (=> b!244586 d!82004))

(declare-fun d!82006 () Bool)

(assert (=> d!82006 (= (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381165)))) (and (bvsge (currentBit!11717 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11717 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11722 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381165)))) (and (= (currentBit!11717 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381165))))))))))

(assert (=> b!244585 d!82006))

(declare-fun d!82008 () Bool)

(assert (=> d!82008 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 thiss!1005))))))

(declare-fun bs!20751 () Bool)

(assert (= bs!20751 d!82008))

(declare-fun m!369025 () Bool)

(assert (=> bs!20751 m!369025))

(assert (=> start!52772 d!82008))

(declare-fun d!82012 () Bool)

(declare-datatypes ((tuple2!21014 0))(
  ( (tuple2!21015 (_1!11429 Bool) (_2!11429 BitStream!10666)) )
))
(declare-fun lt!381536 () tuple2!21014)

(declare-fun readBit!0 (BitStream!10666) tuple2!21014)

(assert (=> d!82012 (= lt!381536 (readBit!0 (readerFrom!0 (_2!11419 lt!381175) (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005))))))

(assert (=> d!82012 (= (readBitPure!0 (readerFrom!0 (_2!11419 lt!381175) (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005))) (tuple2!20999 (_2!11429 lt!381536) (_1!11429 lt!381536)))))

(declare-fun bs!20752 () Bool)

(assert (= bs!20752 d!82012))

(assert (=> bs!20752 m!368679))

(declare-fun m!369027 () Bool)

(assert (=> bs!20752 m!369027))

(assert (=> b!244595 d!82012))

(declare-fun d!82014 () Bool)

(declare-fun e!169656 () Bool)

(assert (=> d!82014 e!169656))

(declare-fun res!204625 () Bool)

(assert (=> d!82014 (=> (not res!204625) (not e!169656))))

(assert (=> d!82014 (= res!204625 (invariant!0 (currentBit!11717 (_2!11419 lt!381175)) (currentByte!11722 (_2!11419 lt!381175)) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(assert (=> d!82014 (= (readerFrom!0 (_2!11419 lt!381175) (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005)) (BitStream!10667 (buf!6344 (_2!11419 lt!381175)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(declare-fun b!244783 () Bool)

(assert (=> b!244783 (= e!169656 (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(assert (= (and d!82014 res!204625) b!244783))

(assert (=> d!82014 m!369021))

(assert (=> b!244783 m!368683))

(assert (=> b!244595 d!82014))

(declare-fun d!82016 () Bool)

(assert (=> d!82016 (= (array_inv!5613 (buf!6344 thiss!1005)) (bvsge (size!5872 (buf!6344 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!244584 d!82016))

(assert (=> b!244583 d!82002))

(declare-fun d!82018 () Bool)

(declare-fun e!169657 () Bool)

(assert (=> d!82018 e!169657))

(declare-fun res!204626 () Bool)

(assert (=> d!82018 (=> (not res!204626) (not e!169657))))

(declare-fun lt!381537 () (_ BitVec 64))

(declare-fun lt!381540 () (_ BitVec 64))

(declare-fun lt!381538 () (_ BitVec 64))

(assert (=> d!82018 (= res!204626 (= lt!381538 (bvsub lt!381540 lt!381537)))))

(assert (=> d!82018 (or (= (bvand lt!381540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381540 lt!381537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82018 (= lt!381537 (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005))))))

(declare-fun lt!381541 () (_ BitVec 64))

(declare-fun lt!381542 () (_ BitVec 64))

(assert (=> d!82018 (= lt!381540 (bvmul lt!381541 lt!381542))))

(assert (=> d!82018 (or (= lt!381541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381542 (bvsdiv (bvmul lt!381541 lt!381542) lt!381541)))))

(assert (=> d!82018 (= lt!381542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82018 (= lt!381541 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))))))

(assert (=> d!82018 (= lt!381538 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11722 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11717 thiss!1005))))))

(assert (=> d!82018 (invariant!0 (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005) (size!5872 (buf!6344 thiss!1005)))))

(assert (=> d!82018 (= (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)) lt!381538)))

(declare-fun b!244784 () Bool)

(declare-fun res!204627 () Bool)

(assert (=> b!244784 (=> (not res!204627) (not e!169657))))

(assert (=> b!244784 (= res!204627 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381538))))

(declare-fun b!244785 () Bool)

(declare-fun lt!381539 () (_ BitVec 64))

(assert (=> b!244785 (= e!169657 (bvsle lt!381538 (bvmul lt!381539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244785 (or (= lt!381539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381539)))))

(assert (=> b!244785 (= lt!381539 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))))))

(assert (= (and d!82018 res!204626) b!244784))

(assert (= (and b!244784 res!204627) b!244785))

(declare-fun m!369029 () Bool)

(assert (=> d!82018 m!369029))

(assert (=> d!82018 m!369025))

(assert (=> b!244583 d!82018))

(declare-fun d!82020 () Bool)

(declare-fun res!204642 () Bool)

(declare-fun e!169665 () Bool)

(assert (=> d!82020 (=> (not res!204642) (not e!169665))))

(assert (=> d!82020 (= res!204642 (= (size!5872 (buf!6344 (_2!11419 lt!381175))) (size!5872 (buf!6344 (_2!11419 lt!381165)))))))

(assert (=> d!82020 (= (isPrefixOf!0 (_2!11419 lt!381175) (_2!11419 lt!381165)) e!169665)))

(declare-fun b!244798 () Bool)

(declare-fun res!204640 () Bool)

(assert (=> b!244798 (=> (not res!204640) (not e!169665))))

(assert (=> b!244798 (= res!204640 (bvsle (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))) (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381165))) (currentByte!11722 (_2!11419 lt!381165)) (currentBit!11717 (_2!11419 lt!381165)))))))

(declare-fun b!244799 () Bool)

(declare-fun e!169666 () Bool)

(assert (=> b!244799 (= e!169665 e!169666)))

(declare-fun res!204641 () Bool)

(assert (=> b!244799 (=> res!204641 e!169666)))

(assert (=> b!244799 (= res!204641 (= (size!5872 (buf!6344 (_2!11419 lt!381175))) #b00000000000000000000000000000000))))

(declare-fun b!244800 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13391 array!13391 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244800 (= e!169666 (arrayBitRangesEq!0 (buf!6344 (_2!11419 lt!381175)) (buf!6344 (_2!11419 lt!381165)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175)))))))

(assert (= (and d!82020 res!204642) b!244798))

(assert (= (and b!244798 res!204640) b!244799))

(assert (= (and b!244799 (not res!204641)) b!244800))

(assert (=> b!244798 m!368695))

(assert (=> b!244798 m!368693))

(assert (=> b!244800 m!368695))

(assert (=> b!244800 m!368695))

(declare-fun m!369035 () Bool)

(assert (=> b!244800 m!369035))

(assert (=> b!244593 d!82020))

(declare-fun d!82024 () Bool)

(assert (=> d!82024 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20753 () Bool)

(assert (= bs!20753 d!82024))

(assert (=> bs!20753 m!369029))

(assert (=> b!244582 d!82024))

(declare-fun d!82026 () Bool)

(assert (=> d!82026 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11420 lt!381166)))) ((_ sign_extend 32) (currentByte!11722 (_1!11420 lt!381166))) ((_ sign_extend 32) (currentBit!11717 (_1!11420 lt!381166))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11420 lt!381166)))) ((_ sign_extend 32) (currentByte!11722 (_1!11420 lt!381166))) ((_ sign_extend 32) (currentBit!11717 (_1!11420 lt!381166)))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun bs!20754 () Bool)

(assert (= bs!20754 d!82026))

(declare-fun m!369037 () Bool)

(assert (=> bs!20754 m!369037))

(assert (=> b!244592 d!82026))

(declare-fun d!82028 () Bool)

(assert (=> d!82028 (isPrefixOf!0 thiss!1005 (_2!11419 lt!381165))))

(declare-fun lt!381563 () Unit!17839)

(declare-fun choose!30 (BitStream!10666 BitStream!10666 BitStream!10666) Unit!17839)

(assert (=> d!82028 (= lt!381563 (choose!30 thiss!1005 (_2!11419 lt!381175) (_2!11419 lt!381165)))))

(assert (=> d!82028 (isPrefixOf!0 thiss!1005 (_2!11419 lt!381175))))

(assert (=> d!82028 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11419 lt!381175) (_2!11419 lt!381165)) lt!381563)))

(declare-fun bs!20755 () Bool)

(assert (= bs!20755 d!82028))

(assert (=> bs!20755 m!368667))

(declare-fun m!369039 () Bool)

(assert (=> bs!20755 m!369039))

(assert (=> bs!20755 m!368677))

(assert (=> b!244581 d!82028))

(declare-fun d!82030 () Bool)

(assert (=> d!82030 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381566 () Unit!17839)

(declare-fun choose!9 (BitStream!10666 array!13391 (_ BitVec 64) BitStream!10666) Unit!17839)

(assert (=> d!82030 (= lt!381566 (choose!9 thiss!1005 (buf!6344 (_2!11419 lt!381165)) (bvsub nBits!297 from!289) (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005))))))

(assert (=> d!82030 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6344 (_2!11419 lt!381165)) (bvsub nBits!297 from!289)) lt!381566)))

(declare-fun bs!20756 () Bool)

(assert (= bs!20756 d!82030))

(assert (=> bs!20756 m!368655))

(declare-fun m!369041 () Bool)

(assert (=> bs!20756 m!369041))

(assert (=> b!244581 d!82030))

(declare-fun b!244844 () Bool)

(declare-fun res!204678 () Bool)

(declare-fun e!169689 () Bool)

(assert (=> b!244844 (=> (not res!204678) (not e!169689))))

(declare-fun lt!381680 () tuple2!20994)

(assert (=> b!244844 (= res!204678 (isPrefixOf!0 (_2!11419 lt!381175) (_2!11419 lt!381680)))))

(declare-fun d!82032 () Bool)

(assert (=> d!82032 e!169689))

(declare-fun res!204677 () Bool)

(assert (=> d!82032 (=> (not res!204677) (not e!169689))))

(assert (=> d!82032 (= res!204677 (= (size!5872 (buf!6344 (_2!11419 lt!381175))) (size!5872 (buf!6344 (_2!11419 lt!381680)))))))

(declare-fun choose!51 (BitStream!10666 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20994)

(assert (=> d!82032 (= lt!381680 (choose!51 (_2!11419 lt!381175) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82032 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82032 (= (appendNBitsLoop!0 (_2!11419 lt!381175) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!381680)))

(declare-fun b!244846 () Bool)

(declare-fun e!169690 () Bool)

(declare-fun lt!381679 () (_ BitVec 64))

(assert (=> b!244846 (= e!169690 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381679))))

(declare-fun b!244845 () Bool)

(declare-fun lt!381676 () tuple2!20998)

(declare-fun lt!381678 () tuple2!20996)

(assert (=> b!244845 (= e!169689 (and (_2!11421 lt!381676) (= (_1!11421 lt!381676) (_2!11420 lt!381678))))))

(assert (=> b!244845 (= lt!381676 (checkBitsLoopPure!0 (_1!11420 lt!381678) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!381677 () Unit!17839)

(declare-fun lt!381681 () Unit!17839)

(assert (=> b!244845 (= lt!381677 lt!381681)))

(assert (=> b!244845 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381680)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381679)))

(assert (=> b!244845 (= lt!381681 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381680)) lt!381679))))

(assert (=> b!244845 e!169690))

(declare-fun res!204679 () Bool)

(assert (=> b!244845 (=> (not res!204679) (not e!169690))))

(assert (=> b!244845 (= res!204679 (and (= (size!5872 (buf!6344 (_2!11419 lt!381175))) (size!5872 (buf!6344 (_2!11419 lt!381680)))) (bvsge lt!381679 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244845 (= lt!381679 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244845 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244845 (= lt!381678 (reader!0 (_2!11419 lt!381175) (_2!11419 lt!381680)))))

(declare-fun b!244843 () Bool)

(declare-fun res!204680 () Bool)

(assert (=> b!244843 (=> (not res!204680) (not e!169689))))

(declare-fun lt!381682 () (_ BitVec 64))

(declare-fun lt!381675 () (_ BitVec 64))

(assert (=> b!244843 (= res!204680 (= (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381680))) (currentByte!11722 (_2!11419 lt!381680)) (currentBit!11717 (_2!11419 lt!381680))) (bvadd lt!381682 lt!381675)))))

(assert (=> b!244843 (or (not (= (bvand lt!381682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!381682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!381682 lt!381675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244843 (= lt!381675 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244843 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244843 (= lt!381682 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))))))

(assert (= (and d!82032 res!204677) b!244843))

(assert (= (and b!244843 res!204680) b!244844))

(assert (= (and b!244844 res!204678) b!244845))

(assert (= (and b!244845 res!204679) b!244846))

(declare-fun m!369111 () Bool)

(assert (=> b!244844 m!369111))

(declare-fun m!369113 () Bool)

(assert (=> b!244845 m!369113))

(declare-fun m!369115 () Bool)

(assert (=> b!244845 m!369115))

(declare-fun m!369117 () Bool)

(assert (=> b!244845 m!369117))

(declare-fun m!369119 () Bool)

(assert (=> b!244845 m!369119))

(declare-fun m!369121 () Bool)

(assert (=> d!82032 m!369121))

(declare-fun m!369123 () Bool)

(assert (=> b!244846 m!369123))

(declare-fun m!369125 () Bool)

(assert (=> b!244843 m!369125))

(assert (=> b!244843 m!368695))

(assert (=> b!244581 d!82032))

(declare-fun d!82046 () Bool)

(declare-fun lt!381683 () tuple2!21014)

(assert (=> d!82046 (= lt!381683 (readBit!0 lt!381161))))

(assert (=> d!82046 (= (readBitPure!0 lt!381161) (tuple2!20999 (_2!11429 lt!381683) (_1!11429 lt!381683)))))

(declare-fun bs!20758 () Bool)

(assert (= bs!20758 d!82046))

(declare-fun m!369127 () Bool)

(assert (=> bs!20758 m!369127))

(assert (=> b!244581 d!82046))

(declare-fun d!82048 () Bool)

(declare-fun e!169697 () Bool)

(assert (=> d!82048 e!169697))

(declare-fun res!204691 () Bool)

(assert (=> d!82048 (=> (not res!204691) (not e!169697))))

(declare-fun lt!381701 () tuple2!20998)

(declare-fun lt!381700 () tuple2!20998)

(assert (=> d!82048 (= res!204691 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381701))) (currentByte!11722 (_1!11421 lt!381701)) (currentBit!11717 (_1!11421 lt!381701))) (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381700))) (currentByte!11722 (_1!11421 lt!381700)) (currentBit!11717 (_1!11421 lt!381700)))))))

(declare-fun lt!381702 () BitStream!10666)

(declare-fun lt!381703 () Unit!17839)

(declare-fun choose!50 (BitStream!10666 BitStream!10666 BitStream!10666 tuple2!20998 tuple2!20998 BitStream!10666 Bool tuple2!20998 tuple2!20998 BitStream!10666 Bool) Unit!17839)

(assert (=> d!82048 (= lt!381703 (choose!50 lt!381161 (_2!11419 lt!381165) lt!381702 lt!381701 (tuple2!20999 (_1!11421 lt!381701) (_2!11421 lt!381701)) (_1!11421 lt!381701) (_2!11421 lt!381701) lt!381700 (tuple2!20999 (_1!11421 lt!381700) (_2!11421 lt!381700)) (_1!11421 lt!381700) (_2!11421 lt!381700)))))

(assert (=> d!82048 (= lt!381700 (readBitPure!0 lt!381702))))

(assert (=> d!82048 (= lt!381701 (readBitPure!0 lt!381161))))

(assert (=> d!82048 (= lt!381702 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 lt!381161) (currentBit!11717 lt!381161)))))

(assert (=> d!82048 (invariant!0 (currentBit!11717 lt!381161) (currentByte!11722 lt!381161) (size!5872 (buf!6344 (_2!11419 lt!381165))))))

(assert (=> d!82048 (= (readBitPrefixLemma!0 lt!381161 (_2!11419 lt!381165)) lt!381703)))

(declare-fun b!244858 () Bool)

(assert (=> b!244858 (= e!169697 (= (_2!11421 lt!381701) (_2!11421 lt!381700)))))

(assert (= (and d!82048 res!204691) b!244858))

(declare-fun m!369129 () Bool)

(assert (=> d!82048 m!369129))

(declare-fun m!369131 () Bool)

(assert (=> d!82048 m!369131))

(assert (=> d!82048 m!368649))

(declare-fun m!369133 () Bool)

(assert (=> d!82048 m!369133))

(declare-fun m!369135 () Bool)

(assert (=> d!82048 m!369135))

(declare-fun m!369137 () Bool)

(assert (=> d!82048 m!369137))

(assert (=> b!244581 d!82048))

(declare-fun d!82050 () Bool)

(assert (=> d!82050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381169) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175)))) lt!381169))))

(declare-fun bs!20759 () Bool)

(assert (= bs!20759 d!82050))

(assert (=> bs!20759 m!369019))

(assert (=> b!244581 d!82050))

(declare-fun d!82052 () Bool)

(assert (=> d!82052 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20760 () Bool)

(assert (= bs!20760 d!82052))

(declare-fun m!369139 () Bool)

(assert (=> bs!20760 m!369139))

(assert (=> b!244581 d!82052))

(declare-fun d!82054 () Bool)

(declare-fun lt!381704 () tuple2!21014)

(assert (=> d!82054 (= lt!381704 (readBit!0 (_1!11420 lt!381157)))))

(assert (=> d!82054 (= (readBitPure!0 (_1!11420 lt!381157)) (tuple2!20999 (_2!11429 lt!381704) (_1!11429 lt!381704)))))

(declare-fun bs!20761 () Bool)

(assert (= bs!20761 d!82054))

(declare-fun m!369141 () Bool)

(assert (=> bs!20761 m!369141))

(assert (=> b!244581 d!82054))

(declare-fun d!82056 () Bool)

(declare-fun e!169698 () Bool)

(assert (=> d!82056 e!169698))

(declare-fun res!204692 () Bool)

(assert (=> d!82056 (=> (not res!204692) (not e!169698))))

(declare-fun lt!381708 () (_ BitVec 64))

(declare-fun lt!381705 () (_ BitVec 64))

(declare-fun lt!381706 () (_ BitVec 64))

(assert (=> d!82056 (= res!204692 (= lt!381706 (bvsub lt!381708 lt!381705)))))

(assert (=> d!82056 (or (= (bvand lt!381708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381708 lt!381705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82056 (= lt!381705 (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381171)))) ((_ sign_extend 32) (currentByte!11722 (_1!11421 lt!381171))) ((_ sign_extend 32) (currentBit!11717 (_1!11421 lt!381171)))))))

(declare-fun lt!381709 () (_ BitVec 64))

(declare-fun lt!381710 () (_ BitVec 64))

(assert (=> d!82056 (= lt!381708 (bvmul lt!381709 lt!381710))))

(assert (=> d!82056 (or (= lt!381709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381710 (bvsdiv (bvmul lt!381709 lt!381710) lt!381709)))))

(assert (=> d!82056 (= lt!381710 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82056 (= lt!381709 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381171)))))))

(assert (=> d!82056 (= lt!381706 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11722 (_1!11421 lt!381171))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11717 (_1!11421 lt!381171)))))))

(assert (=> d!82056 (invariant!0 (currentBit!11717 (_1!11421 lt!381171)) (currentByte!11722 (_1!11421 lt!381171)) (size!5872 (buf!6344 (_1!11421 lt!381171))))))

(assert (=> d!82056 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381171))) (currentByte!11722 (_1!11421 lt!381171)) (currentBit!11717 (_1!11421 lt!381171))) lt!381706)))

(declare-fun b!244859 () Bool)

(declare-fun res!204693 () Bool)

(assert (=> b!244859 (=> (not res!204693) (not e!169698))))

(assert (=> b!244859 (= res!204693 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381706))))

(declare-fun b!244860 () Bool)

(declare-fun lt!381707 () (_ BitVec 64))

(assert (=> b!244860 (= e!169698 (bvsle lt!381706 (bvmul lt!381707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244860 (or (= lt!381707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381707)))))

(assert (=> b!244860 (= lt!381707 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381171)))))))

(assert (= (and d!82056 res!204692) b!244859))

(assert (= (and b!244859 res!204693) b!244860))

(declare-fun m!369143 () Bool)

(assert (=> d!82056 m!369143))

(declare-fun m!369145 () Bool)

(assert (=> d!82056 m!369145))

(assert (=> b!244581 d!82056))

(declare-fun d!82058 () Bool)

(declare-fun lt!381711 () tuple2!21014)

(assert (=> d!82058 (= lt!381711 (readBit!0 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005))))))

(assert (=> d!82058 (= (readBitPure!0 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005))) (tuple2!20999 (_2!11429 lt!381711) (_1!11429 lt!381711)))))

(declare-fun bs!20762 () Bool)

(assert (= bs!20762 d!82058))

(declare-fun m!369147 () Bool)

(assert (=> bs!20762 m!369147))

(assert (=> b!244581 d!82058))

(declare-fun b!244877 () Bool)

(declare-fun e!169705 () Bool)

(declare-fun lt!381727 () tuple2!20998)

(declare-fun lt!381725 () tuple2!20994)

(assert (=> b!244877 (= e!169705 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381727))) (currentByte!11722 (_1!11421 lt!381727)) (currentBit!11717 (_1!11421 lt!381727))) (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381725))) (currentByte!11722 (_2!11419 lt!381725)) (currentBit!11717 (_2!11419 lt!381725)))))))

(declare-fun b!244875 () Bool)

(declare-fun res!204706 () Bool)

(declare-fun e!169706 () Bool)

(assert (=> b!244875 (=> (not res!204706) (not e!169706))))

(assert (=> b!244875 (= res!204706 (isPrefixOf!0 thiss!1005 (_2!11419 lt!381725)))))

(declare-fun b!244874 () Bool)

(declare-fun res!204708 () Bool)

(assert (=> b!244874 (=> (not res!204708) (not e!169706))))

(declare-fun lt!381726 () (_ BitVec 64))

(declare-fun lt!381728 () (_ BitVec 64))

(assert (=> b!244874 (= res!204708 (= (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381725))) (currentByte!11722 (_2!11419 lt!381725)) (currentBit!11717 (_2!11419 lt!381725))) (bvadd lt!381728 lt!381726)))))

(assert (=> b!244874 (or (not (= (bvand lt!381728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381726 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!381728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!381728 lt!381726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244874 (= lt!381726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!244874 (= lt!381728 (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(declare-fun b!244876 () Bool)

(assert (=> b!244876 (= e!169706 e!169705)))

(declare-fun res!204709 () Bool)

(assert (=> b!244876 (=> (not res!204709) (not e!169705))))

(assert (=> b!244876 (= res!204709 (and (= (_2!11421 lt!381727) bit!26) (= (_1!11421 lt!381727) (_2!11419 lt!381725))))))

(assert (=> b!244876 (= lt!381727 (readBitPure!0 (readerFrom!0 (_2!11419 lt!381725) (currentBit!11717 thiss!1005) (currentByte!11722 thiss!1005))))))

(declare-fun d!82060 () Bool)

(assert (=> d!82060 e!169706))

(declare-fun res!204707 () Bool)

(assert (=> d!82060 (=> (not res!204707) (not e!169706))))

(assert (=> d!82060 (= res!204707 (= (size!5872 (buf!6344 thiss!1005)) (size!5872 (buf!6344 (_2!11419 lt!381725)))))))

(declare-fun choose!16 (BitStream!10666 Bool) tuple2!20994)

(assert (=> d!82060 (= lt!381725 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82060 (validate_offset_bit!0 ((_ sign_extend 32) (size!5872 (buf!6344 thiss!1005))) ((_ sign_extend 32) (currentByte!11722 thiss!1005)) ((_ sign_extend 32) (currentBit!11717 thiss!1005)))))

(assert (=> d!82060 (= (appendBit!0 thiss!1005 bit!26) lt!381725)))

(assert (= (and d!82060 res!204707) b!244874))

(assert (= (and b!244874 res!204708) b!244875))

(assert (= (and b!244875 res!204706) b!244876))

(assert (= (and b!244876 res!204709) b!244877))

(declare-fun m!369165 () Bool)

(assert (=> b!244874 m!369165))

(assert (=> b!244874 m!368703))

(declare-fun m!369167 () Bool)

(assert (=> b!244876 m!369167))

(assert (=> b!244876 m!369167))

(declare-fun m!369169 () Bool)

(assert (=> b!244876 m!369169))

(declare-fun m!369171 () Bool)

(assert (=> b!244877 m!369171))

(assert (=> b!244877 m!369165))

(declare-fun m!369173 () Bool)

(assert (=> d!82060 m!369173))

(declare-fun m!369175 () Bool)

(assert (=> d!82060 m!369175))

(declare-fun m!369177 () Bool)

(assert (=> b!244875 m!369177))

(assert (=> b!244581 d!82060))

(declare-fun b!244900 () Bool)

(declare-fun e!169718 () Unit!17839)

(declare-fun lt!381805 () Unit!17839)

(assert (=> b!244900 (= e!169718 lt!381805)))

(declare-fun lt!381801 () (_ BitVec 64))

(assert (=> b!244900 (= lt!381801 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!381799 () (_ BitVec 64))

(assert (=> b!244900 (= lt!381799 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13391 array!13391 (_ BitVec 64) (_ BitVec 64)) Unit!17839)

(assert (=> b!244900 (= lt!381805 (arrayBitRangesEqSymmetric!0 (buf!6344 (_2!11419 lt!381175)) (buf!6344 (_2!11419 lt!381165)) lt!381801 lt!381799))))

(assert (=> b!244900 (arrayBitRangesEq!0 (buf!6344 (_2!11419 lt!381165)) (buf!6344 (_2!11419 lt!381175)) lt!381801 lt!381799)))

(declare-fun b!244901 () Bool)

(declare-fun Unit!17849 () Unit!17839)

(assert (=> b!244901 (= e!169718 Unit!17849)))

(declare-fun lt!381804 () tuple2!20996)

(declare-fun lt!381808 () (_ BitVec 64))

(declare-fun e!169717 () Bool)

(declare-fun b!244902 () Bool)

(declare-fun lt!381794 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10666 (_ BitVec 64)) BitStream!10666)

(assert (=> b!244902 (= e!169717 (= (_1!11420 lt!381804) (withMovedBitIndex!0 (_2!11420 lt!381804) (bvsub lt!381808 lt!381794))))))

(assert (=> b!244902 (or (= (bvand lt!381808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381808 lt!381794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244902 (= lt!381794 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381165))) (currentByte!11722 (_2!11419 lt!381165)) (currentBit!11717 (_2!11419 lt!381165))))))

(assert (=> b!244902 (= lt!381808 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))))))

(declare-fun b!244903 () Bool)

(declare-fun res!204730 () Bool)

(assert (=> b!244903 (=> (not res!204730) (not e!169717))))

(assert (=> b!244903 (= res!204730 (isPrefixOf!0 (_1!11420 lt!381804) (_2!11419 lt!381175)))))

(declare-fun b!244904 () Bool)

(declare-fun res!204728 () Bool)

(assert (=> b!244904 (=> (not res!204728) (not e!169717))))

(assert (=> b!244904 (= res!204728 (isPrefixOf!0 (_2!11420 lt!381804) (_2!11419 lt!381165)))))

(declare-fun d!82066 () Bool)

(assert (=> d!82066 e!169717))

(declare-fun res!204729 () Bool)

(assert (=> d!82066 (=> (not res!204729) (not e!169717))))

(assert (=> d!82066 (= res!204729 (isPrefixOf!0 (_1!11420 lt!381804) (_2!11420 lt!381804)))))

(declare-fun lt!381796 () BitStream!10666)

(assert (=> d!82066 (= lt!381804 (tuple2!20997 lt!381796 (_2!11419 lt!381165)))))

(declare-fun lt!381812 () Unit!17839)

(declare-fun lt!381803 () Unit!17839)

(assert (=> d!82066 (= lt!381812 lt!381803)))

(assert (=> d!82066 (isPrefixOf!0 lt!381796 (_2!11419 lt!381165))))

(assert (=> d!82066 (= lt!381803 (lemmaIsPrefixTransitive!0 lt!381796 (_2!11419 lt!381165) (_2!11419 lt!381165)))))

(declare-fun lt!381798 () Unit!17839)

(declare-fun lt!381800 () Unit!17839)

(assert (=> d!82066 (= lt!381798 lt!381800)))

(assert (=> d!82066 (isPrefixOf!0 lt!381796 (_2!11419 lt!381165))))

(assert (=> d!82066 (= lt!381800 (lemmaIsPrefixTransitive!0 lt!381796 (_2!11419 lt!381175) (_2!11419 lt!381165)))))

(declare-fun lt!381802 () Unit!17839)

(assert (=> d!82066 (= lt!381802 e!169718)))

(declare-fun c!11475 () Bool)

(assert (=> d!82066 (= c!11475 (not (= (size!5872 (buf!6344 (_2!11419 lt!381175))) #b00000000000000000000000000000000)))))

(declare-fun lt!381806 () Unit!17839)

(declare-fun lt!381807 () Unit!17839)

(assert (=> d!82066 (= lt!381806 lt!381807)))

(assert (=> d!82066 (isPrefixOf!0 (_2!11419 lt!381165) (_2!11419 lt!381165))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10666) Unit!17839)

(assert (=> d!82066 (= lt!381807 (lemmaIsPrefixRefl!0 (_2!11419 lt!381165)))))

(declare-fun lt!381797 () Unit!17839)

(declare-fun lt!381811 () Unit!17839)

(assert (=> d!82066 (= lt!381797 lt!381811)))

(assert (=> d!82066 (= lt!381811 (lemmaIsPrefixRefl!0 (_2!11419 lt!381165)))))

(declare-fun lt!381795 () Unit!17839)

(declare-fun lt!381809 () Unit!17839)

(assert (=> d!82066 (= lt!381795 lt!381809)))

(assert (=> d!82066 (isPrefixOf!0 lt!381796 lt!381796)))

(assert (=> d!82066 (= lt!381809 (lemmaIsPrefixRefl!0 lt!381796))))

(declare-fun lt!381793 () Unit!17839)

(declare-fun lt!381810 () Unit!17839)

(assert (=> d!82066 (= lt!381793 lt!381810)))

(assert (=> d!82066 (isPrefixOf!0 (_2!11419 lt!381175) (_2!11419 lt!381175))))

(assert (=> d!82066 (= lt!381810 (lemmaIsPrefixRefl!0 (_2!11419 lt!381175)))))

(assert (=> d!82066 (= lt!381796 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175))))))

(assert (=> d!82066 (isPrefixOf!0 (_2!11419 lt!381175) (_2!11419 lt!381165))))

(assert (=> d!82066 (= (reader!0 (_2!11419 lt!381175) (_2!11419 lt!381165)) lt!381804)))

(assert (= (and d!82066 c!11475) b!244900))

(assert (= (and d!82066 (not c!11475)) b!244901))

(assert (= (and d!82066 res!204729) b!244903))

(assert (= (and b!244903 res!204730) b!244904))

(assert (= (and b!244904 res!204728) b!244902))

(declare-fun m!369195 () Bool)

(assert (=> d!82066 m!369195))

(assert (=> d!82066 m!368709))

(declare-fun m!369197 () Bool)

(assert (=> d!82066 m!369197))

(declare-fun m!369199 () Bool)

(assert (=> d!82066 m!369199))

(declare-fun m!369201 () Bool)

(assert (=> d!82066 m!369201))

(declare-fun m!369203 () Bool)

(assert (=> d!82066 m!369203))

(declare-fun m!369205 () Bool)

(assert (=> d!82066 m!369205))

(declare-fun m!369207 () Bool)

(assert (=> d!82066 m!369207))

(declare-fun m!369209 () Bool)

(assert (=> d!82066 m!369209))

(declare-fun m!369211 () Bool)

(assert (=> d!82066 m!369211))

(declare-fun m!369213 () Bool)

(assert (=> d!82066 m!369213))

(declare-fun m!369215 () Bool)

(assert (=> b!244904 m!369215))

(declare-fun m!369217 () Bool)

(assert (=> b!244903 m!369217))

(declare-fun m!369219 () Bool)

(assert (=> b!244902 m!369219))

(assert (=> b!244902 m!368693))

(assert (=> b!244902 m!368695))

(assert (=> b!244900 m!368695))

(declare-fun m!369221 () Bool)

(assert (=> b!244900 m!369221))

(declare-fun m!369223 () Bool)

(assert (=> b!244900 m!369223))

(assert (=> b!244581 d!82066))

(declare-fun d!82070 () Bool)

(declare-fun e!169723 () Bool)

(assert (=> d!82070 e!169723))

(declare-fun res!204735 () Bool)

(assert (=> d!82070 (=> (not res!204735) (not e!169723))))

(assert (=> d!82070 (= res!204735 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!381823 () Unit!17839)

(declare-fun choose!27 (BitStream!10666 BitStream!10666 (_ BitVec 64) (_ BitVec 64)) Unit!17839)

(assert (=> d!82070 (= lt!381823 (choose!27 thiss!1005 (_2!11419 lt!381175) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82070 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82070 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11419 lt!381175) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!381823)))

(declare-fun b!244908 () Bool)

(assert (=> b!244908 (= e!169723 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381175)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82070 res!204735) b!244908))

(declare-fun m!369225 () Bool)

(assert (=> d!82070 m!369225))

(declare-fun m!369227 () Bool)

(assert (=> b!244908 m!369227))

(assert (=> b!244581 d!82070))

(declare-fun d!82072 () Bool)

(declare-fun res!204738 () Bool)

(declare-fun e!169724 () Bool)

(assert (=> d!82072 (=> (not res!204738) (not e!169724))))

(assert (=> d!82072 (= res!204738 (= (size!5872 (buf!6344 thiss!1005)) (size!5872 (buf!6344 (_2!11419 lt!381165)))))))

(assert (=> d!82072 (= (isPrefixOf!0 thiss!1005 (_2!11419 lt!381165)) e!169724)))

(declare-fun b!244910 () Bool)

(declare-fun res!204736 () Bool)

(assert (=> b!244910 (=> (not res!204736) (not e!169724))))

(assert (=> b!244910 (= res!204736 (bvsle (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)) (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381165))) (currentByte!11722 (_2!11419 lt!381165)) (currentBit!11717 (_2!11419 lt!381165)))))))

(declare-fun b!244911 () Bool)

(declare-fun e!169725 () Bool)

(assert (=> b!244911 (= e!169724 e!169725)))

(declare-fun res!204737 () Bool)

(assert (=> b!244911 (=> res!204737 e!169725)))

(assert (=> b!244911 (= res!204737 (= (size!5872 (buf!6344 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!244912 () Bool)

(assert (=> b!244912 (= e!169725 (arrayBitRangesEq!0 (buf!6344 thiss!1005) (buf!6344 (_2!11419 lt!381165)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005))))))

(assert (= (and d!82072 res!204738) b!244910))

(assert (= (and b!244910 res!204736) b!244911))

(assert (= (and b!244911 (not res!204737)) b!244912))

(assert (=> b!244910 m!368703))

(assert (=> b!244910 m!368693))

(assert (=> b!244912 m!368703))

(assert (=> b!244912 m!368703))

(declare-fun m!369229 () Bool)

(assert (=> b!244912 m!369229))

(assert (=> b!244581 d!82072))

(declare-fun d!82074 () Bool)

(assert (=> d!82074 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381169)))

(declare-fun lt!381824 () Unit!17839)

(assert (=> d!82074 (= lt!381824 (choose!9 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381165)) lt!381169 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175)))))))

(assert (=> d!82074 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381165)) lt!381169) lt!381824)))

(declare-fun bs!20764 () Bool)

(assert (= bs!20764 d!82074))

(assert (=> bs!20764 m!368671))

(declare-fun m!369231 () Bool)

(assert (=> bs!20764 m!369231))

(assert (=> b!244581 d!82074))

(declare-fun d!82076 () Bool)

(assert (=> d!82076 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381169) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175)))) lt!381169))))

(declare-fun bs!20765 () Bool)

(assert (= bs!20765 d!82076))

(declare-fun m!369233 () Bool)

(assert (=> bs!20765 m!369233))

(assert (=> b!244581 d!82076))

(declare-fun d!82078 () Bool)

(declare-fun e!169726 () Bool)

(assert (=> d!82078 e!169726))

(declare-fun res!204739 () Bool)

(assert (=> d!82078 (=> (not res!204739) (not e!169726))))

(declare-fun lt!381828 () (_ BitVec 64))

(declare-fun lt!381825 () (_ BitVec 64))

(declare-fun lt!381826 () (_ BitVec 64))

(assert (=> d!82078 (= res!204739 (= lt!381826 (bvsub lt!381828 lt!381825)))))

(assert (=> d!82078 (or (= (bvand lt!381828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381825 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381828 lt!381825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82078 (= lt!381825 (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381176)))) ((_ sign_extend 32) (currentByte!11722 (_1!11421 lt!381176))) ((_ sign_extend 32) (currentBit!11717 (_1!11421 lt!381176)))))))

(declare-fun lt!381829 () (_ BitVec 64))

(declare-fun lt!381830 () (_ BitVec 64))

(assert (=> d!82078 (= lt!381828 (bvmul lt!381829 lt!381830))))

(assert (=> d!82078 (or (= lt!381829 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!381830 (bvsdiv (bvmul lt!381829 lt!381830) lt!381829)))))

(assert (=> d!82078 (= lt!381830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82078 (= lt!381829 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381176)))))))

(assert (=> d!82078 (= lt!381826 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11722 (_1!11421 lt!381176))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11717 (_1!11421 lt!381176)))))))

(assert (=> d!82078 (invariant!0 (currentBit!11717 (_1!11421 lt!381176)) (currentByte!11722 (_1!11421 lt!381176)) (size!5872 (buf!6344 (_1!11421 lt!381176))))))

(assert (=> d!82078 (= (bitIndex!0 (size!5872 (buf!6344 (_1!11421 lt!381176))) (currentByte!11722 (_1!11421 lt!381176)) (currentBit!11717 (_1!11421 lt!381176))) lt!381826)))

(declare-fun b!244913 () Bool)

(declare-fun res!204740 () Bool)

(assert (=> b!244913 (=> (not res!204740) (not e!169726))))

(assert (=> b!244913 (= res!204740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!381826))))

(declare-fun b!244914 () Bool)

(declare-fun lt!381827 () (_ BitVec 64))

(assert (=> b!244914 (= e!169726 (bvsle lt!381826 (bvmul lt!381827 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!244914 (or (= lt!381827 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!381827 #b0000000000000000000000000000000000000000000000000000000000001000) lt!381827)))))

(assert (=> b!244914 (= lt!381827 ((_ sign_extend 32) (size!5872 (buf!6344 (_1!11421 lt!381176)))))))

(assert (= (and d!82078 res!204739) b!244913))

(assert (= (and b!244913 res!204740) b!244914))

(declare-fun m!369235 () Bool)

(assert (=> d!82078 m!369235))

(declare-fun m!369237 () Bool)

(assert (=> d!82078 m!369237))

(assert (=> b!244581 d!82078))

(declare-fun b!244916 () Bool)

(declare-fun e!169729 () Unit!17839)

(declare-fun lt!381847 () Unit!17839)

(assert (=> b!244916 (= e!169729 lt!381847)))

(declare-fun lt!381843 () (_ BitVec 64))

(assert (=> b!244916 (= lt!381843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!381841 () (_ BitVec 64))

(assert (=> b!244916 (= lt!381841 (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(assert (=> b!244916 (= lt!381847 (arrayBitRangesEqSymmetric!0 (buf!6344 thiss!1005) (buf!6344 (_2!11419 lt!381165)) lt!381843 lt!381841))))

(assert (=> b!244916 (arrayBitRangesEq!0 (buf!6344 (_2!11419 lt!381165)) (buf!6344 thiss!1005) lt!381843 lt!381841)))

(declare-fun b!244917 () Bool)

(declare-fun Unit!17850 () Unit!17839)

(assert (=> b!244917 (= e!169729 Unit!17850)))

(declare-fun b!244918 () Bool)

(declare-fun lt!381846 () tuple2!20996)

(declare-fun lt!381850 () (_ BitVec 64))

(declare-fun lt!381836 () (_ BitVec 64))

(declare-fun e!169728 () Bool)

(assert (=> b!244918 (= e!169728 (= (_1!11420 lt!381846) (withMovedBitIndex!0 (_2!11420 lt!381846) (bvsub lt!381850 lt!381836))))))

(assert (=> b!244918 (or (= (bvand lt!381850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!381836 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!381850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!381850 lt!381836) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!244918 (= lt!381836 (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381165))) (currentByte!11722 (_2!11419 lt!381165)) (currentBit!11717 (_2!11419 lt!381165))))))

(assert (=> b!244918 (= lt!381850 (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(declare-fun b!244919 () Bool)

(declare-fun res!204744 () Bool)

(assert (=> b!244919 (=> (not res!204744) (not e!169728))))

(assert (=> b!244919 (= res!204744 (isPrefixOf!0 (_1!11420 lt!381846) thiss!1005))))

(declare-fun b!244920 () Bool)

(declare-fun res!204742 () Bool)

(assert (=> b!244920 (=> (not res!204742) (not e!169728))))

(assert (=> b!244920 (= res!204742 (isPrefixOf!0 (_2!11420 lt!381846) (_2!11419 lt!381165)))))

(declare-fun d!82080 () Bool)

(assert (=> d!82080 e!169728))

(declare-fun res!204743 () Bool)

(assert (=> d!82080 (=> (not res!204743) (not e!169728))))

(assert (=> d!82080 (= res!204743 (isPrefixOf!0 (_1!11420 lt!381846) (_2!11420 lt!381846)))))

(declare-fun lt!381838 () BitStream!10666)

(assert (=> d!82080 (= lt!381846 (tuple2!20997 lt!381838 (_2!11419 lt!381165)))))

(declare-fun lt!381854 () Unit!17839)

(declare-fun lt!381845 () Unit!17839)

(assert (=> d!82080 (= lt!381854 lt!381845)))

(assert (=> d!82080 (isPrefixOf!0 lt!381838 (_2!11419 lt!381165))))

(assert (=> d!82080 (= lt!381845 (lemmaIsPrefixTransitive!0 lt!381838 (_2!11419 lt!381165) (_2!11419 lt!381165)))))

(declare-fun lt!381840 () Unit!17839)

(declare-fun lt!381842 () Unit!17839)

(assert (=> d!82080 (= lt!381840 lt!381842)))

(assert (=> d!82080 (isPrefixOf!0 lt!381838 (_2!11419 lt!381165))))

(assert (=> d!82080 (= lt!381842 (lemmaIsPrefixTransitive!0 lt!381838 thiss!1005 (_2!11419 lt!381165)))))

(declare-fun lt!381844 () Unit!17839)

(assert (=> d!82080 (= lt!381844 e!169729)))

(declare-fun c!11476 () Bool)

(assert (=> d!82080 (= c!11476 (not (= (size!5872 (buf!6344 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!381848 () Unit!17839)

(declare-fun lt!381849 () Unit!17839)

(assert (=> d!82080 (= lt!381848 lt!381849)))

(assert (=> d!82080 (isPrefixOf!0 (_2!11419 lt!381165) (_2!11419 lt!381165))))

(assert (=> d!82080 (= lt!381849 (lemmaIsPrefixRefl!0 (_2!11419 lt!381165)))))

(declare-fun lt!381839 () Unit!17839)

(declare-fun lt!381853 () Unit!17839)

(assert (=> d!82080 (= lt!381839 lt!381853)))

(assert (=> d!82080 (= lt!381853 (lemmaIsPrefixRefl!0 (_2!11419 lt!381165)))))

(declare-fun lt!381837 () Unit!17839)

(declare-fun lt!381851 () Unit!17839)

(assert (=> d!82080 (= lt!381837 lt!381851)))

(assert (=> d!82080 (isPrefixOf!0 lt!381838 lt!381838)))

(assert (=> d!82080 (= lt!381851 (lemmaIsPrefixRefl!0 lt!381838))))

(declare-fun lt!381835 () Unit!17839)

(declare-fun lt!381852 () Unit!17839)

(assert (=> d!82080 (= lt!381835 lt!381852)))

(assert (=> d!82080 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82080 (= lt!381852 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82080 (= lt!381838 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)))))

(assert (=> d!82080 (isPrefixOf!0 thiss!1005 (_2!11419 lt!381165))))

(assert (=> d!82080 (= (reader!0 thiss!1005 (_2!11419 lt!381165)) lt!381846)))

(assert (= (and d!82080 c!11476) b!244916))

(assert (= (and d!82080 (not c!11476)) b!244917))

(assert (= (and d!82080 res!204743) b!244919))

(assert (= (and b!244919 res!204744) b!244920))

(assert (= (and b!244920 res!204742) b!244918))

(declare-fun m!369249 () Bool)

(assert (=> d!82080 m!369249))

(assert (=> d!82080 m!368667))

(declare-fun m!369251 () Bool)

(assert (=> d!82080 m!369251))

(declare-fun m!369253 () Bool)

(assert (=> d!82080 m!369253))

(declare-fun m!369255 () Bool)

(assert (=> d!82080 m!369255))

(assert (=> d!82080 m!369203))

(declare-fun m!369257 () Bool)

(assert (=> d!82080 m!369257))

(declare-fun m!369259 () Bool)

(assert (=> d!82080 m!369259))

(declare-fun m!369261 () Bool)

(assert (=> d!82080 m!369261))

(declare-fun m!369263 () Bool)

(assert (=> d!82080 m!369263))

(assert (=> d!82080 m!369213))

(declare-fun m!369265 () Bool)

(assert (=> b!244920 m!369265))

(declare-fun m!369267 () Bool)

(assert (=> b!244919 m!369267))

(declare-fun m!369269 () Bool)

(assert (=> b!244918 m!369269))

(assert (=> b!244918 m!368693))

(assert (=> b!244918 m!368703))

(assert (=> b!244916 m!368703))

(declare-fun m!369271 () Bool)

(assert (=> b!244916 m!369271))

(declare-fun m!369273 () Bool)

(assert (=> b!244916 m!369273))

(assert (=> b!244581 d!82080))

(declare-fun lt!381862 () tuple2!21014)

(declare-fun d!82084 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10666 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21014)

(assert (=> d!82084 (= lt!381862 (checkBitsLoop!0 (_1!11420 lt!381157) nBits!297 bit!26 from!289))))

(assert (=> d!82084 (= (checkBitsLoopPure!0 (_1!11420 lt!381157) nBits!297 bit!26 from!289) (tuple2!20999 (_2!11429 lt!381862) (_1!11429 lt!381862)))))

(declare-fun bs!20769 () Bool)

(assert (= bs!20769 d!82084))

(declare-fun m!369281 () Bool)

(assert (=> bs!20769 m!369281))

(assert (=> b!244581 d!82084))

(declare-fun d!82092 () Bool)

(declare-fun lt!381863 () tuple2!21014)

(assert (=> d!82092 (= lt!381863 (checkBitsLoop!0 (_1!11420 lt!381170) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82092 (= (checkBitsLoopPure!0 (_1!11420 lt!381170) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20999 (_2!11429 lt!381863) (_1!11429 lt!381863)))))

(declare-fun bs!20770 () Bool)

(assert (= bs!20770 d!82092))

(declare-fun m!369283 () Bool)

(assert (=> bs!20770 m!369283))

(assert (=> b!244591 d!82092))

(declare-fun d!82094 () Bool)

(assert (=> d!82094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381168) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175)))) lt!381168))))

(declare-fun bs!20771 () Bool)

(assert (= bs!20771 d!82094))

(assert (=> bs!20771 m!369233))

(assert (=> b!244591 d!82094))

(declare-fun d!82096 () Bool)

(assert (=> d!82096 (validate_offset_bits!1 ((_ sign_extend 32) (size!5872 (buf!6344 (_2!11419 lt!381165)))) ((_ sign_extend 32) (currentByte!11722 (_2!11419 lt!381175))) ((_ sign_extend 32) (currentBit!11717 (_2!11419 lt!381175))) lt!381168)))

(declare-fun lt!381864 () Unit!17839)

(assert (=> d!82096 (= lt!381864 (choose!9 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381165)) lt!381168 (BitStream!10667 (buf!6344 (_2!11419 lt!381165)) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175)))))))

(assert (=> d!82096 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11419 lt!381175) (buf!6344 (_2!11419 lt!381165)) lt!381168) lt!381864)))

(declare-fun bs!20772 () Bool)

(assert (= bs!20772 d!82096))

(assert (=> bs!20772 m!368689))

(declare-fun m!369285 () Bool)

(assert (=> bs!20772 m!369285))

(assert (=> b!244591 d!82096))

(assert (=> b!244591 d!82066))

(declare-fun d!82098 () Bool)

(declare-fun res!204747 () Bool)

(declare-fun e!169730 () Bool)

(assert (=> d!82098 (=> (not res!204747) (not e!169730))))

(assert (=> d!82098 (= res!204747 (= (size!5872 (buf!6344 thiss!1005)) (size!5872 (buf!6344 (_2!11419 lt!381175)))))))

(assert (=> d!82098 (= (isPrefixOf!0 thiss!1005 (_2!11419 lt!381175)) e!169730)))

(declare-fun b!244921 () Bool)

(declare-fun res!204745 () Bool)

(assert (=> b!244921 (=> (not res!204745) (not e!169730))))

(assert (=> b!244921 (= res!204745 (bvsle (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005)) (bitIndex!0 (size!5872 (buf!6344 (_2!11419 lt!381175))) (currentByte!11722 (_2!11419 lt!381175)) (currentBit!11717 (_2!11419 lt!381175)))))))

(declare-fun b!244922 () Bool)

(declare-fun e!169731 () Bool)

(assert (=> b!244922 (= e!169730 e!169731)))

(declare-fun res!204746 () Bool)

(assert (=> b!244922 (=> res!204746 e!169731)))

(assert (=> b!244922 (= res!204746 (= (size!5872 (buf!6344 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!244923 () Bool)

(assert (=> b!244923 (= e!169731 (arrayBitRangesEq!0 (buf!6344 thiss!1005) (buf!6344 (_2!11419 lt!381175)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5872 (buf!6344 thiss!1005)) (currentByte!11722 thiss!1005) (currentBit!11717 thiss!1005))))))

(assert (= (and d!82098 res!204747) b!244921))

(assert (= (and b!244921 res!204745) b!244922))

(assert (= (and b!244922 (not res!204746)) b!244923))

(assert (=> b!244921 m!368703))

(assert (=> b!244921 m!368695))

(assert (=> b!244923 m!368703))

(assert (=> b!244923 m!368703))

(declare-fun m!369287 () Bool)

(assert (=> b!244923 m!369287))

(assert (=> b!244589 d!82098))

(push 1)

(assert (not b!244798))

(assert (not d!82056))

(assert (not b!244903))

(assert (not b!244904))

(assert (not d!82048))

(assert (not d!82050))

(assert (not d!82060))

(assert (not b!244783))

(assert (not d!82008))

(assert (not d!81996))

(assert (not d!82002))

(assert (not b!244919))

(assert (not d!82066))

(assert (not d!82030))

(assert (not b!244874))

(assert (not b!244846))

(assert (not b!244902))

(assert (not b!244916))

(assert (not d!82078))

(assert (not b!244877))

(assert (not b!244844))

(assert (not d!82032))

(assert (not d!82084))

(assert (not d!82046))

(assert (not d!81998))

(assert (not d!82058))

(assert (not d!82080))

(assert (not d!82076))

(assert (not d!82074))

(assert (not b!244910))

(assert (not d!82094))

(assert (not d!82024))

(assert (not d!82096))

(assert (not b!244912))

(assert (not b!244923))

(assert (not b!244908))

(assert (not b!244875))

(assert (not b!244800))

(assert (not b!244921))

(assert (not d!82012))

(assert (not b!244918))

(assert (not d!82054))

(assert (not d!82052))

(assert (not b!244845))

(assert (not b!244843))

(assert (not b!244876))

(assert (not d!82014))

(assert (not d!82092))

(assert (not d!82018))

(assert (not d!82070))

(assert (not d!82026))

(assert (not d!82028))

(assert (not b!244920))

(assert (not b!244900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

