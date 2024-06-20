; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27810 () Bool)

(assert start!27810)

(declare-fun b!143626 () Bool)

(declare-fun res!119979 () Bool)

(declare-fun e!95684 () Bool)

(assert (=> b!143626 (=> (not res!119979) (not e!95684))))

(declare-datatypes ((array!6567 0))(
  ( (array!6568 (arr!3696 (Array (_ BitVec 32) (_ BitVec 8))) (size!2973 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5204 0))(
  ( (BitStream!5205 (buf!3402 array!6567) (currentByte!6286 (_ BitVec 32)) (currentBit!6281 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5204)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143626 (= res!119979 (invariant!0 (currentBit!6281 thiss!1634) (currentByte!6286 thiss!1634) (size!2973 (buf!3402 thiss!1634))))))

(declare-fun b!143627 () Bool)

(declare-fun e!95686 () Bool)

(declare-datatypes ((tuple2!12816 0))(
  ( (tuple2!12817 (_1!6749 BitStream!5204) (_2!6749 (_ BitVec 8))) )
))
(declare-fun lt!222543 () tuple2!12816)

(declare-fun lt!222542 () tuple2!12816)

(assert (=> b!143627 (= e!95686 (= (_2!6749 lt!222543) (_2!6749 lt!222542)))))

(declare-datatypes ((tuple2!12818 0))(
  ( (tuple2!12819 (_1!6750 BitStream!5204) (_2!6750 array!6567)) )
))
(declare-fun lt!222552 () tuple2!12818)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!95685 () Bool)

(declare-fun arr!237 () array!6567)

(declare-fun b!143628 () Bool)

(declare-fun arrayRangesEq!289 (array!6567 array!6567 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143628 (= e!95685 (not (arrayRangesEq!289 arr!237 (_2!6750 lt!222552) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143629 () Bool)

(declare-fun e!95691 () Bool)

(assert (=> b!143629 (= e!95691 (not e!95685))))

(declare-fun res!119983 () Bool)

(assert (=> b!143629 (=> res!119983 e!95685)))

(declare-datatypes ((tuple2!12820 0))(
  ( (tuple2!12821 (_1!6751 BitStream!5204) (_2!6751 BitStream!5204)) )
))
(declare-fun lt!222541 () tuple2!12820)

(assert (=> b!143629 (= res!119983 (or (not (= (size!2973 (_2!6750 lt!222552)) (size!2973 arr!237))) (not (= (_1!6750 lt!222552) (_2!6751 lt!222541)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5204 array!6567 (_ BitVec 32) (_ BitVec 32)) tuple2!12818)

(assert (=> b!143629 (= lt!222552 (readByteArrayLoopPure!0 (_1!6751 lt!222541) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8946 0))(
  ( (Unit!8947) )
))
(declare-datatypes ((tuple2!12822 0))(
  ( (tuple2!12823 (_1!6752 Unit!8946) (_2!6752 BitStream!5204)) )
))
(declare-fun lt!222545 () tuple2!12822)

(declare-fun lt!222539 () tuple2!12822)

(declare-fun lt!222540 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143629 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222540)))

(declare-fun lt!222549 () Unit!8946)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5204 array!6567 (_ BitVec 64)) Unit!8946)

(assert (=> b!143629 (= lt!222549 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222545)) lt!222540))))

(declare-fun reader!0 (BitStream!5204 BitStream!5204) tuple2!12820)

(assert (=> b!143629 (= lt!222541 (reader!0 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(declare-fun b!143630 () Bool)

(declare-fun res!119974 () Bool)

(assert (=> b!143630 (=> (not res!119974) (not e!95684))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143630 (= res!119974 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143631 () Bool)

(declare-fun e!95690 () Bool)

(declare-fun lt!222550 () tuple2!12816)

(declare-fun lt!222548 () tuple2!12820)

(assert (=> b!143631 (= e!95690 (and (= (_2!6749 lt!222550) (select (arr!3696 arr!237) from!447)) (= (_1!6749 lt!222550) (_2!6751 lt!222548))))))

(declare-fun readBytePure!0 (BitStream!5204) tuple2!12816)

(assert (=> b!143631 (= lt!222550 (readBytePure!0 (_1!6751 lt!222548)))))

(assert (=> b!143631 (= lt!222548 (reader!0 thiss!1634 (_2!6752 lt!222539)))))

(declare-fun b!143632 () Bool)

(declare-fun res!119972 () Bool)

(assert (=> b!143632 (=> (not res!119972) (not e!95690))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143632 (= res!119972 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))))

(declare-fun b!143633 () Bool)

(declare-fun e!95687 () Bool)

(assert (=> b!143633 (= e!95687 e!95691)))

(declare-fun res!119975 () Bool)

(assert (=> b!143633 (=> (not res!119975) (not e!95691))))

(assert (=> b!143633 (= res!119975 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545))) (bvadd (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222540))))))

(assert (=> b!143633 (= lt!222540 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143634 () Bool)

(declare-fun lt!222553 () tuple2!12820)

(assert (=> b!143634 (= e!95684 (not (= (_1!6750 (readByteArrayLoopPure!0 (_1!6751 lt!222553) arr!237 from!447 to!404)) (_2!6751 lt!222553))))))

(assert (=> b!143634 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!222547 () Unit!8946)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5204 array!6567 (_ BitVec 32)) Unit!8946)

(assert (=> b!143634 (= lt!222547 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3402 (_2!6752 lt!222545)) (bvsub to!404 from!447)))))

(assert (=> b!143634 (= (_2!6749 (readBytePure!0 (_1!6751 lt!222553))) (select (arr!3696 arr!237) from!447))))

(declare-fun lt!222551 () tuple2!12820)

(assert (=> b!143634 (= lt!222551 (reader!0 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(assert (=> b!143634 (= lt!222553 (reader!0 thiss!1634 (_2!6752 lt!222545)))))

(assert (=> b!143634 e!95686))

(declare-fun res!119976 () Bool)

(assert (=> b!143634 (=> (not res!119976) (not e!95686))))

(assert (=> b!143634 (= res!119976 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222543))) (currentByte!6286 (_1!6749 lt!222543)) (currentBit!6281 (_1!6749 lt!222543))) (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222542))) (currentByte!6286 (_1!6749 lt!222542)) (currentBit!6281 (_1!6749 lt!222542)))))))

(declare-fun lt!222537 () Unit!8946)

(declare-fun lt!222538 () BitStream!5204)

(declare-fun readBytePrefixLemma!0 (BitStream!5204 BitStream!5204) Unit!8946)

(assert (=> b!143634 (= lt!222537 (readBytePrefixLemma!0 lt!222538 (_2!6752 lt!222545)))))

(assert (=> b!143634 (= lt!222542 (readBytePure!0 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (=> b!143634 (= lt!222543 (readBytePure!0 lt!222538))))

(assert (=> b!143634 (= lt!222538 (BitStream!5205 (buf!3402 (_2!6752 lt!222539)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(declare-fun e!95682 () Bool)

(assert (=> b!143634 e!95682))

(declare-fun res!119984 () Bool)

(assert (=> b!143634 (=> (not res!119984) (not e!95682))))

(declare-fun isPrefixOf!0 (BitStream!5204 BitStream!5204) Bool)

(assert (=> b!143634 (= res!119984 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222545)))))

(declare-fun lt!222544 () Unit!8946)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5204 BitStream!5204 BitStream!5204) Unit!8946)

(assert (=> b!143634 (= lt!222544 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(assert (=> b!143634 e!95687))

(declare-fun res!119973 () Bool)

(assert (=> b!143634 (=> (not res!119973) (not e!95687))))

(assert (=> b!143634 (= res!119973 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5204 array!6567 (_ BitVec 32) (_ BitVec 32)) tuple2!12822)

(assert (=> b!143634 (= lt!222545 (appendByteArrayLoop!0 (_2!6752 lt!222539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143634 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222546 () Unit!8946)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5204 BitStream!5204 (_ BitVec 64) (_ BitVec 32)) Unit!8946)

(assert (=> b!143634 (= lt!222546 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6752 lt!222539) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143634 e!95690))

(declare-fun res!119980 () Bool)

(assert (=> b!143634 (=> (not res!119980) (not e!95690))))

(assert (=> b!143634 (= res!119980 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(declare-fun appendByte!0 (BitStream!5204 (_ BitVec 8)) tuple2!12822)

(assert (=> b!143634 (= lt!222539 (appendByte!0 thiss!1634 (select (arr!3696 arr!237) from!447)))))

(declare-fun res!119978 () Bool)

(assert (=> start!27810 (=> (not res!119978) (not e!95684))))

(assert (=> start!27810 (= res!119978 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2973 arr!237))))))

(assert (=> start!27810 e!95684))

(assert (=> start!27810 true))

(declare-fun array_inv!2762 (array!6567) Bool)

(assert (=> start!27810 (array_inv!2762 arr!237)))

(declare-fun e!95689 () Bool)

(declare-fun inv!12 (BitStream!5204) Bool)

(assert (=> start!27810 (and (inv!12 thiss!1634) e!95689)))

(declare-fun b!143635 () Bool)

(declare-fun res!119977 () Bool)

(assert (=> b!143635 (=> (not res!119977) (not e!95684))))

(assert (=> b!143635 (= res!119977 (bvslt from!447 to!404))))

(declare-fun b!143636 () Bool)

(assert (=> b!143636 (= e!95689 (array_inv!2762 (buf!3402 thiss!1634)))))

(declare-fun b!143637 () Bool)

(declare-fun res!119982 () Bool)

(assert (=> b!143637 (=> (not res!119982) (not e!95690))))

(assert (=> b!143637 (= res!119982 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222539)))))

(declare-fun b!143638 () Bool)

(declare-fun res!119981 () Bool)

(assert (=> b!143638 (=> (not res!119981) (not e!95691))))

(assert (=> b!143638 (= res!119981 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(declare-fun b!143639 () Bool)

(assert (=> b!143639 (= e!95682 (invariant!0 (currentBit!6281 thiss!1634) (currentByte!6286 thiss!1634) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (= (and start!27810 res!119978) b!143630))

(assert (= (and b!143630 res!119974) b!143635))

(assert (= (and b!143635 res!119977) b!143626))

(assert (= (and b!143626 res!119979) b!143634))

(assert (= (and b!143634 res!119980) b!143632))

(assert (= (and b!143632 res!119972) b!143637))

(assert (= (and b!143637 res!119982) b!143631))

(assert (= (and b!143634 res!119973) b!143633))

(assert (= (and b!143633 res!119975) b!143638))

(assert (= (and b!143638 res!119981) b!143629))

(assert (= (and b!143629 (not res!119983)) b!143628))

(assert (= (and b!143634 res!119984) b!143639))

(assert (= (and b!143634 res!119976) b!143627))

(assert (= start!27810 b!143636))

(declare-fun m!220521 () Bool)

(assert (=> b!143634 m!220521))

(declare-fun m!220523 () Bool)

(assert (=> b!143634 m!220523))

(declare-fun m!220525 () Bool)

(assert (=> b!143634 m!220525))

(declare-fun m!220527 () Bool)

(assert (=> b!143634 m!220527))

(declare-fun m!220529 () Bool)

(assert (=> b!143634 m!220529))

(declare-fun m!220531 () Bool)

(assert (=> b!143634 m!220531))

(declare-fun m!220533 () Bool)

(assert (=> b!143634 m!220533))

(declare-fun m!220535 () Bool)

(assert (=> b!143634 m!220535))

(declare-fun m!220537 () Bool)

(assert (=> b!143634 m!220537))

(declare-fun m!220539 () Bool)

(assert (=> b!143634 m!220539))

(declare-fun m!220541 () Bool)

(assert (=> b!143634 m!220541))

(declare-fun m!220543 () Bool)

(assert (=> b!143634 m!220543))

(declare-fun m!220545 () Bool)

(assert (=> b!143634 m!220545))

(declare-fun m!220547 () Bool)

(assert (=> b!143634 m!220547))

(declare-fun m!220549 () Bool)

(assert (=> b!143634 m!220549))

(declare-fun m!220551 () Bool)

(assert (=> b!143634 m!220551))

(assert (=> b!143634 m!220539))

(declare-fun m!220553 () Bool)

(assert (=> b!143634 m!220553))

(declare-fun m!220555 () Bool)

(assert (=> b!143634 m!220555))

(assert (=> b!143631 m!220539))

(declare-fun m!220557 () Bool)

(assert (=> b!143631 m!220557))

(declare-fun m!220559 () Bool)

(assert (=> b!143631 m!220559))

(declare-fun m!220561 () Bool)

(assert (=> b!143632 m!220561))

(declare-fun m!220563 () Bool)

(assert (=> b!143632 m!220563))

(declare-fun m!220565 () Bool)

(assert (=> start!27810 m!220565))

(declare-fun m!220567 () Bool)

(assert (=> start!27810 m!220567))

(declare-fun m!220569 () Bool)

(assert (=> b!143626 m!220569))

(declare-fun m!220571 () Bool)

(assert (=> b!143637 m!220571))

(declare-fun m!220573 () Bool)

(assert (=> b!143628 m!220573))

(declare-fun m!220575 () Bool)

(assert (=> b!143638 m!220575))

(declare-fun m!220577 () Bool)

(assert (=> b!143633 m!220577))

(assert (=> b!143633 m!220561))

(declare-fun m!220579 () Bool)

(assert (=> b!143629 m!220579))

(declare-fun m!220581 () Bool)

(assert (=> b!143629 m!220581))

(declare-fun m!220583 () Bool)

(assert (=> b!143629 m!220583))

(assert (=> b!143629 m!220555))

(declare-fun m!220585 () Bool)

(assert (=> b!143630 m!220585))

(declare-fun m!220587 () Bool)

(assert (=> b!143639 m!220587))

(declare-fun m!220589 () Bool)

(assert (=> b!143636 m!220589))

(push 1)

(assert (not b!143632))

(assert (not b!143636))

(assert (not b!143628))

(assert (not b!143633))

(assert (not b!143630))

(assert (not b!143631))

(assert (not b!143629))

(assert (not b!143637))

(assert (not b!143639))

(assert (not b!143638))

(assert (not b!143634))

(assert (not b!143626))

(assert (not start!27810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45848 () Bool)

(declare-datatypes ((tuple2!12824 0))(
  ( (tuple2!12825 (_1!6753 (_ BitVec 8)) (_2!6753 BitStream!5204)) )
))
(declare-fun lt!222556 () tuple2!12824)

(declare-fun readByte!0 (BitStream!5204) tuple2!12824)

(assert (=> d!45848 (= lt!222556 (readByte!0 (_1!6751 lt!222548)))))

(assert (=> d!45848 (= (readBytePure!0 (_1!6751 lt!222548)) (tuple2!12817 (_2!6753 lt!222556) (_1!6753 lt!222556)))))

(declare-fun bs!11259 () Bool)

(assert (= bs!11259 d!45848))

(declare-fun m!220591 () Bool)

(assert (=> bs!11259 m!220591))

(assert (=> b!143631 d!45848))

(declare-fun b!143650 () Bool)

(declare-fun res!119991 () Bool)

(declare-fun e!95697 () Bool)

(assert (=> b!143650 (=> (not res!119991) (not e!95697))))

(declare-fun lt!222616 () tuple2!12820)

(assert (=> b!143650 (= res!119991 (isPrefixOf!0 (_2!6751 lt!222616) (_2!6752 lt!222539)))))

(declare-fun b!143651 () Bool)

(declare-fun res!119993 () Bool)

(assert (=> b!143651 (=> (not res!119993) (not e!95697))))

(assert (=> b!143651 (= res!119993 (isPrefixOf!0 (_1!6751 lt!222616) thiss!1634))))

(declare-fun b!143652 () Bool)

(declare-fun e!95696 () Unit!8946)

(declare-fun lt!222615 () Unit!8946)

(assert (=> b!143652 (= e!95696 lt!222615)))

(declare-fun lt!222599 () (_ BitVec 64))

(assert (=> b!143652 (= lt!222599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!222600 () (_ BitVec 64))

(assert (=> b!143652 (= lt!222600 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6567 array!6567 (_ BitVec 64) (_ BitVec 64)) Unit!8946)

(assert (=> b!143652 (= lt!222615 (arrayBitRangesEqSymmetric!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222539)) lt!222599 lt!222600))))

(declare-fun arrayBitRangesEq!0 (array!6567 array!6567 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143652 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 thiss!1634) lt!222599 lt!222600)))

(declare-fun lt!222611 () (_ BitVec 64))

(declare-fun b!143653 () Bool)

(declare-fun lt!222609 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5204 (_ BitVec 64)) BitStream!5204)

(assert (=> b!143653 (= e!95697 (= (_1!6751 lt!222616) (withMovedBitIndex!0 (_2!6751 lt!222616) (bvsub lt!222609 lt!222611))))))

(assert (=> b!143653 (or (= (bvand lt!222609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222609 lt!222611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143653 (= lt!222611 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(assert (=> b!143653 (= lt!222609 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(declare-fun d!45850 () Bool)

(assert (=> d!45850 e!95697))

(declare-fun res!119992 () Bool)

(assert (=> d!45850 (=> (not res!119992) (not e!95697))))

(assert (=> d!45850 (= res!119992 (isPrefixOf!0 (_1!6751 lt!222616) (_2!6751 lt!222616)))))

(declare-fun lt!222614 () BitStream!5204)

(assert (=> d!45850 (= lt!222616 (tuple2!12821 lt!222614 (_2!6752 lt!222539)))))

(declare-fun lt!222613 () Unit!8946)

(declare-fun lt!222602 () Unit!8946)

(assert (=> d!45850 (= lt!222613 lt!222602)))

(assert (=> d!45850 (isPrefixOf!0 lt!222614 (_2!6752 lt!222539))))

(assert (=> d!45850 (= lt!222602 (lemmaIsPrefixTransitive!0 lt!222614 (_2!6752 lt!222539) (_2!6752 lt!222539)))))

(declare-fun lt!222610 () Unit!8946)

(declare-fun lt!222605 () Unit!8946)

(assert (=> d!45850 (= lt!222610 lt!222605)))

(assert (=> d!45850 (isPrefixOf!0 lt!222614 (_2!6752 lt!222539))))

(assert (=> d!45850 (= lt!222605 (lemmaIsPrefixTransitive!0 lt!222614 thiss!1634 (_2!6752 lt!222539)))))

(declare-fun lt!222604 () Unit!8946)

(assert (=> d!45850 (= lt!222604 e!95696)))

(declare-fun c!7845 () Bool)

(assert (=> d!45850 (= c!7845 (not (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!222601 () Unit!8946)

(declare-fun lt!222597 () Unit!8946)

(assert (=> d!45850 (= lt!222601 lt!222597)))

(assert (=> d!45850 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222539))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5204) Unit!8946)

(assert (=> d!45850 (= lt!222597 (lemmaIsPrefixRefl!0 (_2!6752 lt!222539)))))

(declare-fun lt!222603 () Unit!8946)

(declare-fun lt!222607 () Unit!8946)

(assert (=> d!45850 (= lt!222603 lt!222607)))

(assert (=> d!45850 (= lt!222607 (lemmaIsPrefixRefl!0 (_2!6752 lt!222539)))))

(declare-fun lt!222598 () Unit!8946)

(declare-fun lt!222606 () Unit!8946)

(assert (=> d!45850 (= lt!222598 lt!222606)))

(assert (=> d!45850 (isPrefixOf!0 lt!222614 lt!222614)))

(assert (=> d!45850 (= lt!222606 (lemmaIsPrefixRefl!0 lt!222614))))

(declare-fun lt!222608 () Unit!8946)

(declare-fun lt!222612 () Unit!8946)

(assert (=> d!45850 (= lt!222608 lt!222612)))

(assert (=> d!45850 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45850 (= lt!222612 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45850 (= lt!222614 (BitStream!5205 (buf!3402 (_2!6752 lt!222539)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(assert (=> d!45850 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222539))))

(assert (=> d!45850 (= (reader!0 thiss!1634 (_2!6752 lt!222539)) lt!222616)))

(declare-fun b!143654 () Bool)

(declare-fun Unit!8948 () Unit!8946)

(assert (=> b!143654 (= e!95696 Unit!8948)))

(assert (= (and d!45850 c!7845) b!143652))

(assert (= (and d!45850 (not c!7845)) b!143654))

(assert (= (and d!45850 res!119992) b!143651))

(assert (= (and b!143651 res!119993) b!143650))

(assert (= (and b!143650 res!119991) b!143653))

(declare-fun m!220593 () Bool)

(assert (=> b!143650 m!220593))

(declare-fun m!220595 () Bool)

(assert (=> b!143653 m!220595))

(assert (=> b!143653 m!220561))

(assert (=> b!143653 m!220563))

(assert (=> b!143652 m!220563))

(declare-fun m!220597 () Bool)

(assert (=> b!143652 m!220597))

(declare-fun m!220599 () Bool)

(assert (=> b!143652 m!220599))

(assert (=> d!45850 m!220571))

(declare-fun m!220601 () Bool)

(assert (=> d!45850 m!220601))

(declare-fun m!220603 () Bool)

(assert (=> d!45850 m!220603))

(declare-fun m!220605 () Bool)

(assert (=> d!45850 m!220605))

(declare-fun m!220607 () Bool)

(assert (=> d!45850 m!220607))

(declare-fun m!220609 () Bool)

(assert (=> d!45850 m!220609))

(declare-fun m!220611 () Bool)

(assert (=> d!45850 m!220611))

(declare-fun m!220613 () Bool)

(assert (=> d!45850 m!220613))

(declare-fun m!220615 () Bool)

(assert (=> d!45850 m!220615))

(declare-fun m!220617 () Bool)

(assert (=> d!45850 m!220617))

(declare-fun m!220619 () Bool)

(assert (=> d!45850 m!220619))

(declare-fun m!220621 () Bool)

(assert (=> b!143651 m!220621))

(assert (=> b!143631 d!45850))

(declare-fun d!45852 () Bool)

(declare-fun e!95700 () Bool)

(assert (=> d!45852 e!95700))

(declare-fun res!119998 () Bool)

(assert (=> d!45852 (=> (not res!119998) (not e!95700))))

(declare-fun lt!222629 () (_ BitVec 64))

(declare-fun lt!222632 () (_ BitVec 64))

(declare-fun lt!222633 () (_ BitVec 64))

(assert (=> d!45852 (= res!119998 (= lt!222632 (bvsub lt!222629 lt!222633)))))

(assert (=> d!45852 (or (= (bvand lt!222629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222629 lt!222633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45852 (= lt!222633 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))))))

(declare-fun lt!222630 () (_ BitVec 64))

(declare-fun lt!222631 () (_ BitVec 64))

(assert (=> d!45852 (= lt!222629 (bvmul lt!222630 lt!222631))))

(assert (=> d!45852 (or (= lt!222630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222631 (bvsdiv (bvmul lt!222630 lt!222631) lt!222630)))))

(assert (=> d!45852 (= lt!222631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45852 (= lt!222630 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (=> d!45852 (= lt!222632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (=> d!45852 (invariant!0 (currentBit!6281 (_2!6752 lt!222539)) (currentByte!6286 (_2!6752 lt!222539)) (size!2973 (buf!3402 (_2!6752 lt!222539))))))

(assert (=> d!45852 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) lt!222632)))

(declare-fun b!143659 () Bool)

(declare-fun res!119999 () Bool)

(assert (=> b!143659 (=> (not res!119999) (not e!95700))))

(assert (=> b!143659 (= res!119999 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222632))))

(declare-fun b!143660 () Bool)

(declare-fun lt!222634 () (_ BitVec 64))

(assert (=> b!143660 (= e!95700 (bvsle lt!222632 (bvmul lt!222634 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143660 (or (= lt!222634 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222634 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222634)))))

(assert (=> b!143660 (= lt!222634 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (= (and d!45852 res!119998) b!143659))

(assert (= (and b!143659 res!119999) b!143660))

(declare-fun m!220623 () Bool)

(assert (=> d!45852 m!220623))

(declare-fun m!220625 () Bool)

(assert (=> d!45852 m!220625))

(assert (=> b!143632 d!45852))

(declare-fun d!45854 () Bool)

(declare-fun e!95701 () Bool)

(assert (=> d!45854 e!95701))

(declare-fun res!120000 () Bool)

(assert (=> d!45854 (=> (not res!120000) (not e!95701))))

(declare-fun lt!222638 () (_ BitVec 64))

(declare-fun lt!222639 () (_ BitVec 64))

(declare-fun lt!222635 () (_ BitVec 64))

(assert (=> d!45854 (= res!120000 (= lt!222638 (bvsub lt!222635 lt!222639)))))

(assert (=> d!45854 (or (= (bvand lt!222635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222635 lt!222639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45854 (= lt!222639 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))))))

(declare-fun lt!222636 () (_ BitVec 64))

(declare-fun lt!222637 () (_ BitVec 64))

(assert (=> d!45854 (= lt!222635 (bvmul lt!222636 lt!222637))))

(assert (=> d!45854 (or (= lt!222636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222637 (bvsdiv (bvmul lt!222636 lt!222637) lt!222636)))))

(assert (=> d!45854 (= lt!222637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45854 (= lt!222636 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))))))

(assert (=> d!45854 (= lt!222638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 thiss!1634))))))

(assert (=> d!45854 (invariant!0 (currentBit!6281 thiss!1634) (currentByte!6286 thiss!1634) (size!2973 (buf!3402 thiss!1634)))))

(assert (=> d!45854 (= (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) lt!222638)))

(declare-fun b!143661 () Bool)

(declare-fun res!120001 () Bool)

(assert (=> b!143661 (=> (not res!120001) (not e!95701))))

(assert (=> b!143661 (= res!120001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222638))))

(declare-fun b!143662 () Bool)

(declare-fun lt!222640 () (_ BitVec 64))

(assert (=> b!143662 (= e!95701 (bvsle lt!222638 (bvmul lt!222640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143662 (or (= lt!222640 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222640 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222640)))))

(assert (=> b!143662 (= lt!222640 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))))))

(assert (= (and d!45854 res!120000) b!143661))

(assert (= (and b!143661 res!120001) b!143662))

(declare-fun m!220627 () Bool)

(assert (=> d!45854 m!220627))

(assert (=> d!45854 m!220569))

(assert (=> b!143632 d!45854))

(declare-fun d!45856 () Bool)

(assert (=> d!45856 (= (invariant!0 (currentBit!6281 thiss!1634) (currentByte!6286 thiss!1634) (size!2973 (buf!3402 (_2!6752 lt!222539)))) (and (bvsge (currentBit!6281 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6281 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6286 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6286 thiss!1634) (size!2973 (buf!3402 (_2!6752 lt!222539)))) (and (= (currentBit!6281 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6286 thiss!1634) (size!2973 (buf!3402 (_2!6752 lt!222539))))))))))

(assert (=> b!143639 d!45856))

(declare-fun d!45858 () Bool)

(declare-fun res!120006 () Bool)

(declare-fun e!95706 () Bool)

(assert (=> d!45858 (=> res!120006 e!95706)))

(assert (=> d!45858 (= res!120006 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45858 (= (arrayRangesEq!289 arr!237 (_2!6750 lt!222552) #b00000000000000000000000000000000 to!404) e!95706)))

(declare-fun b!143667 () Bool)

(declare-fun e!95707 () Bool)

(assert (=> b!143667 (= e!95706 e!95707)))

(declare-fun res!120007 () Bool)

(assert (=> b!143667 (=> (not res!120007) (not e!95707))))

(assert (=> b!143667 (= res!120007 (= (select (arr!3696 arr!237) #b00000000000000000000000000000000) (select (arr!3696 (_2!6750 lt!222552)) #b00000000000000000000000000000000)))))

(declare-fun b!143668 () Bool)

(assert (=> b!143668 (= e!95707 (arrayRangesEq!289 arr!237 (_2!6750 lt!222552) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45858 (not res!120006)) b!143667))

(assert (= (and b!143667 res!120007) b!143668))

(declare-fun m!220629 () Bool)

(assert (=> b!143667 m!220629))

(declare-fun m!220631 () Bool)

(assert (=> b!143667 m!220631))

(declare-fun m!220633 () Bool)

(assert (=> b!143668 m!220633))

(assert (=> b!143628 d!45858))

(declare-fun d!45862 () Bool)

(assert (=> d!45862 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11260 () Bool)

(assert (= bs!11260 d!45862))

(assert (=> bs!11260 m!220627))

(assert (=> b!143630 d!45862))

(declare-datatypes ((tuple3!552 0))(
  ( (tuple3!553 (_1!6754 Unit!8946) (_2!6754 BitStream!5204) (_3!341 array!6567)) )
))
(declare-fun lt!222643 () tuple3!552)

(declare-fun d!45864 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5204 array!6567 (_ BitVec 32) (_ BitVec 32)) tuple3!552)

(assert (=> d!45864 (= lt!222643 (readByteArrayLoop!0 (_1!6751 lt!222541) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45864 (= (readByteArrayLoopPure!0 (_1!6751 lt!222541) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12819 (_2!6754 lt!222643) (_3!341 lt!222643)))))

(declare-fun bs!11261 () Bool)

(assert (= bs!11261 d!45864))

(declare-fun m!220635 () Bool)

(assert (=> bs!11261 m!220635))

(assert (=> b!143629 d!45864))

(declare-fun d!45866 () Bool)

(assert (=> d!45866 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222540) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) lt!222540))))

(declare-fun bs!11262 () Bool)

(assert (= bs!11262 d!45866))

(declare-fun m!220637 () Bool)

(assert (=> bs!11262 m!220637))

(assert (=> b!143629 d!45866))

(declare-fun d!45868 () Bool)

(assert (=> d!45868 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222540)))

(declare-fun lt!222658 () Unit!8946)

(declare-fun choose!9 (BitStream!5204 array!6567 (_ BitVec 64) BitStream!5204) Unit!8946)

(assert (=> d!45868 (= lt!222658 (choose!9 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222545)) lt!222540 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (=> d!45868 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222545)) lt!222540) lt!222658)))

(declare-fun bs!11263 () Bool)

(assert (= bs!11263 d!45868))

(assert (=> bs!11263 m!220581))

(declare-fun m!220639 () Bool)

(assert (=> bs!11263 m!220639))

(assert (=> b!143629 d!45868))

(declare-fun b!143673 () Bool)

(declare-fun res!120012 () Bool)

(declare-fun e!95711 () Bool)

(assert (=> b!143673 (=> (not res!120012) (not e!95711))))

(declare-fun lt!222678 () tuple2!12820)

(assert (=> b!143673 (= res!120012 (isPrefixOf!0 (_2!6751 lt!222678) (_2!6752 lt!222545)))))

(declare-fun b!143674 () Bool)

(declare-fun res!120014 () Bool)

(assert (=> b!143674 (=> (not res!120014) (not e!95711))))

(assert (=> b!143674 (= res!120014 (isPrefixOf!0 (_1!6751 lt!222678) (_2!6752 lt!222539)))))

(declare-fun b!143675 () Bool)

(declare-fun e!95710 () Unit!8946)

(declare-fun lt!222677 () Unit!8946)

(assert (=> b!143675 (= e!95710 lt!222677)))

(declare-fun lt!222661 () (_ BitVec 64))

(assert (=> b!143675 (= lt!222661 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!222662 () (_ BitVec 64))

(assert (=> b!143675 (= lt!222662 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(assert (=> b!143675 (= lt!222677 (arrayBitRangesEqSymmetric!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222545)) lt!222661 lt!222662))))

(assert (=> b!143675 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 (_2!6752 lt!222539)) lt!222661 lt!222662)))

(declare-fun lt!222673 () (_ BitVec 64))

(declare-fun b!143676 () Bool)

(declare-fun lt!222671 () (_ BitVec 64))

(assert (=> b!143676 (= e!95711 (= (_1!6751 lt!222678) (withMovedBitIndex!0 (_2!6751 lt!222678) (bvsub lt!222671 lt!222673))))))

(assert (=> b!143676 (or (= (bvand lt!222671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222671 lt!222673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143676 (= lt!222673 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545))))))

(assert (=> b!143676 (= lt!222671 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(declare-fun d!45870 () Bool)

(assert (=> d!45870 e!95711))

(declare-fun res!120013 () Bool)

(assert (=> d!45870 (=> (not res!120013) (not e!95711))))

(assert (=> d!45870 (= res!120013 (isPrefixOf!0 (_1!6751 lt!222678) (_2!6751 lt!222678)))))

(declare-fun lt!222676 () BitStream!5204)

(assert (=> d!45870 (= lt!222678 (tuple2!12821 lt!222676 (_2!6752 lt!222545)))))

(declare-fun lt!222675 () Unit!8946)

(declare-fun lt!222664 () Unit!8946)

(assert (=> d!45870 (= lt!222675 lt!222664)))

(assert (=> d!45870 (isPrefixOf!0 lt!222676 (_2!6752 lt!222545))))

(assert (=> d!45870 (= lt!222664 (lemmaIsPrefixTransitive!0 lt!222676 (_2!6752 lt!222545) (_2!6752 lt!222545)))))

(declare-fun lt!222672 () Unit!8946)

(declare-fun lt!222667 () Unit!8946)

(assert (=> d!45870 (= lt!222672 lt!222667)))

(assert (=> d!45870 (isPrefixOf!0 lt!222676 (_2!6752 lt!222545))))

(assert (=> d!45870 (= lt!222667 (lemmaIsPrefixTransitive!0 lt!222676 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(declare-fun lt!222666 () Unit!8946)

(assert (=> d!45870 (= lt!222666 e!95710)))

(declare-fun c!7846 () Bool)

(assert (=> d!45870 (= c!7846 (not (= (size!2973 (buf!3402 (_2!6752 lt!222539))) #b00000000000000000000000000000000)))))

(declare-fun lt!222663 () Unit!8946)

(declare-fun lt!222659 () Unit!8946)

(assert (=> d!45870 (= lt!222663 lt!222659)))

(assert (=> d!45870 (isPrefixOf!0 (_2!6752 lt!222545) (_2!6752 lt!222545))))

(assert (=> d!45870 (= lt!222659 (lemmaIsPrefixRefl!0 (_2!6752 lt!222545)))))

(declare-fun lt!222665 () Unit!8946)

(declare-fun lt!222669 () Unit!8946)

(assert (=> d!45870 (= lt!222665 lt!222669)))

(assert (=> d!45870 (= lt!222669 (lemmaIsPrefixRefl!0 (_2!6752 lt!222545)))))

(declare-fun lt!222660 () Unit!8946)

(declare-fun lt!222668 () Unit!8946)

(assert (=> d!45870 (= lt!222660 lt!222668)))

(assert (=> d!45870 (isPrefixOf!0 lt!222676 lt!222676)))

(assert (=> d!45870 (= lt!222668 (lemmaIsPrefixRefl!0 lt!222676))))

(declare-fun lt!222670 () Unit!8946)

(declare-fun lt!222674 () Unit!8946)

(assert (=> d!45870 (= lt!222670 lt!222674)))

(assert (=> d!45870 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222539))))

(assert (=> d!45870 (= lt!222674 (lemmaIsPrefixRefl!0 (_2!6752 lt!222539)))))

(assert (=> d!45870 (= lt!222676 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(assert (=> d!45870 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222545))))

(assert (=> d!45870 (= (reader!0 (_2!6752 lt!222539) (_2!6752 lt!222545)) lt!222678)))

(declare-fun b!143677 () Bool)

(declare-fun Unit!8949 () Unit!8946)

(assert (=> b!143677 (= e!95710 Unit!8949)))

(assert (= (and d!45870 c!7846) b!143675))

(assert (= (and d!45870 (not c!7846)) b!143677))

(assert (= (and d!45870 res!120013) b!143674))

(assert (= (and b!143674 res!120014) b!143673))

(assert (= (and b!143673 res!120012) b!143676))

(declare-fun m!220645 () Bool)

(assert (=> b!143673 m!220645))

(declare-fun m!220647 () Bool)

(assert (=> b!143676 m!220647))

(assert (=> b!143676 m!220577))

(assert (=> b!143676 m!220561))

(assert (=> b!143675 m!220561))

(declare-fun m!220651 () Bool)

(assert (=> b!143675 m!220651))

(declare-fun m!220653 () Bool)

(assert (=> b!143675 m!220653))

(assert (=> d!45870 m!220575))

(declare-fun m!220655 () Bool)

(assert (=> d!45870 m!220655))

(declare-fun m!220657 () Bool)

(assert (=> d!45870 m!220657))

(declare-fun m!220659 () Bool)

(assert (=> d!45870 m!220659))

(declare-fun m!220661 () Bool)

(assert (=> d!45870 m!220661))

(declare-fun m!220663 () Bool)

(assert (=> d!45870 m!220663))

(declare-fun m!220665 () Bool)

(assert (=> d!45870 m!220665))

(declare-fun m!220667 () Bool)

(assert (=> d!45870 m!220667))

(assert (=> d!45870 m!220603))

(declare-fun m!220669 () Bool)

(assert (=> d!45870 m!220669))

(assert (=> d!45870 m!220617))

(declare-fun m!220671 () Bool)

(assert (=> b!143674 m!220671))

(assert (=> b!143629 d!45870))

(declare-fun d!45876 () Bool)

(assert (=> d!45876 (= (invariant!0 (currentBit!6281 thiss!1634) (currentByte!6286 thiss!1634) (size!2973 (buf!3402 thiss!1634))) (and (bvsge (currentBit!6281 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6281 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6286 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6286 thiss!1634) (size!2973 (buf!3402 thiss!1634))) (and (= (currentBit!6281 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6286 thiss!1634) (size!2973 (buf!3402 thiss!1634)))))))))

(assert (=> b!143626 d!45876))

(declare-fun d!45878 () Bool)

(assert (=> d!45878 (= (array_inv!2762 (buf!3402 thiss!1634)) (bvsge (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!143636 d!45878))

(declare-fun d!45880 () Bool)

(assert (=> d!45880 (= (array_inv!2762 arr!237) (bvsge (size!2973 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27810 d!45880))

(declare-fun d!45882 () Bool)

(assert (=> d!45882 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6281 thiss!1634) (currentByte!6286 thiss!1634) (size!2973 (buf!3402 thiss!1634))))))

(declare-fun bs!11264 () Bool)

(assert (= bs!11264 d!45882))

(assert (=> bs!11264 m!220569))

(assert (=> start!27810 d!45882))

(declare-fun d!45884 () Bool)

(declare-fun res!120036 () Bool)

(declare-fun e!95725 () Bool)

(assert (=> d!45884 (=> (not res!120036) (not e!95725))))

(assert (=> d!45884 (= res!120036 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!45884 (= (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222545)) e!95725)))

(declare-fun b!143697 () Bool)

(declare-fun res!120035 () Bool)

(assert (=> b!143697 (=> (not res!120035) (not e!95725))))

(assert (=> b!143697 (= res!120035 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!143698 () Bool)

(declare-fun e!95724 () Bool)

(assert (=> b!143698 (= e!95725 e!95724)))

(declare-fun res!120034 () Bool)

(assert (=> b!143698 (=> res!120034 e!95724)))

(assert (=> b!143698 (= res!120034 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) #b00000000000000000000000000000000))))

(declare-fun b!143699 () Bool)

(assert (=> b!143699 (= e!95724 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (= (and d!45884 res!120036) b!143697))

(assert (= (and b!143697 res!120035) b!143698))

(assert (= (and b!143698 (not res!120034)) b!143699))

(assert (=> b!143697 m!220561))

(assert (=> b!143697 m!220577))

(assert (=> b!143699 m!220561))

(assert (=> b!143699 m!220561))

(declare-fun m!220679 () Bool)

(assert (=> b!143699 m!220679))

(assert (=> b!143638 d!45884))

(declare-fun d!45894 () Bool)

(declare-fun res!120041 () Bool)

(declare-fun e!95728 () Bool)

(assert (=> d!45894 (=> (not res!120041) (not e!95728))))

(assert (=> d!45894 (= res!120041 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (=> d!45894 (= (isPrefixOf!0 thiss!1634 (_2!6752 lt!222539)) e!95728)))

(declare-fun b!143702 () Bool)

(declare-fun res!120040 () Bool)

(assert (=> b!143702 (=> (not res!120040) (not e!95728))))

(assert (=> b!143702 (= res!120040 (bvsle (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(declare-fun b!143703 () Bool)

(declare-fun e!95727 () Bool)

(assert (=> b!143703 (= e!95728 e!95727)))

(declare-fun res!120039 () Bool)

(assert (=> b!143703 (=> res!120039 e!95727)))

(assert (=> b!143703 (= res!120039 (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143704 () Bool)

(assert (=> b!143704 (= e!95727 (arrayBitRangesEq!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (= (and d!45894 res!120041) b!143702))

(assert (= (and b!143702 res!120040) b!143703))

(assert (= (and b!143703 (not res!120039)) b!143704))

(assert (=> b!143702 m!220563))

(assert (=> b!143702 m!220561))

(assert (=> b!143704 m!220563))

(assert (=> b!143704 m!220563))

(declare-fun m!220681 () Bool)

(assert (=> b!143704 m!220681))

(assert (=> b!143637 d!45894))

(declare-fun d!45896 () Bool)

(declare-fun lt!222697 () tuple2!12824)

(assert (=> d!45896 (= lt!222697 (readByte!0 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (=> d!45896 (= (readBytePure!0 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) (tuple2!12817 (_2!6753 lt!222697) (_1!6753 lt!222697)))))

(declare-fun bs!11266 () Bool)

(assert (= bs!11266 d!45896))

(declare-fun m!220683 () Bool)

(assert (=> bs!11266 m!220683))

(assert (=> b!143634 d!45896))

(declare-fun b!143738 () Bool)

(declare-fun e!95749 () Bool)

(declare-fun lt!222807 () tuple2!12818)

(assert (=> b!143738 (= e!95749 (arrayRangesEq!289 arr!237 (_2!6750 lt!222807) #b00000000000000000000000000000000 to!404))))

(declare-fun b!143739 () Bool)

(declare-fun res!120072 () Bool)

(declare-fun e!95747 () Bool)

(assert (=> b!143739 (=> (not res!120072) (not e!95747))))

(declare-fun lt!222808 () tuple2!12822)

(assert (=> b!143739 (= res!120072 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222808)))))

(declare-fun b!143740 () Bool)

(assert (=> b!143740 (= e!95747 e!95749)))

(declare-fun res!120070 () Bool)

(assert (=> b!143740 (=> (not res!120070) (not e!95749))))

(declare-fun lt!222803 () tuple2!12820)

(assert (=> b!143740 (= res!120070 (and (= (size!2973 (_2!6750 lt!222807)) (size!2973 arr!237)) (= (_1!6750 lt!222807) (_2!6751 lt!222803))))))

(assert (=> b!143740 (= lt!222807 (readByteArrayLoopPure!0 (_1!6751 lt!222803) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!222805 () Unit!8946)

(declare-fun lt!222806 () Unit!8946)

(assert (=> b!143740 (= lt!222805 lt!222806)))

(declare-fun lt!222804 () (_ BitVec 64))

(assert (=> b!143740 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222804)))

(assert (=> b!143740 (= lt!222806 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222808)) lt!222804))))

(declare-fun e!95748 () Bool)

(assert (=> b!143740 e!95748))

(declare-fun res!120069 () Bool)

(assert (=> b!143740 (=> (not res!120069) (not e!95748))))

(assert (=> b!143740 (= res!120069 (and (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 lt!222808)))) (bvsge lt!222804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143740 (= lt!222804 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!143740 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!143740 (= lt!222803 (reader!0 (_2!6752 lt!222539) (_2!6752 lt!222808)))))

(declare-fun b!143741 () Bool)

(assert (=> b!143741 (= e!95748 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222804))))

(declare-fun b!143742 () Bool)

(declare-fun res!120071 () Bool)

(assert (=> b!143742 (=> (not res!120071) (not e!95747))))

(declare-fun lt!222811 () (_ BitVec 64))

(declare-fun lt!222809 () (_ BitVec 64))

(assert (=> b!143742 (= res!120071 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222808))) (currentByte!6286 (_2!6752 lt!222808)) (currentBit!6281 (_2!6752 lt!222808))) (bvadd lt!222811 lt!222809)))))

(assert (=> b!143742 (or (not (= (bvand lt!222811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222809 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!222811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!222811 lt!222809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!222810 () (_ BitVec 64))

(assert (=> b!143742 (= lt!222809 (bvmul lt!222810 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!143742 (or (= lt!222810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222810)))))

(assert (=> b!143742 (= lt!222810 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!143742 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!143742 (= lt!222811 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(declare-fun d!45898 () Bool)

(assert (=> d!45898 e!95747))

(declare-fun res!120073 () Bool)

(assert (=> d!45898 (=> (not res!120073) (not e!95747))))

(assert (=> d!45898 (= res!120073 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 lt!222808)))))))

(declare-fun choose!64 (BitStream!5204 array!6567 (_ BitVec 32) (_ BitVec 32)) tuple2!12822)

(assert (=> d!45898 (= lt!222808 (choose!64 (_2!6752 lt!222539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45898 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2973 arr!237)))))

(assert (=> d!45898 (= (appendByteArrayLoop!0 (_2!6752 lt!222539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!222808)))

(assert (= (and d!45898 res!120073) b!143742))

(assert (= (and b!143742 res!120071) b!143739))

(assert (= (and b!143739 res!120072) b!143740))

(assert (= (and b!143740 res!120069) b!143741))

(assert (= (and b!143740 res!120070) b!143738))

(declare-fun m!220737 () Bool)

(assert (=> d!45898 m!220737))

(declare-fun m!220739 () Bool)

(assert (=> b!143739 m!220739))

(declare-fun m!220741 () Bool)

(assert (=> b!143742 m!220741))

(assert (=> b!143742 m!220561))

(declare-fun m!220743 () Bool)

(assert (=> b!143738 m!220743))

(declare-fun m!220745 () Bool)

(assert (=> b!143741 m!220745))

(declare-fun m!220747 () Bool)

(assert (=> b!143740 m!220747))

(declare-fun m!220749 () Bool)

(assert (=> b!143740 m!220749))

(declare-fun m!220751 () Bool)

(assert (=> b!143740 m!220751))

(declare-fun m!220753 () Bool)

(assert (=> b!143740 m!220753))

(assert (=> b!143634 d!45898))

(declare-fun d!45918 () Bool)

(assert (=> d!45918 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!222814 () Unit!8946)

(declare-fun choose!26 (BitStream!5204 array!6567 (_ BitVec 32) BitStream!5204) Unit!8946)

(assert (=> d!45918 (= lt!222814 (choose!26 thiss!1634 (buf!3402 (_2!6752 lt!222545)) (bvsub to!404 from!447) (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (=> d!45918 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3402 (_2!6752 lt!222545)) (bvsub to!404 from!447)) lt!222814)))

(declare-fun bs!11271 () Bool)

(assert (= bs!11271 d!45918))

(assert (=> bs!11271 m!220525))

(declare-fun m!220755 () Bool)

(assert (=> bs!11271 m!220755))

(assert (=> b!143634 d!45918))

(declare-fun d!45920 () Bool)

(declare-fun lt!222815 () tuple3!552)

(assert (=> d!45920 (= lt!222815 (readByteArrayLoop!0 (_1!6751 lt!222553) arr!237 from!447 to!404))))

(assert (=> d!45920 (= (readByteArrayLoopPure!0 (_1!6751 lt!222553) arr!237 from!447 to!404) (tuple2!12819 (_2!6754 lt!222815) (_3!341 lt!222815)))))

(declare-fun bs!11272 () Bool)

(assert (= bs!11272 d!45920))

(declare-fun m!220757 () Bool)

(assert (=> bs!11272 m!220757))

(assert (=> b!143634 d!45920))

(declare-fun d!45922 () Bool)

(declare-fun res!120076 () Bool)

(declare-fun e!95751 () Bool)

(assert (=> d!45922 (=> (not res!120076) (not e!95751))))

(assert (=> d!45922 (= res!120076 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!45922 (= (isPrefixOf!0 thiss!1634 (_2!6752 lt!222545)) e!95751)))

(declare-fun b!143743 () Bool)

(declare-fun res!120075 () Bool)

(assert (=> b!143743 (=> (not res!120075) (not e!95751))))

(assert (=> b!143743 (= res!120075 (bvsle (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!143744 () Bool)

(declare-fun e!95750 () Bool)

(assert (=> b!143744 (= e!95751 e!95750)))

(declare-fun res!120074 () Bool)

(assert (=> b!143744 (=> res!120074 e!95750)))

(assert (=> b!143744 (= res!120074 (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143745 () Bool)

(assert (=> b!143745 (= e!95750 (arrayBitRangesEq!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (= (and d!45922 res!120076) b!143743))

(assert (= (and b!143743 res!120075) b!143744))

(assert (= (and b!143744 (not res!120074)) b!143745))

(assert (=> b!143743 m!220563))

(assert (=> b!143743 m!220577))

(assert (=> b!143745 m!220563))

(assert (=> b!143745 m!220563))

(declare-fun m!220759 () Bool)

(assert (=> b!143745 m!220759))

(assert (=> b!143634 d!45922))

(declare-fun d!45924 () Bool)

(declare-fun lt!222816 () tuple2!12824)

(assert (=> d!45924 (= lt!222816 (readByte!0 lt!222538))))

(assert (=> d!45924 (= (readBytePure!0 lt!222538) (tuple2!12817 (_2!6753 lt!222816) (_1!6753 lt!222816)))))

(declare-fun bs!11273 () Bool)

(assert (= bs!11273 d!45924))

(declare-fun m!220761 () Bool)

(assert (=> bs!11273 m!220761))

(assert (=> b!143634 d!45924))

(declare-fun d!45926 () Bool)

(declare-fun e!95752 () Bool)

(assert (=> d!45926 e!95752))

(declare-fun res!120077 () Bool)

(assert (=> d!45926 (=> (not res!120077) (not e!95752))))

(declare-fun lt!222820 () (_ BitVec 64))

(declare-fun lt!222821 () (_ BitVec 64))

(declare-fun lt!222817 () (_ BitVec 64))

(assert (=> d!45926 (= res!120077 (= lt!222820 (bvsub lt!222817 lt!222821)))))

(assert (=> d!45926 (or (= (bvand lt!222817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222817 lt!222821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45926 (= lt!222821 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222543)))) ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222543))) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222543)))))))

(declare-fun lt!222818 () (_ BitVec 64))

(declare-fun lt!222819 () (_ BitVec 64))

(assert (=> d!45926 (= lt!222817 (bvmul lt!222818 lt!222819))))

(assert (=> d!45926 (or (= lt!222818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222819 (bvsdiv (bvmul lt!222818 lt!222819) lt!222818)))))

(assert (=> d!45926 (= lt!222819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45926 (= lt!222818 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222543)))))))

(assert (=> d!45926 (= lt!222820 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222543))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222543)))))))

(assert (=> d!45926 (invariant!0 (currentBit!6281 (_1!6749 lt!222543)) (currentByte!6286 (_1!6749 lt!222543)) (size!2973 (buf!3402 (_1!6749 lt!222543))))))

(assert (=> d!45926 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222543))) (currentByte!6286 (_1!6749 lt!222543)) (currentBit!6281 (_1!6749 lt!222543))) lt!222820)))

(declare-fun b!143746 () Bool)

(declare-fun res!120078 () Bool)

(assert (=> b!143746 (=> (not res!120078) (not e!95752))))

(assert (=> b!143746 (= res!120078 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222820))))

(declare-fun b!143747 () Bool)

(declare-fun lt!222822 () (_ BitVec 64))

(assert (=> b!143747 (= e!95752 (bvsle lt!222820 (bvmul lt!222822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143747 (or (= lt!222822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222822)))))

(assert (=> b!143747 (= lt!222822 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222543)))))))

(assert (= (and d!45926 res!120077) b!143746))

(assert (= (and b!143746 res!120078) b!143747))

(declare-fun m!220763 () Bool)

(assert (=> d!45926 m!220763))

(declare-fun m!220765 () Bool)

(assert (=> d!45926 m!220765))

(assert (=> b!143634 d!45926))

(assert (=> b!143634 d!45870))

(declare-fun d!45928 () Bool)

(assert (=> d!45928 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222545))))

(declare-fun lt!222825 () Unit!8946)

(declare-fun choose!30 (BitStream!5204 BitStream!5204 BitStream!5204) Unit!8946)

(assert (=> d!45928 (= lt!222825 (choose!30 thiss!1634 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(assert (=> d!45928 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222539))))

(assert (=> d!45928 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6752 lt!222539) (_2!6752 lt!222545)) lt!222825)))

(declare-fun bs!11274 () Bool)

(assert (= bs!11274 d!45928))

(assert (=> bs!11274 m!220537))

(declare-fun m!220767 () Bool)

(assert (=> bs!11274 m!220767))

(assert (=> bs!11274 m!220571))

(assert (=> b!143634 d!45928))

(declare-fun b!143748 () Bool)

(declare-fun res!120079 () Bool)

(declare-fun e!95754 () Bool)

(assert (=> b!143748 (=> (not res!120079) (not e!95754))))

(declare-fun lt!222845 () tuple2!12820)

(assert (=> b!143748 (= res!120079 (isPrefixOf!0 (_2!6751 lt!222845) (_2!6752 lt!222545)))))

(declare-fun b!143749 () Bool)

(declare-fun res!120081 () Bool)

(assert (=> b!143749 (=> (not res!120081) (not e!95754))))

(assert (=> b!143749 (= res!120081 (isPrefixOf!0 (_1!6751 lt!222845) thiss!1634))))

(declare-fun b!143750 () Bool)

(declare-fun e!95753 () Unit!8946)

(declare-fun lt!222844 () Unit!8946)

(assert (=> b!143750 (= e!95753 lt!222844)))

(declare-fun lt!222828 () (_ BitVec 64))

(assert (=> b!143750 (= lt!222828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!222829 () (_ BitVec 64))

(assert (=> b!143750 (= lt!222829 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(assert (=> b!143750 (= lt!222844 (arrayBitRangesEqSymmetric!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222545)) lt!222828 lt!222829))))

(assert (=> b!143750 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 thiss!1634) lt!222828 lt!222829)))

(declare-fun lt!222838 () (_ BitVec 64))

(declare-fun b!143751 () Bool)

(declare-fun lt!222840 () (_ BitVec 64))

(assert (=> b!143751 (= e!95754 (= (_1!6751 lt!222845) (withMovedBitIndex!0 (_2!6751 lt!222845) (bvsub lt!222838 lt!222840))))))

(assert (=> b!143751 (or (= (bvand lt!222838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222838 lt!222840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143751 (= lt!222840 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545))))))

(assert (=> b!143751 (= lt!222838 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(declare-fun d!45930 () Bool)

(assert (=> d!45930 e!95754))

(declare-fun res!120080 () Bool)

(assert (=> d!45930 (=> (not res!120080) (not e!95754))))

(assert (=> d!45930 (= res!120080 (isPrefixOf!0 (_1!6751 lt!222845) (_2!6751 lt!222845)))))

(declare-fun lt!222843 () BitStream!5204)

(assert (=> d!45930 (= lt!222845 (tuple2!12821 lt!222843 (_2!6752 lt!222545)))))

(declare-fun lt!222842 () Unit!8946)

(declare-fun lt!222831 () Unit!8946)

(assert (=> d!45930 (= lt!222842 lt!222831)))

(assert (=> d!45930 (isPrefixOf!0 lt!222843 (_2!6752 lt!222545))))

(assert (=> d!45930 (= lt!222831 (lemmaIsPrefixTransitive!0 lt!222843 (_2!6752 lt!222545) (_2!6752 lt!222545)))))

(declare-fun lt!222839 () Unit!8946)

(declare-fun lt!222834 () Unit!8946)

(assert (=> d!45930 (= lt!222839 lt!222834)))

(assert (=> d!45930 (isPrefixOf!0 lt!222843 (_2!6752 lt!222545))))

(assert (=> d!45930 (= lt!222834 (lemmaIsPrefixTransitive!0 lt!222843 thiss!1634 (_2!6752 lt!222545)))))

(declare-fun lt!222833 () Unit!8946)

(assert (=> d!45930 (= lt!222833 e!95753)))

(declare-fun c!7850 () Bool)

(assert (=> d!45930 (= c!7850 (not (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!222830 () Unit!8946)

(declare-fun lt!222826 () Unit!8946)

(assert (=> d!45930 (= lt!222830 lt!222826)))

(assert (=> d!45930 (isPrefixOf!0 (_2!6752 lt!222545) (_2!6752 lt!222545))))

(assert (=> d!45930 (= lt!222826 (lemmaIsPrefixRefl!0 (_2!6752 lt!222545)))))

(declare-fun lt!222832 () Unit!8946)

(declare-fun lt!222836 () Unit!8946)

(assert (=> d!45930 (= lt!222832 lt!222836)))

(assert (=> d!45930 (= lt!222836 (lemmaIsPrefixRefl!0 (_2!6752 lt!222545)))))

(declare-fun lt!222827 () Unit!8946)

(declare-fun lt!222835 () Unit!8946)

(assert (=> d!45930 (= lt!222827 lt!222835)))

(assert (=> d!45930 (isPrefixOf!0 lt!222843 lt!222843)))

(assert (=> d!45930 (= lt!222835 (lemmaIsPrefixRefl!0 lt!222843))))

(declare-fun lt!222837 () Unit!8946)

(declare-fun lt!222841 () Unit!8946)

(assert (=> d!45930 (= lt!222837 lt!222841)))

(assert (=> d!45930 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45930 (= lt!222841 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45930 (= lt!222843 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(assert (=> d!45930 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222545))))

(assert (=> d!45930 (= (reader!0 thiss!1634 (_2!6752 lt!222545)) lt!222845)))

(declare-fun b!143752 () Bool)

(declare-fun Unit!8950 () Unit!8946)

(assert (=> b!143752 (= e!95753 Unit!8950)))

(assert (= (and d!45930 c!7850) b!143750))

(assert (= (and d!45930 (not c!7850)) b!143752))

(assert (= (and d!45930 res!120080) b!143749))

(assert (= (and b!143749 res!120081) b!143748))

(assert (= (and b!143748 res!120079) b!143751))

(declare-fun m!220769 () Bool)

(assert (=> b!143748 m!220769))

(declare-fun m!220771 () Bool)

(assert (=> b!143751 m!220771))

(assert (=> b!143751 m!220577))

(assert (=> b!143751 m!220563))

(assert (=> b!143750 m!220563))

(declare-fun m!220773 () Bool)

(assert (=> b!143750 m!220773))

(declare-fun m!220775 () Bool)

(assert (=> b!143750 m!220775))

(assert (=> d!45930 m!220537))

(declare-fun m!220777 () Bool)

(assert (=> d!45930 m!220777))

(assert (=> d!45930 m!220657))

(declare-fun m!220779 () Bool)

(assert (=> d!45930 m!220779))

(declare-fun m!220781 () Bool)

(assert (=> d!45930 m!220781))

(declare-fun m!220783 () Bool)

(assert (=> d!45930 m!220783))

(declare-fun m!220785 () Bool)

(assert (=> d!45930 m!220785))

(declare-fun m!220787 () Bool)

(assert (=> d!45930 m!220787))

(assert (=> d!45930 m!220615))

(assert (=> d!45930 m!220669))

(assert (=> d!45930 m!220619))

(declare-fun m!220789 () Bool)

(assert (=> b!143749 m!220789))

(assert (=> b!143634 d!45930))

(declare-fun d!45932 () Bool)

(declare-fun e!95761 () Bool)

(assert (=> d!45932 e!95761))

(declare-fun res!120090 () Bool)

(assert (=> d!45932 (=> (not res!120090) (not e!95761))))

(assert (=> d!45932 (= res!120090 (and (or (let ((rhs!3200 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3200 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3200) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45933 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45933 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45933 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3199 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3199 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3199) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!222892 () Unit!8946)

(declare-fun choose!57 (BitStream!5204 BitStream!5204 (_ BitVec 64) (_ BitVec 32)) Unit!8946)

(assert (=> d!45932 (= lt!222892 (choose!57 thiss!1634 (_2!6752 lt!222539) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45932 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6752 lt!222539) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!222892)))

(declare-fun b!143765 () Bool)

(declare-fun lt!222894 () (_ BitVec 32))

(assert (=> b!143765 (= e!95761 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) (bvsub (bvsub to!404 from!447) lt!222894)))))

(assert (=> b!143765 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!222894 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!222894) #b10000000000000000000000000000000)))))

(declare-fun lt!222893 () (_ BitVec 64))

(assert (=> b!143765 (= lt!222894 ((_ extract 31 0) lt!222893))))

(assert (=> b!143765 (and (bvslt lt!222893 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!222893 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!143765 (= lt!222893 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45932 res!120090) b!143765))

(declare-fun m!220791 () Bool)

(assert (=> d!45932 m!220791))

(declare-fun m!220793 () Bool)

(assert (=> b!143765 m!220793))

(assert (=> b!143634 d!45932))

(declare-fun d!45935 () Bool)

(assert (=> d!45935 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11275 () Bool)

(assert (= bs!11275 d!45935))

(assert (=> bs!11275 m!220623))

(assert (=> b!143634 d!45935))

(declare-fun d!45937 () Bool)

(declare-fun e!95778 () Bool)

(assert (=> d!45937 e!95778))

(declare-fun res!120122 () Bool)

(assert (=> d!45937 (=> (not res!120122) (not e!95778))))

(declare-fun lt!222953 () tuple2!12822)

(assert (=> d!45937 (= res!120122 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 (_2!6752 lt!222953)))))))

(declare-fun choose!6 (BitStream!5204 (_ BitVec 8)) tuple2!12822)

(assert (=> d!45937 (= lt!222953 (choose!6 thiss!1634 (select (arr!3696 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45937 (validate_offset_byte!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)))))

(assert (=> d!45937 (= (appendByte!0 thiss!1634 (select (arr!3696 arr!237) from!447)) lt!222953)))

(declare-fun b!143797 () Bool)

(declare-fun res!120121 () Bool)

(assert (=> b!143797 (=> (not res!120121) (not e!95778))))

(declare-fun lt!222951 () (_ BitVec 64))

(declare-fun lt!222952 () (_ BitVec 64))

(assert (=> b!143797 (= res!120121 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222953))) (currentByte!6286 (_2!6752 lt!222953)) (currentBit!6281 (_2!6752 lt!222953))) (bvadd lt!222951 lt!222952)))))

(assert (=> b!143797 (or (not (= (bvand lt!222951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222952 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!222951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!222951 lt!222952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143797 (= lt!222952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!143797 (= lt!222951 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(declare-fun b!143798 () Bool)

(declare-fun res!120120 () Bool)

(assert (=> b!143798 (=> (not res!120120) (not e!95778))))

(assert (=> b!143798 (= res!120120 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222953)))))

(declare-fun lt!222949 () tuple2!12816)

(declare-fun b!143799 () Bool)

(declare-fun lt!222950 () tuple2!12820)

(assert (=> b!143799 (= e!95778 (and (= (_2!6749 lt!222949) (select (arr!3696 arr!237) from!447)) (= (_1!6749 lt!222949) (_2!6751 lt!222950))))))

(assert (=> b!143799 (= lt!222949 (readBytePure!0 (_1!6751 lt!222950)))))

(assert (=> b!143799 (= lt!222950 (reader!0 thiss!1634 (_2!6752 lt!222953)))))

(assert (= (and d!45937 res!120122) b!143797))

(assert (= (and b!143797 res!120121) b!143798))

(assert (= (and b!143798 res!120120) b!143799))

(assert (=> d!45937 m!220539))

(declare-fun m!220839 () Bool)

(assert (=> d!45937 m!220839))

(declare-fun m!220841 () Bool)

(assert (=> d!45937 m!220841))

(declare-fun m!220843 () Bool)

(assert (=> b!143797 m!220843))

(assert (=> b!143797 m!220563))

(declare-fun m!220845 () Bool)

(assert (=> b!143798 m!220845))

(declare-fun m!220847 () Bool)

(assert (=> b!143799 m!220847))

(declare-fun m!220849 () Bool)

(assert (=> b!143799 m!220849))

(assert (=> b!143634 d!45937))

(declare-fun d!45957 () Bool)

(assert (=> d!45957 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11278 () Bool)

(assert (= bs!11278 d!45957))

(declare-fun m!220851 () Bool)

(assert (=> bs!11278 m!220851))

(assert (=> b!143634 d!45957))

(declare-fun d!45959 () Bool)

(declare-fun e!95779 () Bool)

(assert (=> d!45959 e!95779))

(declare-fun res!120123 () Bool)

(assert (=> d!45959 (=> (not res!120123) (not e!95779))))

(declare-fun lt!222958 () (_ BitVec 64))

(declare-fun lt!222954 () (_ BitVec 64))

(declare-fun lt!222957 () (_ BitVec 64))

(assert (=> d!45959 (= res!120123 (= lt!222957 (bvsub lt!222954 lt!222958)))))

(assert (=> d!45959 (or (= (bvand lt!222954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222954 lt!222958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45959 (= lt!222958 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222542)))) ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222542))) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222542)))))))

(declare-fun lt!222955 () (_ BitVec 64))

(declare-fun lt!222956 () (_ BitVec 64))

(assert (=> d!45959 (= lt!222954 (bvmul lt!222955 lt!222956))))

(assert (=> d!45959 (or (= lt!222955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222956 (bvsdiv (bvmul lt!222955 lt!222956) lt!222955)))))

(assert (=> d!45959 (= lt!222956 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45959 (= lt!222955 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222542)))))))

(assert (=> d!45959 (= lt!222957 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222542))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222542)))))))

(assert (=> d!45959 (invariant!0 (currentBit!6281 (_1!6749 lt!222542)) (currentByte!6286 (_1!6749 lt!222542)) (size!2973 (buf!3402 (_1!6749 lt!222542))))))

(assert (=> d!45959 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222542))) (currentByte!6286 (_1!6749 lt!222542)) (currentBit!6281 (_1!6749 lt!222542))) lt!222957)))

(declare-fun b!143800 () Bool)

(declare-fun res!120124 () Bool)

(assert (=> b!143800 (=> (not res!120124) (not e!95779))))

(assert (=> b!143800 (= res!120124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222957))))

(declare-fun b!143801 () Bool)

(declare-fun lt!222959 () (_ BitVec 64))

(assert (=> b!143801 (= e!95779 (bvsle lt!222957 (bvmul lt!222959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143801 (or (= lt!222959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222959)))))

(assert (=> b!143801 (= lt!222959 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222542)))))))

(assert (= (and d!45959 res!120123) b!143800))

(assert (= (and b!143800 res!120124) b!143801))

(declare-fun m!220853 () Bool)

(assert (=> d!45959 m!220853))

(declare-fun m!220855 () Bool)

(assert (=> d!45959 m!220855))

(assert (=> b!143634 d!45959))

(declare-fun d!45963 () Bool)

(declare-fun e!95788 () Bool)

(assert (=> d!45963 e!95788))

(declare-fun res!120133 () Bool)

(assert (=> d!45963 (=> (not res!120133) (not e!95788))))

(declare-fun lt!222972 () tuple2!12816)

(declare-fun lt!222973 () tuple2!12816)

(assert (=> d!45963 (= res!120133 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222972))) (currentByte!6286 (_1!6749 lt!222972)) (currentBit!6281 (_1!6749 lt!222972))) (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222973))) (currentByte!6286 (_1!6749 lt!222973)) (currentBit!6281 (_1!6749 lt!222973)))))))

(declare-fun lt!222971 () Unit!8946)

(declare-fun lt!222974 () BitStream!5204)

(declare-fun choose!14 (BitStream!5204 BitStream!5204 BitStream!5204 tuple2!12816 tuple2!12816 BitStream!5204 (_ BitVec 8) tuple2!12816 tuple2!12816 BitStream!5204 (_ BitVec 8)) Unit!8946)

(assert (=> d!45963 (= lt!222971 (choose!14 lt!222538 (_2!6752 lt!222545) lt!222974 lt!222972 (tuple2!12817 (_1!6749 lt!222972) (_2!6749 lt!222972)) (_1!6749 lt!222972) (_2!6749 lt!222972) lt!222973 (tuple2!12817 (_1!6749 lt!222973) (_2!6749 lt!222973)) (_1!6749 lt!222973) (_2!6749 lt!222973)))))

(assert (=> d!45963 (= lt!222973 (readBytePure!0 lt!222974))))

(assert (=> d!45963 (= lt!222972 (readBytePure!0 lt!222538))))

(assert (=> d!45963 (= lt!222974 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 lt!222538) (currentBit!6281 lt!222538)))))

(assert (=> d!45963 (= (readBytePrefixLemma!0 lt!222538 (_2!6752 lt!222545)) lt!222971)))

(declare-fun b!143810 () Bool)

(assert (=> b!143810 (= e!95788 (= (_2!6749 lt!222972) (_2!6749 lt!222973)))))

(assert (= (and d!45963 res!120133) b!143810))

(assert (=> d!45963 m!220541))

(declare-fun m!220867 () Bool)

(assert (=> d!45963 m!220867))

(declare-fun m!220869 () Bool)

(assert (=> d!45963 m!220869))

(declare-fun m!220871 () Bool)

(assert (=> d!45963 m!220871))

(declare-fun m!220873 () Bool)

(assert (=> d!45963 m!220873))

(assert (=> b!143634 d!45963))

(declare-fun d!45971 () Bool)

(declare-fun lt!222975 () tuple2!12824)

(assert (=> d!45971 (= lt!222975 (readByte!0 (_1!6751 lt!222553)))))

(assert (=> d!45971 (= (readBytePure!0 (_1!6751 lt!222553)) (tuple2!12817 (_2!6753 lt!222975) (_1!6753 lt!222975)))))

(declare-fun bs!11281 () Bool)

(assert (= bs!11281 d!45971))

(declare-fun m!220875 () Bool)

(assert (=> bs!11281 m!220875))

(assert (=> b!143634 d!45971))

(declare-fun d!45973 () Bool)

(declare-fun e!95789 () Bool)

(assert (=> d!45973 e!95789))

(declare-fun res!120134 () Bool)

(assert (=> d!45973 (=> (not res!120134) (not e!95789))))

(declare-fun lt!222980 () (_ BitVec 64))

(declare-fun lt!222979 () (_ BitVec 64))

(declare-fun lt!222976 () (_ BitVec 64))

(assert (=> d!45973 (= res!120134 (= lt!222979 (bvsub lt!222976 lt!222980)))))

(assert (=> d!45973 (or (= (bvand lt!222976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222976 lt!222980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45973 (= lt!222980 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222545))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun lt!222977 () (_ BitVec 64))

(declare-fun lt!222978 () (_ BitVec 64))

(assert (=> d!45973 (= lt!222976 (bvmul lt!222977 lt!222978))))

(assert (=> d!45973 (or (= lt!222977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222978 (bvsdiv (bvmul lt!222977 lt!222978) lt!222977)))))

(assert (=> d!45973 (= lt!222978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45973 (= lt!222977 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!45973 (= lt!222979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222545))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222545)))))))

(assert (=> d!45973 (invariant!0 (currentBit!6281 (_2!6752 lt!222545)) (currentByte!6286 (_2!6752 lt!222545)) (size!2973 (buf!3402 (_2!6752 lt!222545))))))

(assert (=> d!45973 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545))) lt!222979)))

(declare-fun b!143811 () Bool)

(declare-fun res!120135 () Bool)

(assert (=> b!143811 (=> (not res!120135) (not e!95789))))

(assert (=> b!143811 (= res!120135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222979))))

(declare-fun b!143812 () Bool)

(declare-fun lt!222981 () (_ BitVec 64))

(assert (=> b!143812 (= e!95789 (bvsle lt!222979 (bvmul lt!222981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143812 (or (= lt!222981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222981)))))

(assert (=> b!143812 (= lt!222981 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (= (and d!45973 res!120134) b!143811))

(assert (= (and b!143811 res!120135) b!143812))

(declare-fun m!220877 () Bool)

(assert (=> d!45973 m!220877))

(declare-fun m!220879 () Bool)

(assert (=> d!45973 m!220879))

(assert (=> b!143633 d!45973))

(assert (=> b!143633 d!45852))

(push 1)

(assert (not d!45870))

(assert (not d!45882))

(assert (not b!143673))

(assert (not d!45959))

(assert (not b!143797))

(assert (not b!143798))

(assert (not d!45957))

(assert (not d!45896))

(assert (not b!143668))

(assert (not b!143748))

(assert (not b!143738))

(assert (not d!45963))

(assert (not b!143739))

(assert (not d!45930))

(assert (not d!45926))

(assert (not d!45973))

(assert (not d!45937))

(assert (not b!143674))

(assert (not d!45898))

(assert (not d!45971))

(assert (not d!45850))

(assert (not b!143697))

(assert (not b!143651))

(assert (not d!45932))

(assert (not b!143650))

(assert (not b!143675))

(assert (not d!45864))

(assert (not b!143740))

(assert (not b!143741))

(assert (not b!143743))

(assert (not b!143751))

(assert (not b!143745))

(assert (not b!143676))

(assert (not d!45868))

(assert (not d!45920))

(assert (not b!143750))

(assert (not b!143702))

(assert (not b!143765))

(assert (not d!45924))

(assert (not d!45848))

(assert (not b!143653))

(assert (not d!45866))

(assert (not b!143652))

(assert (not b!143749))

(assert (not d!45918))

(assert (not d!45854))

(assert (not b!143742))

(assert (not b!143699))

(assert (not d!45935))

(assert (not d!45862))

(assert (not b!143799))

(assert (not d!45852))

(assert (not b!143704))

(assert (not d!45928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun c!7874 () Bool)

(declare-fun call!1877 () Bool)

(declare-fun lt!223567 () (_ BitVec 32))

(declare-datatypes ((tuple4!132 0))(
  ( (tuple4!133 (_1!6761 (_ BitVec 32)) (_2!6761 (_ BitVec 32)) (_3!345 (_ BitVec 32)) (_4!66 (_ BitVec 32))) )
))
(declare-fun lt!223566 () tuple4!132)

(declare-fun lt!223568 () (_ BitVec 32))

(declare-fun bm!1874 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1874 (= call!1877 (byteRangesEq!0 (select (arr!3696 (buf!3402 thiss!1634)) (_3!345 lt!223566)) (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_3!345 lt!223566)) lt!223568 (ite c!7874 lt!223567 #b00000000000000000000000000001000)))))

(declare-fun b!144129 () Bool)

(declare-fun e!96011 () Bool)

(assert (=> b!144129 (= e!96011 (byteRangesEq!0 (select (arr!3696 (buf!3402 thiss!1634)) (_4!66 lt!223566)) (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_4!66 lt!223566)) #b00000000000000000000000000000000 lt!223567))))

(declare-fun b!144130 () Bool)

(declare-fun e!96014 () Bool)

(assert (=> b!144130 (= e!96014 (arrayRangesEq!289 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222539)) (_1!6761 lt!223566) (_2!6761 lt!223566)))))

(declare-fun b!144132 () Bool)

(declare-fun e!96013 () Bool)

(declare-fun e!96010 () Bool)

(assert (=> b!144132 (= e!96013 e!96010)))

(assert (=> b!144132 (= c!7874 (= (_3!345 lt!223566) (_4!66 lt!223566)))))

(declare-fun b!144133 () Bool)

(declare-fun res!120408 () Bool)

(assert (=> b!144133 (= res!120408 (= lt!223567 #b00000000000000000000000000000000))))

(assert (=> b!144133 (=> res!120408 e!96011)))

(declare-fun e!96015 () Bool)

(assert (=> b!144133 (= e!96015 e!96011)))

(declare-fun b!144134 () Bool)

(assert (=> b!144134 (= e!96010 e!96015)))

(declare-fun res!120410 () Bool)

(assert (=> b!144134 (= res!120410 call!1877)))

(assert (=> b!144134 (=> (not res!120410) (not e!96015))))

(declare-fun b!144135 () Bool)

(assert (=> b!144135 (= e!96010 call!1877)))

(declare-fun d!46223 () Bool)

(declare-fun res!120409 () Bool)

(declare-fun e!96012 () Bool)

(assert (=> d!46223 (=> res!120409 e!96012)))

(assert (=> d!46223 (= res!120409 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (=> d!46223 (= (arrayBitRangesEq!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) e!96012)))

(declare-fun b!144131 () Bool)

(assert (=> b!144131 (= e!96012 e!96013)))

(declare-fun res!120407 () Bool)

(assert (=> b!144131 (=> (not res!120407) (not e!96013))))

(assert (=> b!144131 (= res!120407 e!96014)))

(declare-fun res!120411 () Bool)

(assert (=> b!144131 (=> res!120411 e!96014)))

(assert (=> b!144131 (= res!120411 (bvsge (_1!6761 lt!223566) (_2!6761 lt!223566)))))

(assert (=> b!144131 (= lt!223567 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144131 (= lt!223568 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!132)

(assert (=> b!144131 (= lt!223566 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (= (and d!46223 (not res!120409)) b!144131))

(assert (= (and b!144131 (not res!120411)) b!144130))

(assert (= (and b!144131 res!120407) b!144132))

(assert (= (and b!144132 c!7874) b!144135))

(assert (= (and b!144132 (not c!7874)) b!144134))

(assert (= (and b!144134 res!120410) b!144133))

(assert (= (and b!144133 (not res!120408)) b!144129))

(assert (= (or b!144135 b!144134) bm!1874))

(declare-fun m!221559 () Bool)

(assert (=> bm!1874 m!221559))

(declare-fun m!221561 () Bool)

(assert (=> bm!1874 m!221561))

(assert (=> bm!1874 m!221559))

(assert (=> bm!1874 m!221561))

(declare-fun m!221563 () Bool)

(assert (=> bm!1874 m!221563))

(declare-fun m!221565 () Bool)

(assert (=> b!144129 m!221565))

(declare-fun m!221567 () Bool)

(assert (=> b!144129 m!221567))

(assert (=> b!144129 m!221565))

(assert (=> b!144129 m!221567))

(declare-fun m!221569 () Bool)

(assert (=> b!144129 m!221569))

(declare-fun m!221571 () Bool)

(assert (=> b!144130 m!221571))

(assert (=> b!144131 m!220563))

(declare-fun m!221573 () Bool)

(assert (=> b!144131 m!221573))

(assert (=> b!143704 d!46223))

(assert (=> b!143704 d!45854))

(assert (=> b!143702 d!45854))

(assert (=> b!143702 d!45852))

(declare-fun d!46225 () Bool)

(declare-fun e!96018 () Bool)

(assert (=> d!46225 e!96018))

(declare-fun res!120414 () Bool)

(assert (=> d!46225 (=> (not res!120414) (not e!96018))))

(declare-fun lt!223573 () BitStream!5204)

(declare-fun lt!223574 () (_ BitVec 64))

(assert (=> d!46225 (= res!120414 (= (bvadd lt!223574 (bvsub lt!222671 lt!222673)) (bitIndex!0 (size!2973 (buf!3402 lt!223573)) (currentByte!6286 lt!223573) (currentBit!6281 lt!223573))))))

(assert (=> d!46225 (or (not (= (bvand lt!223574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222671 lt!222673) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223574 (bvsub lt!222671 lt!222673)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46225 (= lt!223574 (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222678))) (currentByte!6286 (_2!6751 lt!222678)) (currentBit!6281 (_2!6751 lt!222678))))))

(declare-fun moveBitIndex!0 (BitStream!5204 (_ BitVec 64)) tuple2!12822)

(assert (=> d!46225 (= lt!223573 (_2!6752 (moveBitIndex!0 (_2!6751 lt!222678) (bvsub lt!222671 lt!222673))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5204 (_ BitVec 64)) Bool)

(assert (=> d!46225 (moveBitIndexPrecond!0 (_2!6751 lt!222678) (bvsub lt!222671 lt!222673))))

(assert (=> d!46225 (= (withMovedBitIndex!0 (_2!6751 lt!222678) (bvsub lt!222671 lt!222673)) lt!223573)))

(declare-fun b!144138 () Bool)

(assert (=> b!144138 (= e!96018 (= (size!2973 (buf!3402 (_2!6751 lt!222678))) (size!2973 (buf!3402 lt!223573))))))

(assert (= (and d!46225 res!120414) b!144138))

(declare-fun m!221575 () Bool)

(assert (=> d!46225 m!221575))

(declare-fun m!221577 () Bool)

(assert (=> d!46225 m!221577))

(declare-fun m!221579 () Bool)

(assert (=> d!46225 m!221579))

(declare-fun m!221581 () Bool)

(assert (=> d!46225 m!221581))

(assert (=> b!143676 d!46225))

(assert (=> b!143676 d!45973))

(assert (=> b!143676 d!45852))

(declare-fun lt!223650 () array!6567)

(declare-fun lt!223652 () array!6567)

(declare-fun call!1884 () Bool)

(declare-fun c!7877 () Bool)

(declare-fun lt!223660 () (_ BitVec 32))

(declare-fun lt!223657 () (_ BitVec 32))

(declare-fun bm!1881 () Bool)

(declare-fun lt!223680 () tuple3!552)

(assert (=> bm!1881 (= call!1884 (arrayRangesEq!289 (ite c!7877 arr!237 lt!223650) (ite c!7877 (_3!341 lt!223680) lt!223652) (ite c!7877 #b00000000000000000000000000000000 lt!223660) (ite c!7877 from!447 lt!223657)))))

(declare-fun lt!223672 () Unit!8946)

(declare-fun b!144149 () Bool)

(declare-fun e!96025 () tuple3!552)

(assert (=> b!144149 (= e!96025 (tuple3!553 lt!223672 (_1!6751 lt!222553) arr!237))))

(declare-fun call!1885 () (_ BitVec 64))

(assert (=> b!144149 (= call!1885 call!1885)))

(declare-fun lt!223653 () Unit!8946)

(declare-fun Unit!8989 () Unit!8946)

(assert (=> b!144149 (= lt!223653 Unit!8989)))

(declare-fun lt!223663 () Unit!8946)

(declare-fun arrayRangesEqReflexiveLemma!9 (array!6567) Unit!8946)

(assert (=> b!144149 (= lt!223663 (arrayRangesEqReflexiveLemma!9 arr!237))))

(declare-fun call!1886 () Bool)

(assert (=> b!144149 call!1886))

(declare-fun lt!223666 () Unit!8946)

(assert (=> b!144149 (= lt!223666 lt!223663)))

(assert (=> b!144149 (= lt!223650 arr!237)))

(assert (=> b!144149 (= lt!223652 arr!237)))

(declare-fun lt!223674 () (_ BitVec 32))

(assert (=> b!144149 (= lt!223674 #b00000000000000000000000000000000)))

(declare-fun lt!223659 () (_ BitVec 32))

(assert (=> b!144149 (= lt!223659 (size!2973 arr!237))))

(assert (=> b!144149 (= lt!223660 #b00000000000000000000000000000000)))

(assert (=> b!144149 (= lt!223657 from!447)))

(declare-fun arrayRangesEqSlicedLemma!9 (array!6567 array!6567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!144149 (= lt!223672 (arrayRangesEqSlicedLemma!9 lt!223650 lt!223652 lt!223674 lt!223659 lt!223660 lt!223657))))

(assert (=> b!144149 call!1884))

(declare-fun bm!1882 () Bool)

(assert (=> bm!1882 (= call!1885 (bitIndex!0 (ite c!7877 (size!2973 (buf!3402 (_2!6754 lt!223680))) (size!2973 (buf!3402 (_1!6751 lt!222553)))) (ite c!7877 (currentByte!6286 (_2!6754 lt!223680)) (currentByte!6286 (_1!6751 lt!222553))) (ite c!7877 (currentBit!6281 (_2!6754 lt!223680)) (currentBit!6281 (_1!6751 lt!222553)))))))

(declare-fun b!144150 () Bool)

(declare-fun lt!223656 () tuple3!552)

(declare-fun e!96027 () Bool)

(assert (=> b!144150 (= e!96027 (= (select (arr!3696 (_3!341 lt!223656)) from!447) (_2!6749 (readBytePure!0 (_1!6751 lt!222553)))))))

(assert (=> b!144150 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2973 (_3!341 lt!223656))))))

(declare-fun lt!223681 () (_ BitVec 32))

(declare-fun bm!1883 () Bool)

(assert (=> bm!1883 (= call!1886 (arrayRangesEq!289 arr!237 (ite c!7877 (_3!341 lt!223680) arr!237) (ite c!7877 lt!223681 #b00000000000000000000000000000000) (ite c!7877 from!447 (size!2973 arr!237))))))

(declare-fun b!144151 () Bool)

(declare-fun lt!223670 () Unit!8946)

(assert (=> b!144151 (= e!96025 (tuple3!553 lt!223670 (_2!6754 lt!223680) (_3!341 lt!223680)))))

(declare-fun lt!223667 () tuple2!12824)

(assert (=> b!144151 (= lt!223667 (readByte!0 (_1!6751 lt!222553)))))

(declare-fun lt!223665 () array!6567)

(assert (=> b!144151 (= lt!223665 (array!6568 (store (arr!3696 arr!237) from!447 (_1!6753 lt!223667)) (size!2973 arr!237)))))

(declare-fun lt!223651 () (_ BitVec 64))

(assert (=> b!144151 (= lt!223651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!223662 () (_ BitVec 32))

(assert (=> b!144151 (= lt!223662 (bvsub to!404 from!447))))

(declare-fun lt!223664 () Unit!8946)

(assert (=> b!144151 (= lt!223664 (validateOffsetBytesFromBitIndexLemma!0 (_1!6751 lt!222553) (_2!6753 lt!223667) lt!223651 lt!223662))))

(assert (=> b!144151 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6753 lt!223667)))) ((_ sign_extend 32) (currentByte!6286 (_2!6753 lt!223667))) ((_ sign_extend 32) (currentBit!6281 (_2!6753 lt!223667))) (bvsub lt!223662 ((_ extract 31 0) (bvsdiv (bvadd lt!223651 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!223654 () Unit!8946)

(assert (=> b!144151 (= lt!223654 lt!223664)))

(assert (=> b!144151 (= lt!223680 (readByteArrayLoop!0 (_2!6753 lt!223667) lt!223665 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!144151 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223667))) (currentByte!6286 (_2!6753 lt!223667)) (currentBit!6281 (_2!6753 lt!223667))) (bvadd (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222553))) (currentByte!6286 (_1!6751 lt!222553)) (currentBit!6281 (_1!6751 lt!222553))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!223673 () Unit!8946)

(declare-fun Unit!8990 () Unit!8946)

(assert (=> b!144151 (= lt!223673 Unit!8990)))

(assert (=> b!144151 (= (bvadd (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223667))) (currentByte!6286 (_2!6753 lt!223667)) (currentBit!6281 (_2!6753 lt!223667))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1885)))

(declare-fun lt!223669 () Unit!8946)

(declare-fun Unit!8991 () Unit!8946)

(assert (=> b!144151 (= lt!223669 Unit!8991)))

(assert (=> b!144151 (= (bvadd (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222553))) (currentByte!6286 (_1!6751 lt!222553)) (currentBit!6281 (_1!6751 lt!222553))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1885)))

(declare-fun lt!223661 () Unit!8946)

(declare-fun Unit!8992 () Unit!8946)

(assert (=> b!144151 (= lt!223661 Unit!8992)))

(assert (=> b!144151 (and (= (buf!3402 (_1!6751 lt!222553)) (buf!3402 (_2!6754 lt!223680))) (= (size!2973 arr!237) (size!2973 (_3!341 lt!223680))))))

(declare-fun lt!223678 () Unit!8946)

(declare-fun Unit!8993 () Unit!8946)

(assert (=> b!144151 (= lt!223678 Unit!8993)))

(declare-fun lt!223655 () Unit!8946)

(declare-fun arrayUpdatedAtPrefixLemma!9 (array!6567 (_ BitVec 32) (_ BitVec 8)) Unit!8946)

(assert (=> b!144151 (= lt!223655 (arrayUpdatedAtPrefixLemma!9 arr!237 from!447 (_1!6753 lt!223667)))))

(assert (=> b!144151 (arrayRangesEq!289 arr!237 (array!6568 (store (arr!3696 arr!237) from!447 (_1!6753 lt!223667)) (size!2973 arr!237)) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!223676 () Unit!8946)

(assert (=> b!144151 (= lt!223676 lt!223655)))

(assert (=> b!144151 (= lt!223681 #b00000000000000000000000000000000)))

(declare-fun lt!223679 () Unit!8946)

(declare-fun arrayRangesEqTransitive!49 (array!6567 array!6567 array!6567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!144151 (= lt!223679 (arrayRangesEqTransitive!49 arr!237 lt!223665 (_3!341 lt!223680) lt!223681 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!144151 call!1886))

(declare-fun lt!223677 () Unit!8946)

(assert (=> b!144151 (= lt!223677 lt!223679)))

(assert (=> b!144151 call!1884))

(declare-fun lt!223648 () Unit!8946)

(declare-fun Unit!8994 () Unit!8946)

(assert (=> b!144151 (= lt!223648 Unit!8994)))

(declare-fun lt!223649 () Unit!8946)

(declare-fun arrayRangesEqImpliesEq!9 (array!6567 array!6567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!144151 (= lt!223649 (arrayRangesEqImpliesEq!9 lt!223665 (_3!341 lt!223680) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!144151 (= (select (store (arr!3696 arr!237) from!447 (_1!6753 lt!223667)) from!447) (select (arr!3696 (_3!341 lt!223680)) from!447))))

(declare-fun lt!223658 () Unit!8946)

(assert (=> b!144151 (= lt!223658 lt!223649)))

(declare-fun lt!223682 () Bool)

(assert (=> b!144151 (= lt!223682 (= (select (arr!3696 (_3!341 lt!223680)) from!447) (_1!6753 lt!223667)))))

(declare-fun Unit!8995 () Unit!8946)

(assert (=> b!144151 (= lt!223670 Unit!8995)))

(assert (=> b!144151 lt!223682))

(declare-fun b!144152 () Bool)

(declare-fun e!96026 () Bool)

(assert (=> b!144152 (= e!96026 (arrayRangesEq!289 arr!237 (_3!341 lt!223656) #b00000000000000000000000000000000 from!447))))

(declare-fun d!46227 () Bool)

(assert (=> d!46227 e!96027))

(declare-fun res!120421 () Bool)

(assert (=> d!46227 (=> res!120421 e!96027)))

(assert (=> d!46227 (= res!120421 (bvsge from!447 to!404))))

(declare-fun lt!223675 () Bool)

(assert (=> d!46227 (= lt!223675 e!96026)))

(declare-fun res!120423 () Bool)

(assert (=> d!46227 (=> (not res!120423) (not e!96026))))

(declare-fun lt!223647 () (_ BitVec 64))

(declare-fun lt!223671 () (_ BitVec 64))

(assert (=> d!46227 (= res!120423 (= (bvadd lt!223647 lt!223671) (bitIndex!0 (size!2973 (buf!3402 (_2!6754 lt!223656))) (currentByte!6286 (_2!6754 lt!223656)) (currentBit!6281 (_2!6754 lt!223656)))))))

(assert (=> d!46227 (or (not (= (bvand lt!223647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223671 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223647 lt!223671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!223668 () (_ BitVec 64))

(assert (=> d!46227 (= lt!223671 (bvmul lt!223668 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!46227 (or (= lt!223668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223668)))))

(assert (=> d!46227 (= lt!223668 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!46227 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!46227 (= lt!223647 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222553))) (currentByte!6286 (_1!6751 lt!222553)) (currentBit!6281 (_1!6751 lt!222553))))))

(assert (=> d!46227 (= lt!223656 e!96025)))

(assert (=> d!46227 (= c!7877 (bvslt from!447 to!404))))

(assert (=> d!46227 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2973 arr!237)))))

(assert (=> d!46227 (= (readByteArrayLoop!0 (_1!6751 lt!222553) arr!237 from!447 to!404) lt!223656)))

(declare-fun b!144153 () Bool)

(declare-fun res!120422 () Bool)

(assert (=> b!144153 (=> (not res!120422) (not e!96026))))

(assert (=> b!144153 (= res!120422 (and (= (buf!3402 (_1!6751 lt!222553)) (buf!3402 (_2!6754 lt!223656))) (= (size!2973 arr!237) (size!2973 (_3!341 lt!223656)))))))

(assert (= (and d!46227 c!7877) b!144151))

(assert (= (and d!46227 (not c!7877)) b!144149))

(assert (= (or b!144151 b!144149) bm!1881))

(assert (= (or b!144151 b!144149) bm!1883))

(assert (= (or b!144151 b!144149) bm!1882))

(assert (= (and d!46227 res!120423) b!144153))

(assert (= (and b!144153 res!120422) b!144152))

(assert (= (and d!46227 (not res!120421)) b!144150))

(declare-fun m!221583 () Bool)

(assert (=> b!144150 m!221583))

(assert (=> b!144150 m!220523))

(declare-fun m!221585 () Bool)

(assert (=> bm!1883 m!221585))

(declare-fun m!221587 () Bool)

(assert (=> d!46227 m!221587))

(declare-fun m!221589 () Bool)

(assert (=> d!46227 m!221589))

(declare-fun m!221591 () Bool)

(assert (=> b!144149 m!221591))

(declare-fun m!221593 () Bool)

(assert (=> b!144149 m!221593))

(declare-fun m!221595 () Bool)

(assert (=> b!144151 m!221595))

(assert (=> b!144151 m!220875))

(declare-fun m!221597 () Bool)

(assert (=> b!144151 m!221597))

(declare-fun m!221599 () Bool)

(assert (=> b!144151 m!221599))

(declare-fun m!221601 () Bool)

(assert (=> b!144151 m!221601))

(declare-fun m!221603 () Bool)

(assert (=> b!144151 m!221603))

(declare-fun m!221605 () Bool)

(assert (=> b!144151 m!221605))

(declare-fun m!221607 () Bool)

(assert (=> b!144151 m!221607))

(declare-fun m!221609 () Bool)

(assert (=> b!144151 m!221609))

(assert (=> b!144151 m!221589))

(declare-fun m!221611 () Bool)

(assert (=> b!144151 m!221611))

(declare-fun m!221613 () Bool)

(assert (=> b!144151 m!221613))

(declare-fun m!221615 () Bool)

(assert (=> b!144151 m!221615))

(declare-fun m!221617 () Bool)

(assert (=> bm!1882 m!221617))

(declare-fun m!221619 () Bool)

(assert (=> bm!1881 m!221619))

(declare-fun m!221621 () Bool)

(assert (=> b!144152 m!221621))

(assert (=> d!45920 d!46227))

(declare-fun d!46229 () Bool)

(assert (=> d!46229 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!46229 true))

(declare-fun _$7!70 () Unit!8946)

(assert (=> d!46229 (= (choose!57 thiss!1634 (_2!6752 lt!222539) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!70)))

(declare-fun bs!11329 () Bool)

(assert (= bs!11329 d!46229))

(declare-fun m!221623 () Bool)

(assert (=> bs!11329 m!221623))

(assert (=> d!45932 d!46229))

(declare-fun d!46231 () Bool)

(declare-fun res!120426 () Bool)

(declare-fun e!96029 () Bool)

(assert (=> d!46231 (=> (not res!120426) (not e!96029))))

(assert (=> d!46231 (= res!120426 (= (size!2973 (buf!3402 (_1!6751 lt!222678))) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (=> d!46231 (= (isPrefixOf!0 (_1!6751 lt!222678) (_2!6752 lt!222539)) e!96029)))

(declare-fun b!144154 () Bool)

(declare-fun res!120425 () Bool)

(assert (=> b!144154 (=> (not res!120425) (not e!96029))))

(assert (=> b!144154 (= res!120425 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222678))) (currentByte!6286 (_1!6751 lt!222678)) (currentBit!6281 (_1!6751 lt!222678))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(declare-fun b!144155 () Bool)

(declare-fun e!96028 () Bool)

(assert (=> b!144155 (= e!96029 e!96028)))

(declare-fun res!120424 () Bool)

(assert (=> b!144155 (=> res!120424 e!96028)))

(assert (=> b!144155 (= res!120424 (= (size!2973 (buf!3402 (_1!6751 lt!222678))) #b00000000000000000000000000000000))))

(declare-fun b!144156 () Bool)

(assert (=> b!144156 (= e!96028 (arrayBitRangesEq!0 (buf!3402 (_1!6751 lt!222678)) (buf!3402 (_2!6752 lt!222539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222678))) (currentByte!6286 (_1!6751 lt!222678)) (currentBit!6281 (_1!6751 lt!222678)))))))

(assert (= (and d!46231 res!120426) b!144154))

(assert (= (and b!144154 res!120425) b!144155))

(assert (= (and b!144155 (not res!120424)) b!144156))

(declare-fun m!221625 () Bool)

(assert (=> b!144154 m!221625))

(assert (=> b!144154 m!220561))

(assert (=> b!144156 m!221625))

(assert (=> b!144156 m!221625))

(declare-fun m!221627 () Bool)

(assert (=> b!144156 m!221627))

(assert (=> b!143674 d!46231))

(declare-fun d!46233 () Bool)

(declare-fun lt!223698 () (_ BitVec 8))

(declare-fun lt!223700 () (_ BitVec 8))

(assert (=> d!46233 (= lt!223698 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222548))) (currentByte!6286 (_1!6751 lt!222548)))) ((_ sign_extend 24) lt!223700))))))

(assert (=> d!46233 (= lt!223700 ((_ extract 7 0) (currentBit!6281 (_1!6751 lt!222548))))))

(declare-fun e!96035 () Bool)

(assert (=> d!46233 e!96035))

(declare-fun res!120432 () Bool)

(assert (=> d!46233 (=> (not res!120432) (not e!96035))))

(assert (=> d!46233 (= res!120432 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6751 lt!222548)))) ((_ sign_extend 32) (currentByte!6286 (_1!6751 lt!222548))) ((_ sign_extend 32) (currentBit!6281 (_1!6751 lt!222548))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!12832 0))(
  ( (tuple2!12833 (_1!6762 Unit!8946) (_2!6762 (_ BitVec 8))) )
))
(declare-fun Unit!8996 () Unit!8946)

(declare-fun Unit!8997 () Unit!8946)

(assert (=> d!46233 (= (readByte!0 (_1!6751 lt!222548)) (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223700) #b00000000000000000000000000000000) (tuple2!12833 Unit!8996 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223698) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222548))) (bvadd (currentByte!6286 (_1!6751 lt!222548)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223700)))))))) (tuple2!12833 Unit!8997 lt!223698))) (BitStream!5205 (buf!3402 (_1!6751 lt!222548)) (bvadd (currentByte!6286 (_1!6751 lt!222548)) #b00000000000000000000000000000001) (currentBit!6281 (_1!6751 lt!222548)))))))

(declare-fun b!144161 () Bool)

(declare-fun e!96034 () Bool)

(assert (=> b!144161 (= e!96035 e!96034)))

(declare-fun res!120433 () Bool)

(assert (=> b!144161 (=> (not res!120433) (not e!96034))))

(declare-fun lt!223702 () tuple2!12824)

(assert (=> b!144161 (= res!120433 (= (buf!3402 (_2!6753 lt!223702)) (buf!3402 (_1!6751 lt!222548))))))

(declare-fun lt!223703 () (_ BitVec 8))

(declare-fun lt!223697 () (_ BitVec 8))

(declare-fun Unit!8998 () Unit!8946)

(declare-fun Unit!8999 () Unit!8946)

(assert (=> b!144161 (= lt!223702 (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223697) #b00000000000000000000000000000000) (tuple2!12833 Unit!8998 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223703) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222548))) (bvadd (currentByte!6286 (_1!6751 lt!222548)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223697)))))))) (tuple2!12833 Unit!8999 lt!223703))) (BitStream!5205 (buf!3402 (_1!6751 lt!222548)) (bvadd (currentByte!6286 (_1!6751 lt!222548)) #b00000000000000000000000000000001) (currentBit!6281 (_1!6751 lt!222548)))))))

(assert (=> b!144161 (= lt!223703 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222548))) (currentByte!6286 (_1!6751 lt!222548)))) ((_ sign_extend 24) lt!223697))))))

(assert (=> b!144161 (= lt!223697 ((_ extract 7 0) (currentBit!6281 (_1!6751 lt!222548))))))

(declare-fun b!144162 () Bool)

(declare-fun lt!223699 () (_ BitVec 64))

(declare-fun lt!223701 () (_ BitVec 64))

(assert (=> b!144162 (= e!96034 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223702))) (currentByte!6286 (_2!6753 lt!223702)) (currentBit!6281 (_2!6753 lt!223702))) (bvadd lt!223699 lt!223701)))))

(assert (=> b!144162 (or (not (= (bvand lt!223699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223701 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223699 lt!223701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144162 (= lt!223701 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!144162 (= lt!223699 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222548))) (currentByte!6286 (_1!6751 lt!222548)) (currentBit!6281 (_1!6751 lt!222548))))))

(assert (= (and d!46233 res!120432) b!144161))

(assert (= (and b!144161 res!120433) b!144162))

(declare-fun m!221629 () Bool)

(assert (=> d!46233 m!221629))

(declare-fun m!221631 () Bool)

(assert (=> d!46233 m!221631))

(declare-fun m!221633 () Bool)

(assert (=> d!46233 m!221633))

(assert (=> b!144161 m!221633))

(assert (=> b!144161 m!221629))

(declare-fun m!221635 () Bool)

(assert (=> b!144162 m!221635))

(declare-fun m!221637 () Bool)

(assert (=> b!144162 m!221637))

(assert (=> d!45848 d!46233))

(declare-fun d!46235 () Bool)

(declare-fun e!96036 () Bool)

(assert (=> d!46235 e!96036))

(declare-fun res!120434 () Bool)

(assert (=> d!46235 (=> (not res!120434) (not e!96036))))

(declare-fun lt!223705 () (_ BitVec 64))

(declare-fun lt!223704 () BitStream!5204)

(assert (=> d!46235 (= res!120434 (= (bvadd lt!223705 (bvsub lt!222609 lt!222611)) (bitIndex!0 (size!2973 (buf!3402 lt!223704)) (currentByte!6286 lt!223704) (currentBit!6281 lt!223704))))))

(assert (=> d!46235 (or (not (= (bvand lt!223705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222609 lt!222611) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223705 (bvsub lt!222609 lt!222611)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46235 (= lt!223705 (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222616))) (currentByte!6286 (_2!6751 lt!222616)) (currentBit!6281 (_2!6751 lt!222616))))))

(assert (=> d!46235 (= lt!223704 (_2!6752 (moveBitIndex!0 (_2!6751 lt!222616) (bvsub lt!222609 lt!222611))))))

(assert (=> d!46235 (moveBitIndexPrecond!0 (_2!6751 lt!222616) (bvsub lt!222609 lt!222611))))

(assert (=> d!46235 (= (withMovedBitIndex!0 (_2!6751 lt!222616) (bvsub lt!222609 lt!222611)) lt!223704)))

(declare-fun b!144163 () Bool)

(assert (=> b!144163 (= e!96036 (= (size!2973 (buf!3402 (_2!6751 lt!222616))) (size!2973 (buf!3402 lt!223704))))))

(assert (= (and d!46235 res!120434) b!144163))

(declare-fun m!221639 () Bool)

(assert (=> d!46235 m!221639))

(declare-fun m!221641 () Bool)

(assert (=> d!46235 m!221641))

(declare-fun m!221643 () Bool)

(assert (=> d!46235 m!221643))

(declare-fun m!221645 () Bool)

(assert (=> d!46235 m!221645))

(assert (=> b!143653 d!46235))

(assert (=> b!143653 d!45852))

(assert (=> b!143653 d!45854))

(declare-fun d!46237 () Bool)

(declare-fun e!96037 () Bool)

(assert (=> d!46237 e!96037))

(declare-fun res!120435 () Bool)

(assert (=> d!46237 (=> (not res!120435) (not e!96037))))

(declare-fun lt!223707 () (_ BitVec 64))

(declare-fun lt!223706 () BitStream!5204)

(assert (=> d!46237 (= res!120435 (= (bvadd lt!223707 (bvsub lt!222838 lt!222840)) (bitIndex!0 (size!2973 (buf!3402 lt!223706)) (currentByte!6286 lt!223706) (currentBit!6281 lt!223706))))))

(assert (=> d!46237 (or (not (= (bvand lt!223707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222838 lt!222840) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223707 (bvsub lt!222838 lt!222840)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46237 (= lt!223707 (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222845))) (currentByte!6286 (_2!6751 lt!222845)) (currentBit!6281 (_2!6751 lt!222845))))))

(assert (=> d!46237 (= lt!223706 (_2!6752 (moveBitIndex!0 (_2!6751 lt!222845) (bvsub lt!222838 lt!222840))))))

(assert (=> d!46237 (moveBitIndexPrecond!0 (_2!6751 lt!222845) (bvsub lt!222838 lt!222840))))

(assert (=> d!46237 (= (withMovedBitIndex!0 (_2!6751 lt!222845) (bvsub lt!222838 lt!222840)) lt!223706)))

(declare-fun b!144164 () Bool)

(assert (=> b!144164 (= e!96037 (= (size!2973 (buf!3402 (_2!6751 lt!222845))) (size!2973 (buf!3402 lt!223706))))))

(assert (= (and d!46237 res!120435) b!144164))

(declare-fun m!221647 () Bool)

(assert (=> d!46237 m!221647))

(declare-fun m!221649 () Bool)

(assert (=> d!46237 m!221649))

(declare-fun m!221651 () Bool)

(assert (=> d!46237 m!221651))

(declare-fun m!221653 () Bool)

(assert (=> d!46237 m!221653))

(assert (=> b!143751 d!46237))

(assert (=> b!143751 d!45973))

(assert (=> b!143751 d!45854))

(declare-fun d!46239 () Bool)

(assert (=> d!46239 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222804) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) lt!222804))))

(declare-fun bs!11330 () Bool)

(assert (= bs!11330 d!46239))

(assert (=> bs!11330 m!220623))

(assert (=> b!143741 d!46239))

(declare-fun d!46241 () Bool)

(assert (=> d!46241 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 thiss!1634)))))))

(assert (=> d!45957 d!46241))

(declare-fun d!46243 () Bool)

(declare-fun e!96038 () Bool)

(assert (=> d!46243 e!96038))

(declare-fun res!120436 () Bool)

(assert (=> d!46243 (=> (not res!120436) (not e!96038))))

(declare-fun lt!223711 () (_ BitVec 64))

(declare-fun lt!223712 () (_ BitVec 64))

(declare-fun lt!223708 () (_ BitVec 64))

(assert (=> d!46243 (= res!120436 (= lt!223711 (bvsub lt!223708 lt!223712)))))

(assert (=> d!46243 (or (= (bvand lt!223708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223708 lt!223712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46243 (= lt!223712 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222953)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222953))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222953)))))))

(declare-fun lt!223709 () (_ BitVec 64))

(declare-fun lt!223710 () (_ BitVec 64))

(assert (=> d!46243 (= lt!223708 (bvmul lt!223709 lt!223710))))

(assert (=> d!46243 (or (= lt!223709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223710 (bvsdiv (bvmul lt!223709 lt!223710) lt!223709)))))

(assert (=> d!46243 (= lt!223710 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46243 (= lt!223709 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222953)))))))

(assert (=> d!46243 (= lt!223711 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222953))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222953)))))))

(assert (=> d!46243 (invariant!0 (currentBit!6281 (_2!6752 lt!222953)) (currentByte!6286 (_2!6752 lt!222953)) (size!2973 (buf!3402 (_2!6752 lt!222953))))))

(assert (=> d!46243 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222953))) (currentByte!6286 (_2!6752 lt!222953)) (currentBit!6281 (_2!6752 lt!222953))) lt!223711)))

(declare-fun b!144165 () Bool)

(declare-fun res!120437 () Bool)

(assert (=> b!144165 (=> (not res!120437) (not e!96038))))

(assert (=> b!144165 (= res!120437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223711))))

(declare-fun b!144166 () Bool)

(declare-fun lt!223713 () (_ BitVec 64))

(assert (=> b!144166 (= e!96038 (bvsle lt!223711 (bvmul lt!223713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144166 (or (= lt!223713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223713)))))

(assert (=> b!144166 (= lt!223713 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222953)))))))

(assert (= (and d!46243 res!120436) b!144165))

(assert (= (and b!144165 res!120437) b!144166))

(declare-fun m!221655 () Bool)

(assert (=> d!46243 m!221655))

(declare-fun m!221657 () Bool)

(assert (=> d!46243 m!221657))

(assert (=> b!143797 d!46243))

(assert (=> b!143797 d!45854))

(declare-fun bm!1884 () Bool)

(declare-fun lt!223715 () (_ BitVec 32))

(declare-fun call!1887 () Bool)

(declare-fun lt!223716 () (_ BitVec 32))

(declare-fun c!7878 () Bool)

(declare-fun lt!223714 () tuple4!132)

(assert (=> bm!1884 (= call!1887 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_3!345 lt!223714)) (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_3!345 lt!223714)) lt!223716 (ite c!7878 lt!223715 #b00000000000000000000000000001000)))))

(declare-fun e!96040 () Bool)

(declare-fun b!144167 () Bool)

(assert (=> b!144167 (= e!96040 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_4!66 lt!223714)) (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_4!66 lt!223714)) #b00000000000000000000000000000000 lt!223715))))

(declare-fun e!96043 () Bool)

(declare-fun b!144168 () Bool)

(assert (=> b!144168 (= e!96043 (arrayRangesEq!289 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222545)) (_1!6761 lt!223714) (_2!6761 lt!223714)))))

(declare-fun b!144170 () Bool)

(declare-fun e!96042 () Bool)

(declare-fun e!96039 () Bool)

(assert (=> b!144170 (= e!96042 e!96039)))

(assert (=> b!144170 (= c!7878 (= (_3!345 lt!223714) (_4!66 lt!223714)))))

(declare-fun b!144171 () Bool)

(declare-fun res!120439 () Bool)

(assert (=> b!144171 (= res!120439 (= lt!223715 #b00000000000000000000000000000000))))

(assert (=> b!144171 (=> res!120439 e!96040)))

(declare-fun e!96044 () Bool)

(assert (=> b!144171 (= e!96044 e!96040)))

(declare-fun b!144172 () Bool)

(assert (=> b!144172 (= e!96039 e!96044)))

(declare-fun res!120441 () Bool)

(assert (=> b!144172 (= res!120441 call!1887)))

(assert (=> b!144172 (=> (not res!120441) (not e!96044))))

(declare-fun b!144173 () Bool)

(assert (=> b!144173 (= e!96039 call!1887)))

(declare-fun d!46245 () Bool)

(declare-fun res!120440 () Bool)

(declare-fun e!96041 () Bool)

(assert (=> d!46245 (=> res!120440 e!96041)))

(assert (=> d!46245 (= res!120440 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (=> d!46245 (= (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))) e!96041)))

(declare-fun b!144169 () Bool)

(assert (=> b!144169 (= e!96041 e!96042)))

(declare-fun res!120438 () Bool)

(assert (=> b!144169 (=> (not res!120438) (not e!96042))))

(assert (=> b!144169 (= res!120438 e!96043)))

(declare-fun res!120442 () Bool)

(assert (=> b!144169 (=> res!120442 e!96043)))

(assert (=> b!144169 (= res!120442 (bvsge (_1!6761 lt!223714) (_2!6761 lt!223714)))))

(assert (=> b!144169 (= lt!223715 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144169 (= lt!223716 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144169 (= lt!223714 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (= (and d!46245 (not res!120440)) b!144169))

(assert (= (and b!144169 (not res!120442)) b!144168))

(assert (= (and b!144169 res!120438) b!144170))

(assert (= (and b!144170 c!7878) b!144173))

(assert (= (and b!144170 (not c!7878)) b!144172))

(assert (= (and b!144172 res!120441) b!144171))

(assert (= (and b!144171 (not res!120439)) b!144167))

(assert (= (or b!144173 b!144172) bm!1884))

(declare-fun m!221659 () Bool)

(assert (=> bm!1884 m!221659))

(declare-fun m!221661 () Bool)

(assert (=> bm!1884 m!221661))

(assert (=> bm!1884 m!221659))

(assert (=> bm!1884 m!221661))

(declare-fun m!221663 () Bool)

(assert (=> bm!1884 m!221663))

(declare-fun m!221665 () Bool)

(assert (=> b!144167 m!221665))

(declare-fun m!221667 () Bool)

(assert (=> b!144167 m!221667))

(assert (=> b!144167 m!221665))

(assert (=> b!144167 m!221667))

(declare-fun m!221669 () Bool)

(assert (=> b!144167 m!221669))

(declare-fun m!221671 () Bool)

(assert (=> b!144168 m!221671))

(assert (=> b!144169 m!220561))

(declare-fun m!221673 () Bool)

(assert (=> b!144169 m!221673))

(assert (=> b!143699 d!46245))

(assert (=> b!143699 d!45852))

(declare-fun d!46247 () Bool)

(declare-fun res!120445 () Bool)

(declare-fun e!96046 () Bool)

(assert (=> d!46247 (=> (not res!120445) (not e!96046))))

(assert (=> d!46247 (= res!120445 (= (size!2973 (buf!3402 (_1!6751 lt!222616))) (size!2973 (buf!3402 thiss!1634))))))

(assert (=> d!46247 (= (isPrefixOf!0 (_1!6751 lt!222616) thiss!1634) e!96046)))

(declare-fun b!144174 () Bool)

(declare-fun res!120444 () Bool)

(assert (=> b!144174 (=> (not res!120444) (not e!96046))))

(assert (=> b!144174 (= res!120444 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222616))) (currentByte!6286 (_1!6751 lt!222616)) (currentBit!6281 (_1!6751 lt!222616))) (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(declare-fun b!144175 () Bool)

(declare-fun e!96045 () Bool)

(assert (=> b!144175 (= e!96046 e!96045)))

(declare-fun res!120443 () Bool)

(assert (=> b!144175 (=> res!120443 e!96045)))

(assert (=> b!144175 (= res!120443 (= (size!2973 (buf!3402 (_1!6751 lt!222616))) #b00000000000000000000000000000000))))

(declare-fun b!144176 () Bool)

(assert (=> b!144176 (= e!96045 (arrayBitRangesEq!0 (buf!3402 (_1!6751 lt!222616)) (buf!3402 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222616))) (currentByte!6286 (_1!6751 lt!222616)) (currentBit!6281 (_1!6751 lt!222616)))))))

(assert (= (and d!46247 res!120445) b!144174))

(assert (= (and b!144174 res!120444) b!144175))

(assert (= (and b!144175 (not res!120443)) b!144176))

(declare-fun m!221675 () Bool)

(assert (=> b!144174 m!221675))

(assert (=> b!144174 m!220563))

(assert (=> b!144176 m!221675))

(assert (=> b!144176 m!221675))

(declare-fun m!221677 () Bool)

(assert (=> b!144176 m!221677))

(assert (=> b!143651 d!46247))

(declare-fun d!46249 () Bool)

(assert (=> d!46249 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))))))))

(assert (=> d!45935 d!46249))

(declare-fun d!46251 () Bool)

(declare-fun res!120448 () Bool)

(declare-fun e!96048 () Bool)

(assert (=> d!46251 (=> (not res!120448) (not e!96048))))

(assert (=> d!46251 (= res!120448 (= (size!2973 (buf!3402 (_1!6751 lt!222845))) (size!2973 (buf!3402 thiss!1634))))))

(assert (=> d!46251 (= (isPrefixOf!0 (_1!6751 lt!222845) thiss!1634) e!96048)))

(declare-fun b!144177 () Bool)

(declare-fun res!120447 () Bool)

(assert (=> b!144177 (=> (not res!120447) (not e!96048))))

(assert (=> b!144177 (= res!120447 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222845))) (currentByte!6286 (_1!6751 lt!222845)) (currentBit!6281 (_1!6751 lt!222845))) (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(declare-fun b!144178 () Bool)

(declare-fun e!96047 () Bool)

(assert (=> b!144178 (= e!96048 e!96047)))

(declare-fun res!120446 () Bool)

(assert (=> b!144178 (=> res!120446 e!96047)))

(assert (=> b!144178 (= res!120446 (= (size!2973 (buf!3402 (_1!6751 lt!222845))) #b00000000000000000000000000000000))))

(declare-fun b!144179 () Bool)

(assert (=> b!144179 (= e!96047 (arrayBitRangesEq!0 (buf!3402 (_1!6751 lt!222845)) (buf!3402 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222845))) (currentByte!6286 (_1!6751 lt!222845)) (currentBit!6281 (_1!6751 lt!222845)))))))

(assert (= (and d!46251 res!120448) b!144177))

(assert (= (and b!144177 res!120447) b!144178))

(assert (= (and b!144178 (not res!120446)) b!144179))

(declare-fun m!221679 () Bool)

(assert (=> b!144177 m!221679))

(assert (=> b!144177 m!220563))

(assert (=> b!144179 m!221679))

(assert (=> b!144179 m!221679))

(declare-fun m!221681 () Bool)

(assert (=> b!144179 m!221681))

(assert (=> b!143749 d!46251))

(declare-fun d!46253 () Bool)

(declare-fun res!120451 () Bool)

(declare-fun e!96050 () Bool)

(assert (=> d!46253 (=> (not res!120451) (not e!96050))))

(assert (=> d!46253 (= res!120451 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 lt!222808)))))))

(assert (=> d!46253 (= (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222808)) e!96050)))

(declare-fun b!144180 () Bool)

(declare-fun res!120450 () Bool)

(assert (=> b!144180 (=> (not res!120450) (not e!96050))))

(assert (=> b!144180 (= res!120450 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222808))) (currentByte!6286 (_2!6752 lt!222808)) (currentBit!6281 (_2!6752 lt!222808)))))))

(declare-fun b!144181 () Bool)

(declare-fun e!96049 () Bool)

(assert (=> b!144181 (= e!96050 e!96049)))

(declare-fun res!120449 () Bool)

(assert (=> b!144181 (=> res!120449 e!96049)))

(assert (=> b!144181 (= res!120449 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) #b00000000000000000000000000000000))))

(declare-fun b!144182 () Bool)

(assert (=> b!144182 (= e!96049 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222808)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (= (and d!46253 res!120451) b!144180))

(assert (= (and b!144180 res!120450) b!144181))

(assert (= (and b!144181 (not res!120449)) b!144182))

(assert (=> b!144180 m!220561))

(assert (=> b!144180 m!220741))

(assert (=> b!144182 m!220561))

(assert (=> b!144182 m!220561))

(declare-fun m!221683 () Bool)

(assert (=> b!144182 m!221683))

(assert (=> b!143739 d!46253))

(declare-fun d!46255 () Bool)

(declare-fun lt!223717 () tuple2!12824)

(assert (=> d!46255 (= lt!223717 (readByte!0 (_1!6751 lt!222950)))))

(assert (=> d!46255 (= (readBytePure!0 (_1!6751 lt!222950)) (tuple2!12817 (_2!6753 lt!223717) (_1!6753 lt!223717)))))

(declare-fun bs!11331 () Bool)

(assert (= bs!11331 d!46255))

(declare-fun m!221685 () Bool)

(assert (=> bs!11331 m!221685))

(assert (=> b!143799 d!46255))

(declare-fun b!144183 () Bool)

(declare-fun res!120452 () Bool)

(declare-fun e!96052 () Bool)

(assert (=> b!144183 (=> (not res!120452) (not e!96052))))

(declare-fun lt!223737 () tuple2!12820)

(assert (=> b!144183 (= res!120452 (isPrefixOf!0 (_2!6751 lt!223737) (_2!6752 lt!222953)))))

(declare-fun b!144184 () Bool)

(declare-fun res!120454 () Bool)

(assert (=> b!144184 (=> (not res!120454) (not e!96052))))

(assert (=> b!144184 (= res!120454 (isPrefixOf!0 (_1!6751 lt!223737) thiss!1634))))

(declare-fun b!144185 () Bool)

(declare-fun e!96051 () Unit!8946)

(declare-fun lt!223736 () Unit!8946)

(assert (=> b!144185 (= e!96051 lt!223736)))

(declare-fun lt!223720 () (_ BitVec 64))

(assert (=> b!144185 (= lt!223720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223721 () (_ BitVec 64))

(assert (=> b!144185 (= lt!223721 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(assert (=> b!144185 (= lt!223736 (arrayBitRangesEqSymmetric!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222953)) lt!223720 lt!223721))))

(assert (=> b!144185 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222953)) (buf!3402 thiss!1634) lt!223720 lt!223721)))

(declare-fun b!144186 () Bool)

(declare-fun lt!223732 () (_ BitVec 64))

(declare-fun lt!223730 () (_ BitVec 64))

(assert (=> b!144186 (= e!96052 (= (_1!6751 lt!223737) (withMovedBitIndex!0 (_2!6751 lt!223737) (bvsub lt!223730 lt!223732))))))

(assert (=> b!144186 (or (= (bvand lt!223730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223730 lt!223732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144186 (= lt!223732 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222953))) (currentByte!6286 (_2!6752 lt!222953)) (currentBit!6281 (_2!6752 lt!222953))))))

(assert (=> b!144186 (= lt!223730 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(declare-fun d!46257 () Bool)

(assert (=> d!46257 e!96052))

(declare-fun res!120453 () Bool)

(assert (=> d!46257 (=> (not res!120453) (not e!96052))))

(assert (=> d!46257 (= res!120453 (isPrefixOf!0 (_1!6751 lt!223737) (_2!6751 lt!223737)))))

(declare-fun lt!223735 () BitStream!5204)

(assert (=> d!46257 (= lt!223737 (tuple2!12821 lt!223735 (_2!6752 lt!222953)))))

(declare-fun lt!223734 () Unit!8946)

(declare-fun lt!223723 () Unit!8946)

(assert (=> d!46257 (= lt!223734 lt!223723)))

(assert (=> d!46257 (isPrefixOf!0 lt!223735 (_2!6752 lt!222953))))

(assert (=> d!46257 (= lt!223723 (lemmaIsPrefixTransitive!0 lt!223735 (_2!6752 lt!222953) (_2!6752 lt!222953)))))

(declare-fun lt!223731 () Unit!8946)

(declare-fun lt!223726 () Unit!8946)

(assert (=> d!46257 (= lt!223731 lt!223726)))

(assert (=> d!46257 (isPrefixOf!0 lt!223735 (_2!6752 lt!222953))))

(assert (=> d!46257 (= lt!223726 (lemmaIsPrefixTransitive!0 lt!223735 thiss!1634 (_2!6752 lt!222953)))))

(declare-fun lt!223725 () Unit!8946)

(assert (=> d!46257 (= lt!223725 e!96051)))

(declare-fun c!7879 () Bool)

(assert (=> d!46257 (= c!7879 (not (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!223722 () Unit!8946)

(declare-fun lt!223718 () Unit!8946)

(assert (=> d!46257 (= lt!223722 lt!223718)))

(assert (=> d!46257 (isPrefixOf!0 (_2!6752 lt!222953) (_2!6752 lt!222953))))

(assert (=> d!46257 (= lt!223718 (lemmaIsPrefixRefl!0 (_2!6752 lt!222953)))))

(declare-fun lt!223724 () Unit!8946)

(declare-fun lt!223728 () Unit!8946)

(assert (=> d!46257 (= lt!223724 lt!223728)))

(assert (=> d!46257 (= lt!223728 (lemmaIsPrefixRefl!0 (_2!6752 lt!222953)))))

(declare-fun lt!223719 () Unit!8946)

(declare-fun lt!223727 () Unit!8946)

(assert (=> d!46257 (= lt!223719 lt!223727)))

(assert (=> d!46257 (isPrefixOf!0 lt!223735 lt!223735)))

(assert (=> d!46257 (= lt!223727 (lemmaIsPrefixRefl!0 lt!223735))))

(declare-fun lt!223729 () Unit!8946)

(declare-fun lt!223733 () Unit!8946)

(assert (=> d!46257 (= lt!223729 lt!223733)))

(assert (=> d!46257 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46257 (= lt!223733 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46257 (= lt!223735 (BitStream!5205 (buf!3402 (_2!6752 lt!222953)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))

(assert (=> d!46257 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222953))))

(assert (=> d!46257 (= (reader!0 thiss!1634 (_2!6752 lt!222953)) lt!223737)))

(declare-fun b!144187 () Bool)

(declare-fun Unit!9000 () Unit!8946)

(assert (=> b!144187 (= e!96051 Unit!9000)))

(assert (= (and d!46257 c!7879) b!144185))

(assert (= (and d!46257 (not c!7879)) b!144187))

(assert (= (and d!46257 res!120453) b!144184))

(assert (= (and b!144184 res!120454) b!144183))

(assert (= (and b!144183 res!120452) b!144186))

(declare-fun m!221687 () Bool)

(assert (=> b!144183 m!221687))

(declare-fun m!221689 () Bool)

(assert (=> b!144186 m!221689))

(assert (=> b!144186 m!220843))

(assert (=> b!144186 m!220563))

(assert (=> b!144185 m!220563))

(declare-fun m!221691 () Bool)

(assert (=> b!144185 m!221691))

(declare-fun m!221693 () Bool)

(assert (=> b!144185 m!221693))

(assert (=> d!46257 m!220845))

(declare-fun m!221695 () Bool)

(assert (=> d!46257 m!221695))

(declare-fun m!221697 () Bool)

(assert (=> d!46257 m!221697))

(declare-fun m!221699 () Bool)

(assert (=> d!46257 m!221699))

(declare-fun m!221701 () Bool)

(assert (=> d!46257 m!221701))

(declare-fun m!221703 () Bool)

(assert (=> d!46257 m!221703))

(declare-fun m!221705 () Bool)

(assert (=> d!46257 m!221705))

(declare-fun m!221707 () Bool)

(assert (=> d!46257 m!221707))

(assert (=> d!46257 m!220615))

(declare-fun m!221709 () Bool)

(assert (=> d!46257 m!221709))

(assert (=> d!46257 m!220619))

(declare-fun m!221711 () Bool)

(assert (=> b!144184 m!221711))

(assert (=> b!143799 d!46257))

(assert (=> b!143697 d!45852))

(assert (=> b!143697 d!45973))

(declare-fun d!46259 () Bool)

(assert (=> d!46259 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) (bvsub (bvsub to!404 from!447) lt!222894)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!222894)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222539)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11332 () Bool)

(assert (= bs!11332 d!46259))

(assert (=> bs!11332 m!220623))

(assert (=> b!143765 d!46259))

(declare-fun d!46261 () Bool)

(assert (=> d!46261 (isPrefixOf!0 lt!222614 lt!222614)))

(declare-fun lt!223740 () Unit!8946)

(declare-fun choose!11 (BitStream!5204) Unit!8946)

(assert (=> d!46261 (= lt!223740 (choose!11 lt!222614))))

(assert (=> d!46261 (= (lemmaIsPrefixRefl!0 lt!222614) lt!223740)))

(declare-fun bs!11334 () Bool)

(assert (= bs!11334 d!46261))

(assert (=> bs!11334 m!220611))

(declare-fun m!221713 () Bool)

(assert (=> bs!11334 m!221713))

(assert (=> d!45850 d!46261))

(assert (=> d!45850 d!45894))

(declare-fun d!46263 () Bool)

(assert (=> d!46263 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222539))))

(declare-fun lt!223741 () Unit!8946)

(assert (=> d!46263 (= lt!223741 (choose!11 (_2!6752 lt!222539)))))

(assert (=> d!46263 (= (lemmaIsPrefixRefl!0 (_2!6752 lt!222539)) lt!223741)))

(declare-fun bs!11335 () Bool)

(assert (= bs!11335 d!46263))

(assert (=> bs!11335 m!220617))

(declare-fun m!221715 () Bool)

(assert (=> bs!11335 m!221715))

(assert (=> d!45850 d!46263))

(declare-fun d!46265 () Bool)

(declare-fun res!120457 () Bool)

(declare-fun e!96054 () Bool)

(assert (=> d!46265 (=> (not res!120457) (not e!96054))))

(assert (=> d!46265 (= res!120457 (= (size!2973 (buf!3402 lt!222614)) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (=> d!46265 (= (isPrefixOf!0 lt!222614 (_2!6752 lt!222539)) e!96054)))

(declare-fun b!144188 () Bool)

(declare-fun res!120456 () Bool)

(assert (=> b!144188 (=> (not res!120456) (not e!96054))))

(assert (=> b!144188 (= res!120456 (bvsle (bitIndex!0 (size!2973 (buf!3402 lt!222614)) (currentByte!6286 lt!222614) (currentBit!6281 lt!222614)) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(declare-fun b!144189 () Bool)

(declare-fun e!96053 () Bool)

(assert (=> b!144189 (= e!96054 e!96053)))

(declare-fun res!120455 () Bool)

(assert (=> b!144189 (=> res!120455 e!96053)))

(assert (=> b!144189 (= res!120455 (= (size!2973 (buf!3402 lt!222614)) #b00000000000000000000000000000000))))

(declare-fun b!144190 () Bool)

(assert (=> b!144190 (= e!96053 (arrayBitRangesEq!0 (buf!3402 lt!222614) (buf!3402 (_2!6752 lt!222539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 lt!222614)) (currentByte!6286 lt!222614) (currentBit!6281 lt!222614))))))

(assert (= (and d!46265 res!120457) b!144188))

(assert (= (and b!144188 res!120456) b!144189))

(assert (= (and b!144189 (not res!120455)) b!144190))

(declare-fun m!221717 () Bool)

(assert (=> b!144188 m!221717))

(assert (=> b!144188 m!220561))

(assert (=> b!144190 m!221717))

(assert (=> b!144190 m!221717))

(declare-fun m!221719 () Bool)

(assert (=> b!144190 m!221719))

(assert (=> d!45850 d!46265))

(declare-fun d!46267 () Bool)

(declare-fun res!120460 () Bool)

(declare-fun e!96056 () Bool)

(assert (=> d!46267 (=> (not res!120460) (not e!96056))))

(assert (=> d!46267 (= res!120460 (= (size!2973 (buf!3402 (_1!6751 lt!222616))) (size!2973 (buf!3402 (_2!6751 lt!222616)))))))

(assert (=> d!46267 (= (isPrefixOf!0 (_1!6751 lt!222616) (_2!6751 lt!222616)) e!96056)))

(declare-fun b!144191 () Bool)

(declare-fun res!120459 () Bool)

(assert (=> b!144191 (=> (not res!120459) (not e!96056))))

(assert (=> b!144191 (= res!120459 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222616))) (currentByte!6286 (_1!6751 lt!222616)) (currentBit!6281 (_1!6751 lt!222616))) (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222616))) (currentByte!6286 (_2!6751 lt!222616)) (currentBit!6281 (_2!6751 lt!222616)))))))

(declare-fun b!144192 () Bool)

(declare-fun e!96055 () Bool)

(assert (=> b!144192 (= e!96056 e!96055)))

(declare-fun res!120458 () Bool)

(assert (=> b!144192 (=> res!120458 e!96055)))

(assert (=> b!144192 (= res!120458 (= (size!2973 (buf!3402 (_1!6751 lt!222616))) #b00000000000000000000000000000000))))

(declare-fun b!144193 () Bool)

(assert (=> b!144193 (= e!96055 (arrayBitRangesEq!0 (buf!3402 (_1!6751 lt!222616)) (buf!3402 (_2!6751 lt!222616)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222616))) (currentByte!6286 (_1!6751 lt!222616)) (currentBit!6281 (_1!6751 lt!222616)))))))

(assert (= (and d!46267 res!120460) b!144191))

(assert (= (and b!144191 res!120459) b!144192))

(assert (= (and b!144192 (not res!120458)) b!144193))

(assert (=> b!144191 m!221675))

(assert (=> b!144191 m!221641))

(assert (=> b!144193 m!221675))

(assert (=> b!144193 m!221675))

(declare-fun m!221721 () Bool)

(assert (=> b!144193 m!221721))

(assert (=> d!45850 d!46267))

(declare-fun d!46269 () Bool)

(assert (=> d!46269 (isPrefixOf!0 lt!222614 (_2!6752 lt!222539))))

(declare-fun lt!223742 () Unit!8946)

(assert (=> d!46269 (= lt!223742 (choose!30 lt!222614 (_2!6752 lt!222539) (_2!6752 lt!222539)))))

(assert (=> d!46269 (isPrefixOf!0 lt!222614 (_2!6752 lt!222539))))

(assert (=> d!46269 (= (lemmaIsPrefixTransitive!0 lt!222614 (_2!6752 lt!222539) (_2!6752 lt!222539)) lt!223742)))

(declare-fun bs!11336 () Bool)

(assert (= bs!11336 d!46269))

(assert (=> bs!11336 m!220605))

(declare-fun m!221723 () Bool)

(assert (=> bs!11336 m!221723))

(assert (=> bs!11336 m!220605))

(assert (=> d!45850 d!46269))

(declare-fun d!46271 () Bool)

(declare-fun res!120463 () Bool)

(declare-fun e!96058 () Bool)

(assert (=> d!46271 (=> (not res!120463) (not e!96058))))

(assert (=> d!46271 (= res!120463 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 thiss!1634))))))

(assert (=> d!46271 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!96058)))

(declare-fun b!144194 () Bool)

(declare-fun res!120462 () Bool)

(assert (=> b!144194 (=> (not res!120462) (not e!96058))))

(assert (=> b!144194 (= res!120462 (bvsle (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(declare-fun b!144195 () Bool)

(declare-fun e!96057 () Bool)

(assert (=> b!144195 (= e!96058 e!96057)))

(declare-fun res!120461 () Bool)

(assert (=> b!144195 (=> res!120461 e!96057)))

(assert (=> b!144195 (= res!120461 (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!144196 () Bool)

(assert (=> b!144196 (= e!96057 (arrayBitRangesEq!0 (buf!3402 thiss!1634) (buf!3402 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (= (and d!46271 res!120463) b!144194))

(assert (= (and b!144194 res!120462) b!144195))

(assert (= (and b!144195 (not res!120461)) b!144196))

(assert (=> b!144194 m!220563))

(assert (=> b!144194 m!220563))

(assert (=> b!144196 m!220563))

(assert (=> b!144196 m!220563))

(declare-fun m!221725 () Bool)

(assert (=> b!144196 m!221725))

(assert (=> d!45850 d!46271))

(declare-fun d!46273 () Bool)

(declare-fun res!120466 () Bool)

(declare-fun e!96060 () Bool)

(assert (=> d!46273 (=> (not res!120466) (not e!96060))))

(assert (=> d!46273 (= res!120466 (= (size!2973 (buf!3402 lt!222614)) (size!2973 (buf!3402 lt!222614))))))

(assert (=> d!46273 (= (isPrefixOf!0 lt!222614 lt!222614) e!96060)))

(declare-fun b!144197 () Bool)

(declare-fun res!120465 () Bool)

(assert (=> b!144197 (=> (not res!120465) (not e!96060))))

(assert (=> b!144197 (= res!120465 (bvsle (bitIndex!0 (size!2973 (buf!3402 lt!222614)) (currentByte!6286 lt!222614) (currentBit!6281 lt!222614)) (bitIndex!0 (size!2973 (buf!3402 lt!222614)) (currentByte!6286 lt!222614) (currentBit!6281 lt!222614))))))

(declare-fun b!144198 () Bool)

(declare-fun e!96059 () Bool)

(assert (=> b!144198 (= e!96060 e!96059)))

(declare-fun res!120464 () Bool)

(assert (=> b!144198 (=> res!120464 e!96059)))

(assert (=> b!144198 (= res!120464 (= (size!2973 (buf!3402 lt!222614)) #b00000000000000000000000000000000))))

(declare-fun b!144199 () Bool)

(assert (=> b!144199 (= e!96059 (arrayBitRangesEq!0 (buf!3402 lt!222614) (buf!3402 lt!222614) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 lt!222614)) (currentByte!6286 lt!222614) (currentBit!6281 lt!222614))))))

(assert (= (and d!46273 res!120466) b!144197))

(assert (= (and b!144197 res!120465) b!144198))

(assert (= (and b!144198 (not res!120464)) b!144199))

(assert (=> b!144197 m!221717))

(assert (=> b!144197 m!221717))

(assert (=> b!144199 m!221717))

(assert (=> b!144199 m!221717))

(declare-fun m!221727 () Bool)

(assert (=> b!144199 m!221727))

(assert (=> d!45850 d!46273))

(declare-fun d!46275 () Bool)

(assert (=> d!46275 (isPrefixOf!0 lt!222614 (_2!6752 lt!222539))))

(declare-fun lt!223743 () Unit!8946)

(assert (=> d!46275 (= lt!223743 (choose!30 lt!222614 thiss!1634 (_2!6752 lt!222539)))))

(assert (=> d!46275 (isPrefixOf!0 lt!222614 thiss!1634)))

(assert (=> d!46275 (= (lemmaIsPrefixTransitive!0 lt!222614 thiss!1634 (_2!6752 lt!222539)) lt!223743)))

(declare-fun bs!11337 () Bool)

(assert (= bs!11337 d!46275))

(assert (=> bs!11337 m!220605))

(declare-fun m!221729 () Bool)

(assert (=> bs!11337 m!221729))

(declare-fun m!221731 () Bool)

(assert (=> bs!11337 m!221731))

(assert (=> d!45850 d!46275))

(declare-fun d!46277 () Bool)

(declare-fun res!120469 () Bool)

(declare-fun e!96062 () Bool)

(assert (=> d!46277 (=> (not res!120469) (not e!96062))))

(assert (=> d!46277 (= res!120469 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (=> d!46277 (= (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222539)) e!96062)))

(declare-fun b!144200 () Bool)

(declare-fun res!120468 () Bool)

(assert (=> b!144200 (=> (not res!120468) (not e!96062))))

(assert (=> b!144200 (= res!120468 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(declare-fun b!144201 () Bool)

(declare-fun e!96061 () Bool)

(assert (=> b!144201 (= e!96062 e!96061)))

(declare-fun res!120467 () Bool)

(assert (=> b!144201 (=> res!120467 e!96061)))

(assert (=> b!144201 (= res!120467 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) #b00000000000000000000000000000000))))

(declare-fun b!144202 () Bool)

(assert (=> b!144202 (= e!96061 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (= (and d!46277 res!120469) b!144200))

(assert (= (and b!144200 res!120468) b!144201))

(assert (= (and b!144201 (not res!120467)) b!144202))

(assert (=> b!144200 m!220561))

(assert (=> b!144200 m!220561))

(assert (=> b!144202 m!220561))

(assert (=> b!144202 m!220561))

(declare-fun m!221733 () Bool)

(assert (=> b!144202 m!221733))

(assert (=> d!45850 d!46277))

(declare-fun d!46279 () Bool)

(assert (=> d!46279 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!223744 () Unit!8946)

(assert (=> d!46279 (= lt!223744 (choose!11 thiss!1634))))

(assert (=> d!46279 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!223744)))

(declare-fun bs!11338 () Bool)

(assert (= bs!11338 d!46279))

(assert (=> bs!11338 m!220619))

(declare-fun m!221735 () Bool)

(assert (=> bs!11338 m!221735))

(assert (=> d!45850 d!46279))

(declare-fun d!46281 () Bool)

(assert (=> d!46281 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222545))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222545)))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222545))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222545))))))))

(assert (=> d!45973 d!46281))

(declare-fun d!46283 () Bool)

(assert (=> d!46283 (= (invariant!0 (currentBit!6281 (_2!6752 lt!222545)) (currentByte!6286 (_2!6752 lt!222545)) (size!2973 (buf!3402 (_2!6752 lt!222545)))) (and (bvsge (currentBit!6281 (_2!6752 lt!222545)) #b00000000000000000000000000000000) (bvslt (currentBit!6281 (_2!6752 lt!222545)) #b00000000000000000000000000001000) (bvsge (currentByte!6286 (_2!6752 lt!222545)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6286 (_2!6752 lt!222545)) (size!2973 (buf!3402 (_2!6752 lt!222545)))) (and (= (currentBit!6281 (_2!6752 lt!222545)) #b00000000000000000000000000000000) (= (currentByte!6286 (_2!6752 lt!222545)) (size!2973 (buf!3402 (_2!6752 lt!222545))))))))))

(assert (=> d!45973 d!46283))

(assert (=> d!45882 d!45876))

(declare-fun d!46285 () Bool)

(assert (=> d!46285 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 thiss!1634)))))))

(assert (=> d!45862 d!46285))

(declare-fun d!46287 () Bool)

(assert (=> d!46287 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222543)))) ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222543))) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222543)))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222543)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222543))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222543))))))))

(assert (=> d!45926 d!46287))

(declare-fun d!46289 () Bool)

(assert (=> d!46289 (= (invariant!0 (currentBit!6281 (_1!6749 lt!222543)) (currentByte!6286 (_1!6749 lt!222543)) (size!2973 (buf!3402 (_1!6749 lt!222543)))) (and (bvsge (currentBit!6281 (_1!6749 lt!222543)) #b00000000000000000000000000000000) (bvslt (currentBit!6281 (_1!6749 lt!222543)) #b00000000000000000000000000001000) (bvsge (currentByte!6286 (_1!6749 lt!222543)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6286 (_1!6749 lt!222543)) (size!2973 (buf!3402 (_1!6749 lt!222543)))) (and (= (currentBit!6281 (_1!6749 lt!222543)) #b00000000000000000000000000000000) (= (currentByte!6286 (_1!6749 lt!222543)) (size!2973 (buf!3402 (_1!6749 lt!222543))))))))))

(assert (=> d!45926 d!46289))

(declare-fun d!46291 () Bool)

(declare-fun lt!223746 () (_ BitVec 8))

(declare-fun lt!223748 () (_ BitVec 8))

(assert (=> d!46291 (= lt!223746 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222553))) (currentByte!6286 (_1!6751 lt!222553)))) ((_ sign_extend 24) lt!223748))))))

(assert (=> d!46291 (= lt!223748 ((_ extract 7 0) (currentBit!6281 (_1!6751 lt!222553))))))

(declare-fun e!96064 () Bool)

(assert (=> d!46291 e!96064))

(declare-fun res!120470 () Bool)

(assert (=> d!46291 (=> (not res!120470) (not e!96064))))

(assert (=> d!46291 (= res!120470 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6751 lt!222553)))) ((_ sign_extend 32) (currentByte!6286 (_1!6751 lt!222553))) ((_ sign_extend 32) (currentBit!6281 (_1!6751 lt!222553))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9001 () Unit!8946)

(declare-fun Unit!9002 () Unit!8946)

(assert (=> d!46291 (= (readByte!0 (_1!6751 lt!222553)) (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223748) #b00000000000000000000000000000000) (tuple2!12833 Unit!9001 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223746) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222553))) (bvadd (currentByte!6286 (_1!6751 lt!222553)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223748)))))))) (tuple2!12833 Unit!9002 lt!223746))) (BitStream!5205 (buf!3402 (_1!6751 lt!222553)) (bvadd (currentByte!6286 (_1!6751 lt!222553)) #b00000000000000000000000000000001) (currentBit!6281 (_1!6751 lt!222553)))))))

(declare-fun b!144203 () Bool)

(declare-fun e!96063 () Bool)

(assert (=> b!144203 (= e!96064 e!96063)))

(declare-fun res!120471 () Bool)

(assert (=> b!144203 (=> (not res!120471) (not e!96063))))

(declare-fun lt!223750 () tuple2!12824)

(assert (=> b!144203 (= res!120471 (= (buf!3402 (_2!6753 lt!223750)) (buf!3402 (_1!6751 lt!222553))))))

(declare-fun lt!223745 () (_ BitVec 8))

(declare-fun lt!223751 () (_ BitVec 8))

(declare-fun Unit!9003 () Unit!8946)

(declare-fun Unit!9004 () Unit!8946)

(assert (=> b!144203 (= lt!223750 (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223745) #b00000000000000000000000000000000) (tuple2!12833 Unit!9003 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223751) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222553))) (bvadd (currentByte!6286 (_1!6751 lt!222553)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223745)))))))) (tuple2!12833 Unit!9004 lt!223751))) (BitStream!5205 (buf!3402 (_1!6751 lt!222553)) (bvadd (currentByte!6286 (_1!6751 lt!222553)) #b00000000000000000000000000000001) (currentBit!6281 (_1!6751 lt!222553)))))))

(assert (=> b!144203 (= lt!223751 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 (_1!6751 lt!222553))) (currentByte!6286 (_1!6751 lt!222553)))) ((_ sign_extend 24) lt!223745))))))

(assert (=> b!144203 (= lt!223745 ((_ extract 7 0) (currentBit!6281 (_1!6751 lt!222553))))))

(declare-fun b!144204 () Bool)

(declare-fun lt!223747 () (_ BitVec 64))

(declare-fun lt!223749 () (_ BitVec 64))

(assert (=> b!144204 (= e!96063 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223750))) (currentByte!6286 (_2!6753 lt!223750)) (currentBit!6281 (_2!6753 lt!223750))) (bvadd lt!223747 lt!223749)))))

(assert (=> b!144204 (or (not (= (bvand lt!223747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223749 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223747 lt!223749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144204 (= lt!223749 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!144204 (= lt!223747 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222553))) (currentByte!6286 (_1!6751 lt!222553)) (currentBit!6281 (_1!6751 lt!222553))))))

(assert (= (and d!46291 res!120470) b!144203))

(assert (= (and b!144203 res!120471) b!144204))

(declare-fun m!221737 () Bool)

(assert (=> d!46291 m!221737))

(declare-fun m!221739 () Bool)

(assert (=> d!46291 m!221739))

(declare-fun m!221741 () Bool)

(assert (=> d!46291 m!221741))

(assert (=> b!144203 m!221741))

(assert (=> b!144203 m!221737))

(declare-fun m!221743 () Bool)

(assert (=> b!144204 m!221743))

(assert (=> b!144204 m!221589))

(assert (=> d!45971 d!46291))

(declare-fun d!46293 () Bool)

(assert (=> d!46293 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))))))))

(assert (=> d!45866 d!46293))

(declare-fun b!144215 () Bool)

(declare-fun res!120480 () Bool)

(declare-fun e!96076 () Bool)

(assert (=> b!144215 (=> (not res!120480) (not e!96076))))

(declare-fun _$39!39 () tuple2!12822)

(assert (=> b!144215 (= res!120480 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 _$39!39)))))

(declare-fun b!144216 () Bool)

(declare-fun e!96075 () Bool)

(assert (=> b!144216 (= e!96076 e!96075)))

(declare-fun res!120483 () Bool)

(assert (=> b!144216 (=> (not res!120483) (not e!96075))))

(declare-fun lt!223762 () tuple2!12818)

(declare-fun lt!223766 () tuple2!12820)

(assert (=> b!144216 (= res!120483 (and (= (size!2973 (_2!6750 lt!223762)) (size!2973 arr!237)) (= (_1!6750 lt!223762) (_2!6751 lt!223766))))))

(assert (=> b!144216 (= lt!223762 (readByteArrayLoopPure!0 (_1!6751 lt!223766) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!223763 () Unit!8946)

(declare-fun lt!223764 () Unit!8946)

(assert (=> b!144216 (= lt!223763 lt!223764)))

(declare-fun lt!223765 () (_ BitVec 64))

(assert (=> b!144216 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 _$39!39)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!223765)))

(assert (=> b!144216 (= lt!223764 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6752 lt!222539) (buf!3402 (_2!6752 _$39!39)) lt!223765))))

(assert (=> b!144216 (= lt!223765 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!144216 (= lt!223766 (reader!0 (_2!6752 lt!222539) (_2!6752 _$39!39)))))

(declare-fun b!144217 () Bool)

(assert (=> b!144217 (= e!96075 (arrayRangesEq!289 arr!237 (_2!6750 lt!223762) #b00000000000000000000000000000000 to!404))))

(declare-fun b!144218 () Bool)

(declare-fun e!96073 () Bool)

(assert (=> b!144218 (= e!96073 (array_inv!2762 (buf!3402 (_2!6752 _$39!39))))))

(declare-fun b!144219 () Bool)

(declare-fun res!120482 () Bool)

(assert (=> b!144219 (=> (not res!120482) (not e!96076))))

(assert (=> b!144219 (= res!120482 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 _$39!39))) (currentByte!6286 (_2!6752 _$39!39)) (currentBit!6281 (_2!6752 _$39!39))) (bvadd (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!46295 () Bool)

(assert (=> d!46295 e!96076))

(declare-fun res!120481 () Bool)

(assert (=> d!46295 (=> (not res!120481) (not e!96076))))

(assert (=> d!46295 (= res!120481 (= (size!2973 (buf!3402 (_2!6752 lt!222539))) (size!2973 (buf!3402 (_2!6752 _$39!39)))))))

(assert (=> d!46295 (and (inv!12 (_2!6752 _$39!39)) e!96073)))

(assert (=> d!46295 (= (choose!64 (_2!6752 lt!222539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!39)))

(assert (= d!46295 b!144218))

(assert (= (and d!46295 res!120481) b!144219))

(assert (= (and b!144219 res!120482) b!144215))

(assert (= (and b!144215 res!120480) b!144216))

(assert (= (and b!144216 res!120483) b!144217))

(declare-fun m!221745 () Bool)

(assert (=> b!144219 m!221745))

(assert (=> b!144219 m!220561))

(declare-fun m!221747 () Bool)

(assert (=> b!144215 m!221747))

(declare-fun m!221749 () Bool)

(assert (=> b!144218 m!221749))

(declare-fun m!221751 () Bool)

(assert (=> b!144217 m!221751))

(declare-fun m!221753 () Bool)

(assert (=> b!144216 m!221753))

(declare-fun m!221755 () Bool)

(assert (=> b!144216 m!221755))

(declare-fun m!221757 () Bool)

(assert (=> b!144216 m!221757))

(declare-fun m!221759 () Bool)

(assert (=> b!144216 m!221759))

(declare-fun m!221761 () Bool)

(assert (=> d!46295 m!221761))

(assert (=> d!45898 d!46295))

(assert (=> b!143750 d!45854))

(declare-fun d!46297 () Bool)

(assert (=> d!46297 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 thiss!1634) lt!222828 lt!222829)))

(declare-fun lt!223769 () Unit!8946)

(declare-fun choose!8 (array!6567 array!6567 (_ BitVec 64) (_ BitVec 64)) Unit!8946)

(assert (=> d!46297 (= lt!223769 (choose!8 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222545)) lt!222828 lt!222829))))

(assert (=> d!46297 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222828) (bvsle lt!222828 lt!222829))))

(assert (=> d!46297 (= (arrayBitRangesEqSymmetric!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222545)) lt!222828 lt!222829) lt!223769)))

(declare-fun bs!11339 () Bool)

(assert (= bs!11339 d!46297))

(assert (=> bs!11339 m!220775))

(declare-fun m!221763 () Bool)

(assert (=> bs!11339 m!221763))

(assert (=> b!143750 d!46297))

(declare-fun c!7880 () Bool)

(declare-fun lt!223770 () tuple4!132)

(declare-fun lt!223772 () (_ BitVec 32))

(declare-fun lt!223771 () (_ BitVec 32))

(declare-fun call!1888 () Bool)

(declare-fun bm!1885 () Bool)

(assert (=> bm!1885 (= call!1888 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_3!345 lt!223770)) (select (arr!3696 (buf!3402 thiss!1634)) (_3!345 lt!223770)) lt!223772 (ite c!7880 lt!223771 #b00000000000000000000000000001000)))))

(declare-fun e!96078 () Bool)

(declare-fun b!144220 () Bool)

(assert (=> b!144220 (= e!96078 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_4!66 lt!223770)) (select (arr!3696 (buf!3402 thiss!1634)) (_4!66 lt!223770)) #b00000000000000000000000000000000 lt!223771))))

(declare-fun b!144221 () Bool)

(declare-fun e!96081 () Bool)

(assert (=> b!144221 (= e!96081 (arrayRangesEq!289 (buf!3402 (_2!6752 lt!222545)) (buf!3402 thiss!1634) (_1!6761 lt!223770) (_2!6761 lt!223770)))))

(declare-fun b!144223 () Bool)

(declare-fun e!96080 () Bool)

(declare-fun e!96077 () Bool)

(assert (=> b!144223 (= e!96080 e!96077)))

(assert (=> b!144223 (= c!7880 (= (_3!345 lt!223770) (_4!66 lt!223770)))))

(declare-fun b!144224 () Bool)

(declare-fun res!120485 () Bool)

(assert (=> b!144224 (= res!120485 (= lt!223771 #b00000000000000000000000000000000))))

(assert (=> b!144224 (=> res!120485 e!96078)))

(declare-fun e!96082 () Bool)

(assert (=> b!144224 (= e!96082 e!96078)))

(declare-fun b!144225 () Bool)

(assert (=> b!144225 (= e!96077 e!96082)))

(declare-fun res!120487 () Bool)

(assert (=> b!144225 (= res!120487 call!1888)))

(assert (=> b!144225 (=> (not res!120487) (not e!96082))))

(declare-fun b!144226 () Bool)

(assert (=> b!144226 (= e!96077 call!1888)))

(declare-fun d!46299 () Bool)

(declare-fun res!120486 () Bool)

(declare-fun e!96079 () Bool)

(assert (=> d!46299 (=> res!120486 e!96079)))

(assert (=> d!46299 (= res!120486 (bvsge lt!222828 lt!222829))))

(assert (=> d!46299 (= (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 thiss!1634) lt!222828 lt!222829) e!96079)))

(declare-fun b!144222 () Bool)

(assert (=> b!144222 (= e!96079 e!96080)))

(declare-fun res!120484 () Bool)

(assert (=> b!144222 (=> (not res!120484) (not e!96080))))

(assert (=> b!144222 (= res!120484 e!96081)))

(declare-fun res!120488 () Bool)

(assert (=> b!144222 (=> res!120488 e!96081)))

(assert (=> b!144222 (= res!120488 (bvsge (_1!6761 lt!223770) (_2!6761 lt!223770)))))

(assert (=> b!144222 (= lt!223771 ((_ extract 31 0) (bvsrem lt!222829 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144222 (= lt!223772 ((_ extract 31 0) (bvsrem lt!222828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144222 (= lt!223770 (arrayBitIndices!0 lt!222828 lt!222829))))

(assert (= (and d!46299 (not res!120486)) b!144222))

(assert (= (and b!144222 (not res!120488)) b!144221))

(assert (= (and b!144222 res!120484) b!144223))

(assert (= (and b!144223 c!7880) b!144226))

(assert (= (and b!144223 (not c!7880)) b!144225))

(assert (= (and b!144225 res!120487) b!144224))

(assert (= (and b!144224 (not res!120485)) b!144220))

(assert (= (or b!144226 b!144225) bm!1885))

(declare-fun m!221765 () Bool)

(assert (=> bm!1885 m!221765))

(declare-fun m!221767 () Bool)

(assert (=> bm!1885 m!221767))

(assert (=> bm!1885 m!221765))

(assert (=> bm!1885 m!221767))

(declare-fun m!221769 () Bool)

(assert (=> bm!1885 m!221769))

(declare-fun m!221771 () Bool)

(assert (=> b!144220 m!221771))

(declare-fun m!221773 () Bool)

(assert (=> b!144220 m!221773))

(assert (=> b!144220 m!221771))

(assert (=> b!144220 m!221773))

(declare-fun m!221775 () Bool)

(assert (=> b!144220 m!221775))

(declare-fun m!221777 () Bool)

(assert (=> b!144221 m!221777))

(declare-fun m!221779 () Bool)

(assert (=> b!144222 m!221779))

(assert (=> b!143750 d!46299))

(declare-fun d!46301 () Bool)

(declare-fun lt!223773 () tuple3!552)

(assert (=> d!46301 (= lt!223773 (readByteArrayLoop!0 (_1!6751 lt!222803) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46301 (= (readByteArrayLoopPure!0 (_1!6751 lt!222803) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12819 (_2!6754 lt!223773) (_3!341 lt!223773)))))

(declare-fun bs!11340 () Bool)

(assert (= bs!11340 d!46301))

(declare-fun m!221781 () Bool)

(assert (=> bs!11340 m!221781))

(assert (=> b!143740 d!46301))

(declare-fun d!46303 () Bool)

(assert (=> d!46303 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222804) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539)))) lt!222804))))

(declare-fun bs!11341 () Bool)

(assert (= bs!11341 d!46303))

(declare-fun m!221783 () Bool)

(assert (=> bs!11341 m!221783))

(assert (=> b!143740 d!46303))

(declare-fun d!46305 () Bool)

(assert (=> d!46305 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222804)))

(declare-fun lt!223774 () Unit!8946)

(assert (=> d!46305 (= lt!223774 (choose!9 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222808)) lt!222804 (BitStream!5205 (buf!3402 (_2!6752 lt!222808)) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(assert (=> d!46305 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222808)) lt!222804) lt!223774)))

(declare-fun bs!11342 () Bool)

(assert (= bs!11342 d!46305))

(assert (=> bs!11342 m!220749))

(declare-fun m!221785 () Bool)

(assert (=> bs!11342 m!221785))

(assert (=> b!143740 d!46305))

(declare-fun b!144227 () Bool)

(declare-fun res!120489 () Bool)

(declare-fun e!96084 () Bool)

(assert (=> b!144227 (=> (not res!120489) (not e!96084))))

(declare-fun lt!223794 () tuple2!12820)

(assert (=> b!144227 (= res!120489 (isPrefixOf!0 (_2!6751 lt!223794) (_2!6752 lt!222808)))))

(declare-fun b!144228 () Bool)

(declare-fun res!120491 () Bool)

(assert (=> b!144228 (=> (not res!120491) (not e!96084))))

(assert (=> b!144228 (= res!120491 (isPrefixOf!0 (_1!6751 lt!223794) (_2!6752 lt!222539)))))

(declare-fun b!144229 () Bool)

(declare-fun e!96083 () Unit!8946)

(declare-fun lt!223793 () Unit!8946)

(assert (=> b!144229 (= e!96083 lt!223793)))

(declare-fun lt!223777 () (_ BitVec 64))

(assert (=> b!144229 (= lt!223777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223778 () (_ BitVec 64))

(assert (=> b!144229 (= lt!223778 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(assert (=> b!144229 (= lt!223793 (arrayBitRangesEqSymmetric!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222808)) lt!223777 lt!223778))))

(assert (=> b!144229 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222808)) (buf!3402 (_2!6752 lt!222539)) lt!223777 lt!223778)))

(declare-fun lt!223787 () (_ BitVec 64))

(declare-fun b!144230 () Bool)

(declare-fun lt!223789 () (_ BitVec 64))

(assert (=> b!144230 (= e!96084 (= (_1!6751 lt!223794) (withMovedBitIndex!0 (_2!6751 lt!223794) (bvsub lt!223787 lt!223789))))))

(assert (=> b!144230 (or (= (bvand lt!223787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223789 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223787 lt!223789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144230 (= lt!223789 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222808))) (currentByte!6286 (_2!6752 lt!222808)) (currentBit!6281 (_2!6752 lt!222808))))))

(assert (=> b!144230 (= lt!223787 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(declare-fun d!46307 () Bool)

(assert (=> d!46307 e!96084))

(declare-fun res!120490 () Bool)

(assert (=> d!46307 (=> (not res!120490) (not e!96084))))

(assert (=> d!46307 (= res!120490 (isPrefixOf!0 (_1!6751 lt!223794) (_2!6751 lt!223794)))))

(declare-fun lt!223792 () BitStream!5204)

(assert (=> d!46307 (= lt!223794 (tuple2!12821 lt!223792 (_2!6752 lt!222808)))))

(declare-fun lt!223791 () Unit!8946)

(declare-fun lt!223780 () Unit!8946)

(assert (=> d!46307 (= lt!223791 lt!223780)))

(assert (=> d!46307 (isPrefixOf!0 lt!223792 (_2!6752 lt!222808))))

(assert (=> d!46307 (= lt!223780 (lemmaIsPrefixTransitive!0 lt!223792 (_2!6752 lt!222808) (_2!6752 lt!222808)))))

(declare-fun lt!223788 () Unit!8946)

(declare-fun lt!223783 () Unit!8946)

(assert (=> d!46307 (= lt!223788 lt!223783)))

(assert (=> d!46307 (isPrefixOf!0 lt!223792 (_2!6752 lt!222808))))

(assert (=> d!46307 (= lt!223783 (lemmaIsPrefixTransitive!0 lt!223792 (_2!6752 lt!222539) (_2!6752 lt!222808)))))

(declare-fun lt!223782 () Unit!8946)

(assert (=> d!46307 (= lt!223782 e!96083)))

(declare-fun c!7881 () Bool)

(assert (=> d!46307 (= c!7881 (not (= (size!2973 (buf!3402 (_2!6752 lt!222539))) #b00000000000000000000000000000000)))))

(declare-fun lt!223779 () Unit!8946)

(declare-fun lt!223775 () Unit!8946)

(assert (=> d!46307 (= lt!223779 lt!223775)))

(assert (=> d!46307 (isPrefixOf!0 (_2!6752 lt!222808) (_2!6752 lt!222808))))

(assert (=> d!46307 (= lt!223775 (lemmaIsPrefixRefl!0 (_2!6752 lt!222808)))))

(declare-fun lt!223781 () Unit!8946)

(declare-fun lt!223785 () Unit!8946)

(assert (=> d!46307 (= lt!223781 lt!223785)))

(assert (=> d!46307 (= lt!223785 (lemmaIsPrefixRefl!0 (_2!6752 lt!222808)))))

(declare-fun lt!223776 () Unit!8946)

(declare-fun lt!223784 () Unit!8946)

(assert (=> d!46307 (= lt!223776 lt!223784)))

(assert (=> d!46307 (isPrefixOf!0 lt!223792 lt!223792)))

(assert (=> d!46307 (= lt!223784 (lemmaIsPrefixRefl!0 lt!223792))))

(declare-fun lt!223786 () Unit!8946)

(declare-fun lt!223790 () Unit!8946)

(assert (=> d!46307 (= lt!223786 lt!223790)))

(assert (=> d!46307 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222539))))

(assert (=> d!46307 (= lt!223790 (lemmaIsPrefixRefl!0 (_2!6752 lt!222539)))))

(assert (=> d!46307 (= lt!223792 (BitStream!5205 (buf!3402 (_2!6752 lt!222808)) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539))))))

(assert (=> d!46307 (isPrefixOf!0 (_2!6752 lt!222539) (_2!6752 lt!222808))))

(assert (=> d!46307 (= (reader!0 (_2!6752 lt!222539) (_2!6752 lt!222808)) lt!223794)))

(declare-fun b!144231 () Bool)

(declare-fun Unit!9005 () Unit!8946)

(assert (=> b!144231 (= e!96083 Unit!9005)))

(assert (= (and d!46307 c!7881) b!144229))

(assert (= (and d!46307 (not c!7881)) b!144231))

(assert (= (and d!46307 res!120490) b!144228))

(assert (= (and b!144228 res!120491) b!144227))

(assert (= (and b!144227 res!120489) b!144230))

(declare-fun m!221787 () Bool)

(assert (=> b!144227 m!221787))

(declare-fun m!221789 () Bool)

(assert (=> b!144230 m!221789))

(assert (=> b!144230 m!220741))

(assert (=> b!144230 m!220561))

(assert (=> b!144229 m!220561))

(declare-fun m!221791 () Bool)

(assert (=> b!144229 m!221791))

(declare-fun m!221793 () Bool)

(assert (=> b!144229 m!221793))

(assert (=> d!46307 m!220739))

(declare-fun m!221795 () Bool)

(assert (=> d!46307 m!221795))

(declare-fun m!221797 () Bool)

(assert (=> d!46307 m!221797))

(declare-fun m!221799 () Bool)

(assert (=> d!46307 m!221799))

(declare-fun m!221801 () Bool)

(assert (=> d!46307 m!221801))

(declare-fun m!221803 () Bool)

(assert (=> d!46307 m!221803))

(declare-fun m!221805 () Bool)

(assert (=> d!46307 m!221805))

(declare-fun m!221807 () Bool)

(assert (=> d!46307 m!221807))

(assert (=> d!46307 m!220603))

(declare-fun m!221809 () Bool)

(assert (=> d!46307 m!221809))

(assert (=> d!46307 m!220617))

(declare-fun m!221811 () Bool)

(assert (=> b!144228 m!221811))

(assert (=> b!143740 d!46307))

(declare-fun d!46309 () Bool)

(declare-fun e!96085 () Bool)

(assert (=> d!46309 e!96085))

(declare-fun res!120492 () Bool)

(assert (=> d!46309 (=> (not res!120492) (not e!96085))))

(declare-fun lt!223795 () (_ BitVec 64))

(declare-fun lt!223799 () (_ BitVec 64))

(declare-fun lt!223798 () (_ BitVec 64))

(assert (=> d!46309 (= res!120492 (= lt!223798 (bvsub lt!223795 lt!223799)))))

(assert (=> d!46309 (or (= (bvand lt!223795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223795 lt!223799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46309 (= lt!223799 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222973)))) ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222973))) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222973)))))))

(declare-fun lt!223796 () (_ BitVec 64))

(declare-fun lt!223797 () (_ BitVec 64))

(assert (=> d!46309 (= lt!223795 (bvmul lt!223796 lt!223797))))

(assert (=> d!46309 (or (= lt!223796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223797 (bvsdiv (bvmul lt!223796 lt!223797) lt!223796)))))

(assert (=> d!46309 (= lt!223797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46309 (= lt!223796 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222973)))))))

(assert (=> d!46309 (= lt!223798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222973))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222973)))))))

(assert (=> d!46309 (invariant!0 (currentBit!6281 (_1!6749 lt!222973)) (currentByte!6286 (_1!6749 lt!222973)) (size!2973 (buf!3402 (_1!6749 lt!222973))))))

(assert (=> d!46309 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222973))) (currentByte!6286 (_1!6749 lt!222973)) (currentBit!6281 (_1!6749 lt!222973))) lt!223798)))

