; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24974 () Bool)

(assert start!24974)

(declare-fun b!126531 () Bool)

(declare-fun e!83413 () Bool)

(declare-datatypes ((array!5725 0))(
  ( (array!5726 (arr!3196 (Array (_ BitVec 32) (_ BitVec 8))) (size!2591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4506 0))(
  ( (BitStream!4507 (buf!2973 array!5725) (currentByte!5706 (_ BitVec 32)) (currentBit!5701 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4506)

(declare-fun array_inv!2380 (array!5725) Bool)

(assert (=> b!126531 (= e!83413 (array_inv!2380 (buf!2973 thiss!1614)))))

(declare-fun b!126532 () Bool)

(declare-fun res!104858 () Bool)

(declare-fun e!83409 () Bool)

(assert (=> b!126532 (=> (not res!104858) (not e!83409))))

(declare-datatypes ((Unit!7785 0))(
  ( (Unit!7786) )
))
(declare-datatypes ((tuple2!10612 0))(
  ( (tuple2!10613 (_1!5588 Unit!7785) (_2!5588 BitStream!4506)) )
))
(declare-fun lt!197646 () tuple2!10612)

(declare-fun isPrefixOf!0 (BitStream!4506 BitStream!4506) Bool)

(assert (=> b!126532 (= res!104858 (isPrefixOf!0 thiss!1614 (_2!5588 lt!197646)))))

(declare-fun res!104857 () Bool)

(declare-fun e!83411 () Bool)

(assert (=> start!24974 (=> (not res!104857) (not e!83411))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun arr!227 () array!5725)

(assert (=> start!24974 (= res!104857 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2591 arr!227))))))

(assert (=> start!24974 e!83411))

(assert (=> start!24974 true))

(assert (=> start!24974 (array_inv!2380 arr!227)))

(declare-fun inv!12 (BitStream!4506) Bool)

(assert (=> start!24974 (and (inv!12 thiss!1614) e!83413)))

(declare-fun b!126533 () Bool)

(declare-fun e!83407 () Bool)

(assert (=> b!126533 (= e!83407 e!83409)))

(declare-fun res!104860 () Bool)

(assert (=> b!126533 (=> (not res!104860) (not e!83409))))

(declare-fun lt!197650 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126533 (= res!104860 (= (bitIndex!0 (size!2591 (buf!2973 (_2!5588 lt!197646))) (currentByte!5706 (_2!5588 lt!197646)) (currentBit!5701 (_2!5588 lt!197646))) (bvadd (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197650))))))

(assert (=> b!126533 (= lt!197650 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126534 () Bool)

(declare-fun e!83414 () Bool)

(assert (=> b!126534 (= e!83409 (not e!83414))))

(declare-fun res!104853 () Bool)

(assert (=> b!126534 (=> res!104853 e!83414)))

(declare-datatypes ((tuple2!10614 0))(
  ( (tuple2!10615 (_1!5589 BitStream!4506) (_2!5589 array!5725)) )
))
(declare-fun lt!197651 () tuple2!10614)

(declare-datatypes ((tuple2!10616 0))(
  ( (tuple2!10617 (_1!5590 BitStream!4506) (_2!5590 BitStream!4506)) )
))
(declare-fun lt!197647 () tuple2!10616)

(assert (=> b!126534 (= res!104853 (or (not (= (size!2591 (_2!5589 lt!197651)) (size!2591 arr!227))) (not (= (_1!5589 lt!197651) (_2!5590 lt!197647)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4506 array!5725 (_ BitVec 32) (_ BitVec 32)) tuple2!10614)

(assert (=> b!126534 (= lt!197651 (readByteArrayLoopPure!0 (_1!5590 lt!197647) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126534 (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) lt!197650)))

(declare-fun lt!197649 () Unit!7785)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4506 array!5725 (_ BitVec 64)) Unit!7785)

(assert (=> b!126534 (= lt!197649 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2973 (_2!5588 lt!197646)) lt!197650))))

(declare-fun reader!0 (BitStream!4506 BitStream!4506) tuple2!10616)

(assert (=> b!126534 (= lt!197647 (reader!0 thiss!1614 (_2!5588 lt!197646)))))

(declare-fun b!126535 () Bool)

(declare-fun e!83410 () Bool)

(declare-fun lt!197645 () tuple2!10616)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126535 (= e!83410 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2591 (buf!2973 (_1!5590 lt!197645)))) ((_ sign_extend 32) (currentByte!5706 (_1!5590 lt!197645))) ((_ sign_extend 32) (currentBit!5701 (_1!5590 lt!197645))) noOfBytes!1))))

(assert (=> b!126535 (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197648 () Unit!7785)

(assert (=> b!126535 (= lt!197648 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2973 (_2!5588 lt!197646)) ((_ sign_extend 32) noOfBytes!1)))))

(assert (=> b!126535 (= lt!197645 (reader!0 thiss!1614 (_2!5588 lt!197646)))))

(declare-fun b!126536 () Bool)

(declare-fun res!104859 () Bool)

(assert (=> b!126536 (=> res!104859 e!83410)))

(assert (=> b!126536 (= res!104859 (not (isPrefixOf!0 thiss!1614 (_2!5588 lt!197646))))))

(declare-fun b!126537 () Bool)

(assert (=> b!126537 (= e!83411 (not e!83410))))

(declare-fun res!104856 () Bool)

(assert (=> b!126537 (=> res!104856 e!83410)))

(assert (=> b!126537 (= res!104856 (not (= (bitIndex!0 (size!2591 (buf!2973 (_2!5588 lt!197646))) (currentByte!5706 (_2!5588 lt!197646)) (currentBit!5701 (_2!5588 lt!197646))) (bvadd (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126537 e!83407))

(declare-fun res!104854 () Bool)

(assert (=> b!126537 (=> (not res!104854) (not e!83407))))

(assert (=> b!126537 (= res!104854 (= (size!2591 (buf!2973 thiss!1614)) (size!2591 (buf!2973 (_2!5588 lt!197646)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4506 array!5725 (_ BitVec 32) (_ BitVec 32)) tuple2!10612)

(assert (=> b!126537 (= lt!197646 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126538 () Bool)

(declare-fun res!104855 () Bool)

(assert (=> b!126538 (=> (not res!104855) (not e!83411))))

(assert (=> b!126538 (= res!104855 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) noOfBytes!1))))

(declare-fun b!126539 () Bool)

(declare-fun arrayRangesEq!78 (array!5725 array!5725 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126539 (= e!83414 (not (arrayRangesEq!78 arr!227 (_2!5589 lt!197651) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!24974 res!104857) b!126538))

(assert (= (and b!126538 res!104855) b!126537))

(assert (= (and b!126537 res!104854) b!126533))

(assert (= (and b!126533 res!104860) b!126532))

(assert (= (and b!126532 res!104858) b!126534))

(assert (= (and b!126534 (not res!104853)) b!126539))

(assert (= (and b!126537 (not res!104856)) b!126536))

(assert (= (and b!126536 (not res!104859)) b!126535))

(assert (= start!24974 b!126531))

(declare-fun m!192035 () Bool)

(assert (=> b!126532 m!192035))

(declare-fun m!192037 () Bool)

(assert (=> b!126537 m!192037))

(declare-fun m!192039 () Bool)

(assert (=> b!126537 m!192039))

(declare-fun m!192041 () Bool)

(assert (=> b!126537 m!192041))

(declare-fun m!192043 () Bool)

(assert (=> b!126535 m!192043))

(declare-fun m!192045 () Bool)

(assert (=> b!126535 m!192045))

(declare-fun m!192047 () Bool)

(assert (=> b!126535 m!192047))

(declare-fun m!192049 () Bool)

(assert (=> b!126535 m!192049))

(assert (=> b!126533 m!192037))

(assert (=> b!126533 m!192039))

(declare-fun m!192051 () Bool)

(assert (=> start!24974 m!192051))

(declare-fun m!192053 () Bool)

(assert (=> start!24974 m!192053))

(declare-fun m!192055 () Bool)

(assert (=> b!126534 m!192055))

(declare-fun m!192057 () Bool)

(assert (=> b!126534 m!192057))

(declare-fun m!192059 () Bool)

(assert (=> b!126534 m!192059))

(assert (=> b!126534 m!192049))

(declare-fun m!192061 () Bool)

(assert (=> b!126531 m!192061))

(declare-fun m!192063 () Bool)

(assert (=> b!126539 m!192063))

(declare-fun m!192065 () Bool)

(assert (=> b!126538 m!192065))

(assert (=> b!126536 m!192035))

(check-sat (not b!126539) (not b!126537) (not b!126534) (not b!126533) (not b!126538) (not b!126531) (not start!24974) (not b!126536) (not b!126532) (not b!126535))
(check-sat)
(get-model)

(declare-fun d!41044 () Bool)

(declare-fun res!104909 () Bool)

(declare-fun e!83454 () Bool)

(assert (=> d!41044 (=> (not res!104909) (not e!83454))))

(assert (=> d!41044 (= res!104909 (= (size!2591 (buf!2973 thiss!1614)) (size!2591 (buf!2973 (_2!5588 lt!197646)))))))

(assert (=> d!41044 (= (isPrefixOf!0 thiss!1614 (_2!5588 lt!197646)) e!83454)))

(declare-fun b!126590 () Bool)

(declare-fun res!104908 () Bool)

(assert (=> b!126590 (=> (not res!104908) (not e!83454))))

(assert (=> b!126590 (= res!104908 (bvsle (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)) (bitIndex!0 (size!2591 (buf!2973 (_2!5588 lt!197646))) (currentByte!5706 (_2!5588 lt!197646)) (currentBit!5701 (_2!5588 lt!197646)))))))

(declare-fun b!126591 () Bool)

(declare-fun e!83453 () Bool)

(assert (=> b!126591 (= e!83454 e!83453)))

(declare-fun res!104910 () Bool)

(assert (=> b!126591 (=> res!104910 e!83453)))

(assert (=> b!126591 (= res!104910 (= (size!2591 (buf!2973 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!126592 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5725 array!5725 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126592 (= e!83453 (arrayBitRangesEq!0 (buf!2973 thiss!1614) (buf!2973 (_2!5588 lt!197646)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614))))))

(assert (= (and d!41044 res!104909) b!126590))

(assert (= (and b!126590 res!104908) b!126591))

(assert (= (and b!126591 (not res!104910)) b!126592))

(assert (=> b!126590 m!192039))

(assert (=> b!126590 m!192037))

(assert (=> b!126592 m!192039))

(assert (=> b!126592 m!192039))

(declare-fun m!192115 () Bool)

(assert (=> b!126592 m!192115))

(assert (=> b!126536 d!41044))

(declare-fun d!41050 () Bool)

(assert (=> d!41050 (= (array_inv!2380 (buf!2973 thiss!1614)) (bvsge (size!2591 (buf!2973 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!126531 d!41050))

(declare-fun d!41054 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41054 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2591 (buf!2973 (_1!5590 lt!197645)))) ((_ sign_extend 32) (currentByte!5706 (_1!5590 lt!197645))) ((_ sign_extend 32) (currentBit!5701 (_1!5590 lt!197645))) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2591 (buf!2973 (_1!5590 lt!197645)))) ((_ sign_extend 32) (currentByte!5706 (_1!5590 lt!197645))) ((_ sign_extend 32) (currentBit!5701 (_1!5590 lt!197645)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9950 () Bool)

(assert (= bs!9950 d!41054))

(declare-fun m!192121 () Bool)

(assert (=> bs!9950 m!192121))

(assert (=> b!126535 d!41054))

(declare-fun d!41058 () Bool)

(assert (=> d!41058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) ((_ sign_extend 32) noOfBytes!1)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614))) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun bs!9952 () Bool)

(assert (= bs!9952 d!41058))

(declare-fun m!192125 () Bool)

(assert (=> bs!9952 m!192125))

(assert (=> b!126535 d!41058))

(declare-fun d!41062 () Bool)

(assert (=> d!41062 (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197768 () Unit!7785)

(declare-fun choose!9 (BitStream!4506 array!5725 (_ BitVec 64) BitStream!4506) Unit!7785)

(assert (=> d!41062 (= lt!197768 (choose!9 thiss!1614 (buf!2973 (_2!5588 lt!197646)) ((_ sign_extend 32) noOfBytes!1) (BitStream!4507 (buf!2973 (_2!5588 lt!197646)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614))))))

(assert (=> d!41062 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2973 (_2!5588 lt!197646)) ((_ sign_extend 32) noOfBytes!1)) lt!197768)))

(declare-fun bs!9953 () Bool)

(assert (= bs!9953 d!41062))

(assert (=> bs!9953 m!192045))

(declare-fun m!192157 () Bool)

(assert (=> bs!9953 m!192157))

(assert (=> b!126535 d!41062))

(declare-fun b!126650 () Bool)

(declare-fun res!104952 () Bool)

(declare-fun e!83481 () Bool)

(assert (=> b!126650 (=> (not res!104952) (not e!83481))))

(declare-fun lt!197908 () tuple2!10616)

(assert (=> b!126650 (= res!104952 (isPrefixOf!0 (_2!5590 lt!197908) (_2!5588 lt!197646)))))

(declare-fun b!126651 () Bool)

(declare-fun lt!197899 () (_ BitVec 64))

(declare-fun lt!197905 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4506 (_ BitVec 64)) BitStream!4506)

(assert (=> b!126651 (= e!83481 (= (_1!5590 lt!197908) (withMovedBitIndex!0 (_2!5590 lt!197908) (bvsub lt!197905 lt!197899))))))

(assert (=> b!126651 (or (= (bvand lt!197905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197899 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197905 lt!197899) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126651 (= lt!197899 (bitIndex!0 (size!2591 (buf!2973 (_2!5588 lt!197646))) (currentByte!5706 (_2!5588 lt!197646)) (currentBit!5701 (_2!5588 lt!197646))))))

(assert (=> b!126651 (= lt!197905 (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)))))

(declare-fun b!126652 () Bool)

(declare-fun res!104953 () Bool)

(assert (=> b!126652 (=> (not res!104953) (not e!83481))))

(assert (=> b!126652 (= res!104953 (isPrefixOf!0 (_1!5590 lt!197908) thiss!1614))))

(declare-fun d!41066 () Bool)

(assert (=> d!41066 e!83481))

(declare-fun res!104954 () Bool)

(assert (=> d!41066 (=> (not res!104954) (not e!83481))))

(assert (=> d!41066 (= res!104954 (isPrefixOf!0 (_1!5590 lt!197908) (_2!5590 lt!197908)))))

(declare-fun lt!197907 () BitStream!4506)

(assert (=> d!41066 (= lt!197908 (tuple2!10617 lt!197907 (_2!5588 lt!197646)))))

(declare-fun lt!197901 () Unit!7785)

(declare-fun lt!197909 () Unit!7785)

(assert (=> d!41066 (= lt!197901 lt!197909)))

(assert (=> d!41066 (isPrefixOf!0 lt!197907 (_2!5588 lt!197646))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4506 BitStream!4506 BitStream!4506) Unit!7785)

(assert (=> d!41066 (= lt!197909 (lemmaIsPrefixTransitive!0 lt!197907 (_2!5588 lt!197646) (_2!5588 lt!197646)))))

(declare-fun lt!197898 () Unit!7785)

(declare-fun lt!197900 () Unit!7785)

(assert (=> d!41066 (= lt!197898 lt!197900)))

(assert (=> d!41066 (isPrefixOf!0 lt!197907 (_2!5588 lt!197646))))

(assert (=> d!41066 (= lt!197900 (lemmaIsPrefixTransitive!0 lt!197907 thiss!1614 (_2!5588 lt!197646)))))

(declare-fun lt!197911 () Unit!7785)

(declare-fun e!83482 () Unit!7785)

(assert (=> d!41066 (= lt!197911 e!83482)))

(declare-fun c!7494 () Bool)

(assert (=> d!41066 (= c!7494 (not (= (size!2591 (buf!2973 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!197894 () Unit!7785)

(declare-fun lt!197895 () Unit!7785)

(assert (=> d!41066 (= lt!197894 lt!197895)))

(assert (=> d!41066 (isPrefixOf!0 (_2!5588 lt!197646) (_2!5588 lt!197646))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4506) Unit!7785)

(assert (=> d!41066 (= lt!197895 (lemmaIsPrefixRefl!0 (_2!5588 lt!197646)))))

(declare-fun lt!197906 () Unit!7785)

(declare-fun lt!197893 () Unit!7785)

(assert (=> d!41066 (= lt!197906 lt!197893)))

(assert (=> d!41066 (= lt!197893 (lemmaIsPrefixRefl!0 (_2!5588 lt!197646)))))

(declare-fun lt!197904 () Unit!7785)

(declare-fun lt!197903 () Unit!7785)

(assert (=> d!41066 (= lt!197904 lt!197903)))

(assert (=> d!41066 (isPrefixOf!0 lt!197907 lt!197907)))

(assert (=> d!41066 (= lt!197903 (lemmaIsPrefixRefl!0 lt!197907))))

(declare-fun lt!197896 () Unit!7785)

(declare-fun lt!197912 () Unit!7785)

(assert (=> d!41066 (= lt!197896 lt!197912)))

(assert (=> d!41066 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41066 (= lt!197912 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41066 (= lt!197907 (BitStream!4507 (buf!2973 (_2!5588 lt!197646)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)))))

(assert (=> d!41066 (isPrefixOf!0 thiss!1614 (_2!5588 lt!197646))))

(assert (=> d!41066 (= (reader!0 thiss!1614 (_2!5588 lt!197646)) lt!197908)))

(declare-fun b!126653 () Bool)

(declare-fun lt!197910 () Unit!7785)

(assert (=> b!126653 (= e!83482 lt!197910)))

(declare-fun lt!197897 () (_ BitVec 64))

(assert (=> b!126653 (= lt!197897 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!197902 () (_ BitVec 64))

(assert (=> b!126653 (= lt!197902 (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5725 array!5725 (_ BitVec 64) (_ BitVec 64)) Unit!7785)

(assert (=> b!126653 (= lt!197910 (arrayBitRangesEqSymmetric!0 (buf!2973 thiss!1614) (buf!2973 (_2!5588 lt!197646)) lt!197897 lt!197902))))

(assert (=> b!126653 (arrayBitRangesEq!0 (buf!2973 (_2!5588 lt!197646)) (buf!2973 thiss!1614) lt!197897 lt!197902)))

(declare-fun b!126654 () Bool)

(declare-fun Unit!7791 () Unit!7785)

(assert (=> b!126654 (= e!83482 Unit!7791)))

(assert (= (and d!41066 c!7494) b!126653))

(assert (= (and d!41066 (not c!7494)) b!126654))

(assert (= (and d!41066 res!104954) b!126652))

(assert (= (and b!126652 res!104953) b!126650))

(assert (= (and b!126650 res!104952) b!126651))

(declare-fun m!192199 () Bool)

(assert (=> b!126652 m!192199))

(declare-fun m!192201 () Bool)

(assert (=> d!41066 m!192201))

(declare-fun m!192203 () Bool)

(assert (=> d!41066 m!192203))

(declare-fun m!192205 () Bool)

(assert (=> d!41066 m!192205))

(declare-fun m!192207 () Bool)

(assert (=> d!41066 m!192207))

(declare-fun m!192209 () Bool)

(assert (=> d!41066 m!192209))

(declare-fun m!192211 () Bool)

(assert (=> d!41066 m!192211))

(declare-fun m!192213 () Bool)

(assert (=> d!41066 m!192213))

(assert (=> d!41066 m!192035))

(declare-fun m!192215 () Bool)

(assert (=> d!41066 m!192215))

(declare-fun m!192217 () Bool)

(assert (=> d!41066 m!192217))

(declare-fun m!192219 () Bool)

(assert (=> d!41066 m!192219))

(declare-fun m!192221 () Bool)

(assert (=> b!126650 m!192221))

(declare-fun m!192223 () Bool)

(assert (=> b!126651 m!192223))

(assert (=> b!126651 m!192037))

(assert (=> b!126651 m!192039))

(assert (=> b!126653 m!192039))

(declare-fun m!192225 () Bool)

(assert (=> b!126653 m!192225))

(declare-fun m!192227 () Bool)

(assert (=> b!126653 m!192227))

(assert (=> b!126535 d!41066))

(declare-fun d!41084 () Bool)

(declare-fun e!83485 () Bool)

(assert (=> d!41084 e!83485))

(declare-fun res!104960 () Bool)

(assert (=> d!41084 (=> (not res!104960) (not e!83485))))

(declare-fun lt!197929 () (_ BitVec 64))

(declare-fun lt!197930 () (_ BitVec 64))

(declare-fun lt!197926 () (_ BitVec 64))

(assert (=> d!41084 (= res!104960 (= lt!197930 (bvsub lt!197929 lt!197926)))))

(assert (=> d!41084 (or (= (bvand lt!197929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197929 lt!197926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41084 (= lt!197926 (remainingBits!0 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 (_2!5588 lt!197646))) ((_ sign_extend 32) (currentBit!5701 (_2!5588 lt!197646)))))))

(declare-fun lt!197927 () (_ BitVec 64))

(declare-fun lt!197928 () (_ BitVec 64))

(assert (=> d!41084 (= lt!197929 (bvmul lt!197927 lt!197928))))

(assert (=> d!41084 (or (= lt!197927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197928 (bvsdiv (bvmul lt!197927 lt!197928) lt!197927)))))

(assert (=> d!41084 (= lt!197928 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41084 (= lt!197927 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))))))

(assert (=> d!41084 (= lt!197930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5706 (_2!5588 lt!197646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5701 (_2!5588 lt!197646)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41084 (invariant!0 (currentBit!5701 (_2!5588 lt!197646)) (currentByte!5706 (_2!5588 lt!197646)) (size!2591 (buf!2973 (_2!5588 lt!197646))))))

(assert (=> d!41084 (= (bitIndex!0 (size!2591 (buf!2973 (_2!5588 lt!197646))) (currentByte!5706 (_2!5588 lt!197646)) (currentBit!5701 (_2!5588 lt!197646))) lt!197930)))

(declare-fun b!126659 () Bool)

(declare-fun res!104959 () Bool)

(assert (=> b!126659 (=> (not res!104959) (not e!83485))))

(assert (=> b!126659 (= res!104959 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197930))))

(declare-fun b!126660 () Bool)

(declare-fun lt!197925 () (_ BitVec 64))

(assert (=> b!126660 (= e!83485 (bvsle lt!197930 (bvmul lt!197925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126660 (or (= lt!197925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197925)))))

(assert (=> b!126660 (= lt!197925 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))))))

(assert (= (and d!41084 res!104960) b!126659))

(assert (= (and b!126659 res!104959) b!126660))

(declare-fun m!192229 () Bool)

(assert (=> d!41084 m!192229))

(declare-fun m!192231 () Bool)

(assert (=> d!41084 m!192231))

(assert (=> b!126533 d!41084))

(declare-fun d!41086 () Bool)

(declare-fun e!83486 () Bool)

(assert (=> d!41086 e!83486))

(declare-fun res!104962 () Bool)

(assert (=> d!41086 (=> (not res!104962) (not e!83486))))

(declare-fun lt!197935 () (_ BitVec 64))

(declare-fun lt!197932 () (_ BitVec 64))

(declare-fun lt!197936 () (_ BitVec 64))

(assert (=> d!41086 (= res!104962 (= lt!197936 (bvsub lt!197935 lt!197932)))))

(assert (=> d!41086 (or (= (bvand lt!197935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197935 lt!197932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41086 (= lt!197932 (remainingBits!0 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614))))))

(declare-fun lt!197933 () (_ BitVec 64))

(declare-fun lt!197934 () (_ BitVec 64))

(assert (=> d!41086 (= lt!197935 (bvmul lt!197933 lt!197934))))

(assert (=> d!41086 (or (= lt!197933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197934 (bvsdiv (bvmul lt!197933 lt!197934) lt!197933)))))

(assert (=> d!41086 (= lt!197934 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41086 (= lt!197933 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))))))

(assert (=> d!41086 (= lt!197936 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5706 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5701 thiss!1614))))))

(assert (=> d!41086 (invariant!0 (currentBit!5701 thiss!1614) (currentByte!5706 thiss!1614) (size!2591 (buf!2973 thiss!1614)))))

(assert (=> d!41086 (= (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)) lt!197936)))

(declare-fun b!126661 () Bool)

(declare-fun res!104961 () Bool)

(assert (=> b!126661 (=> (not res!104961) (not e!83486))))

(assert (=> b!126661 (= res!104961 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197936))))

(declare-fun b!126662 () Bool)

(declare-fun lt!197931 () (_ BitVec 64))

(assert (=> b!126662 (= e!83486 (bvsle lt!197936 (bvmul lt!197931 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126662 (or (= lt!197931 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197931 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197931)))))

(assert (=> b!126662 (= lt!197931 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))))))

(assert (= (and d!41086 res!104962) b!126661))

(assert (= (and b!126661 res!104961) b!126662))

(declare-fun m!192233 () Bool)

(assert (=> d!41086 m!192233))

(declare-fun m!192235 () Bool)

(assert (=> d!41086 m!192235))

(assert (=> b!126533 d!41086))

(declare-fun d!41088 () Bool)

(declare-fun res!104967 () Bool)

(declare-fun e!83491 () Bool)

(assert (=> d!41088 (=> res!104967 e!83491)))

(assert (=> d!41088 (= res!104967 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41088 (= (arrayRangesEq!78 arr!227 (_2!5589 lt!197651) #b00000000000000000000000000000000 noOfBytes!1) e!83491)))

(declare-fun b!126667 () Bool)

(declare-fun e!83492 () Bool)

(assert (=> b!126667 (= e!83491 e!83492)))

(declare-fun res!104968 () Bool)

(assert (=> b!126667 (=> (not res!104968) (not e!83492))))

(assert (=> b!126667 (= res!104968 (= (select (arr!3196 arr!227) #b00000000000000000000000000000000) (select (arr!3196 (_2!5589 lt!197651)) #b00000000000000000000000000000000)))))

(declare-fun b!126668 () Bool)

(assert (=> b!126668 (= e!83492 (arrayRangesEq!78 arr!227 (_2!5589 lt!197651) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41088 (not res!104967)) b!126667))

(assert (= (and b!126667 res!104968) b!126668))

(declare-fun m!192237 () Bool)

(assert (=> b!126667 m!192237))

(declare-fun m!192239 () Bool)

(assert (=> b!126667 m!192239))

(declare-fun m!192241 () Bool)

(assert (=> b!126668 m!192241))

(assert (=> b!126539 d!41088))

(declare-fun d!41090 () Bool)

(assert (=> d!41090 (= (array_inv!2380 arr!227) (bvsge (size!2591 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24974 d!41090))

(declare-fun d!41092 () Bool)

(assert (=> d!41092 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5701 thiss!1614) (currentByte!5706 thiss!1614) (size!2591 (buf!2973 thiss!1614))))))

(declare-fun bs!9956 () Bool)

(assert (= bs!9956 d!41092))

(assert (=> bs!9956 m!192235))

(assert (=> start!24974 d!41092))

(declare-fun d!41094 () Bool)

(declare-datatypes ((tuple3!458 0))(
  ( (tuple3!459 (_1!5596 Unit!7785) (_2!5596 BitStream!4506) (_3!284 array!5725)) )
))
(declare-fun lt!197939 () tuple3!458)

(declare-fun readByteArrayLoop!0 (BitStream!4506 array!5725 (_ BitVec 32) (_ BitVec 32)) tuple3!458)

(assert (=> d!41094 (= lt!197939 (readByteArrayLoop!0 (_1!5590 lt!197647) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41094 (= (readByteArrayLoopPure!0 (_1!5590 lt!197647) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10615 (_2!5596 lt!197939) (_3!284 lt!197939)))))

(declare-fun bs!9957 () Bool)

(assert (= bs!9957 d!41094))

(declare-fun m!192243 () Bool)

(assert (=> bs!9957 m!192243))

(assert (=> b!126534 d!41094))

(declare-fun d!41096 () Bool)

(assert (=> d!41096 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) lt!197650) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614))) lt!197650))))

(declare-fun bs!9958 () Bool)

(assert (= bs!9958 d!41096))

(assert (=> bs!9958 m!192125))

(assert (=> b!126534 d!41096))

(declare-fun d!41098 () Bool)

(assert (=> d!41098 (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!197646)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) lt!197650)))

(declare-fun lt!197940 () Unit!7785)

(assert (=> d!41098 (= lt!197940 (choose!9 thiss!1614 (buf!2973 (_2!5588 lt!197646)) lt!197650 (BitStream!4507 (buf!2973 (_2!5588 lt!197646)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614))))))

(assert (=> d!41098 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2973 (_2!5588 lt!197646)) lt!197650) lt!197940)))

(declare-fun bs!9959 () Bool)

(assert (= bs!9959 d!41098))

(assert (=> bs!9959 m!192057))

(declare-fun m!192245 () Bool)

(assert (=> bs!9959 m!192245))

(assert (=> b!126534 d!41098))

(assert (=> b!126534 d!41066))

(assert (=> b!126537 d!41084))

(assert (=> b!126537 d!41086))

(declare-fun b!126721 () Bool)

(declare-fun res!105023 () Bool)

(declare-fun e!83531 () Bool)

(assert (=> b!126721 (=> (not res!105023) (not e!83531))))

(declare-fun lt!198023 () (_ BitVec 64))

(declare-fun lt!198021 () tuple2!10612)

(declare-fun lt!198018 () (_ BitVec 64))

(assert (=> b!126721 (= res!105023 (= (bitIndex!0 (size!2591 (buf!2973 (_2!5588 lt!198021))) (currentByte!5706 (_2!5588 lt!198021)) (currentBit!5701 (_2!5588 lt!198021))) (bvadd lt!198023 lt!198018)))))

(assert (=> b!126721 (or (not (= (bvand lt!198023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198018 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!198023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!198023 lt!198018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!198019 () (_ BitVec 64))

(assert (=> b!126721 (= lt!198018 (bvmul lt!198019 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!126721 (or (= lt!198019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198019)))))

(assert (=> b!126721 (= lt!198019 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126721 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126721 (= lt!198023 (bitIndex!0 (size!2591 (buf!2973 thiss!1614)) (currentByte!5706 thiss!1614) (currentBit!5701 thiss!1614)))))

(declare-fun d!41100 () Bool)

(assert (=> d!41100 e!83531))

(declare-fun res!105024 () Bool)

(assert (=> d!41100 (=> (not res!105024) (not e!83531))))

(assert (=> d!41100 (= res!105024 (= (size!2591 (buf!2973 thiss!1614)) (size!2591 (buf!2973 (_2!5588 lt!198021)))))))

(declare-fun choose!64 (BitStream!4506 array!5725 (_ BitVec 32) (_ BitVec 32)) tuple2!10612)

(assert (=> d!41100 (= lt!198021 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41100 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2591 arr!227)))))

(assert (=> d!41100 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!198021)))

(declare-fun b!126722 () Bool)

(declare-fun e!83529 () Bool)

(assert (=> b!126722 (= e!83531 e!83529)))

(declare-fun res!105022 () Bool)

(assert (=> b!126722 (=> (not res!105022) (not e!83529))))

(declare-fun lt!198020 () tuple2!10616)

(declare-fun lt!198024 () tuple2!10614)

(assert (=> b!126722 (= res!105022 (and (= (size!2591 (_2!5589 lt!198024)) (size!2591 arr!227)) (= (_1!5589 lt!198024) (_2!5590 lt!198020))))))

(assert (=> b!126722 (= lt!198024 (readByteArrayLoopPure!0 (_1!5590 lt!198020) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198022 () Unit!7785)

(declare-fun lt!198026 () Unit!7785)

(assert (=> b!126722 (= lt!198022 lt!198026)))

(declare-fun lt!198025 () (_ BitVec 64))

(assert (=> b!126722 (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 (_2!5588 lt!198021)))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) lt!198025)))

(assert (=> b!126722 (= lt!198026 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2973 (_2!5588 lt!198021)) lt!198025))))

(declare-fun e!83530 () Bool)

(assert (=> b!126722 e!83530))

(declare-fun res!105025 () Bool)

(assert (=> b!126722 (=> (not res!105025) (not e!83530))))

(assert (=> b!126722 (= res!105025 (and (= (size!2591 (buf!2973 thiss!1614)) (size!2591 (buf!2973 (_2!5588 lt!198021)))) (bvsge lt!198025 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126722 (= lt!198025 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126722 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126722 (= lt!198020 (reader!0 thiss!1614 (_2!5588 lt!198021)))))

(declare-fun b!126723 () Bool)

(declare-fun res!105021 () Bool)

(assert (=> b!126723 (=> (not res!105021) (not e!83531))))

(assert (=> b!126723 (= res!105021 (isPrefixOf!0 thiss!1614 (_2!5588 lt!198021)))))

(declare-fun b!126724 () Bool)

(assert (=> b!126724 (= e!83529 (arrayRangesEq!78 arr!227 (_2!5589 lt!198024) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126725 () Bool)

(assert (=> b!126725 (= e!83530 (validate_offset_bits!1 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) lt!198025))))

(assert (= (and d!41100 res!105024) b!126721))

(assert (= (and b!126721 res!105023) b!126723))

(assert (= (and b!126723 res!105021) b!126722))

(assert (= (and b!126722 res!105025) b!126725))

(assert (= (and b!126722 res!105022) b!126724))

(declare-fun m!192303 () Bool)

(assert (=> b!126724 m!192303))

(declare-fun m!192305 () Bool)

(assert (=> b!126725 m!192305))

(declare-fun m!192307 () Bool)

(assert (=> b!126723 m!192307))

(declare-fun m!192309 () Bool)

(assert (=> b!126721 m!192309))

(assert (=> b!126721 m!192039))

(declare-fun m!192311 () Bool)

(assert (=> b!126722 m!192311))

(declare-fun m!192313 () Bool)

(assert (=> b!126722 m!192313))

(declare-fun m!192315 () Bool)

(assert (=> b!126722 m!192315))

(declare-fun m!192317 () Bool)

(assert (=> b!126722 m!192317))

(declare-fun m!192319 () Bool)

(assert (=> d!41100 m!192319))

(assert (=> b!126537 d!41100))

(assert (=> b!126532 d!41044))

(declare-fun d!41124 () Bool)

(assert (=> d!41124 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2591 (buf!2973 thiss!1614))) ((_ sign_extend 32) (currentByte!5706 thiss!1614)) ((_ sign_extend 32) (currentBit!5701 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9967 () Bool)

(assert (= bs!9967 d!41124))

(assert (=> bs!9967 m!192233))

(assert (=> b!126538 d!41124))

(check-sat (not d!41098) (not b!126721) (not b!126723) (not d!41054) (not d!41100) (not b!126652) (not b!126651) (not d!41066) (not d!41086) (not d!41096) (not d!41124) (not b!126650) (not d!41092) (not b!126724) (not b!126668) (not d!41062) (not b!126725) (not b!126653) (not b!126590) (not d!41058) (not d!41094) (not b!126722) (not b!126592) (not d!41084))
(check-sat)
