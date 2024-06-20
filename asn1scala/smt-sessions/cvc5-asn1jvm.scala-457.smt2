; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12444 () Bool)

(assert start!12444)

(declare-fun b!63508 () Bool)

(declare-fun res!52763 () Bool)

(declare-fun e!42054 () Bool)

(assert (=> b!63508 (=> res!52763 e!42054)))

(declare-datatypes ((array!2806 0))(
  ( (array!2807 (arr!1850 (Array (_ BitVec 32) (_ BitVec 8))) (size!1286 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2230 0))(
  ( (BitStream!2231 (buf!1667 array!2806) (currentByte!3315 (_ BitVec 32)) (currentBit!3310 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4313 0))(
  ( (Unit!4314) )
))
(declare-datatypes ((tuple2!5700 0))(
  ( (tuple2!5701 (_1!2961 Unit!4313) (_2!2961 BitStream!2230)) )
))
(declare-fun lt!100146 () tuple2!5700)

(declare-fun lt!100150 () tuple2!5700)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!63508 (= res!52763 (not (invariant!0 (currentBit!3310 (_2!2961 lt!100146)) (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100150))))))))

(declare-fun e!42059 () Bool)

(declare-datatypes ((tuple2!5702 0))(
  ( (tuple2!5703 (_1!2962 BitStream!2230) (_2!2962 BitStream!2230)) )
))
(declare-fun lt!100140 () tuple2!5702)

(declare-fun lt!100148 () (_ BitVec 64))

(declare-fun lt!100142 () tuple2!5702)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!63509 () Bool)

(assert (=> b!63509 (= e!42059 (or (not (= (buf!1667 (_1!2962 lt!100142)) (buf!1667 (_1!2962 lt!100140)))) (not (= (buf!1667 (_1!2962 lt!100142)) (buf!1667 (_2!2961 lt!100150)))) (bvslt lt!100148 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!63510 () Bool)

(declare-fun res!52779 () Bool)

(assert (=> b!63510 (=> res!52779 e!42059)))

(declare-fun isPrefixOf!0 (BitStream!2230 BitStream!2230) Bool)

(assert (=> b!63510 (= res!52779 (not (isPrefixOf!0 (_1!2962 lt!100142) (_2!2961 lt!100150))))))

(declare-fun b!63511 () Bool)

(assert (=> b!63511 (= e!42054 e!42059)))

(declare-fun res!52774 () Bool)

(assert (=> b!63511 (=> res!52774 e!42059)))

(assert (=> b!63511 (= res!52774 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!690 0))(
  ( (Nil!687) (Cons!686 (h!805 Bool) (t!1440 List!690)) )
))
(declare-fun lt!100145 () List!690)

(declare-fun lt!100143 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2230 BitStream!2230 (_ BitVec 64)) List!690)

(assert (=> b!63511 (= lt!100145 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100150) (_1!2962 lt!100140) lt!100143))))

(declare-fun lt!100144 () List!690)

(assert (=> b!63511 (= lt!100144 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100150) (_1!2962 lt!100142) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63511 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100143)))

(declare-fun lt!100147 () Unit!4313)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2230 array!2806 (_ BitVec 64)) Unit!4313)

(assert (=> b!63511 (= lt!100147 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2961 lt!100146) (buf!1667 (_2!2961 lt!100150)) lt!100143))))

(declare-fun reader!0 (BitStream!2230 BitStream!2230) tuple2!5702)

(assert (=> b!63511 (= lt!100140 (reader!0 (_2!2961 lt!100146) (_2!2961 lt!100150)))))

(declare-fun thiss!1379 () BitStream!2230)

(assert (=> b!63511 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!100139 () Unit!4313)

(assert (=> b!63511 (= lt!100139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1667 (_2!2961 lt!100150)) (bvsub to!314 i!635)))))

(assert (=> b!63511 (= lt!100142 (reader!0 thiss!1379 (_2!2961 lt!100150)))))

(declare-fun b!63512 () Bool)

(declare-fun e!42053 () Bool)

(declare-fun e!42056 () Bool)

(assert (=> b!63512 (= e!42053 (not e!42056))))

(declare-fun res!52762 () Bool)

(assert (=> b!63512 (=> res!52762 e!42056)))

(assert (=> b!63512 (= res!52762 (bvsge i!635 to!314))))

(assert (=> b!63512 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!100141 () Unit!4313)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2230) Unit!4313)

(assert (=> b!63512 (= lt!100141 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!100153 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!63512 (= lt!100153 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(declare-fun b!63513 () Bool)

(declare-fun res!52773 () Bool)

(assert (=> b!63513 (=> res!52773 e!42059)))

(assert (=> b!63513 (= res!52773 (not (isPrefixOf!0 (_1!2962 lt!100142) (_1!2962 lt!100140))))))

(declare-fun srcBuffer!2 () array!2806)

(declare-fun lt!100151 () tuple2!5702)

(declare-fun e!42051 () Bool)

(declare-fun b!63514 () Bool)

(declare-fun head!509 (List!690) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2230 array!2806 (_ BitVec 64) (_ BitVec 64)) List!690)

(assert (=> b!63514 (= e!42051 (= (head!509 (byteArrayBitContentToList!0 (_2!2961 lt!100146) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!509 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100146) (_1!2962 lt!100151) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!63515 () Bool)

(declare-fun e!42052 () Bool)

(declare-fun array_inv!1174 (array!2806) Bool)

(assert (=> b!63515 (= e!42052 (array_inv!1174 (buf!1667 thiss!1379)))))

(declare-fun res!52768 () Bool)

(assert (=> start!12444 (=> (not res!52768) (not e!42053))))

(assert (=> start!12444 (= res!52768 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1286 srcBuffer!2))))))))

(assert (=> start!12444 e!42053))

(assert (=> start!12444 true))

(assert (=> start!12444 (array_inv!1174 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2230) Bool)

(assert (=> start!12444 (and (inv!12 thiss!1379) e!42052)))

(declare-fun b!63516 () Bool)

(declare-fun e!42050 () Bool)

(declare-fun e!42057 () Bool)

(assert (=> b!63516 (= e!42050 e!42057)))

(declare-fun res!52775 () Bool)

(assert (=> b!63516 (=> res!52775 e!42057)))

(assert (=> b!63516 (= res!52775 (not (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100150))))))

(assert (=> b!63516 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100150))))

(declare-fun lt!100149 () Unit!4313)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2230 BitStream!2230 BitStream!2230) Unit!4313)

(assert (=> b!63516 (= lt!100149 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2961 lt!100146) (_2!2961 lt!100150)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2230 array!2806 (_ BitVec 64) (_ BitVec 64)) tuple2!5700)

(assert (=> b!63516 (= lt!100150 (appendBitsMSBFirstLoop!0 (_2!2961 lt!100146) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!63516 e!42051))

(declare-fun res!52769 () Bool)

(assert (=> b!63516 (=> (not res!52769) (not e!42051))))

(assert (=> b!63516 (= res!52769 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100138 () Unit!4313)

(assert (=> b!63516 (= lt!100138 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1667 (_2!2961 lt!100146)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!63516 (= lt!100151 (reader!0 thiss!1379 (_2!2961 lt!100146)))))

(declare-fun b!63517 () Bool)

(declare-fun e!42048 () Bool)

(assert (=> b!63517 (= e!42057 e!42048)))

(declare-fun res!52778 () Bool)

(assert (=> b!63517 (=> res!52778 e!42048)))

(assert (=> b!63517 (= res!52778 (not (= lt!100148 (bvsub (bvadd lt!100153 to!314) i!635))))))

(assert (=> b!63517 (= lt!100148 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150))))))

(declare-fun b!63518 () Bool)

(assert (=> b!63518 (= e!42056 e!42050)))

(declare-fun res!52770 () Bool)

(assert (=> b!63518 (=> res!52770 e!42050)))

(assert (=> b!63518 (= res!52770 (not (isPrefixOf!0 thiss!1379 (_2!2961 lt!100146))))))

(assert (=> b!63518 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100143)))

(assert (=> b!63518 (= lt!100143 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100152 () Unit!4313)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2230 BitStream!2230 (_ BitVec 64) (_ BitVec 64)) Unit!4313)

(assert (=> b!63518 (= lt!100152 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2961 lt!100146) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2230 (_ BitVec 8) (_ BitVec 32)) tuple2!5700)

(assert (=> b!63518 (= lt!100146 (appendBitFromByte!0 thiss!1379 (select (arr!1850 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!63519 () Bool)

(assert (=> b!63519 (= e!42048 e!42054)))

(declare-fun res!52772 () Bool)

(assert (=> b!63519 (=> res!52772 e!42054)))

(assert (=> b!63519 (= res!52772 (not (= (size!1286 (buf!1667 (_2!2961 lt!100146))) (size!1286 (buf!1667 (_2!2961 lt!100150))))))))

(declare-fun e!42058 () Bool)

(assert (=> b!63519 e!42058))

(declare-fun res!52766 () Bool)

(assert (=> b!63519 (=> (not res!52766) (not e!42058))))

(assert (=> b!63519 (= res!52766 (= (size!1286 (buf!1667 (_2!2961 lt!100150))) (size!1286 (buf!1667 thiss!1379))))))

(declare-fun b!63520 () Bool)

(declare-fun res!52764 () Bool)

(assert (=> b!63520 (=> res!52764 e!42054)))

(assert (=> b!63520 (= res!52764 (not (invariant!0 (currentBit!3310 (_2!2961 lt!100146)) (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100146))))))))

(declare-fun b!63521 () Bool)

(declare-fun res!52777 () Bool)

(assert (=> b!63521 (=> res!52777 e!42059)))

(assert (=> b!63521 (= res!52777 (not (isPrefixOf!0 (_1!2962 lt!100140) (_2!2961 lt!100150))))))

(declare-fun b!63522 () Bool)

(declare-fun res!52765 () Bool)

(assert (=> b!63522 (=> res!52765 e!42059)))

(declare-fun length!318 (List!690) Int)

(assert (=> b!63522 (= res!52765 (<= (length!318 lt!100144) 0))))

(declare-fun b!63523 () Bool)

(declare-fun res!52767 () Bool)

(assert (=> b!63523 (=> (not res!52767) (not e!42053))))

(assert (=> b!63523 (= res!52767 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 thiss!1379))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!63524 () Bool)

(assert (=> b!63524 (= e!42058 (= lt!100148 (bvsub (bvsub (bvadd (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!63525 () Bool)

(declare-fun res!52776 () Bool)

(assert (=> b!63525 (=> res!52776 e!42048)))

(assert (=> b!63525 (= res!52776 (not (= (size!1286 (buf!1667 thiss!1379)) (size!1286 (buf!1667 (_2!2961 lt!100150))))))))

(declare-fun b!63526 () Bool)

(declare-fun res!52771 () Bool)

(assert (=> b!63526 (=> res!52771 e!42048)))

(assert (=> b!63526 (= res!52771 (not (invariant!0 (currentBit!3310 (_2!2961 lt!100150)) (currentByte!3315 (_2!2961 lt!100150)) (size!1286 (buf!1667 (_2!2961 lt!100150))))))))

(assert (= (and start!12444 res!52768) b!63523))

(assert (= (and b!63523 res!52767) b!63512))

(assert (= (and b!63512 (not res!52762)) b!63518))

(assert (= (and b!63518 (not res!52770)) b!63516))

(assert (= (and b!63516 res!52769) b!63514))

(assert (= (and b!63516 (not res!52775)) b!63517))

(assert (= (and b!63517 (not res!52778)) b!63526))

(assert (= (and b!63526 (not res!52771)) b!63525))

(assert (= (and b!63525 (not res!52776)) b!63519))

(assert (= (and b!63519 res!52766) b!63524))

(assert (= (and b!63519 (not res!52772)) b!63520))

(assert (= (and b!63520 (not res!52764)) b!63508))

(assert (= (and b!63508 (not res!52763)) b!63511))

(assert (= (and b!63511 (not res!52774)) b!63522))

(assert (= (and b!63522 (not res!52765)) b!63510))

(assert (= (and b!63510 (not res!52779)) b!63521))

(assert (= (and b!63521 (not res!52777)) b!63513))

(assert (= (and b!63513 (not res!52773)) b!63509))

(assert (= start!12444 b!63515))

(declare-fun m!100627 () Bool)

(assert (=> b!63514 m!100627))

(assert (=> b!63514 m!100627))

(declare-fun m!100629 () Bool)

(assert (=> b!63514 m!100629))

(declare-fun m!100631 () Bool)

(assert (=> b!63514 m!100631))

(assert (=> b!63514 m!100631))

(declare-fun m!100633 () Bool)

(assert (=> b!63514 m!100633))

(declare-fun m!100635 () Bool)

(assert (=> b!63526 m!100635))

(declare-fun m!100637 () Bool)

(assert (=> b!63522 m!100637))

(declare-fun m!100639 () Bool)

(assert (=> b!63508 m!100639))

(declare-fun m!100641 () Bool)

(assert (=> b!63520 m!100641))

(declare-fun m!100643 () Bool)

(assert (=> b!63521 m!100643))

(declare-fun m!100645 () Bool)

(assert (=> b!63524 m!100645))

(declare-fun m!100647 () Bool)

(assert (=> b!63512 m!100647))

(declare-fun m!100649 () Bool)

(assert (=> b!63512 m!100649))

(declare-fun m!100651 () Bool)

(assert (=> b!63512 m!100651))

(declare-fun m!100653 () Bool)

(assert (=> b!63513 m!100653))

(declare-fun m!100655 () Bool)

(assert (=> b!63510 m!100655))

(declare-fun m!100657 () Bool)

(assert (=> b!63511 m!100657))

(declare-fun m!100659 () Bool)

(assert (=> b!63511 m!100659))

(declare-fun m!100661 () Bool)

(assert (=> b!63511 m!100661))

(declare-fun m!100663 () Bool)

(assert (=> b!63511 m!100663))

(declare-fun m!100665 () Bool)

(assert (=> b!63511 m!100665))

(declare-fun m!100667 () Bool)

(assert (=> b!63511 m!100667))

(declare-fun m!100669 () Bool)

(assert (=> b!63511 m!100669))

(declare-fun m!100671 () Bool)

(assert (=> b!63511 m!100671))

(declare-fun m!100673 () Bool)

(assert (=> b!63515 m!100673))

(declare-fun m!100675 () Bool)

(assert (=> b!63517 m!100675))

(declare-fun m!100677 () Bool)

(assert (=> b!63516 m!100677))

(declare-fun m!100679 () Bool)

(assert (=> b!63516 m!100679))

(declare-fun m!100681 () Bool)

(assert (=> b!63516 m!100681))

(declare-fun m!100683 () Bool)

(assert (=> b!63516 m!100683))

(declare-fun m!100685 () Bool)

(assert (=> b!63516 m!100685))

(declare-fun m!100687 () Bool)

(assert (=> b!63516 m!100687))

(declare-fun m!100689 () Bool)

(assert (=> b!63516 m!100689))

(declare-fun m!100691 () Bool)

(assert (=> b!63523 m!100691))

(declare-fun m!100693 () Bool)

(assert (=> start!12444 m!100693))

(declare-fun m!100695 () Bool)

(assert (=> start!12444 m!100695))

(declare-fun m!100697 () Bool)

(assert (=> b!63518 m!100697))

(declare-fun m!100699 () Bool)

(assert (=> b!63518 m!100699))

(declare-fun m!100701 () Bool)

(assert (=> b!63518 m!100701))

(declare-fun m!100703 () Bool)

(assert (=> b!63518 m!100703))

(assert (=> b!63518 m!100701))

(declare-fun m!100705 () Bool)

(assert (=> b!63518 m!100705))

(push 1)

(assert (not b!63522))

(assert (not b!63515))

(assert (not b!63512))

(assert (not b!63524))

(assert (not b!63514))

(assert (not b!63516))

(assert (not b!63523))

(assert (not b!63513))

(assert (not b!63521))

(assert (not b!63508))

(assert (not b!63518))

(assert (not b!63526))

(assert (not b!63510))

(assert (not b!63517))

(assert (not b!63520))

(assert (not b!63511))

(assert (not start!12444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19788 () Bool)

(declare-fun e!42164 () Bool)

(assert (=> d!19788 e!42164))

(declare-fun res!52916 () Bool)

(assert (=> d!19788 (=> (not res!52916) (not e!42164))))

(declare-fun lt!100368 () (_ BitVec 64))

(declare-fun lt!100365 () (_ BitVec 64))

(declare-fun lt!100366 () (_ BitVec 64))

(assert (=> d!19788 (= res!52916 (= lt!100368 (bvsub lt!100366 lt!100365)))))

(assert (=> d!19788 (or (= (bvand lt!100366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100366 lt!100365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19788 (= lt!100365 (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146)))))))

(declare-fun lt!100367 () (_ BitVec 64))

(declare-fun lt!100364 () (_ BitVec 64))

(assert (=> d!19788 (= lt!100366 (bvmul lt!100367 lt!100364))))

(assert (=> d!19788 (or (= lt!100367 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100364 (bvsdiv (bvmul lt!100367 lt!100364) lt!100367)))))

(assert (=> d!19788 (= lt!100364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19788 (= lt!100367 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))))))

(assert (=> d!19788 (= lt!100368 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146)))))))

(assert (=> d!19788 (invariant!0 (currentBit!3310 (_2!2961 lt!100146)) (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100146))))))

(assert (=> d!19788 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))) lt!100368)))