(declare-fun b!144232 () Bool)

(declare-fun res!120493 () Bool)

(assert (=> b!144232 (=> (not res!120493) (not e!96085))))

(assert (=> b!144232 (= res!120493 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223798))))

(declare-fun b!144233 () Bool)

(declare-fun lt!223800 () (_ BitVec 64))

(assert (=> b!144233 (= e!96085 (bvsle lt!223798 (bvmul lt!223800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144233 (or (= lt!223800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223800)))))

(assert (=> b!144233 (= lt!223800 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222973)))))))

(assert (= (and d!46309 res!120492) b!144232))

(assert (= (and b!144232 res!120493) b!144233))

(declare-fun m!221813 () Bool)

(assert (=> d!46309 m!221813))

(declare-fun m!221815 () Bool)

(assert (=> d!46309 m!221815))

(assert (=> d!45963 d!46309))

(assert (=> d!45963 d!45924))

(declare-fun d!46311 () Bool)

(declare-fun e!96086 () Bool)

(assert (=> d!46311 e!96086))

(declare-fun res!120494 () Bool)

(assert (=> d!46311 (=> (not res!120494) (not e!96086))))

(declare-fun lt!223801 () (_ BitVec 64))

(declare-fun lt!223804 () (_ BitVec 64))

(declare-fun lt!223805 () (_ BitVec 64))

