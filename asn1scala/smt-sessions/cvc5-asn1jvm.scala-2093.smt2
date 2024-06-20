; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53114 () Bool)

(assert start!53114)

(declare-fun b!246406 () Bool)

(declare-fun res!206125 () Bool)

(declare-fun e!170712 () Bool)

(assert (=> b!246406 (=> (not res!206125) (not e!170712))))

(declare-datatypes ((array!13442 0))(
  ( (array!13443 (arr!6880 (Array (_ BitVec 32) (_ BitVec 8))) (size!5893 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10708 0))(
  ( (BitStream!10709 (buf!6374 array!13442) (currentByte!11770 (_ BitVec 32)) (currentBit!11765 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10708)

(declare-datatypes ((Unit!17898 0))(
  ( (Unit!17899) )
))
(declare-datatypes ((tuple2!21138 0))(
  ( (tuple2!21139 (_1!11491 Unit!17898) (_2!11491 BitStream!10708)) )
))
(declare-fun lt!384397 () tuple2!21138)

(declare-fun isPrefixOf!0 (BitStream!10708 BitStream!10708) Bool)

(assert (=> b!246406 (= res!206125 (isPrefixOf!0 thiss!1005 (_2!11491 lt!384397)))))

(declare-fun b!246407 () Bool)

(declare-fun e!170709 () Bool)

(declare-fun lt!384404 () tuple2!21138)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246407 (= e!170709 (invariant!0 (currentBit!11765 thiss!1005) (currentByte!11770 thiss!1005) (size!5893 (buf!6374 (_2!11491 lt!384404)))))))

(declare-fun b!246408 () Bool)

(declare-fun res!206139 () Bool)

(assert (=> b!246408 (=> (not res!206139) (not e!170709))))

(assert (=> b!246408 (= res!206139 (invariant!0 (currentBit!11765 thiss!1005) (currentByte!11770 thiss!1005) (size!5893 (buf!6374 (_2!11491 lt!384397)))))))

(declare-fun b!246409 () Bool)

(declare-fun res!206126 () Bool)

(declare-fun e!170714 () Bool)

(assert (=> b!246409 (=> (not res!206126) (not e!170714))))

(assert (=> b!246409 (= res!206126 (isPrefixOf!0 (_2!11491 lt!384397) (_2!11491 lt!384404)))))

(declare-fun b!246410 () Bool)

(declare-fun res!206135 () Bool)

(declare-fun e!170706 () Bool)

(assert (=> b!246410 (=> res!206135 e!170706)))

(declare-datatypes ((tuple2!21140 0))(
  ( (tuple2!21141 (_1!11492 BitStream!10708) (_2!11492 BitStream!10708)) )
))
(declare-fun lt!384393 () tuple2!21140)

(declare-fun lt!384401 () tuple2!21140)

(declare-fun withMovedBitIndex!0 (BitStream!10708 (_ BitVec 64)) BitStream!10708)

(assert (=> b!246410 (= res!206135 (not (= (_1!11492 lt!384393) (withMovedBitIndex!0 (_1!11492 lt!384401) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246411 () Bool)

(declare-fun e!170716 () Bool)

(assert (=> b!246411 (= e!170716 true)))

(declare-fun lt!384395 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246411 (= lt!384395 (bitIndex!0 (size!5893 (buf!6374 (_2!11491 lt!384404))) (currentByte!11770 (_2!11491 lt!384404)) (currentBit!11765 (_2!11491 lt!384404))))))

(declare-fun lt!384394 () (_ BitVec 64))

(assert (=> b!246411 (= lt!384394 (bitIndex!0 (size!5893 (buf!6374 thiss!1005)) (currentByte!11770 thiss!1005) (currentBit!11765 thiss!1005)))))

(declare-fun b!246412 () Bool)

(declare-fun e!170715 () Bool)

(assert (=> b!246412 (= e!170715 (not e!170706))))

(declare-fun res!206128 () Bool)

(assert (=> b!246412 (=> res!206128 e!170706)))

(declare-datatypes ((tuple2!21142 0))(
  ( (tuple2!21143 (_1!11493 BitStream!10708) (_2!11493 Bool)) )
))
(declare-fun lt!384411 () tuple2!21142)

(assert (=> b!246412 (= res!206128 (not (= (_1!11493 lt!384411) (_2!11492 lt!384393))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10708 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21142)

(assert (=> b!246412 (= lt!384411 (checkBitsLoopPure!0 (_1!11492 lt!384393) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384412 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246412 (validate_offset_bits!1 ((_ sign_extend 32) (size!5893 (buf!6374 (_2!11491 lt!384404)))) ((_ sign_extend 32) (currentByte!11770 (_2!11491 lt!384397))) ((_ sign_extend 32) (currentBit!11765 (_2!11491 lt!384397))) lt!384412)))

(declare-fun lt!384407 () Unit!17898)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10708 array!13442 (_ BitVec 64)) Unit!17898)

(assert (=> b!246412 (= lt!384407 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11491 lt!384397) (buf!6374 (_2!11491 lt!384404)) lt!384412))))

(declare-fun lt!384398 () tuple2!21142)

(assert (=> b!246412 (= lt!384398 (checkBitsLoopPure!0 (_1!11492 lt!384401) nBits!297 bit!26 from!289))))

(assert (=> b!246412 (validate_offset_bits!1 ((_ sign_extend 32) (size!5893 (buf!6374 (_2!11491 lt!384404)))) ((_ sign_extend 32) (currentByte!11770 thiss!1005)) ((_ sign_extend 32) (currentBit!11765 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384413 () Unit!17898)

(assert (=> b!246412 (= lt!384413 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6374 (_2!11491 lt!384404)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10708) tuple2!21142)

(assert (=> b!246412 (= (_2!11493 (readBitPure!0 (_1!11492 lt!384401))) bit!26)))

(declare-fun reader!0 (BitStream!10708 BitStream!10708) tuple2!21140)

(assert (=> b!246412 (= lt!384393 (reader!0 (_2!11491 lt!384397) (_2!11491 lt!384404)))))

(assert (=> b!246412 (= lt!384401 (reader!0 thiss!1005 (_2!11491 lt!384404)))))

(declare-fun e!170707 () Bool)

(assert (=> b!246412 e!170707))

(declare-fun res!206129 () Bool)

(assert (=> b!246412 (=> (not res!206129) (not e!170707))))

(declare-fun lt!384408 () tuple2!21142)

(declare-fun lt!384405 () tuple2!21142)

(assert (=> b!246412 (= res!206129 (= (bitIndex!0 (size!5893 (buf!6374 (_1!11493 lt!384408))) (currentByte!11770 (_1!11493 lt!384408)) (currentBit!11765 (_1!11493 lt!384408))) (bitIndex!0 (size!5893 (buf!6374 (_1!11493 lt!384405))) (currentByte!11770 (_1!11493 lt!384405)) (currentBit!11765 (_1!11493 lt!384405)))))))

(declare-fun lt!384400 () Unit!17898)

(declare-fun lt!384414 () BitStream!10708)

(declare-fun readBitPrefixLemma!0 (BitStream!10708 BitStream!10708) Unit!17898)

(assert (=> b!246412 (= lt!384400 (readBitPrefixLemma!0 lt!384414 (_2!11491 lt!384404)))))

(assert (=> b!246412 (= lt!384405 (readBitPure!0 (BitStream!10709 (buf!6374 (_2!11491 lt!384404)) (currentByte!11770 thiss!1005) (currentBit!11765 thiss!1005))))))

(assert (=> b!246412 (= lt!384408 (readBitPure!0 lt!384414))))

(assert (=> b!246412 (= lt!384414 (BitStream!10709 (buf!6374 (_2!11491 lt!384397)) (currentByte!11770 thiss!1005) (currentBit!11765 thiss!1005)))))

(assert (=> b!246412 e!170709))

(declare-fun res!206134 () Bool)

(assert (=> b!246412 (=> (not res!206134) (not e!170709))))

(assert (=> b!246412 (= res!206134 (isPrefixOf!0 thiss!1005 (_2!11491 lt!384404)))))

(declare-fun lt!384399 () Unit!17898)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10708 BitStream!10708 BitStream!10708) Unit!17898)

(assert (=> b!246412 (= lt!384399 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11491 lt!384397) (_2!11491 lt!384404)))))

(declare-fun e!170711 () Bool)

(assert (=> b!246412 e!170711))

(declare-fun res!206132 () Bool)

(assert (=> b!246412 (=> (not res!206132) (not e!170711))))

(assert (=> b!246412 (= res!206132 (= (size!5893 (buf!6374 (_2!11491 lt!384397))) (size!5893 (buf!6374 (_2!11491 lt!384404)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10708 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21138)

(assert (=> b!246412 (= lt!384404 (appendNBitsLoop!0 (_2!11491 lt!384397) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246412 (validate_offset_bits!1 ((_ sign_extend 32) (size!5893 (buf!6374 (_2!11491 lt!384397)))) ((_ sign_extend 32) (currentByte!11770 (_2!11491 lt!384397))) ((_ sign_extend 32) (currentBit!11765 (_2!11491 lt!384397))) lt!384412)))

(assert (=> b!246412 (= lt!384412 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384406 () Unit!17898)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10708 BitStream!10708 (_ BitVec 64) (_ BitVec 64)) Unit!17898)

(assert (=> b!246412 (= lt!384406 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11491 lt!384397) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170708 () Bool)

(assert (=> b!246412 e!170708))

(declare-fun res!206137 () Bool)

(assert (=> b!246412 (=> (not res!206137) (not e!170708))))

(assert (=> b!246412 (= res!206137 (= (size!5893 (buf!6374 thiss!1005)) (size!5893 (buf!6374 (_2!11491 lt!384397)))))))

(declare-fun appendBit!0 (BitStream!10708 Bool) tuple2!21138)

(assert (=> b!246412 (= lt!384397 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246413 () Bool)

(assert (=> b!246413 (= e!170708 e!170712)))

(declare-fun res!206130 () Bool)

(assert (=> b!246413 (=> (not res!206130) (not e!170712))))

(declare-fun lt!384391 () (_ BitVec 64))

(declare-fun lt!384402 () (_ BitVec 64))

(assert (=> b!246413 (= res!206130 (= lt!384391 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384402)))))

(assert (=> b!246413 (= lt!384391 (bitIndex!0 (size!5893 (buf!6374 (_2!11491 lt!384397))) (currentByte!11770 (_2!11491 lt!384397)) (currentBit!11765 (_2!11491 lt!384397))))))

(assert (=> b!246413 (= lt!384402 (bitIndex!0 (size!5893 (buf!6374 thiss!1005)) (currentByte!11770 thiss!1005) (currentBit!11765 thiss!1005)))))

(declare-fun b!246414 () Bool)

(assert (=> b!246414 (= e!170706 e!170716)))

(declare-fun res!206133 () Bool)

(assert (=> b!246414 (=> res!206133 e!170716)))

(assert (=> b!246414 (= res!206133 (not (= (size!5893 (buf!6374 thiss!1005)) (size!5893 (buf!6374 (_2!11491 lt!384404))))))))

(assert (=> b!246414 (and (= (_2!11493 lt!384398) (_2!11493 lt!384411)) (= (_1!11493 lt!384398) (_2!11492 lt!384401)))))

(declare-fun b!246415 () Bool)

(declare-fun e!170710 () Bool)

(declare-fun lt!384392 () tuple2!21142)

(assert (=> b!246415 (= e!170710 (= (bitIndex!0 (size!5893 (buf!6374 (_1!11493 lt!384392))) (currentByte!11770 (_1!11493 lt!384392)) (currentBit!11765 (_1!11493 lt!384392))) lt!384391))))

(declare-fun b!246416 () Bool)

(declare-fun lt!384403 () tuple2!21142)

(declare-fun lt!384410 () tuple2!21140)

(assert (=> b!246416 (= e!170714 (not (or (not (_2!11493 lt!384403)) (not (= (_1!11493 lt!384403) (_2!11492 lt!384410))))))))

(assert (=> b!246416 (= lt!384403 (checkBitsLoopPure!0 (_1!11492 lt!384410) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384396 () (_ BitVec 64))

(assert (=> b!246416 (validate_offset_bits!1 ((_ sign_extend 32) (size!5893 (buf!6374 (_2!11491 lt!384404)))) ((_ sign_extend 32) (currentByte!11770 (_2!11491 lt!384397))) ((_ sign_extend 32) (currentBit!11765 (_2!11491 lt!384397))) lt!384396)))

(declare-fun lt!384409 () Unit!17898)

(assert (=> b!246416 (= lt!384409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11491 lt!384397) (buf!6374 (_2!11491 lt!384404)) lt!384396))))

(assert (=> b!246416 (= lt!384410 (reader!0 (_2!11491 lt!384397) (_2!11491 lt!384404)))))

(declare-fun res!206138 () Bool)

(assert (=> start!53114 (=> (not res!206138) (not e!170715))))

(assert (=> start!53114 (= res!206138 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53114 e!170715))

(assert (=> start!53114 true))

(declare-fun e!170717 () Bool)

(declare-fun inv!12 (BitStream!10708) Bool)

(assert (=> start!53114 (and (inv!12 thiss!1005) e!170717)))

(declare-fun b!246417 () Bool)

(declare-fun res!206124 () Bool)

(assert (=> b!246417 (=> (not res!206124) (not e!170715))))

(assert (=> b!246417 (= res!206124 (bvslt from!289 nBits!297))))

(declare-fun b!246418 () Bool)

(assert (=> b!246418 (= e!170712 e!170710)))

(declare-fun res!206127 () Bool)

(assert (=> b!246418 (=> (not res!206127) (not e!170710))))

(assert (=> b!246418 (= res!206127 (and (= (_2!11493 lt!384392) bit!26) (= (_1!11493 lt!384392) (_2!11491 lt!384397))))))

(declare-fun readerFrom!0 (BitStream!10708 (_ BitVec 32) (_ BitVec 32)) BitStream!10708)

(assert (=> b!246418 (= lt!384392 (readBitPure!0 (readerFrom!0 (_2!11491 lt!384397) (currentBit!11765 thiss!1005) (currentByte!11770 thiss!1005))))))

(declare-fun b!246419 () Bool)

(assert (=> b!246419 (= e!170707 (= (_2!11493 lt!384408) (_2!11493 lt!384405)))))

(declare-fun b!246420 () Bool)

(assert (=> b!246420 (= e!170711 e!170714)))

(declare-fun res!206136 () Bool)

(assert (=> b!246420 (=> (not res!206136) (not e!170714))))

(assert (=> b!246420 (= res!206136 (= (bitIndex!0 (size!5893 (buf!6374 (_2!11491 lt!384404))) (currentByte!11770 (_2!11491 lt!384404)) (currentBit!11765 (_2!11491 lt!384404))) (bvadd (bitIndex!0 (size!5893 (buf!6374 (_2!11491 lt!384397))) (currentByte!11770 (_2!11491 lt!384397)) (currentBit!11765 (_2!11491 lt!384397))) lt!384396)))))

(assert (=> b!246420 (= lt!384396 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246421 () Bool)

(declare-fun array_inv!5634 (array!13442) Bool)

(assert (=> b!246421 (= e!170717 (array_inv!5634 (buf!6374 thiss!1005)))))

(declare-fun b!246422 () Bool)

(declare-fun res!206131 () Bool)

(assert (=> b!246422 (=> (not res!206131) (not e!170715))))

(assert (=> b!246422 (= res!206131 (validate_offset_bits!1 ((_ sign_extend 32) (size!5893 (buf!6374 thiss!1005))) ((_ sign_extend 32) (currentByte!11770 thiss!1005)) ((_ sign_extend 32) (currentBit!11765 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53114 res!206138) b!246422))

(assert (= (and b!246422 res!206131) b!246417))

(assert (= (and b!246417 res!206124) b!246412))

(assert (= (and b!246412 res!206137) b!246413))

(assert (= (and b!246413 res!206130) b!246406))

(assert (= (and b!246406 res!206125) b!246418))

(assert (= (and b!246418 res!206127) b!246415))

(assert (= (and b!246412 res!206132) b!246420))

(assert (= (and b!246420 res!206136) b!246409))

(assert (= (and b!246409 res!206126) b!246416))

(assert (= (and b!246412 res!206134) b!246408))

(assert (= (and b!246408 res!206139) b!246407))

(assert (= (and b!246412 res!206129) b!246419))

(assert (= (and b!246412 (not res!206128)) b!246410))

(assert (= (and b!246410 (not res!206135)) b!246414))

(assert (= (and b!246414 (not res!206133)) b!246411))

(assert (= start!53114 b!246421))

(declare-fun m!371627 () Bool)

(assert (=> b!246421 m!371627))

(declare-fun m!371629 () Bool)

(assert (=> b!246422 m!371629))

(declare-fun m!371631 () Bool)

(assert (=> b!246416 m!371631))

(declare-fun m!371633 () Bool)

(assert (=> b!246416 m!371633))

(declare-fun m!371635 () Bool)

(assert (=> b!246416 m!371635))

(declare-fun m!371637 () Bool)

(assert (=> b!246416 m!371637))

(declare-fun m!371639 () Bool)

(assert (=> b!246412 m!371639))

(declare-fun m!371641 () Bool)

(assert (=> b!246412 m!371641))

(declare-fun m!371643 () Bool)

(assert (=> b!246412 m!371643))

(declare-fun m!371645 () Bool)

(assert (=> b!246412 m!371645))

(declare-fun m!371647 () Bool)

(assert (=> b!246412 m!371647))

(declare-fun m!371649 () Bool)

(assert (=> b!246412 m!371649))

(declare-fun m!371651 () Bool)

(assert (=> b!246412 m!371651))

(declare-fun m!371653 () Bool)

(assert (=> b!246412 m!371653))

(declare-fun m!371655 () Bool)

(assert (=> b!246412 m!371655))

(declare-fun m!371657 () Bool)

(assert (=> b!246412 m!371657))

(declare-fun m!371659 () Bool)

(assert (=> b!246412 m!371659))

(declare-fun m!371661 () Bool)

(assert (=> b!246412 m!371661))

(declare-fun m!371663 () Bool)

(assert (=> b!246412 m!371663))

(declare-fun m!371665 () Bool)

(assert (=> b!246412 m!371665))

(declare-fun m!371667 () Bool)

(assert (=> b!246412 m!371667))

(declare-fun m!371669 () Bool)

(assert (=> b!246412 m!371669))

(declare-fun m!371671 () Bool)

(assert (=> b!246412 m!371671))

(declare-fun m!371673 () Bool)

(assert (=> b!246412 m!371673))

(declare-fun m!371675 () Bool)

(assert (=> b!246412 m!371675))

(assert (=> b!246412 m!371637))

(declare-fun m!371677 () Bool)

(assert (=> b!246418 m!371677))

(assert (=> b!246418 m!371677))

(declare-fun m!371679 () Bool)

(assert (=> b!246418 m!371679))

(declare-fun m!371681 () Bool)

(assert (=> b!246406 m!371681))

(declare-fun m!371683 () Bool)

(assert (=> start!53114 m!371683))

(declare-fun m!371685 () Bool)

(assert (=> b!246411 m!371685))

(declare-fun m!371687 () Bool)

(assert (=> b!246411 m!371687))

(declare-fun m!371689 () Bool)

(assert (=> b!246408 m!371689))

(declare-fun m!371691 () Bool)

(assert (=> b!246410 m!371691))

(declare-fun m!371693 () Bool)

(assert (=> b!246415 m!371693))

(assert (=> b!246420 m!371685))

(declare-fun m!371695 () Bool)

(assert (=> b!246420 m!371695))

(declare-fun m!371697 () Bool)

(assert (=> b!246409 m!371697))

(assert (=> b!246413 m!371695))

(assert (=> b!246413 m!371687))

(declare-fun m!371699 () Bool)

(assert (=> b!246407 m!371699))

(push 1)

(assert (not b!246412))

(assert (not b!246418))

(assert (not b!246413))

(assert (not b!246407))