(declare-fun b!63703 () Bool)

(declare-fun res!52917 () Bool)

(assert (=> b!63703 (=> (not res!52917) (not e!42164))))

(assert (=> b!63703 (= res!52917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100368))))

(declare-fun b!63704 () Bool)

(declare-fun lt!100369 () (_ BitVec 64))

(assert (=> b!63704 (= e!42164 (bvsle lt!100368 (bvmul lt!100369 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63704 (or (= lt!100369 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100369 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100369)))))

(assert (=> b!63704 (= lt!100369 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))))))

(assert (= (and d!19788 res!52916) b!63703))

(assert (= (and b!63703 res!52917) b!63704))

(declare-fun m!100963 () Bool)

(assert (=> d!19788 m!100963))

(assert (=> d!19788 m!100641))

(assert (=> b!63524 d!19788))

(declare-fun d!19790 () Bool)

(declare-fun res!52924 () Bool)

(declare-fun e!42169 () Bool)

(assert (=> d!19790 (=> (not res!52924) (not e!42169))))

(assert (=> d!19790 (= res!52924 (= (size!1286 (buf!1667 (_1!2962 lt!100142))) (size!1286 (buf!1667 (_1!2962 lt!100140)))))))

(assert (=> d!19790 (= (isPrefixOf!0 (_1!2962 lt!100142) (_1!2962 lt!100140)) e!42169)))

(declare-fun b!63711 () Bool)

(declare-fun res!52926 () Bool)

(assert (=> b!63711 (=> (not res!52926) (not e!42169))))

(assert (=> b!63711 (= res!52926 (bvsle (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100142))) (currentByte!3315 (_1!2962 lt!100142)) (currentBit!3310 (_1!2962 lt!100142))) (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100140))) (currentByte!3315 (_1!2962 lt!100140)) (currentBit!3310 (_1!2962 lt!100140)))))))

(declare-fun b!63712 () Bool)

(declare-fun e!42170 () Bool)

(assert (=> b!63712 (= e!42169 e!42170)))

(declare-fun res!52925 () Bool)

(assert (=> b!63712 (=> res!52925 e!42170)))

(assert (=> b!63712 (= res!52925 (= (size!1286 (buf!1667 (_1!2962 lt!100142))) #b00000000000000000000000000000000))))

(declare-fun b!63713 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2806 array!2806 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63713 (= e!42170 (arrayBitRangesEq!0 (buf!1667 (_1!2962 lt!100142)) (buf!1667 (_1!2962 lt!100140)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100142))) (currentByte!3315 (_1!2962 lt!100142)) (currentBit!3310 (_1!2962 lt!100142)))))))

(assert (= (and d!19790 res!52924) b!63711))

(assert (= (and b!63711 res!52926) b!63712))

(assert (= (and b!63712 (not res!52925)) b!63713))

(declare-fun m!100965 () Bool)

(assert (=> b!63711 m!100965))

(declare-fun m!100967 () Bool)

(assert (=> b!63711 m!100967))

(assert (=> b!63713 m!100965))

(assert (=> b!63713 m!100965))

(declare-fun m!100969 () Bool)

(assert (=> b!63713 m!100969))

(assert (=> b!63513 d!19790))

(declare-fun d!19792 () Bool)

(assert (=> d!19792 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 thiss!1379))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 thiss!1379))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4880 () Bool)

(assert (= bs!4880 d!19792))

(declare-fun m!100971 () Bool)

(assert (=> bs!4880 m!100971))

(assert (=> b!63523 d!19792))

(declare-fun d!19794 () Bool)

(assert (=> d!19794 (= (array_inv!1174 srcBuffer!2) (bvsge (size!1286 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12444 d!19794))

(declare-fun d!19796 () Bool)

(assert (=> d!19796 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3310 thiss!1379) (currentByte!3315 thiss!1379) (size!1286 (buf!1667 thiss!1379))))))

(declare-fun bs!4881 () Bool)

(assert (= bs!4881 d!19796))

(declare-fun m!100973 () Bool)

(assert (=> bs!4881 m!100973))

(assert (=> start!12444 d!19796))

(declare-fun d!19798 () Bool)