(assert (=> d!46311 (= res!120494 (= lt!223804 (bvsub lt!223801 lt!223805)))))

(assert (=> d!46311 (or (= (bvand lt!223801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223805 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223801 lt!223805) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46311 (= lt!223805 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222972)))) ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222972))) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222972)))))))

(declare-fun lt!223802 () (_ BitVec 64))

(declare-fun lt!223803 () (_ BitVec 64))

(assert (=> d!46311 (= lt!223801 (bvmul lt!223802 lt!223803))))

(assert (=> d!46311 (or (= lt!223802 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223803 (bvsdiv (bvmul lt!223802 lt!223803) lt!223802)))))

(assert (=> d!46311 (= lt!223803 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46311 (= lt!223802 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222972)))))))

(assert (=> d!46311 (= lt!223804 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222972))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222972)))))))

(assert (=> d!46311 (invariant!0 (currentBit!6281 (_1!6749 lt!222972)) (currentByte!6286 (_1!6749 lt!222972)) (size!2973 (buf!3402 (_1!6749 lt!222972))))))

(assert (=> d!46311 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!222972))) (currentByte!6286 (_1!6749 lt!222972)) (currentBit!6281 (_1!6749 lt!222972))) lt!223804)))

(declare-fun b!144234 () Bool)

(declare-fun res!120495 () Bool)

