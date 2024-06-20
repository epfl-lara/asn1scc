; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24866 () Bool)

(assert start!24866)

(declare-fun res!104297 () Bool)

(declare-fun e!82891 () Bool)

(assert (=> start!24866 (=> (not res!104297) (not e!82891))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5686 0))(
  ( (array!5687 (arr!3172 (Array (_ BitVec 32) (_ BitVec 8))) (size!2573 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5686)

(assert (=> start!24866 (= res!104297 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2573 arr!227))))))

(assert (=> start!24866 e!82891))

(assert (=> start!24866 true))

(declare-fun array_inv!2362 (array!5686) Bool)

(assert (=> start!24866 (array_inv!2362 arr!227)))

(declare-datatypes ((BitStream!4470 0))(
  ( (BitStream!4471 (buf!2952 array!5686) (currentByte!5676 (_ BitVec 32)) (currentBit!5671 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4470)

(declare-fun e!82889 () Bool)

(declare-fun inv!12 (BitStream!4470) Bool)

(assert (=> start!24866 (and (inv!12 thiss!1614) e!82889)))

(declare-fun b!125903 () Bool)

(declare-fun e!82890 () Bool)

(declare-fun e!82887 () Bool)

(assert (=> b!125903 (= e!82890 (not e!82887))))

(declare-fun res!104298 () Bool)

(assert (=> b!125903 (=> res!104298 e!82887)))

(declare-datatypes ((tuple2!10504 0))(
  ( (tuple2!10505 (_1!5531 BitStream!4470) (_2!5531 array!5686)) )
))
(declare-fun lt!196960 () tuple2!10504)

(declare-datatypes ((tuple2!10506 0))(
  ( (tuple2!10507 (_1!5532 BitStream!4470) (_2!5532 BitStream!4470)) )
))
(declare-fun lt!196962 () tuple2!10506)

(assert (=> b!125903 (= res!104298 (or (not (= (size!2573 (_2!5531 lt!196960)) (size!2573 arr!227))) (not (= (_1!5531 lt!196960) (_2!5532 lt!196962)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4470 array!5686 (_ BitVec 32) (_ BitVec 32)) tuple2!10504)

(assert (=> b!125903 (= lt!196960 (readByteArrayLoopPure!0 (_1!5532 lt!196962) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7746 0))(
  ( (Unit!7747) )
))
(declare-datatypes ((tuple2!10508 0))(
  ( (tuple2!10509 (_1!5533 Unit!7746) (_2!5533 BitStream!4470)) )
))
(declare-fun lt!196964 () tuple2!10508)

(declare-fun lt!196963 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125903 (validate_offset_bits!1 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) lt!196963)))

(declare-fun lt!196961 () Unit!7746)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4470 array!5686 (_ BitVec 64)) Unit!7746)

(assert (=> b!125903 (= lt!196961 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2952 (_2!5533 lt!196964)) lt!196963))))

(declare-fun reader!0 (BitStream!4470 BitStream!4470) tuple2!10506)

(assert (=> b!125903 (= lt!196962 (reader!0 thiss!1614 (_2!5533 lt!196964)))))

(declare-fun b!125904 () Bool)

(declare-fun res!104300 () Bool)

(assert (=> b!125904 (=> (not res!104300) (not e!82891))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!125904 (= res!104300 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) noOfBytes!1))))

(declare-fun b!125905 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125905 (= e!82891 (not (invariant!0 (currentBit!5671 thiss!1614) (currentByte!5676 thiss!1614) (size!2573 (buf!2952 thiss!1614)))))))

(declare-fun e!82892 () Bool)

(assert (=> b!125905 e!82892))

(declare-fun res!104301 () Bool)

(assert (=> b!125905 (=> (not res!104301) (not e!82892))))