(assert (=> d!19798 (= (head!509 (byteArrayBitContentToList!0 (_2!2961 lt!100146) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!805 (byteArrayBitContentToList!0 (_2!2961 lt!100146) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63514 d!19798))

(declare-fun d!19800 () Bool)

(declare-fun c!4562 () Bool)

(assert (=> d!19800 (= c!4562 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42173 () List!690)

(assert (=> d!19800 (= (byteArrayBitContentToList!0 (_2!2961 lt!100146) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42173)))

(declare-fun b!63718 () Bool)

(assert (=> b!63718 (= e!42173 Nil!687)))

(declare-fun b!63719 () Bool)

(assert (=> b!63719 (= e!42173 (Cons!686 (not (= (bvand ((_ sign_extend 24) (select (arr!1850 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2961 lt!100146) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19800 c!4562) b!63718))

(assert (= (and d!19800 (not c!4562)) b!63719))

(assert (=> b!63719 m!100701))

(declare-fun m!100975 () Bool)

(assert (=> b!63719 m!100975))

(declare-fun m!100977 () Bool)

(assert (=> b!63719 m!100977))

(assert (=> b!63514 d!19800))

(declare-fun d!19802 () Bool)

(assert (=> d!19802 (= (head!509 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100146) (_1!2962 lt!100151) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!805 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100146) (_1!2962 lt!100151) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63514 d!19802))

(declare-fun b!63730 () Bool)

(declare-fun e!42178 () Bool)

(declare-fun lt!100377 () List!690)

(declare-fun isEmpty!195 (List!690) Bool)

(assert (=> b!63730 (= e!42178 (isEmpty!195 lt!100377))))

(declare-fun b!63731 () Bool)

(assert (=> b!63731 (= e!42178 (> (length!318 lt!100377) 0))))

(declare-fun b!63728 () Bool)

(declare-datatypes ((tuple2!5712 0))(
  ( (tuple2!5713 (_1!2967 List!690) (_2!2967 BitStream!2230)) )
))
(declare-fun e!42179 () tuple2!5712)

(assert (=> b!63728 (= e!42179 (tuple2!5713 Nil!687 (_1!2962 lt!100151)))))

(declare-fun d!19804 () Bool)

(assert (=> d!19804 e!42178))

(declare-fun c!4568 () Bool)

(assert (=> d!19804 (= c!4568 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19804 (= lt!100377 (_1!2967 e!42179))))

(declare-fun c!4567 () Bool)

(assert (=> d!19804 (= c!4567 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19804 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19804 (= (bitStreamReadBitsIntoList!0 (_2!2961 lt!100146) (_1!2962 lt!100151) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100377)))

(declare-datatypes ((tuple2!5714 0))(
  ( (tuple2!5715 (_1!2968 Bool) (_2!2968 BitStream!2230)) )
))
(declare-fun lt!100378 () tuple2!5714)

(declare-fun lt!100376 () (_ BitVec 64))

(declare-fun b!63729 () Bool)

(assert (=> b!63729 (= e!42179 (tuple2!5713 (Cons!686 (_1!2968 lt!100378) (bitStreamReadBitsIntoList!0 (_2!2961 lt!100146) (_2!2968 lt!100378) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!100376))) (_2!2968 lt!100378)))))

(declare-fun readBit!0 (BitStream!2230) tuple2!5714)

(assert (=> b!63729 (= lt!100378 (readBit!0 (_1!2962 lt!100151)))))

(assert (=> b!63729 (= lt!100376 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19804 c!4567) b!63728))

(assert (= (and d!19804 (not c!4567)) b!63729))

(assert (= (and d!19804 c!4568) b!63730))

(assert (= (and d!19804 (not c!4568)) b!63731))

(declare-fun m!100979 () Bool)

(assert (=> b!63730 m!100979))

(declare-fun m!100981 () Bool)

(assert (=> b!63731 m!100981))

(declare-fun m!100983 () Bool)

(assert (=> b!63729 m!100983))

(declare-fun m!100985 () Bool)

(assert (=> b!63729 m!100985))

(assert (=> b!63514 d!19804))

(declare-fun d!19806 () Bool)

(declare-fun res!52927 () Bool)

(declare-fun e!42180 () Bool)

(assert (=> d!19806 (=> (not res!52927) (not e!42180))))

(assert (=> d!19806 (= res!52927 (= (size!1286 (buf!1667 (_2!2961 lt!100146))) (size!1286 (buf!1667 (_2!2961 lt!100150)))))))

(assert (=> d!19806 (= (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100150)) e!42180)))

(declare-fun b!63732 () Bool)

(declare-fun res!52929 () Bool)

(assert (=> b!63732 (=> (not res!52929) (not e!42180))))

(assert (=> b!63732 (= res!52929 (bvsle (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150)))))))

(declare-fun b!63733 () Bool)

(declare-fun e!42181 () Bool)

(assert (=> b!63733 (= e!42180 e!42181)))

(declare-fun res!52928 () Bool)

(assert (=> b!63733 (=> res!52928 e!42181)))

(assert (=> b!63733 (= res!52928 (= (size!1286 (buf!1667 (_2!2961 lt!100146))) #b00000000000000000000000000000000))))

(declare-fun b!63734 () Bool)

(assert (=> b!63734 (= e!42181 (arrayBitRangesEq!0 (buf!1667 (_2!2961 lt!100146)) (buf!1667 (_2!2961 lt!100150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146)))))))

(assert (= (and d!19806 res!52927) b!63732))

(assert (= (and b!63732 res!52929) b!63733))

(assert (= (and b!63733 (not res!52928)) b!63734))

(assert (=> b!63732 m!100645))

(assert (=> b!63732 m!100675))

(assert (=> b!63734 m!100645))

(assert (=> b!63734 m!100645))

(declare-fun m!100987 () Bool)

(assert (=> b!63734 m!100987))

(assert (=> b!63516 d!19806))

(declare-fun d!19808 () Bool)

(declare-fun res!52930 () Bool)

(declare-fun e!42182 () Bool)

(assert (=> d!19808 (=> (not res!52930) (not e!42182))))

(assert (=> d!19808 (= res!52930 (= (size!1286 (buf!1667 thiss!1379)) (size!1286 (buf!1667 (_2!2961 lt!100150)))))))

(assert (=> d!19808 (= (isPrefixOf!0 thiss!1379 (_2!2961 lt!100150)) e!42182)))

(declare-fun b!63735 () Bool)

(declare-fun res!52932 () Bool)

(assert (=> b!63735 (=> (not res!52932) (not e!42182))))

(assert (=> b!63735 (= res!52932 (bvsle (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150)))))))

(declare-fun b!63736 () Bool)

(declare-fun e!42183 () Bool)

(assert (=> b!63736 (= e!42182 e!42183)))

(declare-fun res!52931 () Bool)

(assert (=> b!63736 (=> res!52931 e!42183)))

(assert (=> b!63736 (= res!52931 (= (size!1286 (buf!1667 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63737 () Bool)

(assert (=> b!63737 (= e!42183 (arrayBitRangesEq!0 (buf!1667 thiss!1379) (buf!1667 (_2!2961 lt!100150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379))))))

(assert (= (and d!19808 res!52930) b!63735))

(assert (= (and b!63735 res!52932) b!63736))

(assert (= (and b!63736 (not res!52931)) b!63737))

(assert (=> b!63735 m!100651))

(assert (=> b!63735 m!100675))

(assert (=> b!63737 m!100651))

(assert (=> b!63737 m!100651))

(declare-fun m!100989 () Bool)

(assert (=> b!63737 m!100989))

(assert (=> b!63516 d!19808))

(declare-fun d!19810 () Bool)

(assert (=> d!19810 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100381 () Unit!4313)

(declare-fun choose!9 (BitStream!2230 array!2806 (_ BitVec 64) BitStream!2230) Unit!4313)

(assert (=> d!19810 (= lt!100381 (choose!9 thiss!1379 (buf!1667 (_2!2961 lt!100146)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2231 (buf!1667 (_2!2961 lt!100146)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379))))))

(assert (=> d!19810 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1667 (_2!2961 lt!100146)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100381)))

(declare-fun bs!4882 () Bool)

(assert (= bs!4882 d!19810))

(assert (=> bs!4882 m!100685))

(declare-fun m!100991 () Bool)

(assert (=> bs!4882 m!100991))

(assert (=> b!63516 d!19810))

(declare-fun d!19812 () Bool)

(assert (=> d!19812 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100150))))

(declare-fun lt!100384 () Unit!4313)

(declare-fun choose!30 (BitStream!2230 BitStream!2230 BitStream!2230) Unit!4313)

(assert (=> d!19812 (= lt!100384 (choose!30 thiss!1379 (_2!2961 lt!100146) (_2!2961 lt!100150)))))

(assert (=> d!19812 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100146))))

(assert (=> d!19812 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2961 lt!100146) (_2!2961 lt!100150)) lt!100384)))

(declare-fun bs!4883 () Bool)

(assert (= bs!4883 d!19812))

(assert (=> bs!4883 m!100681))

(declare-fun m!100993 () Bool)

(assert (=> bs!4883 m!100993))

(assert (=> bs!4883 m!100699))

(assert (=> b!63516 d!19812))

(declare-fun d!19814 () Bool)

(assert (=> d!19814 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4884 () Bool)

(assert (= bs!4884 d!19814))

(declare-fun m!100995 () Bool)

(assert (=> bs!4884 m!100995))

(assert (=> b!63516 d!19814))

(declare-fun lt!100633 () tuple2!5700)

(declare-fun lt!100643 () tuple2!5702)

(declare-fun b!63838 () Bool)

(declare-fun e!42237 () Bool)

(assert (=> b!63838 (= e!42237 (= (bitStreamReadBitsIntoList!0 (_2!2961 lt!100633) (_1!2962 lt!100643) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2961 lt!100633) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!63838 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63838 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!100632 () Unit!4313)

(declare-fun lt!100641 () Unit!4313)

(assert (=> b!63838 (= lt!100632 lt!100641)))

(declare-fun lt!100638 () (_ BitVec 64))

(assert (=> b!63838 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100633)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100638)))

(assert (=> b!63838 (= lt!100641 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2961 lt!100146) (buf!1667 (_2!2961 lt!100633)) lt!100638))))

(declare-fun e!42235 () Bool)

(assert (=> b!63838 e!42235))

(declare-fun res!53027 () Bool)

(assert (=> b!63838 (=> (not res!53027) (not e!42235))))

(assert (=> b!63838 (= res!53027 (and (= (size!1286 (buf!1667 (_2!2961 lt!100146))) (size!1286 (buf!1667 (_2!2961 lt!100633)))) (bvsge lt!100638 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63838 (= lt!100638 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!63838 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63838 (= lt!100643 (reader!0 (_2!2961 lt!100146) (_2!2961 lt!100633)))))

(declare-fun b!63839 () Bool)

(declare-fun res!53022 () Bool)

(assert (=> b!63839 (=> (not res!53022) (not e!42237))))

(assert (=> b!63839 (= res!53022 (= (size!1286 (buf!1667 (_2!2961 lt!100633))) (size!1286 (buf!1667 (_2!2961 lt!100146)))))))

(declare-fun b!63840 () Bool)

(declare-fun res!53024 () Bool)

(assert (=> b!63840 (=> (not res!53024) (not e!42237))))

(assert (=> b!63840 (= res!53024 (invariant!0 (currentBit!3310 (_2!2961 lt!100633)) (currentByte!3315 (_2!2961 lt!100633)) (size!1286 (buf!1667 (_2!2961 lt!100633)))))))

(declare-fun b!63841 () Bool)

(declare-fun e!42236 () tuple2!5700)

(declare-fun Unit!4319 () Unit!4313)

(assert (=> b!63841 (= e!42236 (tuple2!5701 Unit!4319 (_2!2961 lt!100146)))))

(assert (=> b!63841 (= (size!1286 (buf!1667 (_2!2961 lt!100146))) (size!1286 (buf!1667 (_2!2961 lt!100146))))))

(declare-fun lt!100647 () Unit!4313)

(declare-fun Unit!4320 () Unit!4313)

(assert (=> b!63841 (= lt!100647 Unit!4320)))

(declare-fun call!811 () tuple2!5702)

(declare-fun checkByteArrayBitContent!0 (BitStream!2230 array!2806 array!2806 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5716 0))(
  ( (tuple2!5717 (_1!2969 array!2806) (_2!2969 BitStream!2230)) )
))
(declare-fun readBits!0 (BitStream!2230 (_ BitVec 64)) tuple2!5716)

(assert (=> b!63841 (checkByteArrayBitContent!0 (_2!2961 lt!100146) srcBuffer!2 (_1!2969 (readBits!0 (_1!2962 call!811) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!19816 () Bool)

(assert (=> d!19816 e!42237))

(declare-fun res!53025 () Bool)

(assert (=> d!19816 (=> (not res!53025) (not e!42237))))

(declare-fun lt!100649 () (_ BitVec 64))

(assert (=> d!19816 (= res!53025 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100633))) (currentByte!3315 (_2!2961 lt!100633)) (currentBit!3310 (_2!2961 lt!100633))) (bvsub lt!100649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19816 (or (= (bvand lt!100649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!100625 () (_ BitVec 64))

(assert (=> d!19816 (= lt!100649 (bvadd lt!100625 to!314))))

(assert (=> d!19816 (or (not (= (bvand lt!100625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!100625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!100625 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19816 (= lt!100625 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))))))

(assert (=> d!19816 (= lt!100633 e!42236)))

(declare-fun c!4574 () Bool)

(assert (=> d!19816 (= c!4574 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!100637 () Unit!4313)

(declare-fun lt!100659 () Unit!4313)

(assert (=> d!19816 (= lt!100637 lt!100659)))

(assert (=> d!19816 (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100146))))

(assert (=> d!19816 (= lt!100659 (lemmaIsPrefixRefl!0 (_2!2961 lt!100146)))))

(declare-fun lt!100656 () (_ BitVec 64))

(assert (=> d!19816 (= lt!100656 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))))))

(assert (=> d!19816 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19816 (= (appendBitsMSBFirstLoop!0 (_2!2961 lt!100146) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!100633)))

(declare-fun lt!100622 () tuple2!5700)

(declare-fun bm!808 () Bool)

(assert (=> bm!808 (= call!811 (reader!0 (_2!2961 lt!100146) (ite c!4574 (_2!2961 lt!100622) (_2!2961 lt!100146))))))

(declare-fun b!63842 () Bool)

(declare-fun res!53023 () Bool)

(assert (=> b!63842 (=> (not res!53023) (not e!42237))))

(assert (=> b!63842 (= res!53023 (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100633)))))

(declare-fun b!63843 () Bool)

(declare-fun res!53026 () Bool)

(assert (=> b!63843 (=> (not res!53026) (not e!42237))))

(assert (=> b!63843 (= res!53026 (= (size!1286 (buf!1667 (_2!2961 lt!100146))) (size!1286 (buf!1667 (_2!2961 lt!100633)))))))

(declare-fun b!63844 () Bool)

(declare-fun Unit!4321 () Unit!4313)

(assert (=> b!63844 (= e!42236 (tuple2!5701 Unit!4321 (_2!2961 lt!100622)))))

(declare-fun lt!100654 () tuple2!5700)

(assert (=> b!63844 (= lt!100654 (appendBitFromByte!0 (_2!2961 lt!100146) (select (arr!1850 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!100652 () (_ BitVec 64))

(assert (=> b!63844 (= lt!100652 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100620 () (_ BitVec 64))

(assert (=> b!63844 (= lt!100620 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100645 () Unit!4313)

(assert (=> b!63844 (= lt!100645 (validateOffsetBitsIneqLemma!0 (_2!2961 lt!100146) (_2!2961 lt!100654) lt!100652 lt!100620))))

(assert (=> b!63844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100654)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100654))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100654))) (bvsub lt!100652 lt!100620))))

(declare-fun lt!100635 () Unit!4313)

(assert (=> b!63844 (= lt!100635 lt!100645)))

(declare-fun lt!100642 () tuple2!5702)

(assert (=> b!63844 (= lt!100642 (reader!0 (_2!2961 lt!100146) (_2!2961 lt!100654)))))

(declare-fun lt!100660 () (_ BitVec 64))

(assert (=> b!63844 (= lt!100660 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100624 () Unit!4313)

(assert (=> b!63844 (= lt!100624 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2961 lt!100146) (buf!1667 (_2!2961 lt!100654)) lt!100660))))

(assert (=> b!63844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100654)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100660)))

(declare-fun lt!100653 () Unit!4313)

(assert (=> b!63844 (= lt!100653 lt!100624)))

(assert (=> b!63844 (= (head!509 (byteArrayBitContentToList!0 (_2!2961 lt!100654) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!509 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100654) (_1!2962 lt!100642) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!100634 () Unit!4313)

(declare-fun Unit!4322 () Unit!4313)

(assert (=> b!63844 (= lt!100634 Unit!4322)))

(assert (=> b!63844 (= lt!100622 (appendBitsMSBFirstLoop!0 (_2!2961 lt!100654) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!100629 () Unit!4313)

(assert (=> b!63844 (= lt!100629 (lemmaIsPrefixTransitive!0 (_2!2961 lt!100146) (_2!2961 lt!100654) (_2!2961 lt!100622)))))

(assert (=> b!63844 (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100622))))

(declare-fun lt!100623 () Unit!4313)

(assert (=> b!63844 (= lt!100623 lt!100629)))

(assert (=> b!63844 (= (size!1286 (buf!1667 (_2!2961 lt!100622))) (size!1286 (buf!1667 (_2!2961 lt!100146))))))

(declare-fun lt!100639 () Unit!4313)

(declare-fun Unit!4323 () Unit!4313)

(assert (=> b!63844 (= lt!100639 Unit!4323)))

(assert (=> b!63844 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100622))) (currentByte!3315 (_2!2961 lt!100622)) (currentBit!3310 (_2!2961 lt!100622))) (bvsub (bvadd (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100657 () Unit!4313)

(declare-fun Unit!4324 () Unit!4313)

(assert (=> b!63844 (= lt!100657 Unit!4324)))

(assert (=> b!63844 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100622))) (currentByte!3315 (_2!2961 lt!100622)) (currentBit!3310 (_2!2961 lt!100622))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100654))) (currentByte!3315 (_2!2961 lt!100654)) (currentBit!3310 (_2!2961 lt!100654))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100646 () Unit!4313)

(declare-fun Unit!4325 () Unit!4313)

(assert (=> b!63844 (= lt!100646 Unit!4325)))

(declare-fun lt!100627 () tuple2!5702)

(assert (=> b!63844 (= lt!100627 call!811)))

(declare-fun lt!100662 () (_ BitVec 64))

(assert (=> b!63844 (= lt!100662 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100650 () Unit!4313)

(assert (=> b!63844 (= lt!100650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2961 lt!100146) (buf!1667 (_2!2961 lt!100622)) lt!100662))))

(assert (=> b!63844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100622)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100662)))

(declare-fun lt!100640 () Unit!4313)

(assert (=> b!63844 (= lt!100640 lt!100650)))

(declare-fun lt!100631 () tuple2!5702)

(assert (=> b!63844 (= lt!100631 (reader!0 (_2!2961 lt!100654) (_2!2961 lt!100622)))))

(declare-fun lt!100648 () (_ BitVec 64))

(assert (=> b!63844 (= lt!100648 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100655 () Unit!4313)

(assert (=> b!63844 (= lt!100655 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2961 lt!100654) (buf!1667 (_2!2961 lt!100622)) lt!100648))))

(assert (=> b!63844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100622)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100654))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100654))) lt!100648)))

(declare-fun lt!100636 () Unit!4313)

(assert (=> b!63844 (= lt!100636 lt!100655)))

(declare-fun lt!100661 () List!690)

(assert (=> b!63844 (= lt!100661 (byteArrayBitContentToList!0 (_2!2961 lt!100622) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!100621 () List!690)

(assert (=> b!63844 (= lt!100621 (byteArrayBitContentToList!0 (_2!2961 lt!100622) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!100663 () List!690)

(assert (=> b!63844 (= lt!100663 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100622) (_1!2962 lt!100627) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!100626 () List!690)

(assert (=> b!63844 (= lt!100626 (bitStreamReadBitsIntoList!0 (_2!2961 lt!100622) (_1!2962 lt!100631) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!100658 () (_ BitVec 64))

(assert (=> b!63844 (= lt!100658 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100630 () Unit!4313)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2230 BitStream!2230 BitStream!2230 BitStream!2230 (_ BitVec 64) List!690) Unit!4313)

(assert (=> b!63844 (= lt!100630 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2961 lt!100622) (_2!2961 lt!100622) (_1!2962 lt!100627) (_1!2962 lt!100631) lt!100658 lt!100663))))

(declare-fun tail!297 (List!690) List!690)

(assert (=> b!63844 (= (bitStreamReadBitsIntoList!0 (_2!2961 lt!100622) (_1!2962 lt!100631) (bvsub lt!100658 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!297 lt!100663))))

(declare-fun lt!100628 () Unit!4313)

(assert (=> b!63844 (= lt!100628 lt!100630)))

(declare-fun lt!100651 () Unit!4313)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2806 array!2806 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4313)

(assert (=> b!63844 (= lt!100651 (arrayBitRangesEqImpliesEq!0 (buf!1667 (_2!2961 lt!100654)) (buf!1667 (_2!2961 lt!100622)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!100656 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100654))) (currentByte!3315 (_2!2961 lt!100654)) (currentBit!3310 (_2!2961 lt!100654)))))))

(declare-fun bitAt!0 (array!2806 (_ BitVec 64)) Bool)

(assert (=> b!63844 (= (bitAt!0 (buf!1667 (_2!2961 lt!100654)) lt!100656) (bitAt!0 (buf!1667 (_2!2961 lt!100622)) lt!100656))))

(declare-fun lt!100644 () Unit!4313)

(assert (=> b!63844 (= lt!100644 lt!100651)))

(declare-fun b!63845 () Bool)

(assert (=> b!63845 (= e!42235 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100638))))

(assert (= (and d!19816 c!4574) b!63844))

(assert (= (and d!19816 (not c!4574)) b!63841))

(assert (= (or b!63844 b!63841) bm!808))

(assert (= (and d!19816 res!53025) b!63840))

(assert (= (and b!63840 res!53024) b!63843))

(assert (= (and b!63843 res!53026) b!63842))

(assert (= (and b!63842 res!53023) b!63839))

(assert (= (and b!63839 res!53022) b!63838))

(assert (= (and b!63838 res!53027) b!63845))

(declare-fun m!101091 () Bool)

(assert (=> b!63841 m!101091))

(declare-fun m!101093 () Bool)

(assert (=> b!63841 m!101093))

(declare-fun m!101095 () Bool)

(assert (=> b!63845 m!101095))

(declare-fun m!101097 () Bool)

(assert (=> b!63842 m!101097))

(declare-fun m!101099 () Bool)

(assert (=> b!63838 m!101099))

(declare-fun m!101101 () Bool)

(assert (=> b!63838 m!101101))

(declare-fun m!101103 () Bool)

(assert (=> b!63838 m!101103))

(declare-fun m!101105 () Bool)

(assert (=> b!63838 m!101105))

(declare-fun m!101107 () Bool)

(assert (=> b!63838 m!101107))

(declare-fun m!101109 () Bool)

(assert (=> bm!808 m!101109))

(declare-fun m!101111 () Bool)

(assert (=> b!63844 m!101111))

(declare-fun m!101113 () Bool)

(assert (=> b!63844 m!101113))

(declare-fun m!101115 () Bool)

(assert (=> b!63844 m!101115))

(declare-fun m!101117 () Bool)

(assert (=> b!63844 m!101117))

(declare-fun m!101119 () Bool)

(assert (=> b!63844 m!101119))

(declare-fun m!101121 () Bool)

(assert (=> b!63844 m!101121))

(declare-fun m!101123 () Bool)

(assert (=> b!63844 m!101123))

(declare-fun m!101125 () Bool)

(assert (=> b!63844 m!101125))

(declare-fun m!101127 () Bool)

(assert (=> b!63844 m!101127))

(declare-fun m!101129 () Bool)

(assert (=> b!63844 m!101129))

(declare-fun m!101131 () Bool)

(assert (=> b!63844 m!101131))

(declare-fun m!101133 () Bool)

(assert (=> b!63844 m!101133))

(declare-fun m!101135 () Bool)

(assert (=> b!63844 m!101135))

(declare-fun m!101137 () Bool)

(assert (=> b!63844 m!101137))

(declare-fun m!101139 () Bool)

(assert (=> b!63844 m!101139))

(declare-fun m!101141 () Bool)

(assert (=> b!63844 m!101141))

(declare-fun m!101143 () Bool)

(assert (=> b!63844 m!101143))

(assert (=> b!63844 m!101133))

(declare-fun m!101145 () Bool)

(assert (=> b!63844 m!101145))

(declare-fun m!101147 () Bool)

(assert (=> b!63844 m!101147))

(declare-fun m!101149 () Bool)

(assert (=> b!63844 m!101149))

(declare-fun m!101151 () Bool)

(assert (=> b!63844 m!101151))

(assert (=> b!63844 m!101121))

(declare-fun m!101153 () Bool)

(assert (=> b!63844 m!101153))

(declare-fun m!101155 () Bool)

(assert (=> b!63844 m!101155))

(declare-fun m!101157 () Bool)

(assert (=> b!63844 m!101157))

(declare-fun m!101159 () Bool)

(assert (=> b!63844 m!101159))

(declare-fun m!101161 () Bool)

(assert (=> b!63844 m!101161))

(assert (=> b!63844 m!101147))

(declare-fun m!101163 () Bool)

(assert (=> b!63844 m!101163))

(assert (=> b!63844 m!101137))

(declare-fun m!101165 () Bool)

(assert (=> b!63844 m!101165))

(declare-fun m!101167 () Bool)

(assert (=> b!63844 m!101167))

(declare-fun m!101169 () Bool)

(assert (=> b!63844 m!101169))

(declare-fun m!101171 () Bool)

(assert (=> b!63844 m!101171))

(assert (=> b!63844 m!100645))

(declare-fun m!101173 () Bool)

(assert (=> d!19816 m!101173))

(assert (=> d!19816 m!100645))

(declare-fun m!101175 () Bool)

(assert (=> d!19816 m!101175))

(declare-fun m!101177 () Bool)

(assert (=> d!19816 m!101177))

(declare-fun m!101179 () Bool)

(assert (=> b!63840 m!101179))

(assert (=> b!63516 d!19816))

(declare-fun b!63856 () Bool)

(declare-fun e!42243 () Unit!4313)

(declare-fun lt!100717 () Unit!4313)

(assert (=> b!63856 (= e!42243 lt!100717)))

(declare-fun lt!100722 () (_ BitVec 64))

(assert (=> b!63856 (= lt!100722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100721 () (_ BitVec 64))

(assert (=> b!63856 (= lt!100721 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2806 array!2806 (_ BitVec 64) (_ BitVec 64)) Unit!4313)

(assert (=> b!63856 (= lt!100717 (arrayBitRangesEqSymmetric!0 (buf!1667 thiss!1379) (buf!1667 (_2!2961 lt!100146)) lt!100722 lt!100721))))

(assert (=> b!63856 (arrayBitRangesEq!0 (buf!1667 (_2!2961 lt!100146)) (buf!1667 thiss!1379) lt!100722 lt!100721)))

(declare-fun d!19864 () Bool)

(declare-fun e!42242 () Bool)

(assert (=> d!19864 e!42242))

(declare-fun res!53035 () Bool)

(assert (=> d!19864 (=> (not res!53035) (not e!42242))))

(declare-fun lt!100714 () tuple2!5702)

(assert (=> d!19864 (= res!53035 (isPrefixOf!0 (_1!2962 lt!100714) (_2!2962 lt!100714)))))

(declare-fun lt!100716 () BitStream!2230)

(assert (=> d!19864 (= lt!100714 (tuple2!5703 lt!100716 (_2!2961 lt!100146)))))

(declare-fun lt!100712 () Unit!4313)

(declare-fun lt!100707 () Unit!4313)

(assert (=> d!19864 (= lt!100712 lt!100707)))

(assert (=> d!19864 (isPrefixOf!0 lt!100716 (_2!2961 lt!100146))))

(assert (=> d!19864 (= lt!100707 (lemmaIsPrefixTransitive!0 lt!100716 (_2!2961 lt!100146) (_2!2961 lt!100146)))))

(declare-fun lt!100708 () Unit!4313)

(declare-fun lt!100713 () Unit!4313)

(assert (=> d!19864 (= lt!100708 lt!100713)))

(assert (=> d!19864 (isPrefixOf!0 lt!100716 (_2!2961 lt!100146))))

(assert (=> d!19864 (= lt!100713 (lemmaIsPrefixTransitive!0 lt!100716 thiss!1379 (_2!2961 lt!100146)))))

(declare-fun lt!100705 () Unit!4313)

(assert (=> d!19864 (= lt!100705 e!42243)))

(declare-fun c!4577 () Bool)

(assert (=> d!19864 (= c!4577 (not (= (size!1286 (buf!1667 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!100718 () Unit!4313)

(declare-fun lt!100704 () Unit!4313)

(assert (=> d!19864 (= lt!100718 lt!100704)))

(assert (=> d!19864 (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100146))))

(assert (=> d!19864 (= lt!100704 (lemmaIsPrefixRefl!0 (_2!2961 lt!100146)))))

(declare-fun lt!100719 () Unit!4313)

(declare-fun lt!100711 () Unit!4313)

(assert (=> d!19864 (= lt!100719 lt!100711)))

(assert (=> d!19864 (= lt!100711 (lemmaIsPrefixRefl!0 (_2!2961 lt!100146)))))

(declare-fun lt!100709 () Unit!4313)

(declare-fun lt!100710 () Unit!4313)

(assert (=> d!19864 (= lt!100709 lt!100710)))

(assert (=> d!19864 (isPrefixOf!0 lt!100716 lt!100716)))

(assert (=> d!19864 (= lt!100710 (lemmaIsPrefixRefl!0 lt!100716))))

(declare-fun lt!100720 () Unit!4313)

(declare-fun lt!100706 () Unit!4313)

(assert (=> d!19864 (= lt!100720 lt!100706)))

(assert (=> d!19864 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19864 (= lt!100706 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19864 (= lt!100716 (BitStream!2231 (buf!1667 (_2!2961 lt!100146)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(assert (=> d!19864 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100146))))

(assert (=> d!19864 (= (reader!0 thiss!1379 (_2!2961 lt!100146)) lt!100714)))

(declare-fun b!63857 () Bool)

(declare-fun Unit!4326 () Unit!4313)

(assert (=> b!63857 (= e!42243 Unit!4326)))

(declare-fun lt!100723 () (_ BitVec 64))

(declare-fun b!63858 () Bool)

(declare-fun lt!100715 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2230 (_ BitVec 64)) BitStream!2230)

(assert (=> b!63858 (= e!42242 (= (_1!2962 lt!100714) (withMovedBitIndex!0 (_2!2962 lt!100714) (bvsub lt!100715 lt!100723))))))

(assert (=> b!63858 (or (= (bvand lt!100715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100715 lt!100723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63858 (= lt!100723 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))))))

(assert (=> b!63858 (= lt!100715 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(declare-fun b!63859 () Bool)

(declare-fun res!53036 () Bool)

(assert (=> b!63859 (=> (not res!53036) (not e!42242))))

(assert (=> b!63859 (= res!53036 (isPrefixOf!0 (_2!2962 lt!100714) (_2!2961 lt!100146)))))

(declare-fun b!63860 () Bool)

(declare-fun res!53034 () Bool)

(assert (=> b!63860 (=> (not res!53034) (not e!42242))))

(assert (=> b!63860 (= res!53034 (isPrefixOf!0 (_1!2962 lt!100714) thiss!1379))))

(assert (= (and d!19864 c!4577) b!63856))

(assert (= (and d!19864 (not c!4577)) b!63857))

(assert (= (and d!19864 res!53035) b!63860))

(assert (= (and b!63860 res!53034) b!63859))

(assert (= (and b!63859 res!53036) b!63858))

(declare-fun m!101181 () Bool)

(assert (=> b!63860 m!101181))

(declare-fun m!101183 () Bool)

(assert (=> b!63859 m!101183))

(declare-fun m!101185 () Bool)

(assert (=> d!19864 m!101185))

(declare-fun m!101187 () Bool)

(assert (=> d!19864 m!101187))

(declare-fun m!101189 () Bool)

(assert (=> d!19864 m!101189))

(declare-fun m!101191 () Bool)

(assert (=> d!19864 m!101191))

(assert (=> d!19864 m!100699))

(declare-fun m!101193 () Bool)

(assert (=> d!19864 m!101193))

(assert (=> d!19864 m!100647))

(assert (=> d!19864 m!101175))

(declare-fun m!101195 () Bool)

(assert (=> d!19864 m!101195))

(assert (=> d!19864 m!100649))

(assert (=> d!19864 m!101177))

(declare-fun m!101197 () Bool)

(assert (=> b!63858 m!101197))

(assert (=> b!63858 m!100645))

(assert (=> b!63858 m!100651))

(assert (=> b!63856 m!100651))

(declare-fun m!101199 () Bool)

(assert (=> b!63856 m!101199))

(declare-fun m!101201 () Bool)

(assert (=> b!63856 m!101201))

(assert (=> b!63516 d!19864))

(declare-fun d!19866 () Bool)

(assert (=> d!19866 (= (invariant!0 (currentBit!3310 (_2!2961 lt!100150)) (currentByte!3315 (_2!2961 lt!100150)) (size!1286 (buf!1667 (_2!2961 lt!100150)))) (and (bvsge (currentBit!3310 (_2!2961 lt!100150)) #b00000000000000000000000000000000) (bvslt (currentBit!3310 (_2!2961 lt!100150)) #b00000000000000000000000000001000) (bvsge (currentByte!3315 (_2!2961 lt!100150)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3315 (_2!2961 lt!100150)) (size!1286 (buf!1667 (_2!2961 lt!100150)))) (and (= (currentBit!3310 (_2!2961 lt!100150)) #b00000000000000000000000000000000) (= (currentByte!3315 (_2!2961 lt!100150)) (size!1286 (buf!1667 (_2!2961 lt!100150))))))))))

(assert (=> b!63526 d!19866))

(declare-fun d!19868 () Bool)

(assert (=> d!19868 (= (array_inv!1174 (buf!1667 thiss!1379)) (bvsge (size!1286 (buf!1667 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!63515 d!19868))

(declare-fun d!19870 () Bool)

(declare-fun e!42244 () Bool)

(assert (=> d!19870 e!42244))

(declare-fun res!53037 () Bool)

(assert (=> d!19870 (=> (not res!53037) (not e!42244))))

(declare-fun lt!100725 () (_ BitVec 64))

(declare-fun lt!100728 () (_ BitVec 64))

(declare-fun lt!100726 () (_ BitVec 64))

(assert (=> d!19870 (= res!53037 (= lt!100728 (bvsub lt!100726 lt!100725)))))

(assert (=> d!19870 (or (= (bvand lt!100726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100726 lt!100725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19870 (= lt!100725 (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100150))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100150)))))))

(declare-fun lt!100727 () (_ BitVec 64))

(declare-fun lt!100724 () (_ BitVec 64))

(assert (=> d!19870 (= lt!100726 (bvmul lt!100727 lt!100724))))

(assert (=> d!19870 (or (= lt!100727 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100724 (bvsdiv (bvmul lt!100727 lt!100724) lt!100727)))))

(assert (=> d!19870 (= lt!100724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19870 (= lt!100727 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))))))

(assert (=> d!19870 (= lt!100728 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100150)))))))

(assert (=> d!19870 (invariant!0 (currentBit!3310 (_2!2961 lt!100150)) (currentByte!3315 (_2!2961 lt!100150)) (size!1286 (buf!1667 (_2!2961 lt!100150))))))

(assert (=> d!19870 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150))) lt!100728)))

(declare-fun b!63861 () Bool)

(declare-fun res!53038 () Bool)

(assert (=> b!63861 (=> (not res!53038) (not e!42244))))

(assert (=> b!63861 (= res!53038 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100728))))

(declare-fun b!63862 () Bool)

(declare-fun lt!100729 () (_ BitVec 64))

(assert (=> b!63862 (= e!42244 (bvsle lt!100728 (bvmul lt!100729 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63862 (or (= lt!100729 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100729 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100729)))))

(assert (=> b!63862 (= lt!100729 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))))))

(assert (= (and d!19870 res!53037) b!63861))

(assert (= (and b!63861 res!53038) b!63862))

(declare-fun m!101203 () Bool)

(assert (=> d!19870 m!101203))

(assert (=> d!19870 m!100635))

(assert (=> b!63517 d!19870))

(declare-fun d!19872 () Bool)

(assert (=> d!19872 (= (invariant!0 (currentBit!3310 (_2!2961 lt!100146)) (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100150)))) (and (bvsge (currentBit!3310 (_2!2961 lt!100146)) #b00000000000000000000000000000000) (bvslt (currentBit!3310 (_2!2961 lt!100146)) #b00000000000000000000000000001000) (bvsge (currentByte!3315 (_2!2961 lt!100146)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100150)))) (and (= (currentBit!3310 (_2!2961 lt!100146)) #b00000000000000000000000000000000) (= (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100150))))))))))

(assert (=> b!63508 d!19872))

(declare-fun d!19874 () Bool)

(declare-fun res!53039 () Bool)

(declare-fun e!42245 () Bool)

(assert (=> d!19874 (=> (not res!53039) (not e!42245))))

(assert (=> d!19874 (= res!53039 (= (size!1286 (buf!1667 thiss!1379)) (size!1286 (buf!1667 (_2!2961 lt!100146)))))))

(assert (=> d!19874 (= (isPrefixOf!0 thiss!1379 (_2!2961 lt!100146)) e!42245)))

(declare-fun b!63863 () Bool)

(declare-fun res!53041 () Bool)

(assert (=> b!63863 (=> (not res!53041) (not e!42245))))

(assert (=> b!63863 (= res!53041 (bvsle (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146)))))))

(declare-fun b!63864 () Bool)

(declare-fun e!42246 () Bool)

(assert (=> b!63864 (= e!42245 e!42246)))

(declare-fun res!53040 () Bool)

(assert (=> b!63864 (=> res!53040 e!42246)))

(assert (=> b!63864 (= res!53040 (= (size!1286 (buf!1667 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63865 () Bool)

(assert (=> b!63865 (= e!42246 (arrayBitRangesEq!0 (buf!1667 thiss!1379) (buf!1667 (_2!2961 lt!100146)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379))))))

(assert (= (and d!19874 res!53039) b!63863))

(assert (= (and b!63863 res!53041) b!63864))

(assert (= (and b!63864 (not res!53040)) b!63865))

(assert (=> b!63863 m!100651))

(assert (=> b!63863 m!100645))

(assert (=> b!63865 m!100651))

(assert (=> b!63865 m!100651))

(declare-fun m!101205 () Bool)

(assert (=> b!63865 m!101205))

(assert (=> b!63518 d!19874))

(declare-fun d!19876 () Bool)

(assert (=> d!19876 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100143) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146)))) lt!100143))))

(declare-fun bs!4892 () Bool)

(assert (= bs!4892 d!19876))

(assert (=> bs!4892 m!100963))

(assert (=> b!63518 d!19876))

(declare-fun d!19878 () Bool)

(declare-fun e!42249 () Bool)

(assert (=> d!19878 e!42249))

(declare-fun res!53044 () Bool)

(assert (=> d!19878 (=> (not res!53044) (not e!42249))))

(assert (=> d!19878 (= res!53044 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!100732 () Unit!4313)

(declare-fun choose!27 (BitStream!2230 BitStream!2230 (_ BitVec 64) (_ BitVec 64)) Unit!4313)

(assert (=> d!19878 (= lt!100732 (choose!27 thiss!1379 (_2!2961 lt!100146) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19878 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19878 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2961 lt!100146) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100732)))

(declare-fun b!63868 () Bool)

(assert (=> b!63868 (= e!42249 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100146)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19878 res!53044) b!63868))

(declare-fun m!101207 () Bool)

(assert (=> d!19878 m!101207))

(declare-fun m!101209 () Bool)

(assert (=> b!63868 m!101209))

(assert (=> b!63518 d!19878))

(declare-fun b!63887 () Bool)

(declare-fun e!42260 () Bool)

(declare-fun e!42258 () Bool)

(assert (=> b!63887 (= e!42260 e!42258)))

(declare-fun res!53066 () Bool)

(assert (=> b!63887 (=> (not res!53066) (not e!42258))))

(declare-datatypes ((tuple2!5722 0))(
  ( (tuple2!5723 (_1!2972 BitStream!2230) (_2!2972 Bool)) )
))
(declare-fun lt!100762 () tuple2!5722)

(declare-fun lt!100761 () tuple2!5700)

(declare-fun lt!100760 () Bool)

(assert (=> b!63887 (= res!53066 (and (= (_2!2972 lt!100762) lt!100760) (= (_1!2972 lt!100762) (_2!2961 lt!100761))))))

(declare-fun readBitPure!0 (BitStream!2230) tuple2!5722)

(declare-fun readerFrom!0 (BitStream!2230 (_ BitVec 32) (_ BitVec 32)) BitStream!2230)

(assert (=> b!63887 (= lt!100762 (readBitPure!0 (readerFrom!0 (_2!2961 lt!100761) (currentBit!3310 thiss!1379) (currentByte!3315 thiss!1379))))))

(declare-fun b!63888 () Bool)

(declare-fun res!53063 () Bool)

(assert (=> b!63888 (=> (not res!53063) (not e!42260))))

(assert (=> b!63888 (= res!53063 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100761)))))

(declare-fun b!63889 () Bool)

(declare-fun e!42261 () Bool)

(declare-fun e!42259 () Bool)

(assert (=> b!63889 (= e!42261 e!42259)))

(declare-fun res!53064 () Bool)

(assert (=> b!63889 (=> (not res!53064) (not e!42259))))

(declare-fun lt!100757 () (_ BitVec 8))

(declare-fun lt!100768 () tuple2!5700)

(declare-fun lt!100759 () tuple2!5722)

(assert (=> b!63889 (= res!53064 (and (= (_2!2972 lt!100759) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1850 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!100757)) #b00000000000000000000000000000000))) (= (_1!2972 lt!100759) (_2!2961 lt!100768))))))

(declare-fun lt!100758 () tuple2!5716)

(declare-fun lt!100766 () BitStream!2230)

(assert (=> b!63889 (= lt!100758 (readBits!0 lt!100766 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!63889 (= lt!100759 (readBitPure!0 lt!100766))))

(assert (=> b!63889 (= lt!100766 (readerFrom!0 (_2!2961 lt!100768) (currentBit!3310 thiss!1379) (currentByte!3315 thiss!1379)))))

(declare-fun b!63890 () Bool)

(declare-fun res!53067 () Bool)

(assert (=> b!63890 (=> (not res!53067) (not e!42261))))

(declare-fun lt!100765 () (_ BitVec 64))

(declare-fun lt!100767 () (_ BitVec 64))

(assert (=> b!63890 (= res!53067 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100768))) (currentByte!3315 (_2!2961 lt!100768)) (currentBit!3310 (_2!2961 lt!100768))) (bvadd lt!100767 lt!100765)))))

(assert (=> b!63890 (or (not (= (bvand lt!100767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100765 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!100767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!100767 lt!100765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63890 (= lt!100765 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!63890 (= lt!100767 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(declare-fun b!63891 () Bool)

(declare-fun res!53065 () Bool)

(assert (=> b!63891 (=> (not res!53065) (not e!42261))))

(assert (=> b!63891 (= res!53065 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100768)))))

(declare-fun d!19880 () Bool)

(assert (=> d!19880 e!42261))

(declare-fun res!53061 () Bool)

(assert (=> d!19880 (=> (not res!53061) (not e!42261))))

(assert (=> d!19880 (= res!53061 (= (size!1286 (buf!1667 (_2!2961 lt!100768))) (size!1286 (buf!1667 thiss!1379))))))

(declare-fun lt!100764 () array!2806)

(assert (=> d!19880 (= lt!100757 (select (arr!1850 lt!100764) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19880 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1286 lt!100764)))))

(assert (=> d!19880 (= lt!100764 (array!2807 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!100763 () tuple2!5700)

(assert (=> d!19880 (= lt!100768 (tuple2!5701 (_1!2961 lt!100763) (_2!2961 lt!100763)))))

(assert (=> d!19880 (= lt!100763 lt!100761)))

(assert (=> d!19880 e!42260))

(declare-fun res!53068 () Bool)

(assert (=> d!19880 (=> (not res!53068) (not e!42260))))

(assert (=> d!19880 (= res!53068 (= (size!1286 (buf!1667 thiss!1379)) (size!1286 (buf!1667 (_2!2961 lt!100761)))))))

(declare-fun appendBit!0 (BitStream!2230 Bool) tuple2!5700)

(assert (=> d!19880 (= lt!100761 (appendBit!0 thiss!1379 lt!100760))))

(assert (=> d!19880 (= lt!100760 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1850 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19880 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19880 (= (appendBitFromByte!0 thiss!1379 (select (arr!1850 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!100768)))

(declare-fun b!63886 () Bool)

(assert (=> b!63886 (= e!42259 (= (bitIndex!0 (size!1286 (buf!1667 (_1!2972 lt!100759))) (currentByte!3315 (_1!2972 lt!100759)) (currentBit!3310 (_1!2972 lt!100759))) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100768))) (currentByte!3315 (_2!2961 lt!100768)) (currentBit!3310 (_2!2961 lt!100768)))))))

(declare-fun b!63892 () Bool)

(assert (=> b!63892 (= e!42258 (= (bitIndex!0 (size!1286 (buf!1667 (_1!2972 lt!100762))) (currentByte!3315 (_1!2972 lt!100762)) (currentBit!3310 (_1!2972 lt!100762))) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100761))) (currentByte!3315 (_2!2961 lt!100761)) (currentBit!3310 (_2!2961 lt!100761)))))))

(declare-fun b!63893 () Bool)

(declare-fun res!53062 () Bool)

(assert (=> b!63893 (=> (not res!53062) (not e!42260))))

(assert (=> b!63893 (= res!53062 (= (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100761))) (currentByte!3315 (_2!2961 lt!100761)) (currentBit!3310 (_2!2961 lt!100761))) (bvadd (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19880 res!53068) b!63893))

(assert (= (and b!63893 res!53062) b!63888))

(assert (= (and b!63888 res!53063) b!63887))

(assert (= (and b!63887 res!53066) b!63892))

(assert (= (and d!19880 res!53061) b!63890))

(assert (= (and b!63890 res!53067) b!63891))

(assert (= (and b!63891 res!53065) b!63889))

(assert (= (and b!63889 res!53064) b!63886))

(declare-fun m!101211 () Bool)

(assert (=> d!19880 m!101211))

(declare-fun m!101213 () Bool)

(assert (=> d!19880 m!101213))

(assert (=> d!19880 m!100975))

(declare-fun m!101215 () Bool)

(assert (=> b!63891 m!101215))

(declare-fun m!101217 () Bool)

(assert (=> b!63889 m!101217))

(declare-fun m!101219 () Bool)

(assert (=> b!63889 m!101219))

(declare-fun m!101221 () Bool)

(assert (=> b!63889 m!101221))

(declare-fun m!101223 () Bool)

(assert (=> b!63893 m!101223))

(assert (=> b!63893 m!100651))

(declare-fun m!101225 () Bool)

(assert (=> b!63892 m!101225))

(assert (=> b!63892 m!101223))

(declare-fun m!101227 () Bool)

(assert (=> b!63888 m!101227))

(declare-fun m!101229 () Bool)

(assert (=> b!63886 m!101229))

(declare-fun m!101231 () Bool)

(assert (=> b!63886 m!101231))

(declare-fun m!101233 () Bool)

(assert (=> b!63887 m!101233))

(assert (=> b!63887 m!101233))

(declare-fun m!101235 () Bool)

(assert (=> b!63887 m!101235))

(assert (=> b!63890 m!101231))

(assert (=> b!63890 m!100651))

(assert (=> b!63518 d!19880))

(declare-fun d!19882 () Bool)

(assert (=> d!19882 (= (invariant!0 (currentBit!3310 (_2!2961 lt!100146)) (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100146)))) (and (bvsge (currentBit!3310 (_2!2961 lt!100146)) #b00000000000000000000000000000000) (bvslt (currentBit!3310 (_2!2961 lt!100146)) #b00000000000000000000000000001000) (bvsge (currentByte!3315 (_2!2961 lt!100146)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100146)))) (and (= (currentBit!3310 (_2!2961 lt!100146)) #b00000000000000000000000000000000) (= (currentByte!3315 (_2!2961 lt!100146)) (size!1286 (buf!1667 (_2!2961 lt!100146))))))))))

(assert (=> b!63520 d!19882))

(declare-fun d!19884 () Bool)

(declare-fun res!53069 () Bool)

(declare-fun e!42262 () Bool)

(assert (=> d!19884 (=> (not res!53069) (not e!42262))))

(assert (=> d!19884 (= res!53069 (= (size!1286 (buf!1667 (_1!2962 lt!100140))) (size!1286 (buf!1667 (_2!2961 lt!100150)))))))

(assert (=> d!19884 (= (isPrefixOf!0 (_1!2962 lt!100140) (_2!2961 lt!100150)) e!42262)))

(declare-fun b!63894 () Bool)

(declare-fun res!53071 () Bool)

(assert (=> b!63894 (=> (not res!53071) (not e!42262))))

(assert (=> b!63894 (= res!53071 (bvsle (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100140))) (currentByte!3315 (_1!2962 lt!100140)) (currentBit!3310 (_1!2962 lt!100140))) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150)))))))

(declare-fun b!63895 () Bool)

(declare-fun e!42263 () Bool)

(assert (=> b!63895 (= e!42262 e!42263)))

(declare-fun res!53070 () Bool)

(assert (=> b!63895 (=> res!53070 e!42263)))

(assert (=> b!63895 (= res!53070 (= (size!1286 (buf!1667 (_1!2962 lt!100140))) #b00000000000000000000000000000000))))

(declare-fun b!63896 () Bool)

(assert (=> b!63896 (= e!42263 (arrayBitRangesEq!0 (buf!1667 (_1!2962 lt!100140)) (buf!1667 (_2!2961 lt!100150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100140))) (currentByte!3315 (_1!2962 lt!100140)) (currentBit!3310 (_1!2962 lt!100140)))))))

(assert (= (and d!19884 res!53069) b!63894))

(assert (= (and b!63894 res!53071) b!63895))

(assert (= (and b!63895 (not res!53070)) b!63896))

(assert (=> b!63894 m!100967))

(assert (=> b!63894 m!100675))

(assert (=> b!63896 m!100967))

(assert (=> b!63896 m!100967))

(declare-fun m!101237 () Bool)

(assert (=> b!63896 m!101237))

(assert (=> b!63521 d!19884))

(declare-fun d!19886 () Bool)

(declare-fun res!53072 () Bool)

(declare-fun e!42264 () Bool)

(assert (=> d!19886 (=> (not res!53072) (not e!42264))))

(assert (=> d!19886 (= res!53072 (= (size!1286 (buf!1667 (_1!2962 lt!100142))) (size!1286 (buf!1667 (_2!2961 lt!100150)))))))

(assert (=> d!19886 (= (isPrefixOf!0 (_1!2962 lt!100142) (_2!2961 lt!100150)) e!42264)))

(declare-fun b!63897 () Bool)

(declare-fun res!53074 () Bool)

(assert (=> b!63897 (=> (not res!53074) (not e!42264))))

(assert (=> b!63897 (= res!53074 (bvsle (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100142))) (currentByte!3315 (_1!2962 lt!100142)) (currentBit!3310 (_1!2962 lt!100142))) (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150)))))))

(declare-fun b!63898 () Bool)

(declare-fun e!42265 () Bool)

(assert (=> b!63898 (= e!42264 e!42265)))

(declare-fun res!53073 () Bool)

(assert (=> b!63898 (=> res!53073 e!42265)))

(assert (=> b!63898 (= res!53073 (= (size!1286 (buf!1667 (_1!2962 lt!100142))) #b00000000000000000000000000000000))))

(declare-fun b!63899 () Bool)

(assert (=> b!63899 (= e!42265 (arrayBitRangesEq!0 (buf!1667 (_1!2962 lt!100142)) (buf!1667 (_2!2961 lt!100150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 (_1!2962 lt!100142))) (currentByte!3315 (_1!2962 lt!100142)) (currentBit!3310 (_1!2962 lt!100142)))))))

(assert (= (and d!19886 res!53072) b!63897))

(assert (= (and b!63897 res!53074) b!63898))

(assert (= (and b!63898 (not res!53073)) b!63899))

(assert (=> b!63897 m!100965))

(assert (=> b!63897 m!100675))

(assert (=> b!63899 m!100965))

(assert (=> b!63899 m!100965))

(declare-fun m!101239 () Bool)

(assert (=> b!63899 m!101239))

(assert (=> b!63510 d!19886))

(declare-fun d!19888 () Bool)

(declare-fun res!53075 () Bool)

(declare-fun e!42266 () Bool)

(assert (=> d!19888 (=> (not res!53075) (not e!42266))))

(assert (=> d!19888 (= res!53075 (= (size!1286 (buf!1667 thiss!1379)) (size!1286 (buf!1667 thiss!1379))))))

(assert (=> d!19888 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42266)))

(declare-fun b!63900 () Bool)

(declare-fun res!53077 () Bool)

(assert (=> b!63900 (=> (not res!53077) (not e!42266))))

(assert (=> b!63900 (= res!53077 (bvsle (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)) (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379))))))

(declare-fun b!63901 () Bool)

(declare-fun e!42267 () Bool)

(assert (=> b!63901 (= e!42266 e!42267)))

(declare-fun res!53076 () Bool)

(assert (=> b!63901 (=> res!53076 e!42267)))

(assert (=> b!63901 (= res!53076 (= (size!1286 (buf!1667 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63902 () Bool)

(assert (=> b!63902 (= e!42267 (arrayBitRangesEq!0 (buf!1667 thiss!1379) (buf!1667 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379))))))

(assert (= (and d!19888 res!53075) b!63900))

(assert (= (and b!63900 res!53077) b!63901))

(assert (= (and b!63901 (not res!53076)) b!63902))

(assert (=> b!63900 m!100651))

(assert (=> b!63900 m!100651))

(assert (=> b!63902 m!100651))

(assert (=> b!63902 m!100651))

(declare-fun m!101241 () Bool)

(assert (=> b!63902 m!101241))

(assert (=> b!63512 d!19888))

(declare-fun d!19890 () Bool)

(assert (=> d!19890 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!100771 () Unit!4313)

(declare-fun choose!11 (BitStream!2230) Unit!4313)

(assert (=> d!19890 (= lt!100771 (choose!11 thiss!1379))))

(assert (=> d!19890 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!100771)))

(declare-fun bs!4894 () Bool)

(assert (= bs!4894 d!19890))

(assert (=> bs!4894 m!100647))

(declare-fun m!101243 () Bool)

(assert (=> bs!4894 m!101243))

(assert (=> b!63512 d!19890))

(declare-fun d!19892 () Bool)

(declare-fun e!42268 () Bool)

(assert (=> d!19892 e!42268))

(declare-fun res!53078 () Bool)

(assert (=> d!19892 (=> (not res!53078) (not e!42268))))

(declare-fun lt!100774 () (_ BitVec 64))

(declare-fun lt!100776 () (_ BitVec 64))

(declare-fun lt!100773 () (_ BitVec 64))

(assert (=> d!19892 (= res!53078 (= lt!100776 (bvsub lt!100774 lt!100773)))))

(assert (=> d!19892 (or (= (bvand lt!100774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100773 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100774 lt!100773) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19892 (= lt!100773 (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 thiss!1379))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379))))))

(declare-fun lt!100775 () (_ BitVec 64))

(declare-fun lt!100772 () (_ BitVec 64))

(assert (=> d!19892 (= lt!100774 (bvmul lt!100775 lt!100772))))

(assert (=> d!19892 (or (= lt!100775 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100772 (bvsdiv (bvmul lt!100775 lt!100772) lt!100775)))))

(assert (=> d!19892 (= lt!100772 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19892 (= lt!100775 ((_ sign_extend 32) (size!1286 (buf!1667 thiss!1379))))))

(assert (=> d!19892 (= lt!100776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3315 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3310 thiss!1379))))))

(assert (=> d!19892 (invariant!0 (currentBit!3310 thiss!1379) (currentByte!3315 thiss!1379) (size!1286 (buf!1667 thiss!1379)))))

(assert (=> d!19892 (= (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)) lt!100776)))

(declare-fun b!63903 () Bool)

(declare-fun res!53079 () Bool)

(assert (=> b!63903 (=> (not res!53079) (not e!42268))))

(assert (=> b!63903 (= res!53079 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100776))))

(declare-fun b!63904 () Bool)

(declare-fun lt!100777 () (_ BitVec 64))

(assert (=> b!63904 (= e!42268 (bvsle lt!100776 (bvmul lt!100777 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63904 (or (= lt!100777 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100777 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100777)))))

(assert (=> b!63904 (= lt!100777 ((_ sign_extend 32) (size!1286 (buf!1667 thiss!1379))))))

(assert (= (and d!19892 res!53078) b!63903))

(assert (= (and b!63903 res!53079) b!63904))

(assert (=> d!19892 m!100971))

(assert (=> d!19892 m!100973))

(assert (=> b!63512 d!19892))

(declare-fun d!19894 () Bool)

(declare-fun size!1289 (List!690) Int)

(assert (=> d!19894 (= (length!318 lt!100144) (size!1289 lt!100144))))

(declare-fun bs!4895 () Bool)

(assert (= bs!4895 d!19894))

(declare-fun m!101245 () Bool)

(assert (=> bs!4895 m!101245))

(assert (=> b!63522 d!19894))

(declare-fun b!63907 () Bool)

(declare-fun e!42269 () Bool)

(declare-fun lt!100779 () List!690)

(assert (=> b!63907 (= e!42269 (isEmpty!195 lt!100779))))

(declare-fun b!63908 () Bool)

(assert (=> b!63908 (= e!42269 (> (length!318 lt!100779) 0))))

(declare-fun b!63905 () Bool)

(declare-fun e!42270 () tuple2!5712)

(assert (=> b!63905 (= e!42270 (tuple2!5713 Nil!687 (_1!2962 lt!100142)))))

(declare-fun d!19896 () Bool)

(assert (=> d!19896 e!42269))

(declare-fun c!4579 () Bool)

(assert (=> d!19896 (= c!4579 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19896 (= lt!100779 (_1!2967 e!42270))))

(declare-fun c!4578 () Bool)

(assert (=> d!19896 (= c!4578 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19896 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19896 (= (bitStreamReadBitsIntoList!0 (_2!2961 lt!100150) (_1!2962 lt!100142) (bvsub to!314 i!635)) lt!100779)))

(declare-fun lt!100778 () (_ BitVec 64))

(declare-fun b!63906 () Bool)

(declare-fun lt!100780 () tuple2!5714)

(assert (=> b!63906 (= e!42270 (tuple2!5713 (Cons!686 (_1!2968 lt!100780) (bitStreamReadBitsIntoList!0 (_2!2961 lt!100150) (_2!2968 lt!100780) (bvsub (bvsub to!314 i!635) lt!100778))) (_2!2968 lt!100780)))))

(assert (=> b!63906 (= lt!100780 (readBit!0 (_1!2962 lt!100142)))))

(assert (=> b!63906 (= lt!100778 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19896 c!4578) b!63905))

(assert (= (and d!19896 (not c!4578)) b!63906))

(assert (= (and d!19896 c!4579) b!63907))

(assert (= (and d!19896 (not c!4579)) b!63908))

(declare-fun m!101247 () Bool)

(assert (=> b!63907 m!101247))

(declare-fun m!101249 () Bool)

(assert (=> b!63908 m!101249))

(declare-fun m!101251 () Bool)

(assert (=> b!63906 m!101251))

(declare-fun m!101253 () Bool)

(assert (=> b!63906 m!101253))

(assert (=> b!63511 d!19896))

(declare-fun b!63909 () Bool)

(declare-fun e!42272 () Unit!4313)

(declare-fun lt!100794 () Unit!4313)

(assert (=> b!63909 (= e!42272 lt!100794)))

(declare-fun lt!100799 () (_ BitVec 64))

(assert (=> b!63909 (= lt!100799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100798 () (_ BitVec 64))

(assert (=> b!63909 (= lt!100798 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(assert (=> b!63909 (= lt!100794 (arrayBitRangesEqSymmetric!0 (buf!1667 thiss!1379) (buf!1667 (_2!2961 lt!100150)) lt!100799 lt!100798))))

(assert (=> b!63909 (arrayBitRangesEq!0 (buf!1667 (_2!2961 lt!100150)) (buf!1667 thiss!1379) lt!100799 lt!100798)))

(declare-fun d!19898 () Bool)

(declare-fun e!42271 () Bool)

(assert (=> d!19898 e!42271))

(declare-fun res!53081 () Bool)

(assert (=> d!19898 (=> (not res!53081) (not e!42271))))

(declare-fun lt!100791 () tuple2!5702)

(assert (=> d!19898 (= res!53081 (isPrefixOf!0 (_1!2962 lt!100791) (_2!2962 lt!100791)))))

(declare-fun lt!100793 () BitStream!2230)

(assert (=> d!19898 (= lt!100791 (tuple2!5703 lt!100793 (_2!2961 lt!100150)))))

(declare-fun lt!100789 () Unit!4313)

(declare-fun lt!100784 () Unit!4313)

(assert (=> d!19898 (= lt!100789 lt!100784)))

(assert (=> d!19898 (isPrefixOf!0 lt!100793 (_2!2961 lt!100150))))

(assert (=> d!19898 (= lt!100784 (lemmaIsPrefixTransitive!0 lt!100793 (_2!2961 lt!100150) (_2!2961 lt!100150)))))

(declare-fun lt!100785 () Unit!4313)

(declare-fun lt!100790 () Unit!4313)

(assert (=> d!19898 (= lt!100785 lt!100790)))

(assert (=> d!19898 (isPrefixOf!0 lt!100793 (_2!2961 lt!100150))))

(assert (=> d!19898 (= lt!100790 (lemmaIsPrefixTransitive!0 lt!100793 thiss!1379 (_2!2961 lt!100150)))))

(declare-fun lt!100782 () Unit!4313)

(assert (=> d!19898 (= lt!100782 e!42272)))

(declare-fun c!4580 () Bool)

(assert (=> d!19898 (= c!4580 (not (= (size!1286 (buf!1667 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!100795 () Unit!4313)

(declare-fun lt!100781 () Unit!4313)

(assert (=> d!19898 (= lt!100795 lt!100781)))

(assert (=> d!19898 (isPrefixOf!0 (_2!2961 lt!100150) (_2!2961 lt!100150))))

(assert (=> d!19898 (= lt!100781 (lemmaIsPrefixRefl!0 (_2!2961 lt!100150)))))

(declare-fun lt!100796 () Unit!4313)

(declare-fun lt!100788 () Unit!4313)

(assert (=> d!19898 (= lt!100796 lt!100788)))

(assert (=> d!19898 (= lt!100788 (lemmaIsPrefixRefl!0 (_2!2961 lt!100150)))))

(declare-fun lt!100786 () Unit!4313)

(declare-fun lt!100787 () Unit!4313)

(assert (=> d!19898 (= lt!100786 lt!100787)))

(assert (=> d!19898 (isPrefixOf!0 lt!100793 lt!100793)))

(assert (=> d!19898 (= lt!100787 (lemmaIsPrefixRefl!0 lt!100793))))

(declare-fun lt!100797 () Unit!4313)

(declare-fun lt!100783 () Unit!4313)

(assert (=> d!19898 (= lt!100797 lt!100783)))

(assert (=> d!19898 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19898 (= lt!100783 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19898 (= lt!100793 (BitStream!2231 (buf!1667 (_2!2961 lt!100150)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(assert (=> d!19898 (isPrefixOf!0 thiss!1379 (_2!2961 lt!100150))))

(assert (=> d!19898 (= (reader!0 thiss!1379 (_2!2961 lt!100150)) lt!100791)))

(declare-fun b!63910 () Bool)

(declare-fun Unit!4329 () Unit!4313)

(assert (=> b!63910 (= e!42272 Unit!4329)))

(declare-fun lt!100792 () (_ BitVec 64))

(declare-fun lt!100800 () (_ BitVec 64))

(declare-fun b!63911 () Bool)

(assert (=> b!63911 (= e!42271 (= (_1!2962 lt!100791) (withMovedBitIndex!0 (_2!2962 lt!100791) (bvsub lt!100792 lt!100800))))))

(assert (=> b!63911 (or (= (bvand lt!100792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100792 lt!100800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63911 (= lt!100800 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150))))))

(assert (=> b!63911 (= lt!100792 (bitIndex!0 (size!1286 (buf!1667 thiss!1379)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379)))))

(declare-fun b!63912 () Bool)

(declare-fun res!53082 () Bool)

(assert (=> b!63912 (=> (not res!53082) (not e!42271))))

(assert (=> b!63912 (= res!53082 (isPrefixOf!0 (_2!2962 lt!100791) (_2!2961 lt!100150)))))

(declare-fun b!63913 () Bool)

(declare-fun res!53080 () Bool)

(assert (=> b!63913 (=> (not res!53080) (not e!42271))))

(assert (=> b!63913 (= res!53080 (isPrefixOf!0 (_1!2962 lt!100791) thiss!1379))))

(assert (= (and d!19898 c!4580) b!63909))

(assert (= (and d!19898 (not c!4580)) b!63910))

(assert (= (and d!19898 res!53081) b!63913))

(assert (= (and b!63913 res!53080) b!63912))

(assert (= (and b!63912 res!53082) b!63911))

(declare-fun m!101255 () Bool)

(assert (=> b!63913 m!101255))

(declare-fun m!101257 () Bool)

(assert (=> b!63912 m!101257))

(declare-fun m!101259 () Bool)

(assert (=> d!19898 m!101259))

(declare-fun m!101261 () Bool)

(assert (=> d!19898 m!101261))

(declare-fun m!101263 () Bool)

(assert (=> d!19898 m!101263))

(declare-fun m!101265 () Bool)

(assert (=> d!19898 m!101265))

(assert (=> d!19898 m!100681))

(declare-fun m!101267 () Bool)

(assert (=> d!19898 m!101267))

(assert (=> d!19898 m!100647))

(declare-fun m!101269 () Bool)

(assert (=> d!19898 m!101269))

(declare-fun m!101271 () Bool)

(assert (=> d!19898 m!101271))

(assert (=> d!19898 m!100649))

(declare-fun m!101273 () Bool)

(assert (=> d!19898 m!101273))

(declare-fun m!101275 () Bool)

(assert (=> b!63911 m!101275))

(assert (=> b!63911 m!100675))

(assert (=> b!63911 m!100651))

(assert (=> b!63909 m!100651))

(declare-fun m!101277 () Bool)

(assert (=> b!63909 m!101277))

(declare-fun m!101279 () Bool)

(assert (=> b!63909 m!101279))

(assert (=> b!63511 d!19898))

(declare-fun b!63914 () Bool)

(declare-fun e!42274 () Unit!4313)

(declare-fun lt!100814 () Unit!4313)

(assert (=> b!63914 (= e!42274 lt!100814)))

(declare-fun lt!100819 () (_ BitVec 64))

(assert (=> b!63914 (= lt!100819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100818 () (_ BitVec 64))

(assert (=> b!63914 (= lt!100818 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))))))

(assert (=> b!63914 (= lt!100814 (arrayBitRangesEqSymmetric!0 (buf!1667 (_2!2961 lt!100146)) (buf!1667 (_2!2961 lt!100150)) lt!100819 lt!100818))))

(assert (=> b!63914 (arrayBitRangesEq!0 (buf!1667 (_2!2961 lt!100150)) (buf!1667 (_2!2961 lt!100146)) lt!100819 lt!100818)))

(declare-fun d!19900 () Bool)

(declare-fun e!42273 () Bool)

(assert (=> d!19900 e!42273))

(declare-fun res!53084 () Bool)

(assert (=> d!19900 (=> (not res!53084) (not e!42273))))

(declare-fun lt!100811 () tuple2!5702)

(assert (=> d!19900 (= res!53084 (isPrefixOf!0 (_1!2962 lt!100811) (_2!2962 lt!100811)))))

(declare-fun lt!100813 () BitStream!2230)

(assert (=> d!19900 (= lt!100811 (tuple2!5703 lt!100813 (_2!2961 lt!100150)))))

(declare-fun lt!100809 () Unit!4313)

(declare-fun lt!100804 () Unit!4313)

(assert (=> d!19900 (= lt!100809 lt!100804)))

(assert (=> d!19900 (isPrefixOf!0 lt!100813 (_2!2961 lt!100150))))

(assert (=> d!19900 (= lt!100804 (lemmaIsPrefixTransitive!0 lt!100813 (_2!2961 lt!100150) (_2!2961 lt!100150)))))

(declare-fun lt!100805 () Unit!4313)

(declare-fun lt!100810 () Unit!4313)

(assert (=> d!19900 (= lt!100805 lt!100810)))

(assert (=> d!19900 (isPrefixOf!0 lt!100813 (_2!2961 lt!100150))))

(assert (=> d!19900 (= lt!100810 (lemmaIsPrefixTransitive!0 lt!100813 (_2!2961 lt!100146) (_2!2961 lt!100150)))))

(declare-fun lt!100802 () Unit!4313)

(assert (=> d!19900 (= lt!100802 e!42274)))

(declare-fun c!4581 () Bool)

(assert (=> d!19900 (= c!4581 (not (= (size!1286 (buf!1667 (_2!2961 lt!100146))) #b00000000000000000000000000000000)))))

(declare-fun lt!100815 () Unit!4313)

(declare-fun lt!100801 () Unit!4313)

(assert (=> d!19900 (= lt!100815 lt!100801)))

(assert (=> d!19900 (isPrefixOf!0 (_2!2961 lt!100150) (_2!2961 lt!100150))))

(assert (=> d!19900 (= lt!100801 (lemmaIsPrefixRefl!0 (_2!2961 lt!100150)))))

(declare-fun lt!100816 () Unit!4313)

(declare-fun lt!100808 () Unit!4313)

(assert (=> d!19900 (= lt!100816 lt!100808)))

(assert (=> d!19900 (= lt!100808 (lemmaIsPrefixRefl!0 (_2!2961 lt!100150)))))

(declare-fun lt!100806 () Unit!4313)

(declare-fun lt!100807 () Unit!4313)

(assert (=> d!19900 (= lt!100806 lt!100807)))

(assert (=> d!19900 (isPrefixOf!0 lt!100813 lt!100813)))

(assert (=> d!19900 (= lt!100807 (lemmaIsPrefixRefl!0 lt!100813))))

(declare-fun lt!100817 () Unit!4313)

(declare-fun lt!100803 () Unit!4313)

(assert (=> d!19900 (= lt!100817 lt!100803)))

(assert (=> d!19900 (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100146))))

(assert (=> d!19900 (= lt!100803 (lemmaIsPrefixRefl!0 (_2!2961 lt!100146)))))

(assert (=> d!19900 (= lt!100813 (BitStream!2231 (buf!1667 (_2!2961 lt!100150)) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))))))

(assert (=> d!19900 (isPrefixOf!0 (_2!2961 lt!100146) (_2!2961 lt!100150))))

(assert (=> d!19900 (= (reader!0 (_2!2961 lt!100146) (_2!2961 lt!100150)) lt!100811)))

(declare-fun b!63915 () Bool)

(declare-fun Unit!4331 () Unit!4313)

(assert (=> b!63915 (= e!42274 Unit!4331)))

(declare-fun b!63916 () Bool)

(declare-fun lt!100812 () (_ BitVec 64))

(declare-fun lt!100820 () (_ BitVec 64))

(assert (=> b!63916 (= e!42273 (= (_1!2962 lt!100811) (withMovedBitIndex!0 (_2!2962 lt!100811) (bvsub lt!100812 lt!100820))))))

(assert (=> b!63916 (or (= (bvand lt!100812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100812 lt!100820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63916 (= lt!100820 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100150))) (currentByte!3315 (_2!2961 lt!100150)) (currentBit!3310 (_2!2961 lt!100150))))))

(assert (=> b!63916 (= lt!100812 (bitIndex!0 (size!1286 (buf!1667 (_2!2961 lt!100146))) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146))))))

(declare-fun b!63917 () Bool)

(declare-fun res!53085 () Bool)

(assert (=> b!63917 (=> (not res!53085) (not e!42273))))

(assert (=> b!63917 (= res!53085 (isPrefixOf!0 (_2!2962 lt!100811) (_2!2961 lt!100150)))))

(declare-fun b!63918 () Bool)

(declare-fun res!53083 () Bool)

(assert (=> b!63918 (=> (not res!53083) (not e!42273))))

(assert (=> b!63918 (= res!53083 (isPrefixOf!0 (_1!2962 lt!100811) (_2!2961 lt!100146)))))

(assert (= (and d!19900 c!4581) b!63914))

(assert (= (and d!19900 (not c!4581)) b!63915))

(assert (= (and d!19900 res!53084) b!63918))

(assert (= (and b!63918 res!53083) b!63917))

(assert (= (and b!63917 res!53085) b!63916))

(declare-fun m!101281 () Bool)

(assert (=> b!63918 m!101281))

(declare-fun m!101283 () Bool)

(assert (=> b!63917 m!101283))

(declare-fun m!101285 () Bool)

(assert (=> d!19900 m!101285))

(declare-fun m!101287 () Bool)

(assert (=> d!19900 m!101287))

(declare-fun m!101289 () Bool)

(assert (=> d!19900 m!101289))

(declare-fun m!101291 () Bool)

(assert (=> d!19900 m!101291))

(assert (=> d!19900 m!100689))

(declare-fun m!101293 () Bool)

(assert (=> d!19900 m!101293))

(assert (=> d!19900 m!101175))

(assert (=> d!19900 m!101269))

(declare-fun m!101295 () Bool)

(assert (=> d!19900 m!101295))

(assert (=> d!19900 m!101177))

(assert (=> d!19900 m!101273))

(declare-fun m!101297 () Bool)

(assert (=> b!63916 m!101297))

(assert (=> b!63916 m!100675))

(assert (=> b!63916 m!100645))

(assert (=> b!63914 m!100645))

(declare-fun m!101299 () Bool)

(assert (=> b!63914 m!101299))

(declare-fun m!101301 () Bool)

(assert (=> b!63914 m!101301))

(assert (=> b!63511 d!19900))

(declare-fun d!19902 () Bool)

(assert (=> d!19902 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100143)))

(declare-fun lt!100821 () Unit!4313)

(assert (=> d!19902 (= lt!100821 (choose!9 (_2!2961 lt!100146) (buf!1667 (_2!2961 lt!100150)) lt!100143 (BitStream!2231 (buf!1667 (_2!2961 lt!100150)) (currentByte!3315 (_2!2961 lt!100146)) (currentBit!3310 (_2!2961 lt!100146)))))))

(assert (=> d!19902 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2961 lt!100146) (buf!1667 (_2!2961 lt!100150)) lt!100143) lt!100821)))

(declare-fun bs!4896 () Bool)

(assert (= bs!4896 d!19902))

(assert (=> bs!4896 m!100665))

(declare-fun m!101303 () Bool)

(assert (=> bs!4896 m!101303))

(assert (=> b!63511 d!19902))

(declare-fun b!63921 () Bool)

(declare-fun e!42275 () Bool)

(declare-fun lt!100823 () List!690)

(assert (=> b!63921 (= e!42275 (isEmpty!195 lt!100823))))

(declare-fun b!63922 () Bool)

(assert (=> b!63922 (= e!42275 (> (length!318 lt!100823) 0))))

(declare-fun b!63919 () Bool)

(declare-fun e!42276 () tuple2!5712)

(assert (=> b!63919 (= e!42276 (tuple2!5713 Nil!687 (_1!2962 lt!100140)))))

(declare-fun d!19904 () Bool)

(assert (=> d!19904 e!42275))

(declare-fun c!4583 () Bool)

(assert (=> d!19904 (= c!4583 (= lt!100143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19904 (= lt!100823 (_1!2967 e!42276))))

(declare-fun c!4582 () Bool)

(assert (=> d!19904 (= c!4582 (= lt!100143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19904 (bvsge lt!100143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19904 (= (bitStreamReadBitsIntoList!0 (_2!2961 lt!100150) (_1!2962 lt!100140) lt!100143) lt!100823)))

(declare-fun b!63920 () Bool)

(declare-fun lt!100822 () (_ BitVec 64))

(declare-fun lt!100824 () tuple2!5714)

(assert (=> b!63920 (= e!42276 (tuple2!5713 (Cons!686 (_1!2968 lt!100824) (bitStreamReadBitsIntoList!0 (_2!2961 lt!100150) (_2!2968 lt!100824) (bvsub lt!100143 lt!100822))) (_2!2968 lt!100824)))))

(assert (=> b!63920 (= lt!100824 (readBit!0 (_1!2962 lt!100140)))))

(assert (=> b!63920 (= lt!100822 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19904 c!4582) b!63919))

(assert (= (and d!19904 (not c!4582)) b!63920))

(assert (= (and d!19904 c!4583) b!63921))

(assert (= (and d!19904 (not c!4583)) b!63922))

(declare-fun m!101305 () Bool)

(assert (=> b!63921 m!101305))

(declare-fun m!101307 () Bool)

(assert (=> b!63922 m!101307))

(declare-fun m!101309 () Bool)

(assert (=> b!63920 m!101309))

(declare-fun m!101311 () Bool)

(assert (=> b!63920 m!101311))

(assert (=> b!63511 d!19904))

(declare-fun d!19906 () Bool)

(assert (=> d!19906 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146))) lt!100143) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 (_2!2961 lt!100146))) ((_ sign_extend 32) (currentBit!3310 (_2!2961 lt!100146)))) lt!100143))))

(declare-fun bs!4897 () Bool)

(assert (= bs!4897 d!19906))

(declare-fun m!101313 () Bool)

(assert (=> bs!4897 m!101313))

(assert (=> b!63511 d!19906))

(declare-fun d!19908 () Bool)

(assert (=> d!19908 (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!100825 () Unit!4313)

(assert (=> d!19908 (= lt!100825 (choose!9 thiss!1379 (buf!1667 (_2!2961 lt!100150)) (bvsub to!314 i!635) (BitStream!2231 (buf!1667 (_2!2961 lt!100150)) (currentByte!3315 thiss!1379) (currentBit!3310 thiss!1379))))))

(assert (=> d!19908 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1667 (_2!2961 lt!100150)) (bvsub to!314 i!635)) lt!100825)))

(declare-fun bs!4898 () Bool)

(assert (= bs!4898 d!19908))

(assert (=> bs!4898 m!100663))

(declare-fun m!101315 () Bool)

(assert (=> bs!4898 m!101315))

(assert (=> b!63511 d!19908))

(declare-fun d!19910 () Bool)

(assert (=> d!19910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1286 (buf!1667 (_2!2961 lt!100150)))) ((_ sign_extend 32) (currentByte!3315 thiss!1379)) ((_ sign_extend 32) (currentBit!3310 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4899 () Bool)

(assert (= bs!4899 d!19910))

(declare-fun m!101317 () Bool)

(assert (=> bs!4899 m!101317))

(assert (=> b!63511 d!19910))

(push 1)

(assert (not b!63863))

(assert (not b!63719))

(assert (not b!63713))

(assert (not b!63858))

(assert (not b!63894))

(assert (not b!63902))

(assert (not b!63912))

(assert (not b!63916))

(assert (not b!63896))

(assert (not b!63914))

(assert (not b!63886))

(assert (not b!63906))

(assert (not b!63865))

(assert (not b!63890))

(assert (not b!63841))

(assert (not b!63899))

(assert (not d!19892))

(assert (not b!63729))

(assert (not d!19880))

(assert (not d!19870))

(assert (not b!63840))

(assert (not b!63732))

(assert (not b!63868))

(assert (not b!63911))

(assert (not b!63737))

(assert (not b!63921))

(assert (not b!63917))

(assert (not d!19876))

(assert (not b!63913))

(assert (not b!63711))

(assert (not d!19908))

(assert (not b!63844))

(assert (not b!63838))

(assert (not d!19906))

(assert (not b!63922))

(assert (not d!19910))

(assert (not b!63907))

(assert (not b!63920))

(assert (not d!19898))

(assert (not b!63892))

(assert (not b!63860))

(assert (not b!63859))

(assert (not d!19890))

(assert (not d!19796))

(assert (not b!63889))

(assert (not d!19814))

(assert (not d!19792))

(assert (not d!19788))

(assert (not b!63893))

(assert (not bm!808))

(assert (not d!19878))

(assert (not d!19810))

(assert (not d!19902))

(assert (not b!63908))

(assert (not b!63891))

(assert (not b!63918))

(assert (not b!63735))

(assert (not b!63730))

(assert (not d!19894))

(assert (not b!63842))

(assert (not b!63845))

(assert (not d!19816))

(assert (not b!63887))

(assert (not d!19812))

(assert (not b!63888))

(assert (not d!19864))

(assert (not d!19900))

(assert (not b!63897))

(assert (not b!63731))

(assert (not b!63900))

(assert (not b!63856))

(assert (not b!63909))

(assert (not b!63734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