(assert (=> b!144234 (=> (not res!120495) (not e!96086))))

(assert (=> b!144234 (= res!120495 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223804))))

(declare-fun b!144235 () Bool)

(declare-fun lt!223806 () (_ BitVec 64))

(assert (=> b!144235 (= e!96086 (bvsle lt!223804 (bvmul lt!223806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144235 (or (= lt!223806 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223806 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223806)))))

(assert (=> b!144235 (= lt!223806 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222972)))))))

(assert (= (and d!46311 res!120494) b!144234))

(assert (= (and b!144234 res!120495) b!144235))

(declare-fun m!221817 () Bool)

(assert (=> d!46311 m!221817))

(declare-fun m!221819 () Bool)

(assert (=> d!46311 m!221819))

(assert (=> d!45963 d!46311))

(declare-fun d!46313 () Bool)

(declare-fun lt!223807 () tuple2!12824)

(assert (=> d!46313 (= lt!223807 (readByte!0 lt!222974))))

(assert (=> d!46313 (= (readBytePure!0 lt!222974) (tuple2!12817 (_2!6753 lt!223807) (_1!6753 lt!223807)))))

(declare-fun bs!11343 () Bool)

(assert (= bs!11343 d!46313))

(declare-fun m!221821 () Bool)

(assert (=> bs!11343 m!221821))