(assert (=> b!125905 (= res!104301 (= (size!2573 (buf!2952 thiss!1614)) (size!2573 (buf!2952 (_2!5533 lt!196964)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4470 array!5686 (_ BitVec 32) (_ BitVec 32)) tuple2!10508)

(assert (=> b!125905 (= lt!196964 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!125906 () Bool)

(declare-fun arrayRangesEq!60 (array!5686 array!5686 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125906 (= e!82887 (not (arrayRangesEq!60 arr!227 (_2!5531 lt!196960) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!125907 () Bool)

(declare-fun res!104299 () Bool)

(assert (=> b!125907 (=> (not res!104299) (not e!82890))))

(declare-fun isPrefixOf!0 (BitStream!4470 BitStream!4470) Bool)

(assert (=> b!125907 (= res!104299 (isPrefixOf!0 thiss!1614 (_2!5533 lt!196964)))))

(declare-fun b!125908 () Bool)

(assert (=> b!125908 (= e!82889 (array_inv!2362 (buf!2952 thiss!1614)))))

(declare-fun b!125909 () Bool)

(assert (=> b!125909 (= e!82892 e!82890)))

(declare-fun res!104302 () Bool)

(assert (=> b!125909 (=> (not res!104302) (not e!82890))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!125909 (= res!104302 (= (bitIndex!0 (size!2573 (buf!2952 (_2!5533 lt!196964))) (currentByte!5676 (_2!5533 lt!196964)) (currentBit!5671 (_2!5533 lt!196964))) (bvadd (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!196963))))))

(assert (=> b!125909 (= lt!196963 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!24866 res!104297) b!125904))

(assert (= (and b!125904 res!104300) b!125905))

(assert (= (and b!125905 res!104301) b!125909))

(assert (= (and b!125909 res!104302) b!125907))

(assert (= (and b!125907 res!104299) b!125903))

(assert (= (and b!125903 (not res!104298)) b!125906))

(assert (= start!24866 b!125908))

(declare-fun m!191341 () Bool)

(assert (=> b!125906 m!191341))

(declare-fun m!191343 () Bool)

(assert (=> b!125905 m!191343))

(declare-fun m!191345 () Bool)

(assert (=> b!125905 m!191345))

(declare-fun m!191347 () Bool)

(assert (=> b!125907 m!191347))

(declare-fun m!191349 () Bool)

(assert (=> b!125904 m!191349))

(declare-fun m!191351 () Bool)

(assert (=> b!125903 m!191351))

(declare-fun m!191353 () Bool)

(assert (=> b!125903 m!191353))

(declare-fun m!191355 () Bool)

(assert (=> b!125903 m!191355))

(declare-fun m!191357 () Bool)

(assert (=> b!125903 m!191357))

(declare-fun m!191359 () Bool)

(assert (=> b!125909 m!191359))

(declare-fun m!191361 () Bool)

(assert (=> b!125909 m!191361))

(declare-fun m!191363 () Bool)

(assert (=> start!24866 m!191363))

(declare-fun m!191365 () Bool)

(assert (=> start!24866 m!191365))

(declare-fun m!191367 () Bool)

(assert (=> b!125908 m!191367))

(check-sat (not b!125905) (not start!24866) (not b!125906) (not b!125909) (not b!125907) (not b!125903) (not b!125904) (not b!125908))
(check-sat)
(get-model)

(declare-fun d!40950 () Bool)

(declare-fun res!104342 () Bool)

(declare-fun e!82930 () Bool)

(assert (=> d!40950 (=> (not res!104342) (not e!82930))))

(assert (=> d!40950 (= res!104342 (= (size!2573 (buf!2952 thiss!1614)) (size!2573 (buf!2952 (_2!5533 lt!196964)))))))

(assert (=> d!40950 (= (isPrefixOf!0 thiss!1614 (_2!5533 lt!196964)) e!82930)))

(declare-fun b!125952 () Bool)

(declare-fun res!104344 () Bool)

(assert (=> b!125952 (=> (not res!104344) (not e!82930))))

(assert (=> b!125952 (= res!104344 (bvsle (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)) (bitIndex!0 (size!2573 (buf!2952 (_2!5533 lt!196964))) (currentByte!5676 (_2!5533 lt!196964)) (currentBit!5671 (_2!5533 lt!196964)))))))

(declare-fun b!125953 () Bool)

(declare-fun e!82931 () Bool)

(assert (=> b!125953 (= e!82930 e!82931)))

(declare-fun res!104343 () Bool)

(assert (=> b!125953 (=> res!104343 e!82931)))

(assert (=> b!125953 (= res!104343 (= (size!2573 (buf!2952 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!125954 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5686 array!5686 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125954 (= e!82931 (arrayBitRangesEq!0 (buf!2952 thiss!1614) (buf!2952 (_2!5533 lt!196964)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614))))))

(assert (= (and d!40950 res!104342) b!125952))

(assert (= (and b!125952 res!104344) b!125953))

(assert (= (and b!125953 (not res!104343)) b!125954))

(assert (=> b!125952 m!191361))

(assert (=> b!125952 m!191359))

(assert (=> b!125954 m!191361))

(assert (=> b!125954 m!191361))

(declare-fun m!191413 () Bool)

(assert (=> b!125954 m!191413))

(assert (=> b!125907 d!40950))

(declare-fun d!40958 () Bool)

(assert (=> d!40958 (= (array_inv!2362 (buf!2952 thiss!1614)) (bvsge (size!2573 (buf!2952 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125908 d!40958))

(declare-fun d!40960 () Bool)

(declare-datatypes ((tuple3!450 0))(
  ( (tuple3!451 (_1!5538 Unit!7746) (_2!5538 BitStream!4470) (_3!280 array!5686)) )
))
(declare-fun lt!196988 () tuple3!450)

(declare-fun readByteArrayLoop!0 (BitStream!4470 array!5686 (_ BitVec 32) (_ BitVec 32)) tuple3!450)

(assert (=> d!40960 (= lt!196988 (readByteArrayLoop!0 (_1!5532 lt!196962) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40960 (= (readByteArrayLoopPure!0 (_1!5532 lt!196962) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10505 (_2!5538 lt!196988) (_3!280 lt!196988)))))

(declare-fun bs!9916 () Bool)

(assert (= bs!9916 d!40960))

(declare-fun m!191415 () Bool)

(assert (=> bs!9916 m!191415))

(assert (=> b!125903 d!40960))

(declare-fun d!40962 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40962 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) lt!196963) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614))) lt!196963))))

(declare-fun bs!9917 () Bool)

(assert (= bs!9917 d!40962))

(declare-fun m!191417 () Bool)

(assert (=> bs!9917 m!191417))

(assert (=> b!125903 d!40962))

(declare-fun d!40964 () Bool)

(assert (=> d!40964 (validate_offset_bits!1 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) lt!196963)))

(declare-fun lt!196991 () Unit!7746)

(declare-fun choose!9 (BitStream!4470 array!5686 (_ BitVec 64) BitStream!4470) Unit!7746)

(assert (=> d!40964 (= lt!196991 (choose!9 thiss!1614 (buf!2952 (_2!5533 lt!196964)) lt!196963 (BitStream!4471 (buf!2952 (_2!5533 lt!196964)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614))))))

(assert (=> d!40964 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2952 (_2!5533 lt!196964)) lt!196963) lt!196991)))

(declare-fun bs!9918 () Bool)

(assert (= bs!9918 d!40964))

(assert (=> bs!9918 m!191353))

(declare-fun m!191419 () Bool)

(assert (=> bs!9918 m!191419))

(assert (=> b!125903 d!40964))

(declare-fun lt!197144 () (_ BitVec 64))

(declare-fun e!82962 () Bool)

(declare-fun lt!197154 () tuple2!10506)

(declare-fun lt!197151 () (_ BitVec 64))

(declare-fun b!126009 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4470 (_ BitVec 64)) BitStream!4470)

(assert (=> b!126009 (= e!82962 (= (_1!5532 lt!197154) (withMovedBitIndex!0 (_2!5532 lt!197154) (bvsub lt!197144 lt!197151))))))

(assert (=> b!126009 (or (= (bvand lt!197144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197151 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197144 lt!197151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126009 (= lt!197151 (bitIndex!0 (size!2573 (buf!2952 (_2!5533 lt!196964))) (currentByte!5676 (_2!5533 lt!196964)) (currentBit!5671 (_2!5533 lt!196964))))))

(assert (=> b!126009 (= lt!197144 (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)))))

(declare-fun b!126010 () Bool)

(declare-fun res!104390 () Bool)

(assert (=> b!126010 (=> (not res!104390) (not e!82962))))

(assert (=> b!126010 (= res!104390 (isPrefixOf!0 (_2!5532 lt!197154) (_2!5533 lt!196964)))))

(declare-fun b!126011 () Bool)

(declare-fun res!104389 () Bool)

(assert (=> b!126011 (=> (not res!104389) (not e!82962))))

(assert (=> b!126011 (= res!104389 (isPrefixOf!0 (_1!5532 lt!197154) thiss!1614))))

(declare-fun b!126013 () Bool)

(declare-fun e!82961 () Unit!7746)

(declare-fun Unit!7751 () Unit!7746)

(assert (=> b!126013 (= e!82961 Unit!7751)))

(declare-fun b!126012 () Bool)

(declare-fun lt!197157 () Unit!7746)

(assert (=> b!126012 (= e!82961 lt!197157)))

(declare-fun lt!197147 () (_ BitVec 64))

(assert (=> b!126012 (= lt!197147 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!197161 () (_ BitVec 64))

(assert (=> b!126012 (= lt!197161 (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5686 array!5686 (_ BitVec 64) (_ BitVec 64)) Unit!7746)

(assert (=> b!126012 (= lt!197157 (arrayBitRangesEqSymmetric!0 (buf!2952 thiss!1614) (buf!2952 (_2!5533 lt!196964)) lt!197147 lt!197161))))

(assert (=> b!126012 (arrayBitRangesEq!0 (buf!2952 (_2!5533 lt!196964)) (buf!2952 thiss!1614) lt!197147 lt!197161)))

(declare-fun d!40966 () Bool)

(assert (=> d!40966 e!82962))

(declare-fun res!104391 () Bool)

(assert (=> d!40966 (=> (not res!104391) (not e!82962))))

(assert (=> d!40966 (= res!104391 (isPrefixOf!0 (_1!5532 lt!197154) (_2!5532 lt!197154)))))

(declare-fun lt!197155 () BitStream!4470)

(assert (=> d!40966 (= lt!197154 (tuple2!10507 lt!197155 (_2!5533 lt!196964)))))

(declare-fun lt!197162 () Unit!7746)

(declare-fun lt!197152 () Unit!7746)

(assert (=> d!40966 (= lt!197162 lt!197152)))

(assert (=> d!40966 (isPrefixOf!0 lt!197155 (_2!5533 lt!196964))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4470 BitStream!4470 BitStream!4470) Unit!7746)

(assert (=> d!40966 (= lt!197152 (lemmaIsPrefixTransitive!0 lt!197155 (_2!5533 lt!196964) (_2!5533 lt!196964)))))

(declare-fun lt!197145 () Unit!7746)

(declare-fun lt!197160 () Unit!7746)

(assert (=> d!40966 (= lt!197145 lt!197160)))

(assert (=> d!40966 (isPrefixOf!0 lt!197155 (_2!5533 lt!196964))))

(assert (=> d!40966 (= lt!197160 (lemmaIsPrefixTransitive!0 lt!197155 thiss!1614 (_2!5533 lt!196964)))))

(declare-fun lt!197153 () Unit!7746)

(assert (=> d!40966 (= lt!197153 e!82961)))

(declare-fun c!7482 () Bool)

(assert (=> d!40966 (= c!7482 (not (= (size!2573 (buf!2952 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!197143 () Unit!7746)

(declare-fun lt!197150 () Unit!7746)

(assert (=> d!40966 (= lt!197143 lt!197150)))

(assert (=> d!40966 (isPrefixOf!0 (_2!5533 lt!196964) (_2!5533 lt!196964))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4470) Unit!7746)

(assert (=> d!40966 (= lt!197150 (lemmaIsPrefixRefl!0 (_2!5533 lt!196964)))))

(declare-fun lt!197158 () Unit!7746)

(declare-fun lt!197148 () Unit!7746)

(assert (=> d!40966 (= lt!197158 lt!197148)))

(assert (=> d!40966 (= lt!197148 (lemmaIsPrefixRefl!0 (_2!5533 lt!196964)))))

(declare-fun lt!197159 () Unit!7746)

(declare-fun lt!197156 () Unit!7746)

(assert (=> d!40966 (= lt!197159 lt!197156)))

(assert (=> d!40966 (isPrefixOf!0 lt!197155 lt!197155)))

(assert (=> d!40966 (= lt!197156 (lemmaIsPrefixRefl!0 lt!197155))))

(declare-fun lt!197146 () Unit!7746)

(declare-fun lt!197149 () Unit!7746)

(assert (=> d!40966 (= lt!197146 lt!197149)))

(assert (=> d!40966 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!40966 (= lt!197149 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!40966 (= lt!197155 (BitStream!4471 (buf!2952 (_2!5533 lt!196964)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)))))

(assert (=> d!40966 (isPrefixOf!0 thiss!1614 (_2!5533 lt!196964))))

(assert (=> d!40966 (= (reader!0 thiss!1614 (_2!5533 lt!196964)) lt!197154)))

(assert (= (and d!40966 c!7482) b!126012))

(assert (= (and d!40966 (not c!7482)) b!126013))

(assert (= (and d!40966 res!104391) b!126011))

(assert (= (and b!126011 res!104389) b!126010))

(assert (= (and b!126010 res!104390) b!126009))

(declare-fun m!191481 () Bool)

(assert (=> b!126010 m!191481))

(declare-fun m!191483 () Bool)

(assert (=> d!40966 m!191483))

(declare-fun m!191485 () Bool)

(assert (=> d!40966 m!191485))

(assert (=> d!40966 m!191347))

(declare-fun m!191487 () Bool)

(assert (=> d!40966 m!191487))

(declare-fun m!191489 () Bool)

(assert (=> d!40966 m!191489))

(declare-fun m!191491 () Bool)

(assert (=> d!40966 m!191491))

(declare-fun m!191493 () Bool)

(assert (=> d!40966 m!191493))

(declare-fun m!191495 () Bool)

(assert (=> d!40966 m!191495))

(declare-fun m!191497 () Bool)

(assert (=> d!40966 m!191497))

(declare-fun m!191499 () Bool)

(assert (=> d!40966 m!191499))

(declare-fun m!191501 () Bool)

(assert (=> d!40966 m!191501))

(assert (=> b!126012 m!191361))

(declare-fun m!191503 () Bool)

(assert (=> b!126012 m!191503))

(declare-fun m!191505 () Bool)

(assert (=> b!126012 m!191505))

(declare-fun m!191507 () Bool)

(assert (=> b!126009 m!191507))

(assert (=> b!126009 m!191359))

(assert (=> b!126009 m!191361))

(declare-fun m!191509 () Bool)

(assert (=> b!126011 m!191509))

(assert (=> b!125903 d!40966))

(declare-fun d!40984 () Bool)

(assert (=> d!40984 (= (array_inv!2362 arr!227) (bvsge (size!2573 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24866 d!40984))

(declare-fun d!40986 () Bool)

(assert (=> d!40986 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5671 thiss!1614) (currentByte!5676 thiss!1614) (size!2573 (buf!2952 thiss!1614))))))

(declare-fun bs!9920 () Bool)

(assert (= bs!9920 d!40986))

(assert (=> bs!9920 m!191343))

(assert (=> start!24866 d!40986))

(declare-fun d!40988 () Bool)

(declare-fun e!82975 () Bool)

(assert (=> d!40988 e!82975))

(declare-fun res!104414 () Bool)

(assert (=> d!40988 (=> (not res!104414) (not e!82975))))

(declare-fun lt!197203 () (_ BitVec 64))

(declare-fun lt!197202 () (_ BitVec 64))

(declare-fun lt!197204 () (_ BitVec 64))

(assert (=> d!40988 (= res!104414 (= lt!197204 (bvsub lt!197202 lt!197203)))))

(assert (=> d!40988 (or (= (bvand lt!197202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197202 lt!197203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40988 (= lt!197203 (remainingBits!0 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))) ((_ sign_extend 32) (currentByte!5676 (_2!5533 lt!196964))) ((_ sign_extend 32) (currentBit!5671 (_2!5533 lt!196964)))))))

(declare-fun lt!197201 () (_ BitVec 64))

(declare-fun lt!197199 () (_ BitVec 64))

(assert (=> d!40988 (= lt!197202 (bvmul lt!197201 lt!197199))))

(assert (=> d!40988 (or (= lt!197201 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197199 (bvsdiv (bvmul lt!197201 lt!197199) lt!197201)))))

(assert (=> d!40988 (= lt!197199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40988 (= lt!197201 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))))))

(assert (=> d!40988 (= lt!197204 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5676 (_2!5533 lt!196964))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5671 (_2!5533 lt!196964)))))))

(assert (=> d!40988 (invariant!0 (currentBit!5671 (_2!5533 lt!196964)) (currentByte!5676 (_2!5533 lt!196964)) (size!2573 (buf!2952 (_2!5533 lt!196964))))))

(assert (=> d!40988 (= (bitIndex!0 (size!2573 (buf!2952 (_2!5533 lt!196964))) (currentByte!5676 (_2!5533 lt!196964)) (currentBit!5671 (_2!5533 lt!196964))) lt!197204)))

(declare-fun b!126035 () Bool)

(declare-fun res!104413 () Bool)

(assert (=> b!126035 (=> (not res!104413) (not e!82975))))

(assert (=> b!126035 (= res!104413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197204))))

(declare-fun b!126036 () Bool)

(declare-fun lt!197200 () (_ BitVec 64))

(assert (=> b!126036 (= e!82975 (bvsle lt!197204 (bvmul lt!197200 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126036 (or (= lt!197200 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197200 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197200)))))

(assert (=> b!126036 (= lt!197200 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!196964)))))))

(assert (= (and d!40988 res!104414) b!126035))

(assert (= (and b!126035 res!104413) b!126036))

(declare-fun m!191517 () Bool)

(assert (=> d!40988 m!191517))

(declare-fun m!191519 () Bool)

(assert (=> d!40988 m!191519))

(assert (=> b!125909 d!40988))

(declare-fun d!41002 () Bool)

(declare-fun e!82976 () Bool)

(assert (=> d!41002 e!82976))

(declare-fun res!104416 () Bool)

(assert (=> d!41002 (=> (not res!104416) (not e!82976))))

(declare-fun lt!197208 () (_ BitVec 64))

(declare-fun lt!197210 () (_ BitVec 64))

(declare-fun lt!197209 () (_ BitVec 64))

(assert (=> d!41002 (= res!104416 (= lt!197210 (bvsub lt!197208 lt!197209)))))

(assert (=> d!41002 (or (= (bvand lt!197208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197208 lt!197209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41002 (= lt!197209 (remainingBits!0 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614))))))

(declare-fun lt!197207 () (_ BitVec 64))

(declare-fun lt!197205 () (_ BitVec 64))

(assert (=> d!41002 (= lt!197208 (bvmul lt!197207 lt!197205))))

(assert (=> d!41002 (or (= lt!197207 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197205 (bvsdiv (bvmul lt!197207 lt!197205) lt!197207)))))

(assert (=> d!41002 (= lt!197205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41002 (= lt!197207 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))))))

(assert (=> d!41002 (= lt!197210 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5676 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5671 thiss!1614))))))

(assert (=> d!41002 (invariant!0 (currentBit!5671 thiss!1614) (currentByte!5676 thiss!1614) (size!2573 (buf!2952 thiss!1614)))))

(assert (=> d!41002 (= (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)) lt!197210)))

(declare-fun b!126037 () Bool)

(declare-fun res!104415 () Bool)

(assert (=> b!126037 (=> (not res!104415) (not e!82976))))

(assert (=> b!126037 (= res!104415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197210))))

(declare-fun b!126038 () Bool)

(declare-fun lt!197206 () (_ BitVec 64))

(assert (=> b!126038 (= e!82976 (bvsle lt!197210 (bvmul lt!197206 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126038 (or (= lt!197206 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197206 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197206)))))

(assert (=> b!126038 (= lt!197206 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))))))

(assert (= (and d!41002 res!104416) b!126037))

(assert (= (and b!126037 res!104415) b!126038))

(declare-fun m!191521 () Bool)

(assert (=> d!41002 m!191521))

(assert (=> d!41002 m!191343))

(assert (=> b!125909 d!41002))

(declare-fun d!41004 () Bool)

(assert (=> d!41004 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9922 () Bool)

(assert (= bs!9922 d!41004))

(assert (=> bs!9922 m!191521))

(assert (=> b!125904 d!41004))

(declare-fun d!41006 () Bool)

(assert (=> d!41006 (= (invariant!0 (currentBit!5671 thiss!1614) (currentByte!5676 thiss!1614) (size!2573 (buf!2952 thiss!1614))) (and (bvsge (currentBit!5671 thiss!1614) #b00000000000000000000000000000000) (bvslt (currentBit!5671 thiss!1614) #b00000000000000000000000000001000) (bvsge (currentByte!5676 thiss!1614) #b00000000000000000000000000000000) (or (bvslt (currentByte!5676 thiss!1614) (size!2573 (buf!2952 thiss!1614))) (and (= (currentBit!5671 thiss!1614) #b00000000000000000000000000000000) (= (currentByte!5676 thiss!1614) (size!2573 (buf!2952 thiss!1614)))))))))

(assert (=> b!125905 d!41006))

(declare-fun b!126079 () Bool)

(declare-fun e!83000 () Bool)

(declare-fun e!82998 () Bool)

(assert (=> b!126079 (= e!83000 e!82998)))

(declare-fun res!104455 () Bool)

(assert (=> b!126079 (=> (not res!104455) (not e!82998))))

(declare-fun lt!197324 () tuple2!10506)

(declare-fun lt!197329 () tuple2!10504)

(assert (=> b!126079 (= res!104455 (and (= (size!2573 (_2!5531 lt!197329)) (size!2573 arr!227)) (= (_1!5531 lt!197329) (_2!5532 lt!197324))))))

(assert (=> b!126079 (= lt!197329 (readByteArrayLoopPure!0 (_1!5532 lt!197324) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197330 () Unit!7746)

(declare-fun lt!197322 () Unit!7746)

(assert (=> b!126079 (= lt!197330 lt!197322)))

(declare-fun lt!197328 () tuple2!10508)

(declare-fun lt!197325 () (_ BitVec 64))

(assert (=> b!126079 (validate_offset_bits!1 ((_ sign_extend 32) (size!2573 (buf!2952 (_2!5533 lt!197328)))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) lt!197325)))

(assert (=> b!126079 (= lt!197322 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2952 (_2!5533 lt!197328)) lt!197325))))

(declare-fun e!82999 () Bool)

(assert (=> b!126079 e!82999))

(declare-fun res!104452 () Bool)

(assert (=> b!126079 (=> (not res!104452) (not e!82999))))

(assert (=> b!126079 (= res!104452 (and (= (size!2573 (buf!2952 thiss!1614)) (size!2573 (buf!2952 (_2!5533 lt!197328)))) (bvsge lt!197325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126079 (= lt!197325 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126079 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126079 (= lt!197324 (reader!0 thiss!1614 (_2!5533 lt!197328)))))

(declare-fun b!126080 () Bool)

(assert (=> b!126080 (= e!82999 (validate_offset_bits!1 ((_ sign_extend 32) (size!2573 (buf!2952 thiss!1614))) ((_ sign_extend 32) (currentByte!5676 thiss!1614)) ((_ sign_extend 32) (currentBit!5671 thiss!1614)) lt!197325))))

(declare-fun b!126081 () Bool)

(declare-fun res!104451 () Bool)

(assert (=> b!126081 (=> (not res!104451) (not e!83000))))

(declare-fun lt!197323 () (_ BitVec 64))

(declare-fun lt!197326 () (_ BitVec 64))

(assert (=> b!126081 (= res!104451 (= (bitIndex!0 (size!2573 (buf!2952 (_2!5533 lt!197328))) (currentByte!5676 (_2!5533 lt!197328)) (currentBit!5671 (_2!5533 lt!197328))) (bvadd lt!197323 lt!197326)))))

(assert (=> b!126081 (or (not (= (bvand lt!197323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197326 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!197323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!197323 lt!197326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!197327 () (_ BitVec 64))

(assert (=> b!126081 (= lt!197326 (bvmul lt!197327 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!126081 (or (= lt!197327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197327)))))

(assert (=> b!126081 (= lt!197327 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126081 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126081 (= lt!197323 (bitIndex!0 (size!2573 (buf!2952 thiss!1614)) (currentByte!5676 thiss!1614) (currentBit!5671 thiss!1614)))))

(declare-fun d!41008 () Bool)

(assert (=> d!41008 e!83000))

(declare-fun res!104453 () Bool)

(assert (=> d!41008 (=> (not res!104453) (not e!83000))))

(assert (=> d!41008 (= res!104453 (= (size!2573 (buf!2952 thiss!1614)) (size!2573 (buf!2952 (_2!5533 lt!197328)))))))

(declare-fun choose!64 (BitStream!4470 array!5686 (_ BitVec 32) (_ BitVec 32)) tuple2!10508)

(assert (=> d!41008 (= lt!197328 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41008 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2573 arr!227)))))

(assert (=> d!41008 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!197328)))

(declare-fun b!126082 () Bool)

(assert (=> b!126082 (= e!82998 (arrayRangesEq!60 arr!227 (_2!5531 lt!197329) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126083 () Bool)

(declare-fun res!104454 () Bool)

(assert (=> b!126083 (=> (not res!104454) (not e!83000))))

(assert (=> b!126083 (= res!104454 (isPrefixOf!0 thiss!1614 (_2!5533 lt!197328)))))

(assert (= (and d!41008 res!104453) b!126081))

(assert (= (and b!126081 res!104451) b!126083))

(assert (= (and b!126083 res!104454) b!126079))

(assert (= (and b!126079 res!104452) b!126080))

(assert (= (and b!126079 res!104455) b!126082))

(declare-fun m!191577 () Bool)

(assert (=> b!126081 m!191577))

(assert (=> b!126081 m!191361))

(declare-fun m!191579 () Bool)

(assert (=> b!126083 m!191579))

(declare-fun m!191581 () Bool)

(assert (=> d!41008 m!191581))

(declare-fun m!191583 () Bool)

(assert (=> b!126079 m!191583))

(declare-fun m!191585 () Bool)

(assert (=> b!126079 m!191585))

(declare-fun m!191587 () Bool)

(assert (=> b!126079 m!191587))

(declare-fun m!191589 () Bool)

(assert (=> b!126079 m!191589))

(declare-fun m!191591 () Bool)

(assert (=> b!126082 m!191591))

(declare-fun m!191593 () Bool)

(assert (=> b!126080 m!191593))

(assert (=> b!125905 d!41008))

(declare-fun d!41016 () Bool)

(declare-fun res!104460 () Bool)

(declare-fun e!83005 () Bool)

(assert (=> d!41016 (=> res!104460 e!83005)))

(assert (=> d!41016 (= res!104460 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41016 (= (arrayRangesEq!60 arr!227 (_2!5531 lt!196960) #b00000000000000000000000000000000 noOfBytes!1) e!83005)))

(declare-fun b!126088 () Bool)

(declare-fun e!83006 () Bool)

(assert (=> b!126088 (= e!83005 e!83006)))

(declare-fun res!104461 () Bool)

(assert (=> b!126088 (=> (not res!104461) (not e!83006))))

(assert (=> b!126088 (= res!104461 (= (select (arr!3172 arr!227) #b00000000000000000000000000000000) (select (arr!3172 (_2!5531 lt!196960)) #b00000000000000000000000000000000)))))

(declare-fun b!126089 () Bool)

(assert (=> b!126089 (= e!83006 (arrayRangesEq!60 arr!227 (_2!5531 lt!196960) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41016 (not res!104460)) b!126088))

(assert (= (and b!126088 res!104461) b!126089))

(declare-fun m!191595 () Bool)

(assert (=> b!126088 m!191595))

(declare-fun m!191597 () Bool)

(assert (=> b!126088 m!191597))

(declare-fun m!191599 () Bool)

(assert (=> b!126089 m!191599))

(assert (=> b!125906 d!41016))

(check-sat (not b!126083) (not b!126011) (not b!126012) (not d!40966) (not b!126081) (not d!41004) (not b!125954) (not d!40988) (not d!40986) (not d!40964) (not d!40962) (not d!41002) (not d!41008) (not b!126080) (not d!40960) (not b!126079) (not b!126082) (not b!125952) (not b!126089) (not b!126009) (not b!126010))