(assert (=> d!45963 d!46313))

(declare-fun d!46315 () Bool)

(declare-fun e!96089 () Bool)

(assert (=> d!46315 e!96089))

(declare-fun res!120498 () Bool)

(assert (=> d!46315 (=> (not res!120498) (not e!96089))))

(declare-fun lt!223813 () tuple2!12816)

(declare-fun lt!223812 () tuple2!12816)

(assert (=> d!46315 (= res!120498 (= (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!223813))) (currentByte!6286 (_1!6749 lt!223813)) (currentBit!6281 (_1!6749 lt!223813))) (bitIndex!0 (size!2973 (buf!3402 (_1!6749 lt!223812))) (currentByte!6286 (_1!6749 lt!223812)) (currentBit!6281 (_1!6749 lt!223812)))))))

(assert (=> d!46315 (= lt!223812 (readBytePure!0 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 lt!222538) (currentBit!6281 lt!222538))))))

(assert (=> d!46315 (= lt!223813 (readBytePure!0 lt!222538))))

(assert (=> d!46315 true))

(declare-fun _$8!78 () Unit!8946)

(assert (=> d!46315 (= (choose!14 lt!222538 (_2!6752 lt!222545) lt!222974 lt!222972 (tuple2!12817 (_1!6749 lt!222972) (_2!6749 lt!222972)) (_1!6749 lt!222972) (_2!6749 lt!222972) lt!222973 (tuple2!12817 (_1!6749 lt!222973) (_2!6749 lt!222973)) (_1!6749 lt!222973) (_2!6749 lt!222973)) _$8!78)))

(declare-fun b!144238 () Bool)

(assert (=> b!144238 (= e!96089 (= (_2!6749 lt!223813) (_2!6749 lt!223812)))))

(assert (= (and d!46315 res!120498) b!144238))

(declare-fun m!221823 () Bool)

(assert (=> d!46315 m!221823))

(declare-fun m!221825 () Bool)

(assert (=> d!46315 m!221825))

(declare-fun m!221827 () Bool)

(assert (=> d!46315 m!221827))

(assert (=> d!46315 m!220541))

(assert (=> d!45963 d!46315))

(declare-fun d!46317 () Bool)

(declare-fun res!120501 () Bool)

(declare-fun e!96091 () Bool)

(assert (=> d!46317 (=> (not res!120501) (not e!96091))))

(assert (=> d!46317 (= res!120501 (= (size!2973 (buf!3402 (_2!6751 lt!222678))) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!46317 (= (isPrefixOf!0 (_2!6751 lt!222678) (_2!6752 lt!222545)) e!96091)))

(declare-fun b!144239 () Bool)

(declare-fun res!120500 () Bool)

(assert (=> b!144239 (=> (not res!120500) (not e!96091))))

(assert (=> b!144239 (= res!120500 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222678))) (currentByte!6286 (_2!6751 lt!222678)) (currentBit!6281 (_2!6751 lt!222678))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!144240 () Bool)

(declare-fun e!96090 () Bool)

(assert (=> b!144240 (= e!96091 e!96090)))

(declare-fun res!120499 () Bool)

(assert (=> b!144240 (=> res!120499 e!96090)))

(assert (=> b!144240 (= res!120499 (= (size!2973 (buf!3402 (_2!6751 lt!222678))) #b00000000000000000000000000000000))))

(declare-fun b!144241 () Bool)

(assert (=> b!144241 (= e!96090 (arrayBitRangesEq!0 (buf!3402 (_2!6751 lt!222678)) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222678))) (currentByte!6286 (_2!6751 lt!222678)) (currentBit!6281 (_2!6751 lt!222678)))))))

(assert (= (and d!46317 res!120501) b!144239))

(assert (= (and b!144239 res!120500) b!144240))

(assert (= (and b!144240 (not res!120499)) b!144241))

(assert (=> b!144239 m!221577))

(assert (=> b!144239 m!220577))

(assert (=> b!144241 m!221577))

(assert (=> b!144241 m!221577))

(declare-fun m!221829 () Bool)

(assert (=> b!144241 m!221829))

(assert (=> b!143673 d!46317))

(assert (=> d!45928 d!45922))

(declare-fun d!46319 () Bool)

(assert (=> d!46319 (isPrefixOf!0 thiss!1634 (_2!6752 lt!222545))))

(assert (=> d!46319 true))

(declare-fun _$15!225 () Unit!8946)

(assert (=> d!46319 (= (choose!30 thiss!1634 (_2!6752 lt!222539) (_2!6752 lt!222545)) _$15!225)))

(declare-fun bs!11344 () Bool)

(assert (= bs!11344 d!46319))

(assert (=> bs!11344 m!220537))

(assert (=> d!45928 d!46319))

(assert (=> d!45928 d!45894))

(declare-fun b!144250 () Bool)

(declare-fun e!96100 () Bool)

(declare-fun _$37!35 () tuple2!12822)

(assert (=> b!144250 (= e!96100 (array_inv!2762 (buf!3402 (_2!6752 _$37!35))))))

(declare-fun lt!223819 () tuple2!12820)

(declare-fun b!144253 () Bool)

(declare-fun lt!223818 () tuple2!12816)

(declare-fun e!96099 () Bool)

(assert (=> b!144253 (= e!96099 (and (= (_2!6749 lt!223818) (select (arr!3696 arr!237) from!447)) (= (_1!6749 lt!223818) (_2!6751 lt!223819))))))

(assert (=> b!144253 (= lt!223818 (readBytePure!0 (_1!6751 lt!223819)))))

(assert (=> b!144253 (= lt!223819 (reader!0 thiss!1634 (_2!6752 _$37!35)))))

(declare-fun b!144251 () Bool)

(declare-fun res!120509 () Bool)

(assert (=> b!144251 (=> (not res!120509) (not e!96099))))

(assert (=> b!144251 (= res!120509 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 _$37!35))) (currentByte!6286 (_2!6752 _$37!35)) (currentBit!6281 (_2!6752 _$37!35))) (bvadd (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!144252 () Bool)

(declare-fun res!120510 () Bool)

(assert (=> b!144252 (=> (not res!120510) (not e!96099))))

(assert (=> b!144252 (= res!120510 (isPrefixOf!0 thiss!1634 (_2!6752 _$37!35)))))

(declare-fun d!46321 () Bool)

(assert (=> d!46321 e!96099))

(declare-fun res!120508 () Bool)

(assert (=> d!46321 (=> (not res!120508) (not e!96099))))

(assert (=> d!46321 (= res!120508 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 (_2!6752 _$37!35)))))))

(assert (=> d!46321 (and (inv!12 (_2!6752 _$37!35)) e!96100)))

(assert (=> d!46321 (= (choose!6 thiss!1634 (select (arr!3696 arr!237) from!447)) _$37!35)))

(assert (= d!46321 b!144250))

(assert (= (and d!46321 res!120508) b!144251))

(assert (= (and b!144251 res!120509) b!144252))

(assert (= (and b!144252 res!120510) b!144253))

(declare-fun m!221831 () Bool)

(assert (=> d!46321 m!221831))

(declare-fun m!221833 () Bool)

(assert (=> b!144251 m!221833))

(assert (=> b!144251 m!220563))

(declare-fun m!221835 () Bool)

(assert (=> b!144252 m!221835))

(declare-fun m!221837 () Bool)

(assert (=> b!144253 m!221837))

(declare-fun m!221839 () Bool)

(assert (=> b!144253 m!221839))

(declare-fun m!221841 () Bool)

(assert (=> b!144250 m!221841))

(assert (=> d!45937 d!46321))

(declare-fun d!46323 () Bool)

(assert (=> d!46323 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 thiss!1634))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11345 () Bool)

(assert (= bs!11345 d!46323))

(assert (=> bs!11345 m!220627))

(assert (=> d!45937 d!46323))

(declare-fun d!46325 () Bool)

(declare-fun e!96101 () Bool)

(assert (=> d!46325 e!96101))

(declare-fun res!120511 () Bool)

(assert (=> d!46325 (=> (not res!120511) (not e!96101))))

(declare-fun lt!223820 () (_ BitVec 64))

(declare-fun lt!223823 () (_ BitVec 64))

(declare-fun lt!223824 () (_ BitVec 64))

(assert (=> d!46325 (= res!120511 (= lt!223823 (bvsub lt!223820 lt!223824)))))

(assert (=> d!46325 (or (= (bvand lt!223820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223820 lt!223824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46325 (= lt!223824 (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222808))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222808)))))))

(declare-fun lt!223821 () (_ BitVec 64))

(declare-fun lt!223822 () (_ BitVec 64))

(assert (=> d!46325 (= lt!223820 (bvmul lt!223821 lt!223822))))

(assert (=> d!46325 (or (= lt!223821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223822 (bvsdiv (bvmul lt!223821 lt!223822) lt!223821)))))

(assert (=> d!46325 (= lt!223822 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46325 (= lt!223821 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))))))

(assert (=> d!46325 (= lt!223823 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222808))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222808)))))))

(assert (=> d!46325 (invariant!0 (currentBit!6281 (_2!6752 lt!222808)) (currentByte!6286 (_2!6752 lt!222808)) (size!2973 (buf!3402 (_2!6752 lt!222808))))))

(assert (=> d!46325 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222808))) (currentByte!6286 (_2!6752 lt!222808)) (currentBit!6281 (_2!6752 lt!222808))) lt!223823)))

(declare-fun b!144254 () Bool)

(declare-fun res!120512 () Bool)

(assert (=> b!144254 (=> (not res!120512) (not e!96101))))

(assert (=> b!144254 (= res!120512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223823))))

(declare-fun b!144255 () Bool)

(declare-fun lt!223825 () (_ BitVec 64))

(assert (=> b!144255 (= e!96101 (bvsle lt!223823 (bvmul lt!223825 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144255 (or (= lt!223825 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223825 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223825)))))

(assert (=> b!144255 (= lt!223825 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222808)))))))

(assert (= (and d!46325 res!120511) b!144254))

(assert (= (and b!144254 res!120512) b!144255))

(declare-fun m!221843 () Bool)

(assert (=> d!46325 m!221843))

(declare-fun m!221845 () Bool)

(assert (=> d!46325 m!221845))

(assert (=> b!143742 d!46325))

(assert (=> b!143742 d!45852))

(assert (=> b!143675 d!45852))

(declare-fun d!46327 () Bool)

(assert (=> d!46327 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 (_2!6752 lt!222539)) lt!222661 lt!222662)))

(declare-fun lt!223826 () Unit!8946)

(assert (=> d!46327 (= lt!223826 (choose!8 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222545)) lt!222661 lt!222662))))

(assert (=> d!46327 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222661) (bvsle lt!222661 lt!222662))))

(assert (=> d!46327 (= (arrayBitRangesEqSymmetric!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 (_2!6752 lt!222545)) lt!222661 lt!222662) lt!223826)))

(declare-fun bs!11346 () Bool)

(assert (= bs!11346 d!46327))

(assert (=> bs!11346 m!220653))

(declare-fun m!221847 () Bool)

(assert (=> bs!11346 m!221847))

(assert (=> b!143675 d!46327))

(declare-fun call!1889 () Bool)

(declare-fun lt!223829 () (_ BitVec 32))

(declare-fun lt!223827 () tuple4!132)

(declare-fun lt!223828 () (_ BitVec 32))

(declare-fun c!7882 () Bool)

(declare-fun bm!1886 () Bool)

(assert (=> bm!1886 (= call!1889 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_3!345 lt!223827)) (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_3!345 lt!223827)) lt!223829 (ite c!7882 lt!223828 #b00000000000000000000000000001000)))))

(declare-fun e!96103 () Bool)

(declare-fun b!144256 () Bool)

(assert (=> b!144256 (= e!96103 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_4!66 lt!223827)) (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_4!66 lt!223827)) #b00000000000000000000000000000000 lt!223828))))

(declare-fun b!144257 () Bool)

(declare-fun e!96106 () Bool)

(assert (=> b!144257 (= e!96106 (arrayRangesEq!289 (buf!3402 (_2!6752 lt!222545)) (buf!3402 (_2!6752 lt!222539)) (_1!6761 lt!223827) (_2!6761 lt!223827)))))

(declare-fun b!144259 () Bool)

(declare-fun e!96105 () Bool)

(declare-fun e!96102 () Bool)

(assert (=> b!144259 (= e!96105 e!96102)))

(assert (=> b!144259 (= c!7882 (= (_3!345 lt!223827) (_4!66 lt!223827)))))

(declare-fun b!144260 () Bool)

(declare-fun res!120514 () Bool)

(assert (=> b!144260 (= res!120514 (= lt!223828 #b00000000000000000000000000000000))))

(assert (=> b!144260 (=> res!120514 e!96103)))

(declare-fun e!96107 () Bool)

(assert (=> b!144260 (= e!96107 e!96103)))

(declare-fun b!144261 () Bool)

(assert (=> b!144261 (= e!96102 e!96107)))

(declare-fun res!120516 () Bool)

(assert (=> b!144261 (= res!120516 call!1889)))

(assert (=> b!144261 (=> (not res!120516) (not e!96107))))

(declare-fun b!144262 () Bool)

(assert (=> b!144262 (= e!96102 call!1889)))

(declare-fun d!46329 () Bool)

(declare-fun res!120515 () Bool)

(declare-fun e!96104 () Bool)

(assert (=> d!46329 (=> res!120515 e!96104)))

(assert (=> d!46329 (= res!120515 (bvsge lt!222661 lt!222662))))

(assert (=> d!46329 (= (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 (_2!6752 lt!222539)) lt!222661 lt!222662) e!96104)))

(declare-fun b!144258 () Bool)

(assert (=> b!144258 (= e!96104 e!96105)))

(declare-fun res!120513 () Bool)

(assert (=> b!144258 (=> (not res!120513) (not e!96105))))

(assert (=> b!144258 (= res!120513 e!96106)))

(declare-fun res!120517 () Bool)

(assert (=> b!144258 (=> res!120517 e!96106)))

(assert (=> b!144258 (= res!120517 (bvsge (_1!6761 lt!223827) (_2!6761 lt!223827)))))

(assert (=> b!144258 (= lt!223828 ((_ extract 31 0) (bvsrem lt!222662 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144258 (= lt!223829 ((_ extract 31 0) (bvsrem lt!222661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144258 (= lt!223827 (arrayBitIndices!0 lt!222661 lt!222662))))

(assert (= (and d!46329 (not res!120515)) b!144258))

(assert (= (and b!144258 (not res!120517)) b!144257))

(assert (= (and b!144258 res!120513) b!144259))

(assert (= (and b!144259 c!7882) b!144262))

(assert (= (and b!144259 (not c!7882)) b!144261))

(assert (= (and b!144261 res!120516) b!144260))

(assert (= (and b!144260 (not res!120514)) b!144256))

(assert (= (or b!144262 b!144261) bm!1886))

(declare-fun m!221849 () Bool)

(assert (=> bm!1886 m!221849))

(declare-fun m!221851 () Bool)

(assert (=> bm!1886 m!221851))

(assert (=> bm!1886 m!221849))

(assert (=> bm!1886 m!221851))

(declare-fun m!221853 () Bool)

(assert (=> bm!1886 m!221853))

(declare-fun m!221855 () Bool)

(assert (=> b!144256 m!221855))

(declare-fun m!221857 () Bool)

(assert (=> b!144256 m!221857))

(assert (=> b!144256 m!221855))

(assert (=> b!144256 m!221857))

(declare-fun m!221859 () Bool)

(assert (=> b!144256 m!221859))

(declare-fun m!221861 () Bool)

(assert (=> b!144257 m!221861))

(declare-fun m!221863 () Bool)

(assert (=> b!144258 m!221863))

(assert (=> b!143675 d!46329))

(declare-fun d!46331 () Bool)

(assert (=> d!46331 (= (remainingBits!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222542)))) ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222542))) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222542)))) (bvsub (bvmul ((_ sign_extend 32) (size!2973 (buf!3402 (_1!6749 lt!222542)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6286 (_1!6749 lt!222542))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6281 (_1!6749 lt!222542))))))))

(assert (=> d!45959 d!46331))

(declare-fun d!46333 () Bool)

(assert (=> d!46333 (= (invariant!0 (currentBit!6281 (_1!6749 lt!222542)) (currentByte!6286 (_1!6749 lt!222542)) (size!2973 (buf!3402 (_1!6749 lt!222542)))) (and (bvsge (currentBit!6281 (_1!6749 lt!222542)) #b00000000000000000000000000000000) (bvslt (currentBit!6281 (_1!6749 lt!222542)) #b00000000000000000000000000001000) (bvsge (currentByte!6286 (_1!6749 lt!222542)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6286 (_1!6749 lt!222542)) (size!2973 (buf!3402 (_1!6749 lt!222542)))) (and (= (currentBit!6281 (_1!6749 lt!222542)) #b00000000000000000000000000000000) (= (currentByte!6286 (_1!6749 lt!222542)) (size!2973 (buf!3402 (_1!6749 lt!222542))))))))))

(assert (=> d!45959 d!46333))

(declare-fun d!46335 () Bool)

(declare-fun res!120520 () Bool)

(declare-fun e!96109 () Bool)

(assert (=> d!46335 (=> (not res!120520) (not e!96109))))

(assert (=> d!46335 (= res!120520 (= (size!2973 (buf!3402 (_2!6751 lt!222616))) (size!2973 (buf!3402 (_2!6752 lt!222539)))))))

(assert (=> d!46335 (= (isPrefixOf!0 (_2!6751 lt!222616) (_2!6752 lt!222539)) e!96109)))

(declare-fun b!144263 () Bool)

(declare-fun res!120519 () Bool)

(assert (=> b!144263 (=> (not res!120519) (not e!96109))))

(assert (=> b!144263 (= res!120519 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222616))) (currentByte!6286 (_2!6751 lt!222616)) (currentBit!6281 (_2!6751 lt!222616))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222539))) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))))))

(declare-fun b!144264 () Bool)

(declare-fun e!96108 () Bool)

(assert (=> b!144264 (= e!96109 e!96108)))

(declare-fun res!120518 () Bool)

(assert (=> b!144264 (=> res!120518 e!96108)))

(assert (=> b!144264 (= res!120518 (= (size!2973 (buf!3402 (_2!6751 lt!222616))) #b00000000000000000000000000000000))))

(declare-fun b!144265 () Bool)

(assert (=> b!144265 (= e!96108 (arrayBitRangesEq!0 (buf!3402 (_2!6751 lt!222616)) (buf!3402 (_2!6752 lt!222539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222616))) (currentByte!6286 (_2!6751 lt!222616)) (currentBit!6281 (_2!6751 lt!222616)))))))

(assert (= (and d!46335 res!120520) b!144263))

(assert (= (and b!144263 res!120519) b!144264))

(assert (= (and b!144264 (not res!120518)) b!144265))

(assert (=> b!144263 m!221641))

(assert (=> b!144263 m!220561))

(assert (=> b!144265 m!221641))

(assert (=> b!144265 m!221641))

(declare-fun m!221865 () Bool)

(assert (=> b!144265 m!221865))

(assert (=> b!143650 d!46335))

(declare-fun d!46337 () Bool)

(declare-fun res!120523 () Bool)

(declare-fun e!96111 () Bool)

(assert (=> d!46337 (=> (not res!120523) (not e!96111))))

(assert (=> d!46337 (= res!120523 (= (size!2973 (buf!3402 (_2!6751 lt!222845))) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!46337 (= (isPrefixOf!0 (_2!6751 lt!222845) (_2!6752 lt!222545)) e!96111)))

(declare-fun b!144266 () Bool)

(declare-fun res!120522 () Bool)

(assert (=> b!144266 (=> (not res!120522) (not e!96111))))

(assert (=> b!144266 (= res!120522 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222845))) (currentByte!6286 (_2!6751 lt!222845)) (currentBit!6281 (_2!6751 lt!222845))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!144267 () Bool)

(declare-fun e!96110 () Bool)

(assert (=> b!144267 (= e!96111 e!96110)))

(declare-fun res!120521 () Bool)

(assert (=> b!144267 (=> res!120521 e!96110)))

(assert (=> b!144267 (= res!120521 (= (size!2973 (buf!3402 (_2!6751 lt!222845))) #b00000000000000000000000000000000))))

(declare-fun b!144268 () Bool)

(assert (=> b!144268 (= e!96110 (arrayBitRangesEq!0 (buf!3402 (_2!6751 lt!222845)) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222845))) (currentByte!6286 (_2!6751 lt!222845)) (currentBit!6281 (_2!6751 lt!222845)))))))

(assert (= (and d!46337 res!120523) b!144266))

(assert (= (and b!144266 res!120522) b!144267))

(assert (= (and b!144267 (not res!120521)) b!144268))

(assert (=> b!144266 m!221649))

(assert (=> b!144266 m!220577))

(assert (=> b!144268 m!221649))

(assert (=> b!144268 m!221649))

(declare-fun m!221867 () Bool)

(assert (=> b!144268 m!221867))

(assert (=> b!143748 d!46337))

(declare-fun d!46339 () Bool)

(declare-fun res!120524 () Bool)

(declare-fun e!96112 () Bool)

(assert (=> d!46339 (=> res!120524 e!96112)))

(assert (=> d!46339 (= res!120524 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46339 (= (arrayRangesEq!289 arr!237 (_2!6750 lt!222807) #b00000000000000000000000000000000 to!404) e!96112)))

(declare-fun b!144269 () Bool)

(declare-fun e!96113 () Bool)

(assert (=> b!144269 (= e!96112 e!96113)))

(declare-fun res!120525 () Bool)

(assert (=> b!144269 (=> (not res!120525) (not e!96113))))

(assert (=> b!144269 (= res!120525 (= (select (arr!3696 arr!237) #b00000000000000000000000000000000) (select (arr!3696 (_2!6750 lt!222807)) #b00000000000000000000000000000000)))))

(declare-fun b!144270 () Bool)

(assert (=> b!144270 (= e!96113 (arrayRangesEq!289 arr!237 (_2!6750 lt!222807) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46339 (not res!120524)) b!144269))

(assert (= (and b!144269 res!120525) b!144270))

(assert (=> b!144269 m!220629))

(declare-fun m!221869 () Bool)

(assert (=> b!144269 m!221869))

(declare-fun m!221871 () Bool)

(assert (=> b!144270 m!221871))

(assert (=> b!143738 d!46339))

(declare-fun d!46341 () Bool)

(declare-fun res!120528 () Bool)

(declare-fun e!96115 () Bool)

(assert (=> d!46341 (=> (not res!120528) (not e!96115))))

(assert (=> d!46341 (= res!120528 (= (size!2973 (buf!3402 thiss!1634)) (size!2973 (buf!3402 (_2!6752 lt!222953)))))))

(assert (=> d!46341 (= (isPrefixOf!0 thiss!1634 (_2!6752 lt!222953)) e!96115)))

(declare-fun b!144271 () Bool)

(declare-fun res!120527 () Bool)

(assert (=> b!144271 (=> (not res!120527) (not e!96115))))

(assert (=> b!144271 (= res!120527 (bvsle (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222953))) (currentByte!6286 (_2!6752 lt!222953)) (currentBit!6281 (_2!6752 lt!222953)))))))

(declare-fun b!144272 () Bool)

(declare-fun e!96114 () Bool)

(assert (=> b!144272 (= e!96115 e!96114)))

(declare-fun res!120526 () Bool)

(assert (=> b!144272 (=> res!120526 e!96114)))

(assert (=> b!144272 (= res!120526 (= (size!2973 (buf!3402 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!144273 () Bool)

(assert (=> b!144273 (= e!96114 (arrayBitRangesEq!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222953)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (= (and d!46341 res!120528) b!144271))

(assert (= (and b!144271 res!120527) b!144272))

(assert (= (and b!144272 (not res!120526)) b!144273))

(assert (=> b!144271 m!220563))

(assert (=> b!144271 m!220843))

(assert (=> b!144273 m!220563))

(assert (=> b!144273 m!220563))

(declare-fun m!221873 () Bool)

(assert (=> b!144273 m!221873))

(assert (=> b!143798 d!46341))

(assert (=> b!143652 d!45854))

(declare-fun d!46343 () Bool)

(assert (=> d!46343 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 thiss!1634) lt!222599 lt!222600)))

(declare-fun lt!223830 () Unit!8946)

(assert (=> d!46343 (= lt!223830 (choose!8 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222539)) lt!222599 lt!222600))))

(assert (=> d!46343 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222599) (bvsle lt!222599 lt!222600))))

(assert (=> d!46343 (= (arrayBitRangesEqSymmetric!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222539)) lt!222599 lt!222600) lt!223830)))

(declare-fun bs!11347 () Bool)

(assert (= bs!11347 d!46343))

(assert (=> bs!11347 m!220599))

(declare-fun m!221875 () Bool)

(assert (=> bs!11347 m!221875))

(assert (=> b!143652 d!46343))

(declare-fun bm!1887 () Bool)

(declare-fun lt!223833 () (_ BitVec 32))

(declare-fun call!1890 () Bool)

(declare-fun lt!223831 () tuple4!132)

(declare-fun lt!223832 () (_ BitVec 32))

(declare-fun c!7883 () Bool)

(assert (=> bm!1887 (= call!1890 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_3!345 lt!223831)) (select (arr!3696 (buf!3402 thiss!1634)) (_3!345 lt!223831)) lt!223833 (ite c!7883 lt!223832 #b00000000000000000000000000001000)))))

(declare-fun b!144274 () Bool)

(declare-fun e!96117 () Bool)

(assert (=> b!144274 (= e!96117 (byteRangesEq!0 (select (arr!3696 (buf!3402 (_2!6752 lt!222539))) (_4!66 lt!223831)) (select (arr!3696 (buf!3402 thiss!1634)) (_4!66 lt!223831)) #b00000000000000000000000000000000 lt!223832))))

(declare-fun b!144275 () Bool)

(declare-fun e!96120 () Bool)

(assert (=> b!144275 (= e!96120 (arrayRangesEq!289 (buf!3402 (_2!6752 lt!222539)) (buf!3402 thiss!1634) (_1!6761 lt!223831) (_2!6761 lt!223831)))))

(declare-fun b!144277 () Bool)

(declare-fun e!96119 () Bool)

(declare-fun e!96116 () Bool)

(assert (=> b!144277 (= e!96119 e!96116)))

(assert (=> b!144277 (= c!7883 (= (_3!345 lt!223831) (_4!66 lt!223831)))))

(declare-fun b!144278 () Bool)

(declare-fun res!120530 () Bool)

(assert (=> b!144278 (= res!120530 (= lt!223832 #b00000000000000000000000000000000))))

(assert (=> b!144278 (=> res!120530 e!96117)))

(declare-fun e!96121 () Bool)

(assert (=> b!144278 (= e!96121 e!96117)))

(declare-fun b!144279 () Bool)

(assert (=> b!144279 (= e!96116 e!96121)))

(declare-fun res!120532 () Bool)

(assert (=> b!144279 (= res!120532 call!1890)))

(assert (=> b!144279 (=> (not res!120532) (not e!96121))))

(declare-fun b!144280 () Bool)

(assert (=> b!144280 (= e!96116 call!1890)))

(declare-fun d!46345 () Bool)

(declare-fun res!120531 () Bool)

(declare-fun e!96118 () Bool)

(assert (=> d!46345 (=> res!120531 e!96118)))

(assert (=> d!46345 (= res!120531 (bvsge lt!222599 lt!222600))))

(assert (=> d!46345 (= (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222539)) (buf!3402 thiss!1634) lt!222599 lt!222600) e!96118)))

(declare-fun b!144276 () Bool)

(assert (=> b!144276 (= e!96118 e!96119)))

(declare-fun res!120529 () Bool)

(assert (=> b!144276 (=> (not res!120529) (not e!96119))))

(assert (=> b!144276 (= res!120529 e!96120)))

(declare-fun res!120533 () Bool)

(assert (=> b!144276 (=> res!120533 e!96120)))

(assert (=> b!144276 (= res!120533 (bvsge (_1!6761 lt!223831) (_2!6761 lt!223831)))))

(assert (=> b!144276 (= lt!223832 ((_ extract 31 0) (bvsrem lt!222600 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144276 (= lt!223833 ((_ extract 31 0) (bvsrem lt!222599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144276 (= lt!223831 (arrayBitIndices!0 lt!222599 lt!222600))))

(assert (= (and d!46345 (not res!120531)) b!144276))

(assert (= (and b!144276 (not res!120533)) b!144275))

(assert (= (and b!144276 res!120529) b!144277))

(assert (= (and b!144277 c!7883) b!144280))

(assert (= (and b!144277 (not c!7883)) b!144279))

(assert (= (and b!144279 res!120532) b!144278))

(assert (= (and b!144278 (not res!120530)) b!144274))

(assert (= (or b!144280 b!144279) bm!1887))

(declare-fun m!221877 () Bool)

(assert (=> bm!1887 m!221877))

(declare-fun m!221879 () Bool)

(assert (=> bm!1887 m!221879))

(assert (=> bm!1887 m!221877))

(assert (=> bm!1887 m!221879))

(declare-fun m!221881 () Bool)

(assert (=> bm!1887 m!221881))

(declare-fun m!221883 () Bool)

(assert (=> b!144274 m!221883))

(declare-fun m!221885 () Bool)

(assert (=> b!144274 m!221885))

(assert (=> b!144274 m!221883))

(assert (=> b!144274 m!221885))

(declare-fun m!221887 () Bool)

(assert (=> b!144274 m!221887))

(declare-fun m!221889 () Bool)

(assert (=> b!144275 m!221889))

(declare-fun m!221891 () Bool)

(assert (=> b!144276 m!221891))

(assert (=> b!143652 d!46345))

(declare-fun d!46347 () Bool)

(declare-fun lt!223835 () (_ BitVec 8))

(declare-fun lt!223837 () (_ BitVec 8))

(assert (=> d!46347 (= lt!223835 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 lt!222538)) (currentByte!6286 lt!222538))) ((_ sign_extend 24) lt!223837))))))

(assert (=> d!46347 (= lt!223837 ((_ extract 7 0) (currentBit!6281 lt!222538)))))

(declare-fun e!96123 () Bool)

(assert (=> d!46347 e!96123))

(declare-fun res!120534 () Bool)

(assert (=> d!46347 (=> (not res!120534) (not e!96123))))

(assert (=> d!46347 (= res!120534 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 lt!222538))) ((_ sign_extend 32) (currentByte!6286 lt!222538)) ((_ sign_extend 32) (currentBit!6281 lt!222538)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9006 () Unit!8946)

(declare-fun Unit!9007 () Unit!8946)

(assert (=> d!46347 (= (readByte!0 lt!222538) (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223837) #b00000000000000000000000000000000) (tuple2!12833 Unit!9006 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223835) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 lt!222538)) (bvadd (currentByte!6286 lt!222538) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223837)))))))) (tuple2!12833 Unit!9007 lt!223835))) (BitStream!5205 (buf!3402 lt!222538) (bvadd (currentByte!6286 lt!222538) #b00000000000000000000000000000001) (currentBit!6281 lt!222538))))))

(declare-fun b!144281 () Bool)

(declare-fun e!96122 () Bool)

(assert (=> b!144281 (= e!96123 e!96122)))

(declare-fun res!120535 () Bool)

(assert (=> b!144281 (=> (not res!120535) (not e!96122))))

(declare-fun lt!223839 () tuple2!12824)

(assert (=> b!144281 (= res!120535 (= (buf!3402 (_2!6753 lt!223839)) (buf!3402 lt!222538)))))

(declare-fun lt!223840 () (_ BitVec 8))

(declare-fun lt!223834 () (_ BitVec 8))

(declare-fun Unit!9008 () Unit!8946)

(declare-fun Unit!9009 () Unit!8946)

(assert (=> b!144281 (= lt!223839 (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223834) #b00000000000000000000000000000000) (tuple2!12833 Unit!9008 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223840) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 lt!222538)) (bvadd (currentByte!6286 lt!222538) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223834)))))))) (tuple2!12833 Unit!9009 lt!223840))) (BitStream!5205 (buf!3402 lt!222538) (bvadd (currentByte!6286 lt!222538) #b00000000000000000000000000000001) (currentBit!6281 lt!222538))))))

(assert (=> b!144281 (= lt!223840 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 lt!222538)) (currentByte!6286 lt!222538))) ((_ sign_extend 24) lt!223834))))))

(assert (=> b!144281 (= lt!223834 ((_ extract 7 0) (currentBit!6281 lt!222538)))))

(declare-fun b!144282 () Bool)

(declare-fun lt!223836 () (_ BitVec 64))

(declare-fun lt!223838 () (_ BitVec 64))

(assert (=> b!144282 (= e!96122 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223839))) (currentByte!6286 (_2!6753 lt!223839)) (currentBit!6281 (_2!6753 lt!223839))) (bvadd lt!223836 lt!223838)))))

(assert (=> b!144282 (or (not (= (bvand lt!223836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223836 lt!223838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144282 (= lt!223838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!144282 (= lt!223836 (bitIndex!0 (size!2973 (buf!3402 lt!222538)) (currentByte!6286 lt!222538) (currentBit!6281 lt!222538)))))

(assert (= (and d!46347 res!120534) b!144281))

(assert (= (and b!144281 res!120535) b!144282))

(declare-fun m!221893 () Bool)

(assert (=> d!46347 m!221893))

(declare-fun m!221895 () Bool)

(assert (=> d!46347 m!221895))

(declare-fun m!221897 () Bool)

(assert (=> d!46347 m!221897))

(assert (=> b!144281 m!221897))

(assert (=> b!144281 m!221893))

(declare-fun m!221899 () Bool)

(assert (=> b!144282 m!221899))

(declare-fun m!221901 () Bool)

(assert (=> b!144282 m!221901))

(assert (=> d!45924 d!46347))

(declare-fun d!46349 () Bool)

(declare-fun res!120536 () Bool)

(declare-fun e!96124 () Bool)

(assert (=> d!46349 (=> res!120536 e!96124)))

(assert (=> d!46349 (= res!120536 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!46349 (= (arrayRangesEq!289 arr!237 (_2!6750 lt!222552) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!96124)))

(declare-fun b!144283 () Bool)

(declare-fun e!96125 () Bool)

(assert (=> b!144283 (= e!96124 e!96125)))

(declare-fun res!120537 () Bool)

(assert (=> b!144283 (=> (not res!120537) (not e!96125))))

(assert (=> b!144283 (= res!120537 (= (select (arr!3696 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3696 (_2!6750 lt!222552)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!144284 () Bool)

(assert (=> b!144284 (= e!96125 (arrayRangesEq!289 arr!237 (_2!6750 lt!222552) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46349 (not res!120536)) b!144283))

(assert (= (and b!144283 res!120537) b!144284))

(declare-fun m!221903 () Bool)

(assert (=> b!144283 m!221903))

(declare-fun m!221905 () Bool)

(assert (=> b!144283 m!221905))

(declare-fun m!221907 () Bool)

(assert (=> b!144284 m!221907))

(assert (=> b!143668 d!46349))

(declare-fun bm!1888 () Bool)

(declare-fun call!1891 () Bool)

(declare-fun lt!223841 () tuple4!132)

(declare-fun lt!223843 () (_ BitVec 32))

(declare-fun c!7884 () Bool)

(declare-fun lt!223842 () (_ BitVec 32))

(assert (=> bm!1888 (= call!1891 (byteRangesEq!0 (select (arr!3696 (buf!3402 thiss!1634)) (_3!345 lt!223841)) (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_3!345 lt!223841)) lt!223843 (ite c!7884 lt!223842 #b00000000000000000000000000001000)))))

(declare-fun e!96127 () Bool)

(declare-fun b!144285 () Bool)

(assert (=> b!144285 (= e!96127 (byteRangesEq!0 (select (arr!3696 (buf!3402 thiss!1634)) (_4!66 lt!223841)) (select (arr!3696 (buf!3402 (_2!6752 lt!222545))) (_4!66 lt!223841)) #b00000000000000000000000000000000 lt!223842))))

(declare-fun e!96130 () Bool)

(declare-fun b!144286 () Bool)

(assert (=> b!144286 (= e!96130 (arrayRangesEq!289 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222545)) (_1!6761 lt!223841) (_2!6761 lt!223841)))))

(declare-fun b!144288 () Bool)

(declare-fun e!96129 () Bool)

(declare-fun e!96126 () Bool)

(assert (=> b!144288 (= e!96129 e!96126)))

(assert (=> b!144288 (= c!7884 (= (_3!345 lt!223841) (_4!66 lt!223841)))))

(declare-fun b!144289 () Bool)

(declare-fun res!120539 () Bool)

(assert (=> b!144289 (= res!120539 (= lt!223842 #b00000000000000000000000000000000))))

(assert (=> b!144289 (=> res!120539 e!96127)))

(declare-fun e!96131 () Bool)

(assert (=> b!144289 (= e!96131 e!96127)))

(declare-fun b!144290 () Bool)

(assert (=> b!144290 (= e!96126 e!96131)))

(declare-fun res!120541 () Bool)

(assert (=> b!144290 (= res!120541 call!1891)))

(assert (=> b!144290 (=> (not res!120541) (not e!96131))))

(declare-fun b!144291 () Bool)

(assert (=> b!144291 (= e!96126 call!1891)))

(declare-fun d!46351 () Bool)

(declare-fun res!120540 () Bool)

(declare-fun e!96128 () Bool)

(assert (=> d!46351 (=> res!120540 e!96128)))

(assert (=> d!46351 (= res!120540 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (=> d!46351 (= (arrayBitRangesEq!0 (buf!3402 thiss!1634) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) e!96128)))

(declare-fun b!144287 () Bool)

(assert (=> b!144287 (= e!96128 e!96129)))

(declare-fun res!120538 () Bool)

(assert (=> b!144287 (=> (not res!120538) (not e!96129))))

(assert (=> b!144287 (= res!120538 e!96130)))

(declare-fun res!120542 () Bool)

(assert (=> b!144287 (=> res!120542 e!96130)))

(assert (=> b!144287 (= res!120542 (bvsge (_1!6761 lt!223841) (_2!6761 lt!223841)))))

(assert (=> b!144287 (= lt!223842 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144287 (= lt!223843 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144287 (= lt!223841 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 thiss!1634)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))

(assert (= (and d!46351 (not res!120540)) b!144287))

(assert (= (and b!144287 (not res!120542)) b!144286))

(assert (= (and b!144287 res!120538) b!144288))

(assert (= (and b!144288 c!7884) b!144291))

(assert (= (and b!144288 (not c!7884)) b!144290))

(assert (= (and b!144290 res!120541) b!144289))

(assert (= (and b!144289 (not res!120539)) b!144285))

(assert (= (or b!144291 b!144290) bm!1888))

(declare-fun m!221909 () Bool)

(assert (=> bm!1888 m!221909))

(declare-fun m!221911 () Bool)

(assert (=> bm!1888 m!221911))

(assert (=> bm!1888 m!221909))

(assert (=> bm!1888 m!221911))

(declare-fun m!221913 () Bool)

(assert (=> bm!1888 m!221913))

(declare-fun m!221915 () Bool)

(assert (=> b!144285 m!221915))

(declare-fun m!221917 () Bool)

(assert (=> b!144285 m!221917))

(assert (=> b!144285 m!221915))

(assert (=> b!144285 m!221917))

(declare-fun m!221919 () Bool)

(assert (=> b!144285 m!221919))

(declare-fun m!221921 () Bool)

(assert (=> b!144286 m!221921))

(assert (=> b!144287 m!220563))

(assert (=> b!144287 m!221573))

(assert (=> b!143745 d!46351))

(assert (=> b!143745 d!45854))

(assert (=> d!45868 d!45866))

(declare-fun d!46353 () Bool)

(assert (=> d!46353 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 (_2!6752 lt!222539))) ((_ sign_extend 32) (currentBit!6281 (_2!6752 lt!222539))) lt!222540)))

(assert (=> d!46353 true))

(declare-fun _$6!304 () Unit!8946)

(assert (=> d!46353 (= (choose!9 (_2!6752 lt!222539) (buf!3402 (_2!6752 lt!222545)) lt!222540 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 (_2!6752 lt!222539)) (currentBit!6281 (_2!6752 lt!222539)))) _$6!304)))

(declare-fun bs!11348 () Bool)

(assert (= bs!11348 d!46353))

(assert (=> bs!11348 m!220581))

(assert (=> d!45868 d!46353))

(assert (=> d!45854 d!46285))

(assert (=> d!45854 d!45876))

(declare-fun d!46355 () Bool)

(declare-fun res!120545 () Bool)

(declare-fun e!96133 () Bool)

(assert (=> d!46355 (=> (not res!120545) (not e!96133))))

(assert (=> d!46355 (= res!120545 (= (size!2973 (buf!3402 lt!222843)) (size!2973 (buf!3402 lt!222843))))))

(assert (=> d!46355 (= (isPrefixOf!0 lt!222843 lt!222843) e!96133)))

(declare-fun b!144292 () Bool)

(declare-fun res!120544 () Bool)

(assert (=> b!144292 (=> (not res!120544) (not e!96133))))

(assert (=> b!144292 (= res!120544 (bvsle (bitIndex!0 (size!2973 (buf!3402 lt!222843)) (currentByte!6286 lt!222843) (currentBit!6281 lt!222843)) (bitIndex!0 (size!2973 (buf!3402 lt!222843)) (currentByte!6286 lt!222843) (currentBit!6281 lt!222843))))))

(declare-fun b!144293 () Bool)

(declare-fun e!96132 () Bool)

(assert (=> b!144293 (= e!96133 e!96132)))

(declare-fun res!120543 () Bool)

(assert (=> b!144293 (=> res!120543 e!96132)))

(assert (=> b!144293 (= res!120543 (= (size!2973 (buf!3402 lt!222843)) #b00000000000000000000000000000000))))

(declare-fun b!144294 () Bool)

(assert (=> b!144294 (= e!96132 (arrayBitRangesEq!0 (buf!3402 lt!222843) (buf!3402 lt!222843) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 lt!222843)) (currentByte!6286 lt!222843) (currentBit!6281 lt!222843))))))

(assert (= (and d!46355 res!120545) b!144292))

(assert (= (and b!144292 res!120544) b!144293))

(assert (= (and b!144293 (not res!120543)) b!144294))

(declare-fun m!221923 () Bool)

(assert (=> b!144292 m!221923))

(assert (=> b!144292 m!221923))

(assert (=> b!144294 m!221923))

(assert (=> b!144294 m!221923))

(declare-fun m!221925 () Bool)

(assert (=> b!144294 m!221925))

(assert (=> d!45930 d!46355))

(declare-fun d!46357 () Bool)

(declare-fun res!120548 () Bool)

(declare-fun e!96135 () Bool)

(assert (=> d!46357 (=> (not res!120548) (not e!96135))))

(assert (=> d!46357 (= res!120548 (= (size!2973 (buf!3402 (_2!6752 lt!222545))) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!46357 (= (isPrefixOf!0 (_2!6752 lt!222545) (_2!6752 lt!222545)) e!96135)))

(declare-fun b!144295 () Bool)

(declare-fun res!120547 () Bool)

(assert (=> b!144295 (=> (not res!120547) (not e!96135))))

(assert (=> b!144295 (= res!120547 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545))) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!144296 () Bool)

(declare-fun e!96134 () Bool)

(assert (=> b!144296 (= e!96135 e!96134)))

(declare-fun res!120546 () Bool)

(assert (=> b!144296 (=> res!120546 e!96134)))

(assert (=> b!144296 (= res!120546 (= (size!2973 (buf!3402 (_2!6752 lt!222545))) #b00000000000000000000000000000000))))

(declare-fun b!144297 () Bool)

(assert (=> b!144297 (= e!96134 (arrayBitRangesEq!0 (buf!3402 (_2!6752 lt!222545)) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(assert (= (and d!46357 res!120548) b!144295))

(assert (= (and b!144295 res!120547) b!144296))

(assert (= (and b!144296 (not res!120546)) b!144297))

(assert (=> b!144295 m!220577))

(assert (=> b!144295 m!220577))

(assert (=> b!144297 m!220577))

(assert (=> b!144297 m!220577))

(declare-fun m!221927 () Bool)

(assert (=> b!144297 m!221927))

(assert (=> d!45930 d!46357))

(declare-fun d!46359 () Bool)

(assert (=> d!46359 (isPrefixOf!0 (_2!6752 lt!222545) (_2!6752 lt!222545))))

(declare-fun lt!223844 () Unit!8946)

(assert (=> d!46359 (= lt!223844 (choose!11 (_2!6752 lt!222545)))))

(assert (=> d!46359 (= (lemmaIsPrefixRefl!0 (_2!6752 lt!222545)) lt!223844)))

(declare-fun bs!11349 () Bool)

(assert (= bs!11349 d!46359))

(assert (=> bs!11349 m!220669))

(declare-fun m!221929 () Bool)

(assert (=> bs!11349 m!221929))

(assert (=> d!45930 d!46359))

(declare-fun d!46361 () Bool)

(assert (=> d!46361 (isPrefixOf!0 lt!222843 (_2!6752 lt!222545))))

(declare-fun lt!223845 () Unit!8946)

(assert (=> d!46361 (= lt!223845 (choose!30 lt!222843 (_2!6752 lt!222545) (_2!6752 lt!222545)))))

(assert (=> d!46361 (isPrefixOf!0 lt!222843 (_2!6752 lt!222545))))

(assert (=> d!46361 (= (lemmaIsPrefixTransitive!0 lt!222843 (_2!6752 lt!222545) (_2!6752 lt!222545)) lt!223845)))

(declare-fun bs!11350 () Bool)

(assert (= bs!11350 d!46361))

(assert (=> bs!11350 m!220779))

(declare-fun m!221931 () Bool)

(assert (=> bs!11350 m!221931))

(assert (=> bs!11350 m!220779))

(assert (=> d!45930 d!46361))

(declare-fun d!46363 () Bool)

(declare-fun res!120551 () Bool)

(declare-fun e!96137 () Bool)

(assert (=> d!46363 (=> (not res!120551) (not e!96137))))

(assert (=> d!46363 (= res!120551 (= (size!2973 (buf!3402 lt!222843)) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!46363 (= (isPrefixOf!0 lt!222843 (_2!6752 lt!222545)) e!96137)))

(declare-fun b!144298 () Bool)

(declare-fun res!120550 () Bool)

(assert (=> b!144298 (=> (not res!120550) (not e!96137))))

(assert (=> b!144298 (= res!120550 (bvsle (bitIndex!0 (size!2973 (buf!3402 lt!222843)) (currentByte!6286 lt!222843) (currentBit!6281 lt!222843)) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!144299 () Bool)

(declare-fun e!96136 () Bool)

(assert (=> b!144299 (= e!96137 e!96136)))

(declare-fun res!120549 () Bool)

(assert (=> b!144299 (=> res!120549 e!96136)))

(assert (=> b!144299 (= res!120549 (= (size!2973 (buf!3402 lt!222843)) #b00000000000000000000000000000000))))

(declare-fun b!144300 () Bool)

(assert (=> b!144300 (= e!96136 (arrayBitRangesEq!0 (buf!3402 lt!222843) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 lt!222843)) (currentByte!6286 lt!222843) (currentBit!6281 lt!222843))))))

(assert (= (and d!46363 res!120551) b!144298))

(assert (= (and b!144298 res!120550) b!144299))

(assert (= (and b!144299 (not res!120549)) b!144300))

(assert (=> b!144298 m!221923))

(assert (=> b!144298 m!220577))

(assert (=> b!144300 m!221923))

(assert (=> b!144300 m!221923))

(declare-fun m!221933 () Bool)

(assert (=> b!144300 m!221933))

(assert (=> d!45930 d!46363))

(assert (=> d!45930 d!46271))

(declare-fun d!46365 () Bool)

(assert (=> d!46365 (isPrefixOf!0 lt!222843 lt!222843)))

(declare-fun lt!223846 () Unit!8946)

(assert (=> d!46365 (= lt!223846 (choose!11 lt!222843))))

(assert (=> d!46365 (= (lemmaIsPrefixRefl!0 lt!222843) lt!223846)))

(declare-fun bs!11351 () Bool)

(assert (= bs!11351 d!46365))

(assert (=> bs!11351 m!220785))

(declare-fun m!221935 () Bool)

(assert (=> bs!11351 m!221935))

(assert (=> d!45930 d!46365))

(declare-fun d!46367 () Bool)

(declare-fun res!120554 () Bool)

(declare-fun e!96139 () Bool)

(assert (=> d!46367 (=> (not res!120554) (not e!96139))))

(assert (=> d!46367 (= res!120554 (= (size!2973 (buf!3402 (_1!6751 lt!222845))) (size!2973 (buf!3402 (_2!6751 lt!222845)))))))

(assert (=> d!46367 (= (isPrefixOf!0 (_1!6751 lt!222845) (_2!6751 lt!222845)) e!96139)))

(declare-fun b!144301 () Bool)

(declare-fun res!120553 () Bool)

(assert (=> b!144301 (=> (not res!120553) (not e!96139))))

(assert (=> b!144301 (= res!120553 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222845))) (currentByte!6286 (_1!6751 lt!222845)) (currentBit!6281 (_1!6751 lt!222845))) (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222845))) (currentByte!6286 (_2!6751 lt!222845)) (currentBit!6281 (_2!6751 lt!222845)))))))

(declare-fun b!144302 () Bool)

(declare-fun e!96138 () Bool)

(assert (=> b!144302 (= e!96139 e!96138)))

(declare-fun res!120552 () Bool)

(assert (=> b!144302 (=> res!120552 e!96138)))

(assert (=> b!144302 (= res!120552 (= (size!2973 (buf!3402 (_1!6751 lt!222845))) #b00000000000000000000000000000000))))

(declare-fun b!144303 () Bool)

(assert (=> b!144303 (= e!96138 (arrayBitRangesEq!0 (buf!3402 (_1!6751 lt!222845)) (buf!3402 (_2!6751 lt!222845)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222845))) (currentByte!6286 (_1!6751 lt!222845)) (currentBit!6281 (_1!6751 lt!222845)))))))

(assert (= (and d!46367 res!120554) b!144301))

(assert (= (and b!144301 res!120553) b!144302))

(assert (= (and b!144302 (not res!120552)) b!144303))

(assert (=> b!144301 m!221679))

(assert (=> b!144301 m!221649))

(assert (=> b!144303 m!221679))

(assert (=> b!144303 m!221679))

(declare-fun m!221937 () Bool)

(assert (=> b!144303 m!221937))

(assert (=> d!45930 d!46367))

(assert (=> d!45930 d!46279))

(declare-fun d!46369 () Bool)

(assert (=> d!46369 (isPrefixOf!0 lt!222843 (_2!6752 lt!222545))))

(declare-fun lt!223847 () Unit!8946)

(assert (=> d!46369 (= lt!223847 (choose!30 lt!222843 thiss!1634 (_2!6752 lt!222545)))))

(assert (=> d!46369 (isPrefixOf!0 lt!222843 thiss!1634)))

(assert (=> d!46369 (= (lemmaIsPrefixTransitive!0 lt!222843 thiss!1634 (_2!6752 lt!222545)) lt!223847)))

(declare-fun bs!11352 () Bool)

(assert (= bs!11352 d!46369))

(assert (=> bs!11352 m!220779))

(declare-fun m!221939 () Bool)

(assert (=> bs!11352 m!221939))

(declare-fun m!221941 () Bool)

(assert (=> bs!11352 m!221941))

(assert (=> d!45930 d!46369))

(assert (=> d!45930 d!45922))

(assert (=> b!143743 d!45854))

(assert (=> b!143743 d!45973))

(declare-fun lt!223861 () (_ BitVec 32))

(declare-fun lt!223853 () array!6567)

(declare-fun lt!223858 () (_ BitVec 32))

(declare-fun lt!223881 () tuple3!552)

(declare-fun call!1892 () Bool)

(declare-fun bm!1889 () Bool)

(declare-fun c!7885 () Bool)

(declare-fun lt!223851 () array!6567)

(assert (=> bm!1889 (= call!1892 (arrayRangesEq!289 (ite c!7885 arr!237 lt!223851) (ite c!7885 (_3!341 lt!223881) lt!223853) (ite c!7885 #b00000000000000000000000000000000 lt!223861) (ite c!7885 (bvadd #b00000000000000000000000000000001 from!447) lt!223858)))))

(declare-fun e!96140 () tuple3!552)

(declare-fun lt!223873 () Unit!8946)

(declare-fun b!144304 () Bool)

(assert (=> b!144304 (= e!96140 (tuple3!553 lt!223873 (_1!6751 lt!222541) arr!237))))

(declare-fun call!1893 () (_ BitVec 64))

(assert (=> b!144304 (= call!1893 call!1893)))

(declare-fun lt!223854 () Unit!8946)

(declare-fun Unit!9010 () Unit!8946)

(assert (=> b!144304 (= lt!223854 Unit!9010)))

(declare-fun lt!223864 () Unit!8946)

(assert (=> b!144304 (= lt!223864 (arrayRangesEqReflexiveLemma!9 arr!237))))

(declare-fun call!1894 () Bool)

(assert (=> b!144304 call!1894))

(declare-fun lt!223867 () Unit!8946)

(assert (=> b!144304 (= lt!223867 lt!223864)))

(assert (=> b!144304 (= lt!223851 arr!237)))

(assert (=> b!144304 (= lt!223853 arr!237)))

(declare-fun lt!223875 () (_ BitVec 32))

(assert (=> b!144304 (= lt!223875 #b00000000000000000000000000000000)))

(declare-fun lt!223860 () (_ BitVec 32))

(assert (=> b!144304 (= lt!223860 (size!2973 arr!237))))

(assert (=> b!144304 (= lt!223861 #b00000000000000000000000000000000)))

(assert (=> b!144304 (= lt!223858 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!144304 (= lt!223873 (arrayRangesEqSlicedLemma!9 lt!223851 lt!223853 lt!223875 lt!223860 lt!223861 lt!223858))))

(assert (=> b!144304 call!1892))

(declare-fun bm!1890 () Bool)

(assert (=> bm!1890 (= call!1893 (bitIndex!0 (ite c!7885 (size!2973 (buf!3402 (_2!6754 lt!223881))) (size!2973 (buf!3402 (_1!6751 lt!222541)))) (ite c!7885 (currentByte!6286 (_2!6754 lt!223881)) (currentByte!6286 (_1!6751 lt!222541))) (ite c!7885 (currentBit!6281 (_2!6754 lt!223881)) (currentBit!6281 (_1!6751 lt!222541)))))))

(declare-fun b!144305 () Bool)

(declare-fun lt!223857 () tuple3!552)

(declare-fun e!96142 () Bool)

(assert (=> b!144305 (= e!96142 (= (select (arr!3696 (_3!341 lt!223857)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6749 (readBytePure!0 (_1!6751 lt!222541)))))))

(assert (=> b!144305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2973 (_3!341 lt!223857))))))

(declare-fun bm!1891 () Bool)

(declare-fun lt!223882 () (_ BitVec 32))

(assert (=> bm!1891 (= call!1894 (arrayRangesEq!289 arr!237 (ite c!7885 (_3!341 lt!223881) arr!237) (ite c!7885 lt!223882 #b00000000000000000000000000000000) (ite c!7885 (bvadd #b00000000000000000000000000000001 from!447) (size!2973 arr!237))))))

(declare-fun b!144306 () Bool)

(declare-fun lt!223871 () Unit!8946)

(assert (=> b!144306 (= e!96140 (tuple3!553 lt!223871 (_2!6754 lt!223881) (_3!341 lt!223881)))))

(declare-fun lt!223868 () tuple2!12824)

(assert (=> b!144306 (= lt!223868 (readByte!0 (_1!6751 lt!222541)))))

(declare-fun lt!223866 () array!6567)

(assert (=> b!144306 (= lt!223866 (array!6568 (store (arr!3696 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6753 lt!223868)) (size!2973 arr!237)))))

(declare-fun lt!223852 () (_ BitVec 64))

(assert (=> b!144306 (= lt!223852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!223863 () (_ BitVec 32))

(assert (=> b!144306 (= lt!223863 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!223865 () Unit!8946)

(assert (=> b!144306 (= lt!223865 (validateOffsetBytesFromBitIndexLemma!0 (_1!6751 lt!222541) (_2!6753 lt!223868) lt!223852 lt!223863))))

(assert (=> b!144306 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6753 lt!223868)))) ((_ sign_extend 32) (currentByte!6286 (_2!6753 lt!223868))) ((_ sign_extend 32) (currentBit!6281 (_2!6753 lt!223868))) (bvsub lt!223863 ((_ extract 31 0) (bvsdiv (bvadd lt!223852 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!223855 () Unit!8946)

(assert (=> b!144306 (= lt!223855 lt!223865)))

(assert (=> b!144306 (= lt!223881 (readByteArrayLoop!0 (_2!6753 lt!223868) lt!223866 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!144306 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223868))) (currentByte!6286 (_2!6753 lt!223868)) (currentBit!6281 (_2!6753 lt!223868))) (bvadd (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222541))) (currentByte!6286 (_1!6751 lt!222541)) (currentBit!6281 (_1!6751 lt!222541))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!223874 () Unit!8946)

(declare-fun Unit!9011 () Unit!8946)

(assert (=> b!144306 (= lt!223874 Unit!9011)))

(assert (=> b!144306 (= (bvadd (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223868))) (currentByte!6286 (_2!6753 lt!223868)) (currentBit!6281 (_2!6753 lt!223868))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1893)))

(declare-fun lt!223870 () Unit!8946)

(declare-fun Unit!9012 () Unit!8946)

(assert (=> b!144306 (= lt!223870 Unit!9012)))

(assert (=> b!144306 (= (bvadd (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222541))) (currentByte!6286 (_1!6751 lt!222541)) (currentBit!6281 (_1!6751 lt!222541))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1893)))

(declare-fun lt!223862 () Unit!8946)

(declare-fun Unit!9013 () Unit!8946)

(assert (=> b!144306 (= lt!223862 Unit!9013)))

(assert (=> b!144306 (and (= (buf!3402 (_1!6751 lt!222541)) (buf!3402 (_2!6754 lt!223881))) (= (size!2973 arr!237) (size!2973 (_3!341 lt!223881))))))

(declare-fun lt!223879 () Unit!8946)

(declare-fun Unit!9014 () Unit!8946)

(assert (=> b!144306 (= lt!223879 Unit!9014)))

(declare-fun lt!223856 () Unit!8946)

(assert (=> b!144306 (= lt!223856 (arrayUpdatedAtPrefixLemma!9 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6753 lt!223868)))))

(assert (=> b!144306 (arrayRangesEq!289 arr!237 (array!6568 (store (arr!3696 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6753 lt!223868)) (size!2973 arr!237)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!223877 () Unit!8946)

(assert (=> b!144306 (= lt!223877 lt!223856)))

(assert (=> b!144306 (= lt!223882 #b00000000000000000000000000000000)))

(declare-fun lt!223880 () Unit!8946)

(assert (=> b!144306 (= lt!223880 (arrayRangesEqTransitive!49 arr!237 lt!223866 (_3!341 lt!223881) lt!223882 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!144306 call!1894))

(declare-fun lt!223878 () Unit!8946)

(assert (=> b!144306 (= lt!223878 lt!223880)))

(assert (=> b!144306 call!1892))

(declare-fun lt!223849 () Unit!8946)

(declare-fun Unit!9015 () Unit!8946)

(assert (=> b!144306 (= lt!223849 Unit!9015)))

(declare-fun lt!223850 () Unit!8946)

(assert (=> b!144306 (= lt!223850 (arrayRangesEqImpliesEq!9 lt!223866 (_3!341 lt!223881) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!144306 (= (select (store (arr!3696 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6753 lt!223868)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3696 (_3!341 lt!223881)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!223859 () Unit!8946)

(assert (=> b!144306 (= lt!223859 lt!223850)))

(declare-fun lt!223883 () Bool)

(assert (=> b!144306 (= lt!223883 (= (select (arr!3696 (_3!341 lt!223881)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6753 lt!223868)))))

(declare-fun Unit!9016 () Unit!8946)

(assert (=> b!144306 (= lt!223871 Unit!9016)))

(assert (=> b!144306 lt!223883))

(declare-fun e!96141 () Bool)

(declare-fun b!144307 () Bool)

(assert (=> b!144307 (= e!96141 (arrayRangesEq!289 arr!237 (_3!341 lt!223857) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!46371 () Bool)

(assert (=> d!46371 e!96142))

(declare-fun res!120555 () Bool)

(assert (=> d!46371 (=> res!120555 e!96142)))

(assert (=> d!46371 (= res!120555 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!223876 () Bool)

(assert (=> d!46371 (= lt!223876 e!96141)))

(declare-fun res!120557 () Bool)

(assert (=> d!46371 (=> (not res!120557) (not e!96141))))

(declare-fun lt!223872 () (_ BitVec 64))

(declare-fun lt!223848 () (_ BitVec 64))

(assert (=> d!46371 (= res!120557 (= (bvadd lt!223848 lt!223872) (bitIndex!0 (size!2973 (buf!3402 (_2!6754 lt!223857))) (currentByte!6286 (_2!6754 lt!223857)) (currentBit!6281 (_2!6754 lt!223857)))))))

(assert (=> d!46371 (or (not (= (bvand lt!223848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223872 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223848 lt!223872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!223869 () (_ BitVec 64))

(assert (=> d!46371 (= lt!223872 (bvmul lt!223869 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!46371 (or (= lt!223869 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223869 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223869)))))

(assert (=> d!46371 (= lt!223869 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!46371 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!46371 (= lt!223848 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222541))) (currentByte!6286 (_1!6751 lt!222541)) (currentBit!6281 (_1!6751 lt!222541))))))

(assert (=> d!46371 (= lt!223857 e!96140)))

(assert (=> d!46371 (= c!7885 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46371 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2973 arr!237)))))

(assert (=> d!46371 (= (readByteArrayLoop!0 (_1!6751 lt!222541) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!223857)))

(declare-fun b!144308 () Bool)

(declare-fun res!120556 () Bool)

(assert (=> b!144308 (=> (not res!120556) (not e!96141))))

(assert (=> b!144308 (= res!120556 (and (= (buf!3402 (_1!6751 lt!222541)) (buf!3402 (_2!6754 lt!223857))) (= (size!2973 arr!237) (size!2973 (_3!341 lt!223857)))))))

(assert (= (and d!46371 c!7885) b!144306))

(assert (= (and d!46371 (not c!7885)) b!144304))

(assert (= (or b!144306 b!144304) bm!1889))

(assert (= (or b!144306 b!144304) bm!1891))

(assert (= (or b!144306 b!144304) bm!1890))

(assert (= (and d!46371 res!120557) b!144308))

(assert (= (and b!144308 res!120556) b!144307))

(assert (= (and d!46371 (not res!120555)) b!144305))

(declare-fun m!221943 () Bool)

(assert (=> b!144305 m!221943))

(declare-fun m!221945 () Bool)

(assert (=> b!144305 m!221945))

(declare-fun m!221947 () Bool)

(assert (=> bm!1891 m!221947))

(declare-fun m!221949 () Bool)

(assert (=> d!46371 m!221949))

(declare-fun m!221951 () Bool)

(assert (=> d!46371 m!221951))

(assert (=> b!144304 m!221591))

(declare-fun m!221953 () Bool)

(assert (=> b!144304 m!221953))

(declare-fun m!221955 () Bool)

(assert (=> b!144306 m!221955))

(declare-fun m!221957 () Bool)

(assert (=> b!144306 m!221957))

(declare-fun m!221959 () Bool)

(assert (=> b!144306 m!221959))

(declare-fun m!221961 () Bool)

(assert (=> b!144306 m!221961))

(declare-fun m!221963 () Bool)

(assert (=> b!144306 m!221963))

(declare-fun m!221965 () Bool)

(assert (=> b!144306 m!221965))

(declare-fun m!221967 () Bool)

(assert (=> b!144306 m!221967))

(declare-fun m!221969 () Bool)

(assert (=> b!144306 m!221969))

(declare-fun m!221971 () Bool)

(assert (=> b!144306 m!221971))

(assert (=> b!144306 m!221951))

(declare-fun m!221973 () Bool)

(assert (=> b!144306 m!221973))

(declare-fun m!221975 () Bool)

(assert (=> b!144306 m!221975))

(declare-fun m!221977 () Bool)

(assert (=> b!144306 m!221977))

(declare-fun m!221979 () Bool)

(assert (=> bm!1890 m!221979))

(declare-fun m!221981 () Bool)

(assert (=> bm!1889 m!221981))

(declare-fun m!221983 () Bool)

(assert (=> b!144307 m!221983))

(assert (=> d!45864 d!46371))

(assert (=> d!45870 d!46357))

(declare-fun d!46373 () Bool)

(declare-fun res!120560 () Bool)

(declare-fun e!96144 () Bool)

(assert (=> d!46373 (=> (not res!120560) (not e!96144))))

(assert (=> d!46373 (= res!120560 (= (size!2973 (buf!3402 lt!222676)) (size!2973 (buf!3402 (_2!6752 lt!222545)))))))

(assert (=> d!46373 (= (isPrefixOf!0 lt!222676 (_2!6752 lt!222545)) e!96144)))

(declare-fun b!144309 () Bool)

(declare-fun res!120559 () Bool)

(assert (=> b!144309 (=> (not res!120559) (not e!96144))))

(assert (=> b!144309 (= res!120559 (bvsle (bitIndex!0 (size!2973 (buf!3402 lt!222676)) (currentByte!6286 lt!222676) (currentBit!6281 lt!222676)) (bitIndex!0 (size!2973 (buf!3402 (_2!6752 lt!222545))) (currentByte!6286 (_2!6752 lt!222545)) (currentBit!6281 (_2!6752 lt!222545)))))))

(declare-fun b!144310 () Bool)

(declare-fun e!96143 () Bool)

(assert (=> b!144310 (= e!96144 e!96143)))

(declare-fun res!120558 () Bool)

(assert (=> b!144310 (=> res!120558 e!96143)))

(assert (=> b!144310 (= res!120558 (= (size!2973 (buf!3402 lt!222676)) #b00000000000000000000000000000000))))

(declare-fun b!144311 () Bool)

(assert (=> b!144311 (= e!96143 (arrayBitRangesEq!0 (buf!3402 lt!222676) (buf!3402 (_2!6752 lt!222545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 lt!222676)) (currentByte!6286 lt!222676) (currentBit!6281 lt!222676))))))

(assert (= (and d!46373 res!120560) b!144309))

(assert (= (and b!144309 res!120559) b!144310))

(assert (= (and b!144310 (not res!120558)) b!144311))

(declare-fun m!221985 () Bool)

(assert (=> b!144309 m!221985))

(assert (=> b!144309 m!220577))

(assert (=> b!144311 m!221985))

(assert (=> b!144311 m!221985))

(declare-fun m!221987 () Bool)

(assert (=> b!144311 m!221987))

(assert (=> d!45870 d!46373))

(assert (=> d!45870 d!46359))

(declare-fun d!46375 () Bool)

(assert (=> d!46375 (isPrefixOf!0 lt!222676 lt!222676)))

(declare-fun lt!223884 () Unit!8946)

(assert (=> d!46375 (= lt!223884 (choose!11 lt!222676))))

(assert (=> d!46375 (= (lemmaIsPrefixRefl!0 lt!222676) lt!223884)))

(declare-fun bs!11353 () Bool)

(assert (= bs!11353 d!46375))

(assert (=> bs!11353 m!220665))

(declare-fun m!221989 () Bool)

(assert (=> bs!11353 m!221989))

(assert (=> d!45870 d!46375))

(declare-fun d!46377 () Bool)

(declare-fun res!120563 () Bool)

(declare-fun e!96146 () Bool)

(assert (=> d!46377 (=> (not res!120563) (not e!96146))))

(assert (=> d!46377 (= res!120563 (= (size!2973 (buf!3402 (_1!6751 lt!222678))) (size!2973 (buf!3402 (_2!6751 lt!222678)))))))

(assert (=> d!46377 (= (isPrefixOf!0 (_1!6751 lt!222678) (_2!6751 lt!222678)) e!96146)))

(declare-fun b!144312 () Bool)

(declare-fun res!120562 () Bool)

(assert (=> b!144312 (=> (not res!120562) (not e!96146))))

(assert (=> b!144312 (= res!120562 (bvsle (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222678))) (currentByte!6286 (_1!6751 lt!222678)) (currentBit!6281 (_1!6751 lt!222678))) (bitIndex!0 (size!2973 (buf!3402 (_2!6751 lt!222678))) (currentByte!6286 (_2!6751 lt!222678)) (currentBit!6281 (_2!6751 lt!222678)))))))

(declare-fun b!144313 () Bool)

(declare-fun e!96145 () Bool)

(assert (=> b!144313 (= e!96146 e!96145)))

(declare-fun res!120561 () Bool)

(assert (=> b!144313 (=> res!120561 e!96145)))

(assert (=> b!144313 (= res!120561 (= (size!2973 (buf!3402 (_1!6751 lt!222678))) #b00000000000000000000000000000000))))

(declare-fun b!144314 () Bool)

(assert (=> b!144314 (= e!96145 (arrayBitRangesEq!0 (buf!3402 (_1!6751 lt!222678)) (buf!3402 (_2!6751 lt!222678)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 (_1!6751 lt!222678))) (currentByte!6286 (_1!6751 lt!222678)) (currentBit!6281 (_1!6751 lt!222678)))))))

(assert (= (and d!46377 res!120563) b!144312))

(assert (= (and b!144312 res!120562) b!144313))

(assert (= (and b!144313 (not res!120561)) b!144314))

(assert (=> b!144312 m!221625))

(assert (=> b!144312 m!221577))

(assert (=> b!144314 m!221625))

(assert (=> b!144314 m!221625))

(declare-fun m!221991 () Bool)

(assert (=> b!144314 m!221991))

(assert (=> d!45870 d!46377))

(declare-fun d!46379 () Bool)

(declare-fun res!120566 () Bool)

(declare-fun e!96148 () Bool)

(assert (=> d!46379 (=> (not res!120566) (not e!96148))))

(assert (=> d!46379 (= res!120566 (= (size!2973 (buf!3402 lt!222676)) (size!2973 (buf!3402 lt!222676))))))

(assert (=> d!46379 (= (isPrefixOf!0 lt!222676 lt!222676) e!96148)))

(declare-fun b!144315 () Bool)

(declare-fun res!120565 () Bool)

(assert (=> b!144315 (=> (not res!120565) (not e!96148))))

(assert (=> b!144315 (= res!120565 (bvsle (bitIndex!0 (size!2973 (buf!3402 lt!222676)) (currentByte!6286 lt!222676) (currentBit!6281 lt!222676)) (bitIndex!0 (size!2973 (buf!3402 lt!222676)) (currentByte!6286 lt!222676) (currentBit!6281 lt!222676))))))

(declare-fun b!144316 () Bool)

(declare-fun e!96147 () Bool)

(assert (=> b!144316 (= e!96148 e!96147)))

(declare-fun res!120564 () Bool)

(assert (=> b!144316 (=> res!120564 e!96147)))

(assert (=> b!144316 (= res!120564 (= (size!2973 (buf!3402 lt!222676)) #b00000000000000000000000000000000))))

(declare-fun b!144317 () Bool)

(assert (=> b!144317 (= e!96147 (arrayBitRangesEq!0 (buf!3402 lt!222676) (buf!3402 lt!222676) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2973 (buf!3402 lt!222676)) (currentByte!6286 lt!222676) (currentBit!6281 lt!222676))))))

(assert (= (and d!46379 res!120566) b!144315))

(assert (= (and b!144315 res!120565) b!144316))

(assert (= (and b!144316 (not res!120564)) b!144317))

(assert (=> b!144315 m!221985))

(assert (=> b!144315 m!221985))

(assert (=> b!144317 m!221985))

(assert (=> b!144317 m!221985))

(declare-fun m!221993 () Bool)

(assert (=> b!144317 m!221993))

(assert (=> d!45870 d!46379))

(declare-fun d!46381 () Bool)

(assert (=> d!46381 (isPrefixOf!0 lt!222676 (_2!6752 lt!222545))))

(declare-fun lt!223885 () Unit!8946)

(assert (=> d!46381 (= lt!223885 (choose!30 lt!222676 (_2!6752 lt!222539) (_2!6752 lt!222545)))))

(assert (=> d!46381 (isPrefixOf!0 lt!222676 (_2!6752 lt!222539))))

(assert (=> d!46381 (= (lemmaIsPrefixTransitive!0 lt!222676 (_2!6752 lt!222539) (_2!6752 lt!222545)) lt!223885)))

(declare-fun bs!11354 () Bool)

(assert (= bs!11354 d!46381))

(assert (=> bs!11354 m!220659))

(declare-fun m!221995 () Bool)

(assert (=> bs!11354 m!221995))

(declare-fun m!221997 () Bool)

(assert (=> bs!11354 m!221997))

(assert (=> d!45870 d!46381))

(declare-fun d!46383 () Bool)

(assert (=> d!46383 (isPrefixOf!0 lt!222676 (_2!6752 lt!222545))))

(declare-fun lt!223886 () Unit!8946)

(assert (=> d!46383 (= lt!223886 (choose!30 lt!222676 (_2!6752 lt!222545) (_2!6752 lt!222545)))))

(assert (=> d!46383 (isPrefixOf!0 lt!222676 (_2!6752 lt!222545))))

(assert (=> d!46383 (= (lemmaIsPrefixTransitive!0 lt!222676 (_2!6752 lt!222545) (_2!6752 lt!222545)) lt!223886)))

(declare-fun bs!11355 () Bool)

(assert (= bs!11355 d!46383))

(assert (=> bs!11355 m!220659))

(declare-fun m!221999 () Bool)

(assert (=> bs!11355 m!221999))

(assert (=> bs!11355 m!220659))

(assert (=> d!45870 d!46383))

(assert (=> d!45870 d!46277))

(assert (=> d!45870 d!45884))

(assert (=> d!45870 d!46263))

(assert (=> d!45918 d!45957))

(declare-fun d!46385 () Bool)

(assert (=> d!46385 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2973 (buf!3402 (_2!6752 lt!222545)))) ((_ sign_extend 32) (currentByte!6286 thiss!1634)) ((_ sign_extend 32) (currentBit!6281 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!46385 true))

(declare-fun _$5!59 () Unit!8946)

(assert (=> d!46385 (= (choose!26 thiss!1634 (buf!3402 (_2!6752 lt!222545)) (bvsub to!404 from!447) (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) _$5!59)))

(declare-fun bs!11356 () Bool)

(assert (= bs!11356 d!46385))

(assert (=> bs!11356 m!220525))

(assert (=> d!45918 d!46385))

(declare-fun lt!223888 () (_ BitVec 8))

(declare-fun lt!223890 () (_ BitVec 8))

(declare-fun d!46387 () Bool)

(assert (=> d!46387 (= lt!223888 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))) ((_ sign_extend 24) lt!223890))))))

(assert (=> d!46387 (= lt!223890 ((_ extract 7 0) (currentBit!6281 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))))

(declare-fun e!96150 () Bool)

(assert (=> d!46387 e!96150))

(declare-fun res!120567 () Bool)

(assert (=> d!46387 (=> (not res!120567) (not e!96150))))

(assert (=> d!46387 (= res!120567 (validate_offset_bits!1 ((_ sign_extend 32) (size!2973 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))) ((_ sign_extend 32) (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) ((_ sign_extend 32) (currentBit!6281 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9017 () Unit!8946)

(declare-fun Unit!9018 () Unit!8946)

(assert (=> d!46387 (= (readByte!0 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223890) #b00000000000000000000000000000000) (tuple2!12833 Unit!9017 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223888) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) (bvadd (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223890)))))))) (tuple2!12833 Unit!9018 lt!223888))) (BitStream!5205 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) (bvadd (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6281 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))))

(declare-fun b!144318 () Bool)

(declare-fun e!96149 () Bool)

(assert (=> b!144318 (= e!96150 e!96149)))

(declare-fun res!120568 () Bool)

(assert (=> b!144318 (=> (not res!120568) (not e!96149))))

(declare-fun lt!223892 () tuple2!12824)

(assert (=> b!144318 (= res!120568 (= (buf!3402 (_2!6753 lt!223892)) (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))))

(declare-fun lt!223887 () (_ BitVec 8))

(declare-fun lt!223893 () (_ BitVec 8))

(declare-fun Unit!9019 () Unit!8946)

(declare-fun Unit!9020 () Unit!8946)

(assert (=> b!144318 (= lt!223892 (tuple2!12825 (_2!6762 (ite (bvsgt ((_ sign_extend 24) lt!223887) #b00000000000000000000000000000000) (tuple2!12833 Unit!9019 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223893) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3696 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) (bvadd (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223887)))))))) (tuple2!12833 Unit!9020 lt!223893))) (BitStream!5205 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) (bvadd (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6281 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))))))

(assert (=> b!144318 (= lt!223893 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3696 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))))) ((_ sign_extend 24) lt!223887))))))

(assert (=> b!144318 (= lt!223887 ((_ extract 7 0) (currentBit!6281 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))))

(declare-fun lt!223891 () (_ BitVec 64))

(declare-fun lt!223889 () (_ BitVec 64))

(declare-fun b!144319 () Bool)

(assert (=> b!144319 (= e!96149 (= (bitIndex!0 (size!2973 (buf!3402 (_2!6753 lt!223892))) (currentByte!6286 (_2!6753 lt!223892)) (currentBit!6281 (_2!6753 lt!223892))) (bvadd lt!223889 lt!223891)))))

(assert (=> b!144319 (or (not (= (bvand lt!223889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223891 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223889 lt!223891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144319 (= lt!223891 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!144319 (= lt!223889 (bitIndex!0 (size!2973 (buf!3402 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))) (currentByte!6286 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634))) (currentBit!6281 (BitStream!5205 (buf!3402 (_2!6752 lt!222545)) (currentByte!6286 thiss!1634) (currentBit!6281 thiss!1634)))))))

(assert (= (and d!46387 res!120567) b!144318))

(assert (= (and b!144318 res!120568) b!144319))

(declare-fun m!222001 () Bool)

(assert (=> d!46387 m!222001))

(declare-fun m!222003 () Bool)

(assert (=> d!46387 m!222003))

(declare-fun m!222005 () Bool)

(assert (=> d!46387 m!222005))

(assert (=> b!144318 m!222005))

(assert (=> b!144318 m!222001))

(declare-fun m!222007 () Bool)

(assert (=> b!144319 m!222007))

(declare-fun m!222009 () Bool)

(assert (=> b!144319 m!222009))

(assert (=> d!45896 d!46387))

(assert (=> d!45852 d!46249))

(declare-fun d!46389 () Bool)

(assert (=> d!46389 (= (invariant!0 (currentBit!6281 (_2!6752 lt!222539)) (currentByte!6286 (_2!6752 lt!222539)) (size!2973 (buf!3402 (_2!6752 lt!222539)))) (and (bvsge (currentBit!6281 (_2!6752 lt!222539)) #b00000000000000000000000000000000) (bvslt (currentBit!6281 (_2!6752 lt!222539)) #b00000000000000000000000000001000) (bvsge (currentByte!6286 (_2!6752 lt!222539)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6286 (_2!6752 lt!222539)) (size!2973 (buf!3402 (_2!6752 lt!222539)))) (and (= (currentBit!6281 (_2!6752 lt!222539)) #b00000000000000000000000000000000) (= (currentByte!6286 (_2!6752 lt!222539)) (size!2973 (buf!3402 (_2!6752 lt!222539))))))))))

(assert (=> d!45852 d!46389))

(push 1)

(assert (not b!144263))

(assert (not b!144276))

(assert (not bm!1887))

(assert (not b!144227))

(assert (not b!144301))

(assert (not bm!1886))

(assert (not d!46311))

(assert (not b!144315))

(assert (not b!144156))

(assert (not b!144314))

(assert (not d!46269))

(assert (not d!46275))

(assert (not b!144241))

(assert (not b!144304))

(assert (not b!144218))

(assert (not d!46227))

(assert (not b!144228))

(assert (not bm!1889))

(assert (not b!144182))

(assert (not b!144167))

(assert (not b!144185))

(assert (not b!144295))

(assert (not b!144311))

(assert (not d!46233))

(assert (not b!144169))

(assert (not b!144216))

(assert (not b!144176))

(assert (not b!144217))

(assert (not d!46369))

(assert (not d!46255))

(assert (not b!144221))

(assert (not b!144152))

(assert (not b!144186))

(assert (not bm!1888))

(assert (not b!144204))

(assert (not bm!1882))

(assert (not b!144162))

(assert (not b!144271))

(assert (not d!46343))

(assert (not b!144150))

(assert (not b!144317))

(assert (not b!144154))

(assert (not b!144200))

(assert (not b!144275))

(assert (not b!144253))

(assert (not d!46353))

(assert (not d!46325))

(assert (not b!144284))

(assert (not bm!1874))

(assert (not b!144258))

(assert (not b!144309))

(assert (not bm!1891))

(assert (not d!46229))

(assert (not d!46385))

(assert (not d!46319))

(assert (not d!46225))

(assert (not b!144286))

(assert (not b!144230))

(assert (not b!144294))

(assert (not b!144251))

(assert (not b!144266))

(assert (not d!46297))

(assert (not b!144177))

(assert (not d!46371))

(assert (not bm!1884))

(assert (not b!144130))

(assert (not b!144190))

(assert (not b!144215))

(assert (not d!46327))

(assert (not b!144194))

(assert (not d!46323))

(assert (not b!144265))

(assert (not b!144307))

(assert (not d!46321))

(assert (not b!144270))

(assert (not bm!1890))

(assert (not b!144303))

(assert (not d!46279))

(assert (not b!144298))

(assert (not d!46347))

(assert (not d!46263))

(assert (not b!144297))

(assert (not d!46383))

(assert (not b!144274))

(assert (not d!46239))

(assert (not b!144179))

(assert (not b!144202))

(assert (not d!46365))

(assert (not b!144174))

(assert (not d!46375))

(assert (not b!144180))

(assert (not b!144149))

(assert (not b!144305))

(assert (not d!46261))

(assert (not d!46315))

(assert (not d!46301))

(assert (not d!46243))

(assert (not b!144196))

(assert (not b!144151))

(assert (not d!46307))

(assert (not d!46361))

(assert (not b!144191))

(assert (not b!144220))

(assert (not b!144287))

(assert (not d!46309))

(assert (not b!144300))

(assert (not bm!1885))

(assert (not d!46257))

(assert (not d!46313))

(assert (not b!144131))

(assert (not b!144252))

(assert (not b!144285))

(assert (not b!144197))

(assert (not b!144306))

(assert (not d!46235))

(assert (not d!46381))

(assert (not b!144199))

(assert (not b!144183))

(assert (not b!144239))

(assert (not b!144184))

(assert (not bm!1883))

(assert (not b!144256))

(assert (not b!144257))

(assert (not d!46303))

(assert (not b!144129))

(assert (not b!144168))

(assert (not d!46387))

(assert (not b!144193))

(assert (not b!144319))

(assert (not b!144273))

(assert (not b!144250))

(assert (not b!144292))

(assert (not d!46305))

(assert (not bm!1881))

(assert (not b!144229))

(assert (not d!46259))

(assert (not b!144222))

(assert (not b!144312))

(assert (not b!144282))

(assert (not b!144188))

(assert (not d!46237))

(assert (not d!46359))

(assert (not d!46295))

(assert (not b!144268))

(assert (not d!46291))

(assert (not b!144219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

