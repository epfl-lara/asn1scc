; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12770 () Bool)

(assert start!12770)

(declare-fun res!54245 () Bool)

(declare-fun e!43056 () Bool)

(assert (=> start!12770 (=> (not res!54245) (not e!43056))))

(declare-datatypes ((array!2835 0))(
  ( (array!2836 (arr!1869 (Array (_ BitVec 32) (_ BitVec 8))) (size!1305 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2835)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!12770 (= res!54245 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1305 srcBuffer!2))))))))

(assert (=> start!12770 e!43056))

(assert (=> start!12770 true))

(declare-fun array_inv!1184 (array!2835) Bool)

(assert (=> start!12770 (array_inv!1184 srcBuffer!2)))

(declare-datatypes ((BitStream!2250 0))(
  ( (BitStream!2251 (buf!1686 array!2835) (currentByte!3352 (_ BitVec 32)) (currentBit!3347 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2250)

(declare-fun e!43057 () Bool)

(declare-fun inv!12 (BitStream!2250) Bool)

(assert (=> start!12770 (and (inv!12 thiss!1379) e!43057)))

(declare-fun b!65404 () Bool)

(declare-fun e!43055 () Bool)

(declare-fun e!43060 () Bool)

(assert (=> b!65404 (= e!43055 e!43060)))

(declare-fun res!54242 () Bool)

(assert (=> b!65404 (=> res!54242 e!43060)))

(declare-fun lt!103638 () (_ BitVec 64))

(declare-fun lt!103643 () (_ BitVec 64))

(assert (=> b!65404 (= res!54242 (not (= lt!103638 (bvsub (bvadd lt!103643 to!314) i!635))))))

(declare-datatypes ((Unit!4423 0))(
  ( (Unit!4424) )
))
(declare-datatypes ((tuple2!5812 0))(
  ( (tuple2!5813 (_1!3017 Unit!4423) (_2!3017 BitStream!2250)) )
))
(declare-fun lt!103646 () tuple2!5812)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!65404 (= lt!103638 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646))))))

(declare-fun b!65405 () Bool)

(declare-fun res!54254 () Bool)

(assert (=> b!65405 (=> res!54254 e!43060)))

(assert (=> b!65405 (= res!54254 (not (= (size!1305 (buf!1686 thiss!1379)) (size!1305 (buf!1686 (_2!3017 lt!103646))))))))

(declare-fun b!65406 () Bool)

(declare-fun e!43050 () Bool)

(assert (=> b!65406 (= e!43056 (not e!43050))))

(declare-fun res!54247 () Bool)

(assert (=> b!65406 (=> res!54247 e!43050)))

(assert (=> b!65406 (= res!54247 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2250 BitStream!2250) Bool)

(assert (=> b!65406 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!103647 () Unit!4423)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2250) Unit!4423)

(assert (=> b!65406 (= lt!103647 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!65406 (= lt!103643 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(declare-fun b!65407 () Bool)

(declare-fun res!54246 () Bool)

(declare-fun e!43058 () Bool)

(assert (=> b!65407 (=> res!54246 e!43058)))

(declare-datatypes ((tuple2!5814 0))(
  ( (tuple2!5815 (_1!3018 BitStream!2250) (_2!3018 BitStream!2250)) )
))
(declare-fun lt!103644 () tuple2!5814)

(assert (=> b!65407 (= res!54246 (not (isPrefixOf!0 (_1!3018 lt!103644) (_2!3017 lt!103646))))))

(declare-fun lt!103641 () tuple2!5812)

(declare-fun b!65408 () Bool)

(declare-fun e!43059 () Bool)

(assert (=> b!65408 (= e!43059 (= lt!103638 (bvsub (bvsub (bvadd (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65409 () Bool)

(declare-fun res!54241 () Bool)

(assert (=> b!65409 (=> res!54241 e!43058)))

(declare-fun lt!103640 () tuple2!5814)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65409 (= res!54241 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103640)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103640))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103640))) (bvsub to!314 i!635))))))

(declare-fun b!65410 () Bool)

(declare-fun e!43052 () Bool)

(assert (=> b!65410 (= e!43050 e!43052)))

(declare-fun res!54261 () Bool)

(assert (=> b!65410 (=> res!54261 e!43052)))

(assert (=> b!65410 (= res!54261 (not (isPrefixOf!0 thiss!1379 (_2!3017 lt!103641))))))

(declare-fun lt!103648 () (_ BitVec 64))

(assert (=> b!65410 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!103648)))

(assert (=> b!65410 (= lt!103648 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103637 () Unit!4423)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2250 BitStream!2250 (_ BitVec 64) (_ BitVec 64)) Unit!4423)

(assert (=> b!65410 (= lt!103637 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3017 lt!103641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2250 (_ BitVec 8) (_ BitVec 32)) tuple2!5812)

(assert (=> b!65410 (= lt!103641 (appendBitFromByte!0 thiss!1379 (select (arr!1869 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!65411 () Bool)

(declare-fun res!54243 () Bool)

(assert (=> b!65411 (=> res!54243 e!43058)))

(assert (=> b!65411 (= res!54243 (or (not (= (buf!1686 (_1!3018 lt!103640)) (buf!1686 (_1!3018 lt!103644)))) (not (= (buf!1686 (_1!3018 lt!103640)) (buf!1686 (_2!3017 lt!103646)))) (bvsge lt!103638 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!65412 () Bool)

(declare-fun res!54260 () Bool)

(assert (=> b!65412 (=> res!54260 e!43058)))

(assert (=> b!65412 (= res!54260 (not (isPrefixOf!0 (_1!3018 lt!103640) (_1!3018 lt!103644))))))

(declare-fun b!65413 () Bool)

(declare-fun e!43053 () Bool)

(assert (=> b!65413 (= e!43060 e!43053)))

(declare-fun res!54255 () Bool)

(assert (=> b!65413 (=> res!54255 e!43053)))

(assert (=> b!65413 (= res!54255 (not (= (size!1305 (buf!1686 (_2!3017 lt!103641))) (size!1305 (buf!1686 (_2!3017 lt!103646))))))))

(assert (=> b!65413 e!43059))

(declare-fun res!54256 () Bool)

(assert (=> b!65413 (=> (not res!54256) (not e!43059))))

(assert (=> b!65413 (= res!54256 (= (size!1305 (buf!1686 (_2!3017 lt!103646))) (size!1305 (buf!1686 thiss!1379))))))

(declare-fun b!65414 () Bool)

(assert (=> b!65414 (= e!43057 (array_inv!1184 (buf!1686 thiss!1379)))))

(declare-fun b!65415 () Bool)

(assert (=> b!65415 (= e!43052 e!43055)))

(declare-fun res!54258 () Bool)

(assert (=> b!65415 (=> res!54258 e!43055)))

(assert (=> b!65415 (= res!54258 (not (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!103646))))))

(assert (=> b!65415 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103646))))

(declare-fun lt!103633 () Unit!4423)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2250 BitStream!2250 BitStream!2250) Unit!4423)

(assert (=> b!65415 (= lt!103633 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3017 lt!103641) (_2!3017 lt!103646)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2250 array!2835 (_ BitVec 64) (_ BitVec 64)) tuple2!5812)

(assert (=> b!65415 (= lt!103646 (appendBitsMSBFirstLoop!0 (_2!3017 lt!103641) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43051 () Bool)

(assert (=> b!65415 e!43051))

(declare-fun res!54252 () Bool)

(assert (=> b!65415 (=> (not res!54252) (not e!43051))))

(assert (=> b!65415 (= res!54252 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103639 () Unit!4423)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2250 array!2835 (_ BitVec 64)) Unit!4423)

(assert (=> b!65415 (= lt!103639 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1686 (_2!3017 lt!103641)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103634 () tuple2!5814)

(declare-fun reader!0 (BitStream!2250 BitStream!2250) tuple2!5814)

(assert (=> b!65415 (= lt!103634 (reader!0 thiss!1379 (_2!3017 lt!103641)))))

(declare-fun b!65416 () Bool)

(declare-fun res!54259 () Bool)

(assert (=> b!65416 (=> res!54259 e!43060)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!65416 (= res!54259 (not (invariant!0 (currentBit!3347 (_2!3017 lt!103646)) (currentByte!3352 (_2!3017 lt!103646)) (size!1305 (buf!1686 (_2!3017 lt!103646))))))))

(declare-fun b!65417 () Bool)

(declare-fun res!54249 () Bool)

(assert (=> b!65417 (=> res!54249 e!43058)))

(assert (=> b!65417 (= res!54249 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103640))) (currentByte!3352 (_1!3018 lt!103640)) (currentBit!3347 (_1!3018 lt!103640)))) (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103644))) (currentByte!3352 (_1!3018 lt!103644)) (currentBit!3347 (_1!3018 lt!103644))))))))

(declare-fun b!65418 () Bool)

(declare-fun res!54244 () Bool)

(assert (=> b!65418 (=> res!54244 e!43058)))

(assert (=> b!65418 (= res!54244 (not (isPrefixOf!0 (_1!3018 lt!103640) (_2!3017 lt!103646))))))

(declare-fun b!65419 () Bool)

(declare-fun res!54250 () Bool)

(assert (=> b!65419 (=> res!54250 e!43053)))

(assert (=> b!65419 (= res!54250 (not (invariant!0 (currentBit!3347 (_2!3017 lt!103641)) (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103641))))))))

(declare-fun b!65420 () Bool)

(declare-fun res!54257 () Bool)

(assert (=> b!65420 (=> res!54257 e!43053)))

(assert (=> b!65420 (= res!54257 (not (invariant!0 (currentBit!3347 (_2!3017 lt!103641)) (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103646))))))))

(declare-fun b!65421 () Bool)

(declare-fun res!54251 () Bool)

(assert (=> b!65421 (=> res!54251 e!43058)))

(declare-datatypes ((List!700 0))(
  ( (Nil!697) (Cons!696 (h!815 Bool) (t!1450 List!700)) )
))
(declare-fun lt!103645 () List!700)

(declare-fun length!328 (List!700) Int)

(assert (=> b!65421 (= res!54251 (<= (length!328 lt!103645) 0))))

(declare-fun b!65422 () Bool)

(declare-fun res!54248 () Bool)

(assert (=> b!65422 (=> (not res!54248) (not e!43056))))

(assert (=> b!65422 (= res!54248 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 thiss!1379))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!65423 () Bool)

(declare-fun head!519 (List!700) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2250 array!2835 (_ BitVec 64) (_ BitVec 64)) List!700)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2250 BitStream!2250 (_ BitVec 64)) List!700)

(assert (=> b!65423 (= e!43051 (= (head!519 (byteArrayBitContentToList!0 (_2!3017 lt!103641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!519 (bitStreamReadBitsIntoList!0 (_2!3017 lt!103641) (_1!3018 lt!103634) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!65424 () Bool)

(assert (=> b!65424 (= e!43053 e!43058)))

(declare-fun res!54253 () Bool)

(assert (=> b!65424 (=> res!54253 e!43058)))

(assert (=> b!65424 (= res!54253 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103642 () List!700)

(assert (=> b!65424 (= lt!103642 (bitStreamReadBitsIntoList!0 (_2!3017 lt!103646) (_1!3018 lt!103644) lt!103648))))

(assert (=> b!65424 (= lt!103645 (bitStreamReadBitsIntoList!0 (_2!3017 lt!103646) (_1!3018 lt!103640) (bvsub to!314 i!635)))))

(assert (=> b!65424 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!103648)))

(declare-fun lt!103636 () Unit!4423)

(assert (=> b!65424 (= lt!103636 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3017 lt!103641) (buf!1686 (_2!3017 lt!103646)) lt!103648))))

(assert (=> b!65424 (= lt!103644 (reader!0 (_2!3017 lt!103641) (_2!3017 lt!103646)))))

(assert (=> b!65424 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!103635 () Unit!4423)

(assert (=> b!65424 (= lt!103635 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1686 (_2!3017 lt!103646)) (bvsub to!314 i!635)))))

(assert (=> b!65424 (= lt!103640 (reader!0 thiss!1379 (_2!3017 lt!103646)))))

(declare-fun b!65425 () Bool)

(assert (=> b!65425 (= e!43058 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103644)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103644))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103644))) lt!103648))))

(assert (= (and start!12770 res!54245) b!65422))

(assert (= (and b!65422 res!54248) b!65406))

(assert (= (and b!65406 (not res!54247)) b!65410))

(assert (= (and b!65410 (not res!54261)) b!65415))

(assert (= (and b!65415 res!54252) b!65423))

(assert (= (and b!65415 (not res!54258)) b!65404))

(assert (= (and b!65404 (not res!54242)) b!65416))

(assert (= (and b!65416 (not res!54259)) b!65405))

(assert (= (and b!65405 (not res!54254)) b!65413))

(assert (= (and b!65413 res!54256) b!65408))

(assert (= (and b!65413 (not res!54255)) b!65419))

(assert (= (and b!65419 (not res!54250)) b!65420))

(assert (= (and b!65420 (not res!54257)) b!65424))

(assert (= (and b!65424 (not res!54253)) b!65421))

(assert (= (and b!65421 (not res!54251)) b!65418))

(assert (= (and b!65418 (not res!54244)) b!65407))

(assert (= (and b!65407 (not res!54246)) b!65412))

(assert (= (and b!65412 (not res!54260)) b!65411))

(assert (= (and b!65411 (not res!54243)) b!65417))

(assert (= (and b!65417 (not res!54249)) b!65409))

(assert (= (and b!65409 (not res!54241)) b!65425))

(assert (= start!12770 b!65414))

(declare-fun m!103847 () Bool)

(assert (=> b!65404 m!103847))

(declare-fun m!103849 () Bool)

(assert (=> b!65422 m!103849))

(declare-fun m!103851 () Bool)

(assert (=> b!65424 m!103851))

(declare-fun m!103853 () Bool)

(assert (=> b!65424 m!103853))

(declare-fun m!103855 () Bool)

(assert (=> b!65424 m!103855))

(declare-fun m!103857 () Bool)

(assert (=> b!65424 m!103857))

(declare-fun m!103859 () Bool)

(assert (=> b!65424 m!103859))

(declare-fun m!103861 () Bool)

(assert (=> b!65424 m!103861))

(declare-fun m!103863 () Bool)

(assert (=> b!65424 m!103863))

(declare-fun m!103865 () Bool)

(assert (=> b!65424 m!103865))

(declare-fun m!103867 () Bool)

(assert (=> b!65412 m!103867))

(declare-fun m!103869 () Bool)

(assert (=> b!65425 m!103869))

(declare-fun m!103871 () Bool)

(assert (=> b!65406 m!103871))

(declare-fun m!103873 () Bool)

(assert (=> b!65406 m!103873))

(declare-fun m!103875 () Bool)

(assert (=> b!65406 m!103875))

(declare-fun m!103877 () Bool)

(assert (=> b!65410 m!103877))

(declare-fun m!103879 () Bool)

(assert (=> b!65410 m!103879))

(declare-fun m!103881 () Bool)

(assert (=> b!65410 m!103881))

(assert (=> b!65410 m!103877))

(declare-fun m!103883 () Bool)

(assert (=> b!65410 m!103883))

(declare-fun m!103885 () Bool)

(assert (=> b!65410 m!103885))

(declare-fun m!103887 () Bool)

(assert (=> b!65423 m!103887))

(assert (=> b!65423 m!103887))

(declare-fun m!103889 () Bool)

(assert (=> b!65423 m!103889))

(declare-fun m!103891 () Bool)

(assert (=> b!65423 m!103891))

(assert (=> b!65423 m!103891))

(declare-fun m!103893 () Bool)

(assert (=> b!65423 m!103893))

(declare-fun m!103895 () Bool)

(assert (=> b!65409 m!103895))

(declare-fun m!103897 () Bool)

(assert (=> b!65415 m!103897))

(declare-fun m!103899 () Bool)

(assert (=> b!65415 m!103899))

(declare-fun m!103901 () Bool)

(assert (=> b!65415 m!103901))

(declare-fun m!103903 () Bool)

(assert (=> b!65415 m!103903))

(declare-fun m!103905 () Bool)

(assert (=> b!65415 m!103905))

(declare-fun m!103907 () Bool)

(assert (=> b!65415 m!103907))

(declare-fun m!103909 () Bool)

(assert (=> b!65415 m!103909))

(declare-fun m!103911 () Bool)

(assert (=> b!65407 m!103911))

(declare-fun m!103913 () Bool)

(assert (=> b!65416 m!103913))

(declare-fun m!103915 () Bool)

(assert (=> b!65414 m!103915))

(declare-fun m!103917 () Bool)

(assert (=> b!65408 m!103917))

(declare-fun m!103919 () Bool)

(assert (=> b!65421 m!103919))

(declare-fun m!103921 () Bool)

(assert (=> b!65419 m!103921))

(declare-fun m!103923 () Bool)

(assert (=> b!65417 m!103923))

(declare-fun m!103925 () Bool)

(assert (=> b!65417 m!103925))

(declare-fun m!103927 () Bool)

(assert (=> start!12770 m!103927))

(declare-fun m!103929 () Bool)

(assert (=> start!12770 m!103929))

(declare-fun m!103931 () Bool)

(assert (=> b!65418 m!103931))

(declare-fun m!103933 () Bool)

(assert (=> b!65420 m!103933))

(check-sat (not b!65407) (not b!65415) (not b!65422) (not b!65409) (not b!65425) (not b!65420) (not b!65410) (not b!65417) (not b!65419) (not b!65416) (not b!65421) (not b!65404) (not b!65423) (not b!65414) (not b!65418) (not b!65406) (not b!65412) (not b!65424) (not start!12770) (not b!65408))
(check-sat)
(get-model)

(declare-fun d!20494 () Bool)

(assert (=> d!20494 (= (invariant!0 (currentBit!3347 (_2!3017 lt!103641)) (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103646)))) (and (bvsge (currentBit!3347 (_2!3017 lt!103641)) #b00000000000000000000000000000000) (bvslt (currentBit!3347 (_2!3017 lt!103641)) #b00000000000000000000000000001000) (bvsge (currentByte!3352 (_2!3017 lt!103641)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103646)))) (and (= (currentBit!3347 (_2!3017 lt!103641)) #b00000000000000000000000000000000) (= (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103646))))))))))

(assert (=> b!65420 d!20494))

(declare-fun d!20500 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20500 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103640)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103640))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103640))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103640)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103640))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103640)))) (bvsub to!314 i!635)))))

(declare-fun bs!5005 () Bool)

(assert (= bs!5005 d!20500))

(declare-fun m!104025 () Bool)

(assert (=> bs!5005 m!104025))

(assert (=> b!65409 d!20500))

(declare-fun d!20502 () Bool)

(declare-fun e!43109 () Bool)

(assert (=> d!20502 e!43109))

(declare-fun res!54341 () Bool)

(assert (=> d!20502 (=> (not res!54341) (not e!43109))))

(declare-fun lt!103712 () (_ BitVec 64))

(declare-fun lt!103714 () (_ BitVec 64))

(declare-fun lt!103715 () (_ BitVec 64))

(assert (=> d!20502 (= res!54341 (= lt!103714 (bvsub lt!103712 lt!103715)))))

(assert (=> d!20502 (or (= (bvand lt!103712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103715 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103712 lt!103715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20502 (= lt!103715 (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641)))))))

(declare-fun lt!103713 () (_ BitVec 64))

(declare-fun lt!103716 () (_ BitVec 64))

(assert (=> d!20502 (= lt!103712 (bvmul lt!103713 lt!103716))))

(assert (=> d!20502 (or (= lt!103713 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103716 (bvsdiv (bvmul lt!103713 lt!103716) lt!103713)))))

(assert (=> d!20502 (= lt!103716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20502 (= lt!103713 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))))))

(assert (=> d!20502 (= lt!103714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641)))))))

(assert (=> d!20502 (invariant!0 (currentBit!3347 (_2!3017 lt!103641)) (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103641))))))

(assert (=> d!20502 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))) lt!103714)))

(declare-fun b!65508 () Bool)

(declare-fun res!54342 () Bool)

(assert (=> b!65508 (=> (not res!54342) (not e!43109))))

(assert (=> b!65508 (= res!54342 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103714))))

(declare-fun b!65509 () Bool)

(declare-fun lt!103717 () (_ BitVec 64))

(assert (=> b!65509 (= e!43109 (bvsle lt!103714 (bvmul lt!103717 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65509 (or (= lt!103717 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103717 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103717)))))

(assert (=> b!65509 (= lt!103717 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))))))

(assert (= (and d!20502 res!54341) b!65508))

(assert (= (and b!65508 res!54342) b!65509))

(declare-fun m!104035 () Bool)

(assert (=> d!20502 m!104035))

(assert (=> d!20502 m!103921))

(assert (=> b!65408 d!20502))

(declare-fun d!20510 () Bool)

(assert (=> d!20510 (= (invariant!0 (currentBit!3347 (_2!3017 lt!103641)) (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103641)))) (and (bvsge (currentBit!3347 (_2!3017 lt!103641)) #b00000000000000000000000000000000) (bvslt (currentBit!3347 (_2!3017 lt!103641)) #b00000000000000000000000000001000) (bvsge (currentByte!3352 (_2!3017 lt!103641)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103641)))) (and (= (currentBit!3347 (_2!3017 lt!103641)) #b00000000000000000000000000000000) (= (currentByte!3352 (_2!3017 lt!103641)) (size!1305 (buf!1686 (_2!3017 lt!103641))))))))))

(assert (=> b!65419 d!20510))

(declare-fun d!20512 () Bool)

(declare-fun res!54350 () Bool)

(declare-fun e!43114 () Bool)

(assert (=> d!20512 (=> (not res!54350) (not e!43114))))

(assert (=> d!20512 (= res!54350 (= (size!1305 (buf!1686 (_1!3018 lt!103640))) (size!1305 (buf!1686 (_2!3017 lt!103646)))))))

(assert (=> d!20512 (= (isPrefixOf!0 (_1!3018 lt!103640) (_2!3017 lt!103646)) e!43114)))

(declare-fun b!65516 () Bool)

(declare-fun res!54349 () Bool)

(assert (=> b!65516 (=> (not res!54349) (not e!43114))))

(assert (=> b!65516 (= res!54349 (bvsle (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103640))) (currentByte!3352 (_1!3018 lt!103640)) (currentBit!3347 (_1!3018 lt!103640))) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646)))))))

(declare-fun b!65517 () Bool)

(declare-fun e!43115 () Bool)

(assert (=> b!65517 (= e!43114 e!43115)))

(declare-fun res!54351 () Bool)

(assert (=> b!65517 (=> res!54351 e!43115)))

(assert (=> b!65517 (= res!54351 (= (size!1305 (buf!1686 (_1!3018 lt!103640))) #b00000000000000000000000000000000))))

(declare-fun b!65518 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2835 array!2835 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65518 (= e!43115 (arrayBitRangesEq!0 (buf!1686 (_1!3018 lt!103640)) (buf!1686 (_2!3017 lt!103646)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103640))) (currentByte!3352 (_1!3018 lt!103640)) (currentBit!3347 (_1!3018 lt!103640)))))))

(assert (= (and d!20512 res!54350) b!65516))

(assert (= (and b!65516 res!54349) b!65517))

(assert (= (and b!65517 (not res!54351)) b!65518))

(assert (=> b!65516 m!103923))

(assert (=> b!65516 m!103847))

(assert (=> b!65518 m!103923))

(assert (=> b!65518 m!103923))

(declare-fun m!104037 () Bool)

(assert (=> b!65518 m!104037))

(assert (=> b!65418 d!20512))

(declare-fun d!20514 () Bool)

(declare-fun res!54353 () Bool)

(declare-fun e!43116 () Bool)

(assert (=> d!20514 (=> (not res!54353) (not e!43116))))

(assert (=> d!20514 (= res!54353 (= (size!1305 (buf!1686 (_1!3018 lt!103640))) (size!1305 (buf!1686 (_1!3018 lt!103644)))))))

(assert (=> d!20514 (= (isPrefixOf!0 (_1!3018 lt!103640) (_1!3018 lt!103644)) e!43116)))

(declare-fun b!65519 () Bool)

(declare-fun res!54352 () Bool)

(assert (=> b!65519 (=> (not res!54352) (not e!43116))))

(assert (=> b!65519 (= res!54352 (bvsle (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103640))) (currentByte!3352 (_1!3018 lt!103640)) (currentBit!3347 (_1!3018 lt!103640))) (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103644))) (currentByte!3352 (_1!3018 lt!103644)) (currentBit!3347 (_1!3018 lt!103644)))))))

(declare-fun b!65520 () Bool)

(declare-fun e!43117 () Bool)

(assert (=> b!65520 (= e!43116 e!43117)))

(declare-fun res!54354 () Bool)

(assert (=> b!65520 (=> res!54354 e!43117)))

(assert (=> b!65520 (= res!54354 (= (size!1305 (buf!1686 (_1!3018 lt!103640))) #b00000000000000000000000000000000))))

(declare-fun b!65521 () Bool)

(assert (=> b!65521 (= e!43117 (arrayBitRangesEq!0 (buf!1686 (_1!3018 lt!103640)) (buf!1686 (_1!3018 lt!103644)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103640))) (currentByte!3352 (_1!3018 lt!103640)) (currentBit!3347 (_1!3018 lt!103640)))))))

(assert (= (and d!20514 res!54353) b!65519))

(assert (= (and b!65519 res!54352) b!65520))

(assert (= (and b!65520 (not res!54354)) b!65521))

(assert (=> b!65519 m!103923))

(assert (=> b!65519 m!103925))

(assert (=> b!65521 m!103923))

(assert (=> b!65521 m!103923))

(declare-fun m!104039 () Bool)

(assert (=> b!65521 m!104039))

(assert (=> b!65412 d!20514))

(declare-fun d!20516 () Bool)

(assert (=> d!20516 (= (head!519 (byteArrayBitContentToList!0 (_2!3017 lt!103641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!815 (byteArrayBitContentToList!0 (_2!3017 lt!103641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!65423 d!20516))

(declare-fun d!20518 () Bool)

(declare-fun c!4734 () Bool)

(assert (=> d!20518 (= c!4734 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43120 () List!700)

(assert (=> d!20518 (= (byteArrayBitContentToList!0 (_2!3017 lt!103641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43120)))

(declare-fun b!65526 () Bool)

(assert (=> b!65526 (= e!43120 Nil!697)))

(declare-fun b!65527 () Bool)

(assert (=> b!65527 (= e!43120 (Cons!696 (not (= (bvand ((_ sign_extend 24) (select (arr!1869 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3017 lt!103641) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20518 c!4734) b!65526))

(assert (= (and d!20518 (not c!4734)) b!65527))

(assert (=> b!65527 m!103877))

(declare-fun m!104041 () Bool)

(assert (=> b!65527 m!104041))

(declare-fun m!104043 () Bool)

(assert (=> b!65527 m!104043))

(assert (=> b!65423 d!20518))

(declare-fun d!20520 () Bool)

(assert (=> d!20520 (= (head!519 (bitStreamReadBitsIntoList!0 (_2!3017 lt!103641) (_1!3018 lt!103634) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!815 (bitStreamReadBitsIntoList!0 (_2!3017 lt!103641) (_1!3018 lt!103634) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!65423 d!20520))

(declare-fun b!65538 () Bool)

(declare-fun e!43126 () Bool)

(declare-fun lt!103725 () List!700)

(declare-fun isEmpty!206 (List!700) Bool)

(assert (=> b!65538 (= e!43126 (isEmpty!206 lt!103725))))

(declare-fun b!65539 () Bool)

(assert (=> b!65539 (= e!43126 (> (length!328 lt!103725) 0))))

(declare-fun d!20522 () Bool)

(assert (=> d!20522 e!43126))

(declare-fun c!4739 () Bool)

(assert (=> d!20522 (= c!4739 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5834 0))(
  ( (tuple2!5835 (_1!3028 List!700) (_2!3028 BitStream!2250)) )
))
(declare-fun e!43125 () tuple2!5834)

(assert (=> d!20522 (= lt!103725 (_1!3028 e!43125))))

(declare-fun c!4740 () Bool)

(assert (=> d!20522 (= c!4740 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20522 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20522 (= (bitStreamReadBitsIntoList!0 (_2!3017 lt!103641) (_1!3018 lt!103634) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103725)))

(declare-fun b!65536 () Bool)

(assert (=> b!65536 (= e!43125 (tuple2!5835 Nil!697 (_1!3018 lt!103634)))))

(declare-datatypes ((tuple2!5836 0))(
  ( (tuple2!5837 (_1!3029 Bool) (_2!3029 BitStream!2250)) )
))
(declare-fun lt!103724 () tuple2!5836)

(declare-fun lt!103726 () (_ BitVec 64))

(declare-fun b!65537 () Bool)

(assert (=> b!65537 (= e!43125 (tuple2!5835 (Cons!696 (_1!3029 lt!103724) (bitStreamReadBitsIntoList!0 (_2!3017 lt!103641) (_2!3029 lt!103724) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!103726))) (_2!3029 lt!103724)))))

(declare-fun readBit!0 (BitStream!2250) tuple2!5836)

(assert (=> b!65537 (= lt!103724 (readBit!0 (_1!3018 lt!103634)))))

(assert (=> b!65537 (= lt!103726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20522 c!4740) b!65536))

(assert (= (and d!20522 (not c!4740)) b!65537))

(assert (= (and d!20522 c!4739) b!65538))

(assert (= (and d!20522 (not c!4739)) b!65539))

(declare-fun m!104045 () Bool)

(assert (=> b!65538 m!104045))

(declare-fun m!104047 () Bool)

(assert (=> b!65539 m!104047))

(declare-fun m!104049 () Bool)

(assert (=> b!65537 m!104049))

(declare-fun m!104051 () Bool)

(assert (=> b!65537 m!104051))

(assert (=> b!65423 d!20522))

(declare-fun d!20524 () Bool)

(assert (=> d!20524 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 thiss!1379))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 thiss!1379))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5007 () Bool)

(assert (= bs!5007 d!20524))

(declare-fun m!104053 () Bool)

(assert (=> bs!5007 m!104053))

(assert (=> b!65422 d!20524))

(declare-fun d!20526 () Bool)

(declare-fun res!54356 () Bool)

(declare-fun e!43127 () Bool)

(assert (=> d!20526 (=> (not res!54356) (not e!43127))))

(assert (=> d!20526 (= res!54356 (= (size!1305 (buf!1686 thiss!1379)) (size!1305 (buf!1686 (_2!3017 lt!103641)))))))

(assert (=> d!20526 (= (isPrefixOf!0 thiss!1379 (_2!3017 lt!103641)) e!43127)))

(declare-fun b!65540 () Bool)

(declare-fun res!54355 () Bool)

(assert (=> b!65540 (=> (not res!54355) (not e!43127))))

(assert (=> b!65540 (= res!54355 (bvsle (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641)))))))

(declare-fun b!65541 () Bool)

(declare-fun e!43128 () Bool)

(assert (=> b!65541 (= e!43127 e!43128)))

(declare-fun res!54357 () Bool)

(assert (=> b!65541 (=> res!54357 e!43128)))

(assert (=> b!65541 (= res!54357 (= (size!1305 (buf!1686 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65542 () Bool)

(assert (=> b!65542 (= e!43128 (arrayBitRangesEq!0 (buf!1686 thiss!1379) (buf!1686 (_2!3017 lt!103641)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379))))))

(assert (= (and d!20526 res!54356) b!65540))

(assert (= (and b!65540 res!54355) b!65541))

(assert (= (and b!65541 (not res!54357)) b!65542))

(assert (=> b!65540 m!103875))

(assert (=> b!65540 m!103917))

(assert (=> b!65542 m!103875))

(assert (=> b!65542 m!103875))

(declare-fun m!104055 () Bool)

(assert (=> b!65542 m!104055))

(assert (=> b!65410 d!20526))

(declare-fun d!20528 () Bool)

(assert (=> d!20528 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!103648) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641)))) lt!103648))))

(declare-fun bs!5008 () Bool)

(assert (= bs!5008 d!20528))

(assert (=> bs!5008 m!104035))

(assert (=> b!65410 d!20528))

(declare-fun d!20530 () Bool)

(declare-fun e!43131 () Bool)

(assert (=> d!20530 e!43131))

(declare-fun res!54360 () Bool)

(assert (=> d!20530 (=> (not res!54360) (not e!43131))))

(assert (=> d!20530 (= res!54360 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!103729 () Unit!4423)

(declare-fun choose!27 (BitStream!2250 BitStream!2250 (_ BitVec 64) (_ BitVec 64)) Unit!4423)

(assert (=> d!20530 (= lt!103729 (choose!27 thiss!1379 (_2!3017 lt!103641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20530 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20530 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3017 lt!103641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103729)))

(declare-fun b!65545 () Bool)

(assert (=> b!65545 (= e!43131 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20530 res!54360) b!65545))

(declare-fun m!104057 () Bool)

(assert (=> d!20530 m!104057))

(declare-fun m!104059 () Bool)

(assert (=> b!65545 m!104059))

(assert (=> b!65410 d!20530))

(declare-fun b!65652 () Bool)

(declare-fun res!54442 () Bool)

(declare-fun e!43187 () Bool)

(assert (=> b!65652 (=> (not res!54442) (not e!43187))))

(declare-fun lt!103901 () (_ BitVec 64))

(declare-fun lt!103907 () (_ BitVec 64))

(declare-fun lt!103903 () tuple2!5812)

(assert (=> b!65652 (= res!54442 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103903))) (currentByte!3352 (_2!3017 lt!103903)) (currentBit!3347 (_2!3017 lt!103903))) (bvadd lt!103907 lt!103901)))))

(assert (=> b!65652 (or (not (= (bvand lt!103907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103901 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103907 lt!103901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65652 (= lt!103901 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!65652 (= lt!103907 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(declare-fun b!65653 () Bool)

(declare-fun res!54443 () Bool)

(declare-fun e!43188 () Bool)

(assert (=> b!65653 (=> (not res!54443) (not e!43188))))

(declare-fun lt!103905 () tuple2!5812)

(assert (=> b!65653 (= res!54443 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103905)))))

(declare-fun b!65654 () Bool)

(declare-fun e!43189 () Bool)

(assert (=> b!65654 (= e!43188 e!43189)))

(declare-fun res!54444 () Bool)

(assert (=> b!65654 (=> (not res!54444) (not e!43189))))

(declare-datatypes ((tuple2!5840 0))(
  ( (tuple2!5841 (_1!3031 BitStream!2250) (_2!3031 Bool)) )
))
(declare-fun lt!103909 () tuple2!5840)

(declare-fun lt!103900 () Bool)

(assert (=> b!65654 (= res!54444 (and (= (_2!3031 lt!103909) lt!103900) (= (_1!3031 lt!103909) (_2!3017 lt!103905))))))

(declare-fun readBitPure!0 (BitStream!2250) tuple2!5840)

(declare-fun readerFrom!0 (BitStream!2250 (_ BitVec 32) (_ BitVec 32)) BitStream!2250)

(assert (=> b!65654 (= lt!103909 (readBitPure!0 (readerFrom!0 (_2!3017 lt!103905) (currentBit!3347 thiss!1379) (currentByte!3352 thiss!1379))))))

(declare-fun b!65655 () Bool)

(declare-fun e!43190 () Bool)

(assert (=> b!65655 (= e!43187 e!43190)))

(declare-fun res!54445 () Bool)

(assert (=> b!65655 (=> (not res!54445) (not e!43190))))

(declare-fun lt!103906 () tuple2!5840)

(declare-fun lt!103899 () (_ BitVec 8))

(assert (=> b!65655 (= res!54445 (and (= (_2!3031 lt!103906) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1869 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!103899)) #b00000000000000000000000000000000))) (= (_1!3031 lt!103906) (_2!3017 lt!103903))))))

(declare-datatypes ((tuple2!5842 0))(
  ( (tuple2!5843 (_1!3032 array!2835) (_2!3032 BitStream!2250)) )
))
(declare-fun lt!103902 () tuple2!5842)

(declare-fun lt!103898 () BitStream!2250)

(declare-fun readBits!0 (BitStream!2250 (_ BitVec 64)) tuple2!5842)

(assert (=> b!65655 (= lt!103902 (readBits!0 lt!103898 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!65655 (= lt!103906 (readBitPure!0 lt!103898))))

(assert (=> b!65655 (= lt!103898 (readerFrom!0 (_2!3017 lt!103903) (currentBit!3347 thiss!1379) (currentByte!3352 thiss!1379)))))

(declare-fun b!65656 () Bool)

(declare-fun res!54447 () Bool)

(assert (=> b!65656 (=> (not res!54447) (not e!43187))))

(assert (=> b!65656 (= res!54447 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103903)))))

(declare-fun b!65657 () Bool)

(declare-fun res!54448 () Bool)

(assert (=> b!65657 (=> (not res!54448) (not e!43188))))

(assert (=> b!65657 (= res!54448 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103905))) (currentByte!3352 (_2!3017 lt!103905)) (currentBit!3347 (_2!3017 lt!103905))) (bvadd (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!20532 () Bool)

(assert (=> d!20532 e!43187))

(declare-fun res!54441 () Bool)

(assert (=> d!20532 (=> (not res!54441) (not e!43187))))

(assert (=> d!20532 (= res!54441 (= (size!1305 (buf!1686 (_2!3017 lt!103903))) (size!1305 (buf!1686 thiss!1379))))))

(declare-fun lt!103904 () array!2835)

(assert (=> d!20532 (= lt!103899 (select (arr!1869 lt!103904) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20532 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1305 lt!103904)))))

(assert (=> d!20532 (= lt!103904 (array!2836 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!103908 () tuple2!5812)

(assert (=> d!20532 (= lt!103903 (tuple2!5813 (_1!3017 lt!103908) (_2!3017 lt!103908)))))

(assert (=> d!20532 (= lt!103908 lt!103905)))

(assert (=> d!20532 e!43188))

(declare-fun res!54446 () Bool)

(assert (=> d!20532 (=> (not res!54446) (not e!43188))))

(assert (=> d!20532 (= res!54446 (= (size!1305 (buf!1686 thiss!1379)) (size!1305 (buf!1686 (_2!3017 lt!103905)))))))

(declare-fun appendBit!0 (BitStream!2250 Bool) tuple2!5812)

(assert (=> d!20532 (= lt!103905 (appendBit!0 thiss!1379 lt!103900))))

(assert (=> d!20532 (= lt!103900 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1869 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20532 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20532 (= (appendBitFromByte!0 thiss!1379 (select (arr!1869 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!103903)))

(declare-fun b!65658 () Bool)

(assert (=> b!65658 (= e!43189 (= (bitIndex!0 (size!1305 (buf!1686 (_1!3031 lt!103909))) (currentByte!3352 (_1!3031 lt!103909)) (currentBit!3347 (_1!3031 lt!103909))) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103905))) (currentByte!3352 (_2!3017 lt!103905)) (currentBit!3347 (_2!3017 lt!103905)))))))

(declare-fun b!65659 () Bool)

(assert (=> b!65659 (= e!43190 (= (bitIndex!0 (size!1305 (buf!1686 (_1!3031 lt!103906))) (currentByte!3352 (_1!3031 lt!103906)) (currentBit!3347 (_1!3031 lt!103906))) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103903))) (currentByte!3352 (_2!3017 lt!103903)) (currentBit!3347 (_2!3017 lt!103903)))))))

(assert (= (and d!20532 res!54446) b!65657))

(assert (= (and b!65657 res!54448) b!65653))

(assert (= (and b!65653 res!54443) b!65654))

(assert (= (and b!65654 res!54444) b!65658))

(assert (= (and d!20532 res!54441) b!65652))

(assert (= (and b!65652 res!54442) b!65656))

(assert (= (and b!65656 res!54447) b!65655))

(assert (= (and b!65655 res!54445) b!65659))

(declare-fun m!104157 () Bool)

(assert (=> b!65658 m!104157))

(declare-fun m!104159 () Bool)

(assert (=> b!65658 m!104159))

(declare-fun m!104161 () Bool)

(assert (=> b!65659 m!104161))

(declare-fun m!104163 () Bool)

(assert (=> b!65659 m!104163))

(declare-fun m!104165 () Bool)

(assert (=> b!65653 m!104165))

(declare-fun m!104167 () Bool)

(assert (=> b!65655 m!104167))

(declare-fun m!104169 () Bool)

(assert (=> b!65655 m!104169))

(declare-fun m!104171 () Bool)

(assert (=> b!65655 m!104171))

(assert (=> b!65657 m!104159))

(assert (=> b!65657 m!103875))

(declare-fun m!104173 () Bool)

(assert (=> d!20532 m!104173))

(declare-fun m!104175 () Bool)

(assert (=> d!20532 m!104175))

(assert (=> d!20532 m!104041))

(declare-fun m!104177 () Bool)

(assert (=> b!65656 m!104177))

(declare-fun m!104179 () Bool)

(assert (=> b!65654 m!104179))

(assert (=> b!65654 m!104179))

(declare-fun m!104181 () Bool)

(assert (=> b!65654 m!104181))

(assert (=> b!65652 m!104163))

(assert (=> b!65652 m!103875))

(assert (=> b!65410 d!20532))

(declare-fun d!20574 () Bool)

(declare-fun size!1308 (List!700) Int)

(assert (=> d!20574 (= (length!328 lt!103645) (size!1308 lt!103645))))

(declare-fun bs!5014 () Bool)

(assert (= bs!5014 d!20574))

(declare-fun m!104183 () Bool)

(assert (=> bs!5014 m!104183))

(assert (=> b!65421 d!20574))

(declare-fun d!20576 () Bool)

(declare-fun e!43191 () Bool)

(assert (=> d!20576 e!43191))

(declare-fun res!54449 () Bool)

(assert (=> d!20576 (=> (not res!54449) (not e!43191))))

(declare-fun lt!103913 () (_ BitVec 64))

(declare-fun lt!103912 () (_ BitVec 64))

(declare-fun lt!103910 () (_ BitVec 64))

(assert (=> d!20576 (= res!54449 (= lt!103912 (bvsub lt!103910 lt!103913)))))

(assert (=> d!20576 (or (= (bvand lt!103910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103910 lt!103913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20576 (= lt!103913 (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103646))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103646)))))))

(declare-fun lt!103911 () (_ BitVec 64))

(declare-fun lt!103914 () (_ BitVec 64))

(assert (=> d!20576 (= lt!103910 (bvmul lt!103911 lt!103914))))

(assert (=> d!20576 (or (= lt!103911 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103914 (bvsdiv (bvmul lt!103911 lt!103914) lt!103911)))))

(assert (=> d!20576 (= lt!103914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20576 (= lt!103911 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))))))

(assert (=> d!20576 (= lt!103912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103646)))))))

(assert (=> d!20576 (invariant!0 (currentBit!3347 (_2!3017 lt!103646)) (currentByte!3352 (_2!3017 lt!103646)) (size!1305 (buf!1686 (_2!3017 lt!103646))))))

(assert (=> d!20576 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646))) lt!103912)))

(declare-fun b!65660 () Bool)

(declare-fun res!54450 () Bool)

(assert (=> b!65660 (=> (not res!54450) (not e!43191))))

(assert (=> b!65660 (= res!54450 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103912))))

(declare-fun b!65661 () Bool)

(declare-fun lt!103915 () (_ BitVec 64))

(assert (=> b!65661 (= e!43191 (bvsle lt!103912 (bvmul lt!103915 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65661 (or (= lt!103915 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103915 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103915)))))

(assert (=> b!65661 (= lt!103915 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))))))

(assert (= (and d!20576 res!54449) b!65660))

(assert (= (and b!65660 res!54450) b!65661))

(declare-fun m!104185 () Bool)

(assert (=> d!20576 m!104185))

(assert (=> d!20576 m!103913))

(assert (=> b!65404 d!20576))

(declare-fun d!20578 () Bool)

(assert (=> d!20578 (= (array_inv!1184 srcBuffer!2) (bvsge (size!1305 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12770 d!20578))

(declare-fun d!20580 () Bool)

(assert (=> d!20580 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3347 thiss!1379) (currentByte!3352 thiss!1379) (size!1305 (buf!1686 thiss!1379))))))

(declare-fun bs!5015 () Bool)

(assert (= bs!5015 d!20580))

(declare-fun m!104187 () Bool)

(assert (=> bs!5015 m!104187))

(assert (=> start!12770 d!20580))

(declare-fun d!20582 () Bool)

(declare-fun res!54452 () Bool)

(declare-fun e!43192 () Bool)

(assert (=> d!20582 (=> (not res!54452) (not e!43192))))

(assert (=> d!20582 (= res!54452 (= (size!1305 (buf!1686 thiss!1379)) (size!1305 (buf!1686 (_2!3017 lt!103646)))))))

(assert (=> d!20582 (= (isPrefixOf!0 thiss!1379 (_2!3017 lt!103646)) e!43192)))

(declare-fun b!65662 () Bool)

(declare-fun res!54451 () Bool)

(assert (=> b!65662 (=> (not res!54451) (not e!43192))))

(assert (=> b!65662 (= res!54451 (bvsle (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646)))))))

(declare-fun b!65663 () Bool)

(declare-fun e!43193 () Bool)

(assert (=> b!65663 (= e!43192 e!43193)))

(declare-fun res!54453 () Bool)

(assert (=> b!65663 (=> res!54453 e!43193)))

(assert (=> b!65663 (= res!54453 (= (size!1305 (buf!1686 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65664 () Bool)

(assert (=> b!65664 (= e!43193 (arrayBitRangesEq!0 (buf!1686 thiss!1379) (buf!1686 (_2!3017 lt!103646)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379))))))

(assert (= (and d!20582 res!54452) b!65662))

(assert (= (and b!65662 res!54451) b!65663))

(assert (= (and b!65663 (not res!54453)) b!65664))

(assert (=> b!65662 m!103875))

(assert (=> b!65662 m!103847))

(assert (=> b!65664 m!103875))

(assert (=> b!65664 m!103875))

(declare-fun m!104189 () Bool)

(assert (=> b!65664 m!104189))

(assert (=> b!65415 d!20582))

(declare-fun d!20584 () Bool)

(assert (=> d!20584 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103931 () Unit!4423)

(declare-fun choose!9 (BitStream!2250 array!2835 (_ BitVec 64) BitStream!2250) Unit!4423)

(assert (=> d!20584 (= lt!103931 (choose!9 thiss!1379 (buf!1686 (_2!3017 lt!103641)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2251 (buf!1686 (_2!3017 lt!103641)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379))))))

(assert (=> d!20584 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1686 (_2!3017 lt!103641)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103931)))

(declare-fun bs!5018 () Bool)

(assert (= bs!5018 d!20584))

(assert (=> bs!5018 m!103903))

(declare-fun m!104211 () Bool)

(assert (=> bs!5018 m!104211))

(assert (=> b!65415 d!20584))

(declare-fun d!20594 () Bool)

(assert (=> d!20594 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5020 () Bool)

(assert (= bs!5020 d!20594))

(declare-fun m!104215 () Bool)

(assert (=> bs!5020 m!104215))

(assert (=> b!65415 d!20594))

(declare-fun b!65733 () Bool)

(declare-fun e!43226 () Unit!4423)

(declare-fun lt!104052 () Unit!4423)

(assert (=> b!65733 (= e!43226 lt!104052)))

(declare-fun lt!104054 () (_ BitVec 64))

(assert (=> b!65733 (= lt!104054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104053 () (_ BitVec 64))

(assert (=> b!65733 (= lt!104053 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2835 array!2835 (_ BitVec 64) (_ BitVec 64)) Unit!4423)

(assert (=> b!65733 (= lt!104052 (arrayBitRangesEqSymmetric!0 (buf!1686 thiss!1379) (buf!1686 (_2!3017 lt!103641)) lt!104054 lt!104053))))

(assert (=> b!65733 (arrayBitRangesEq!0 (buf!1686 (_2!3017 lt!103641)) (buf!1686 thiss!1379) lt!104054 lt!104053)))

(declare-fun b!65735 () Bool)

(declare-fun res!54489 () Bool)

(declare-fun e!43227 () Bool)

(assert (=> b!65735 (=> (not res!54489) (not e!43227))))

(declare-fun lt!104045 () tuple2!5814)

(assert (=> b!65735 (= res!54489 (isPrefixOf!0 (_2!3018 lt!104045) (_2!3017 lt!103641)))))

(declare-fun b!65736 () Bool)

(declare-fun res!54491 () Bool)

(assert (=> b!65736 (=> (not res!54491) (not e!43227))))

(assert (=> b!65736 (= res!54491 (isPrefixOf!0 (_1!3018 lt!104045) thiss!1379))))

(declare-fun b!65737 () Bool)

(declare-fun Unit!4437 () Unit!4423)

(assert (=> b!65737 (= e!43226 Unit!4437)))

(declare-fun d!20598 () Bool)

(assert (=> d!20598 e!43227))

(declare-fun res!54490 () Bool)

(assert (=> d!20598 (=> (not res!54490) (not e!43227))))

(assert (=> d!20598 (= res!54490 (isPrefixOf!0 (_1!3018 lt!104045) (_2!3018 lt!104045)))))

(declare-fun lt!104040 () BitStream!2250)

(assert (=> d!20598 (= lt!104045 (tuple2!5815 lt!104040 (_2!3017 lt!103641)))))

(declare-fun lt!104039 () Unit!4423)

(declare-fun lt!104049 () Unit!4423)

(assert (=> d!20598 (= lt!104039 lt!104049)))

(assert (=> d!20598 (isPrefixOf!0 lt!104040 (_2!3017 lt!103641))))

(assert (=> d!20598 (= lt!104049 (lemmaIsPrefixTransitive!0 lt!104040 (_2!3017 lt!103641) (_2!3017 lt!103641)))))

(declare-fun lt!104044 () Unit!4423)

(declare-fun lt!104041 () Unit!4423)

(assert (=> d!20598 (= lt!104044 lt!104041)))

(assert (=> d!20598 (isPrefixOf!0 lt!104040 (_2!3017 lt!103641))))

(assert (=> d!20598 (= lt!104041 (lemmaIsPrefixTransitive!0 lt!104040 thiss!1379 (_2!3017 lt!103641)))))

(declare-fun lt!104056 () Unit!4423)

(assert (=> d!20598 (= lt!104056 e!43226)))

(declare-fun c!4769 () Bool)

(assert (=> d!20598 (= c!4769 (not (= (size!1305 (buf!1686 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!104043 () Unit!4423)

(declare-fun lt!104037 () Unit!4423)

(assert (=> d!20598 (= lt!104043 lt!104037)))

(assert (=> d!20598 (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!103641))))

(assert (=> d!20598 (= lt!104037 (lemmaIsPrefixRefl!0 (_2!3017 lt!103641)))))

(declare-fun lt!104042 () Unit!4423)

(declare-fun lt!104047 () Unit!4423)

(assert (=> d!20598 (= lt!104042 lt!104047)))

(assert (=> d!20598 (= lt!104047 (lemmaIsPrefixRefl!0 (_2!3017 lt!103641)))))

(declare-fun lt!104038 () Unit!4423)

(declare-fun lt!104055 () Unit!4423)

(assert (=> d!20598 (= lt!104038 lt!104055)))

(assert (=> d!20598 (isPrefixOf!0 lt!104040 lt!104040)))

(assert (=> d!20598 (= lt!104055 (lemmaIsPrefixRefl!0 lt!104040))))

(declare-fun lt!104046 () Unit!4423)

(declare-fun lt!104050 () Unit!4423)

(assert (=> d!20598 (= lt!104046 lt!104050)))

(assert (=> d!20598 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20598 (= lt!104050 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20598 (= lt!104040 (BitStream!2251 (buf!1686 (_2!3017 lt!103641)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(assert (=> d!20598 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103641))))

(assert (=> d!20598 (= (reader!0 thiss!1379 (_2!3017 lt!103641)) lt!104045)))

(declare-fun lt!104048 () (_ BitVec 64))

(declare-fun lt!104051 () (_ BitVec 64))

(declare-fun b!65734 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2250 (_ BitVec 64)) BitStream!2250)

(assert (=> b!65734 (= e!43227 (= (_1!3018 lt!104045) (withMovedBitIndex!0 (_2!3018 lt!104045) (bvsub lt!104051 lt!104048))))))

(assert (=> b!65734 (or (= (bvand lt!104051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104051 lt!104048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65734 (= lt!104048 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))))))

(assert (=> b!65734 (= lt!104051 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(assert (= (and d!20598 c!4769) b!65733))

(assert (= (and d!20598 (not c!4769)) b!65737))

(assert (= (and d!20598 res!54490) b!65736))

(assert (= (and b!65736 res!54491) b!65735))

(assert (= (and b!65735 res!54489) b!65734))

(declare-fun m!104281 () Bool)

(assert (=> b!65735 m!104281))

(declare-fun m!104283 () Bool)

(assert (=> d!20598 m!104283))

(assert (=> d!20598 m!103873))

(declare-fun m!104285 () Bool)

(assert (=> d!20598 m!104285))

(declare-fun m!104287 () Bool)

(assert (=> d!20598 m!104287))

(declare-fun m!104289 () Bool)

(assert (=> d!20598 m!104289))

(declare-fun m!104291 () Bool)

(assert (=> d!20598 m!104291))

(declare-fun m!104293 () Bool)

(assert (=> d!20598 m!104293))

(declare-fun m!104295 () Bool)

(assert (=> d!20598 m!104295))

(assert (=> d!20598 m!103871))

(declare-fun m!104297 () Bool)

(assert (=> d!20598 m!104297))

(assert (=> d!20598 m!103885))

(assert (=> b!65733 m!103875))

(declare-fun m!104299 () Bool)

(assert (=> b!65733 m!104299))

(declare-fun m!104301 () Bool)

(assert (=> b!65733 m!104301))

(declare-fun m!104303 () Bool)

(assert (=> b!65734 m!104303))

(assert (=> b!65734 m!103917))

(assert (=> b!65734 m!103875))

(declare-fun m!104305 () Bool)

(assert (=> b!65736 m!104305))

(assert (=> b!65415 d!20598))

(declare-fun d!20614 () Bool)

(assert (=> d!20614 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103646))))

(declare-fun lt!104059 () Unit!4423)

(declare-fun choose!30 (BitStream!2250 BitStream!2250 BitStream!2250) Unit!4423)

(assert (=> d!20614 (= lt!104059 (choose!30 thiss!1379 (_2!3017 lt!103641) (_2!3017 lt!103646)))))

(assert (=> d!20614 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103641))))

(assert (=> d!20614 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3017 lt!103641) (_2!3017 lt!103646)) lt!104059)))

(declare-fun bs!5021 () Bool)

(assert (= bs!5021 d!20614))

(assert (=> bs!5021 m!103901))

(declare-fun m!104307 () Bool)

(assert (=> bs!5021 m!104307))

(assert (=> bs!5021 m!103885))

(assert (=> b!65415 d!20614))

(declare-fun d!20616 () Bool)

(declare-fun res!54493 () Bool)

(declare-fun e!43228 () Bool)

(assert (=> d!20616 (=> (not res!54493) (not e!43228))))

(assert (=> d!20616 (= res!54493 (= (size!1305 (buf!1686 (_2!3017 lt!103641))) (size!1305 (buf!1686 (_2!3017 lt!103646)))))))

(assert (=> d!20616 (= (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!103646)) e!43228)))

(declare-fun b!65738 () Bool)

(declare-fun res!54492 () Bool)

(assert (=> b!65738 (=> (not res!54492) (not e!43228))))

(assert (=> b!65738 (= res!54492 (bvsle (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646)))))))

(declare-fun b!65739 () Bool)

(declare-fun e!43229 () Bool)

(assert (=> b!65739 (= e!43228 e!43229)))

(declare-fun res!54494 () Bool)

(assert (=> b!65739 (=> res!54494 e!43229)))

(assert (=> b!65739 (= res!54494 (= (size!1305 (buf!1686 (_2!3017 lt!103641))) #b00000000000000000000000000000000))))

(declare-fun b!65740 () Bool)

(assert (=> b!65740 (= e!43229 (arrayBitRangesEq!0 (buf!1686 (_2!3017 lt!103641)) (buf!1686 (_2!3017 lt!103646)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641)))))))

(assert (= (and d!20616 res!54493) b!65738))

(assert (= (and b!65738 res!54492) b!65739))

(assert (= (and b!65739 (not res!54494)) b!65740))

(assert (=> b!65738 m!103917))

(assert (=> b!65738 m!103847))

(assert (=> b!65740 m!103917))

(assert (=> b!65740 m!103917))

(declare-fun m!104309 () Bool)

(assert (=> b!65740 m!104309))

(assert (=> b!65415 d!20616))

(declare-fun d!20618 () Bool)

(declare-fun e!43298 () Bool)

(assert (=> d!20618 e!43298))

(declare-fun res!54607 () Bool)

(assert (=> d!20618 (=> (not res!54607) (not e!43298))))

(declare-fun lt!104620 () (_ BitVec 64))

(declare-fun lt!104606 () tuple2!5812)

(assert (=> d!20618 (= res!54607 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!104606))) (currentByte!3352 (_2!3017 lt!104606)) (currentBit!3347 (_2!3017 lt!104606))) (bvsub lt!104620 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20618 (or (= (bvand lt!104620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104620 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!104642 () (_ BitVec 64))

(assert (=> d!20618 (= lt!104620 (bvadd lt!104642 to!314))))

(assert (=> d!20618 (or (not (= (bvand lt!104642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!104642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!104642 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20618 (= lt!104642 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))))))

(declare-fun e!43296 () tuple2!5812)

(assert (=> d!20618 (= lt!104606 e!43296)))

(declare-fun c!4788 () Bool)

(assert (=> d!20618 (= c!4788 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!104643 () Unit!4423)

(declare-fun lt!104602 () Unit!4423)

(assert (=> d!20618 (= lt!104643 lt!104602)))

(assert (=> d!20618 (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!103641))))

(assert (=> d!20618 (= lt!104602 (lemmaIsPrefixRefl!0 (_2!3017 lt!103641)))))

(declare-fun lt!104622 () (_ BitVec 64))

(assert (=> d!20618 (= lt!104622 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))))))

(assert (=> d!20618 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20618 (= (appendBitsMSBFirstLoop!0 (_2!3017 lt!103641) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!104606)))

(declare-fun b!65886 () Bool)

(declare-fun e!43297 () Bool)

(declare-fun lt!104635 () (_ BitVec 64))

(assert (=> b!65886 (= e!43297 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103641)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!104635))))

(declare-fun b!65887 () Bool)

(declare-fun res!54605 () Bool)

(assert (=> b!65887 (=> (not res!54605) (not e!43298))))

(assert (=> b!65887 (= res!54605 (invariant!0 (currentBit!3347 (_2!3017 lt!104606)) (currentByte!3352 (_2!3017 lt!104606)) (size!1305 (buf!1686 (_2!3017 lt!104606)))))))

(declare-fun lt!104615 () tuple2!5812)

(declare-fun bm!841 () Bool)

(declare-fun lt!104637 () tuple2!5812)

(declare-fun call!844 () tuple2!5814)

(assert (=> bm!841 (= call!844 (reader!0 (ite c!4788 (_2!3017 lt!104637) (_2!3017 lt!103641)) (ite c!4788 (_2!3017 lt!104615) (_2!3017 lt!103641))))))

(declare-fun b!65888 () Bool)

(declare-fun Unit!4443 () Unit!4423)

(assert (=> b!65888 (= e!43296 (tuple2!5813 Unit!4443 (_2!3017 lt!103641)))))

(assert (=> b!65888 (= (size!1305 (buf!1686 (_2!3017 lt!103641))) (size!1305 (buf!1686 (_2!3017 lt!103641))))))

(declare-fun lt!104609 () Unit!4423)

(declare-fun Unit!4444 () Unit!4423)

(assert (=> b!65888 (= lt!104609 Unit!4444)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2250 array!2835 array!2835 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65888 (checkByteArrayBitContent!0 (_2!3017 lt!103641) srcBuffer!2 (_1!3032 (readBits!0 (_1!3018 call!844) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!65889 () Bool)

(declare-fun res!54604 () Bool)

(assert (=> b!65889 (=> (not res!54604) (not e!43298))))

(assert (=> b!65889 (= res!54604 (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!104606)))))

(declare-fun b!65890 () Bool)

(declare-fun lt!104601 () tuple2!5814)

(assert (=> b!65890 (= e!43298 (= (bitStreamReadBitsIntoList!0 (_2!3017 lt!104606) (_1!3018 lt!104601) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3017 lt!104606) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!65890 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65890 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!104638 () Unit!4423)

(declare-fun lt!104621 () Unit!4423)

(assert (=> b!65890 (= lt!104638 lt!104621)))

(assert (=> b!65890 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!104606)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!104635)))

(assert (=> b!65890 (= lt!104621 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3017 lt!103641) (buf!1686 (_2!3017 lt!104606)) lt!104635))))

(assert (=> b!65890 e!43297))

(declare-fun res!54608 () Bool)

(assert (=> b!65890 (=> (not res!54608) (not e!43297))))

(assert (=> b!65890 (= res!54608 (and (= (size!1305 (buf!1686 (_2!3017 lt!103641))) (size!1305 (buf!1686 (_2!3017 lt!104606)))) (bvsge lt!104635 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65890 (= lt!104635 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!65890 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65890 (= lt!104601 (reader!0 (_2!3017 lt!103641) (_2!3017 lt!104606)))))

(declare-fun b!65891 () Bool)

(declare-fun Unit!4445 () Unit!4423)

(assert (=> b!65891 (= e!43296 (tuple2!5813 Unit!4445 (_2!3017 lt!104615)))))

(assert (=> b!65891 (= lt!104637 (appendBitFromByte!0 (_2!3017 lt!103641) (select (arr!1869 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!104641 () (_ BitVec 64))

(assert (=> b!65891 (= lt!104641 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104617 () (_ BitVec 64))

(assert (=> b!65891 (= lt!104617 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104619 () Unit!4423)

(assert (=> b!65891 (= lt!104619 (validateOffsetBitsIneqLemma!0 (_2!3017 lt!103641) (_2!3017 lt!104637) lt!104641 lt!104617))))

(assert (=> b!65891 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!104637)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!104637))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!104637))) (bvsub lt!104641 lt!104617))))

(declare-fun lt!104610 () Unit!4423)

(assert (=> b!65891 (= lt!104610 lt!104619)))

(declare-fun lt!104607 () tuple2!5814)

(assert (=> b!65891 (= lt!104607 (reader!0 (_2!3017 lt!103641) (_2!3017 lt!104637)))))

(declare-fun lt!104613 () (_ BitVec 64))

(assert (=> b!65891 (= lt!104613 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104624 () Unit!4423)

(assert (=> b!65891 (= lt!104624 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3017 lt!103641) (buf!1686 (_2!3017 lt!104637)) lt!104613))))

(assert (=> b!65891 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!104637)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!104613)))

(declare-fun lt!104626 () Unit!4423)

(assert (=> b!65891 (= lt!104626 lt!104624)))

(assert (=> b!65891 (= (head!519 (byteArrayBitContentToList!0 (_2!3017 lt!104637) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!519 (bitStreamReadBitsIntoList!0 (_2!3017 lt!104637) (_1!3018 lt!104607) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104634 () Unit!4423)

(declare-fun Unit!4446 () Unit!4423)

(assert (=> b!65891 (= lt!104634 Unit!4446)))

(assert (=> b!65891 (= lt!104615 (appendBitsMSBFirstLoop!0 (_2!3017 lt!104637) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!104629 () Unit!4423)

(assert (=> b!65891 (= lt!104629 (lemmaIsPrefixTransitive!0 (_2!3017 lt!103641) (_2!3017 lt!104637) (_2!3017 lt!104615)))))

(assert (=> b!65891 (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!104615))))

(declare-fun lt!104644 () Unit!4423)

(assert (=> b!65891 (= lt!104644 lt!104629)))

(assert (=> b!65891 (= (size!1305 (buf!1686 (_2!3017 lt!104615))) (size!1305 (buf!1686 (_2!3017 lt!103641))))))

(declare-fun lt!104631 () Unit!4423)

(declare-fun Unit!4447 () Unit!4423)

(assert (=> b!65891 (= lt!104631 Unit!4447)))

(assert (=> b!65891 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!104615))) (currentByte!3352 (_2!3017 lt!104615)) (currentBit!3347 (_2!3017 lt!104615))) (bvsub (bvadd (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104603 () Unit!4423)

(declare-fun Unit!4448 () Unit!4423)

(assert (=> b!65891 (= lt!104603 Unit!4448)))

(assert (=> b!65891 (= (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!104615))) (currentByte!3352 (_2!3017 lt!104615)) (currentBit!3347 (_2!3017 lt!104615))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!104637))) (currentByte!3352 (_2!3017 lt!104637)) (currentBit!3347 (_2!3017 lt!104637))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104611 () Unit!4423)

(declare-fun Unit!4449 () Unit!4423)

(assert (=> b!65891 (= lt!104611 Unit!4449)))

(declare-fun lt!104630 () tuple2!5814)

(assert (=> b!65891 (= lt!104630 (reader!0 (_2!3017 lt!103641) (_2!3017 lt!104615)))))

(declare-fun lt!104604 () (_ BitVec 64))

(assert (=> b!65891 (= lt!104604 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104628 () Unit!4423)

(assert (=> b!65891 (= lt!104628 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3017 lt!103641) (buf!1686 (_2!3017 lt!104615)) lt!104604))))

(assert (=> b!65891 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!104615)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!104604)))

(declare-fun lt!104633 () Unit!4423)

(assert (=> b!65891 (= lt!104633 lt!104628)))

(declare-fun lt!104623 () tuple2!5814)

(assert (=> b!65891 (= lt!104623 call!844)))

(declare-fun lt!104616 () (_ BitVec 64))

(assert (=> b!65891 (= lt!104616 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104627 () Unit!4423)

(assert (=> b!65891 (= lt!104627 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3017 lt!104637) (buf!1686 (_2!3017 lt!104615)) lt!104616))))

(assert (=> b!65891 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!104615)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!104637))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!104637))) lt!104616)))

(declare-fun lt!104636 () Unit!4423)

(assert (=> b!65891 (= lt!104636 lt!104627)))

(declare-fun lt!104640 () List!700)

(assert (=> b!65891 (= lt!104640 (byteArrayBitContentToList!0 (_2!3017 lt!104615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!104639 () List!700)

(assert (=> b!65891 (= lt!104639 (byteArrayBitContentToList!0 (_2!3017 lt!104615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104625 () List!700)

(assert (=> b!65891 (= lt!104625 (bitStreamReadBitsIntoList!0 (_2!3017 lt!104615) (_1!3018 lt!104630) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!104608 () List!700)

(assert (=> b!65891 (= lt!104608 (bitStreamReadBitsIntoList!0 (_2!3017 lt!104615) (_1!3018 lt!104623) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104614 () (_ BitVec 64))

(assert (=> b!65891 (= lt!104614 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104632 () Unit!4423)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2250 BitStream!2250 BitStream!2250 BitStream!2250 (_ BitVec 64) List!700) Unit!4423)

(assert (=> b!65891 (= lt!104632 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3017 lt!104615) (_2!3017 lt!104615) (_1!3018 lt!104630) (_1!3018 lt!104623) lt!104614 lt!104625))))

(declare-fun tail!308 (List!700) List!700)

(assert (=> b!65891 (= (bitStreamReadBitsIntoList!0 (_2!3017 lt!104615) (_1!3018 lt!104623) (bvsub lt!104614 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!308 lt!104625))))

(declare-fun lt!104612 () Unit!4423)

(assert (=> b!65891 (= lt!104612 lt!104632)))

(declare-fun lt!104605 () Unit!4423)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2835 array!2835 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4423)

(assert (=> b!65891 (= lt!104605 (arrayBitRangesEqImpliesEq!0 (buf!1686 (_2!3017 lt!104637)) (buf!1686 (_2!3017 lt!104615)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!104622 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!104637))) (currentByte!3352 (_2!3017 lt!104637)) (currentBit!3347 (_2!3017 lt!104637)))))))

(declare-fun bitAt!0 (array!2835 (_ BitVec 64)) Bool)

(assert (=> b!65891 (= (bitAt!0 (buf!1686 (_2!3017 lt!104637)) lt!104622) (bitAt!0 (buf!1686 (_2!3017 lt!104615)) lt!104622))))

(declare-fun lt!104618 () Unit!4423)

(assert (=> b!65891 (= lt!104618 lt!104605)))

(declare-fun b!65892 () Bool)

(declare-fun res!54606 () Bool)

(assert (=> b!65892 (=> (not res!54606) (not e!43298))))

(assert (=> b!65892 (= res!54606 (= (size!1305 (buf!1686 (_2!3017 lt!104606))) (size!1305 (buf!1686 (_2!3017 lt!103641)))))))

(declare-fun b!65893 () Bool)

(declare-fun res!54609 () Bool)

(assert (=> b!65893 (=> (not res!54609) (not e!43298))))

(assert (=> b!65893 (= res!54609 (= (size!1305 (buf!1686 (_2!3017 lt!103641))) (size!1305 (buf!1686 (_2!3017 lt!104606)))))))

(assert (= (and d!20618 c!4788) b!65891))

(assert (= (and d!20618 (not c!4788)) b!65888))

(assert (= (or b!65891 b!65888) bm!841))

(assert (= (and d!20618 res!54607) b!65887))

(assert (= (and b!65887 res!54605) b!65893))

(assert (= (and b!65893 res!54609) b!65889))

(assert (= (and b!65889 res!54604) b!65892))

(assert (= (and b!65892 res!54606) b!65890))

(assert (= (and b!65890 res!54608) b!65886))

(declare-fun m!104651 () Bool)

(assert (=> b!65886 m!104651))

(declare-fun m!104653 () Bool)

(assert (=> b!65888 m!104653))

(declare-fun m!104655 () Bool)

(assert (=> b!65888 m!104655))

(declare-fun m!104657 () Bool)

(assert (=> b!65891 m!104657))

(declare-fun m!104659 () Bool)

(assert (=> b!65891 m!104659))

(declare-fun m!104661 () Bool)

(assert (=> b!65891 m!104661))

(declare-fun m!104663 () Bool)

(assert (=> b!65891 m!104663))

(declare-fun m!104665 () Bool)

(assert (=> b!65891 m!104665))

(declare-fun m!104667 () Bool)

(assert (=> b!65891 m!104667))

(declare-fun m!104669 () Bool)

(assert (=> b!65891 m!104669))

(declare-fun m!104671 () Bool)

(assert (=> b!65891 m!104671))

(declare-fun m!104673 () Bool)

(assert (=> b!65891 m!104673))

(declare-fun m!104675 () Bool)

(assert (=> b!65891 m!104675))

(assert (=> b!65891 m!104659))

(declare-fun m!104677 () Bool)

(assert (=> b!65891 m!104677))

(declare-fun m!104679 () Bool)

(assert (=> b!65891 m!104679))

(declare-fun m!104681 () Bool)

(assert (=> b!65891 m!104681))

(assert (=> b!65891 m!103917))

(declare-fun m!104683 () Bool)

(assert (=> b!65891 m!104683))

(declare-fun m!104685 () Bool)

(assert (=> b!65891 m!104685))

(declare-fun m!104687 () Bool)

(assert (=> b!65891 m!104687))

(declare-fun m!104689 () Bool)

(assert (=> b!65891 m!104689))

(declare-fun m!104691 () Bool)

(assert (=> b!65891 m!104691))

(declare-fun m!104693 () Bool)

(assert (=> b!65891 m!104693))

(declare-fun m!104695 () Bool)

(assert (=> b!65891 m!104695))

(declare-fun m!104697 () Bool)

(assert (=> b!65891 m!104697))

(assert (=> b!65891 m!104665))

(declare-fun m!104699 () Bool)

(assert (=> b!65891 m!104699))

(assert (=> b!65891 m!104669))

(declare-fun m!104701 () Bool)

(assert (=> b!65891 m!104701))

(declare-fun m!104703 () Bool)

(assert (=> b!65891 m!104703))

(assert (=> b!65891 m!104695))

(declare-fun m!104705 () Bool)

(assert (=> b!65891 m!104705))

(declare-fun m!104707 () Bool)

(assert (=> b!65891 m!104707))

(declare-fun m!104709 () Bool)

(assert (=> b!65891 m!104709))

(declare-fun m!104711 () Bool)

(assert (=> b!65891 m!104711))

(declare-fun m!104713 () Bool)

(assert (=> b!65891 m!104713))

(declare-fun m!104715 () Bool)

(assert (=> b!65891 m!104715))

(declare-fun m!104717 () Bool)

(assert (=> b!65891 m!104717))

(declare-fun m!104719 () Bool)

(assert (=> b!65890 m!104719))

(declare-fun m!104721 () Bool)

(assert (=> b!65890 m!104721))

(declare-fun m!104723 () Bool)

(assert (=> b!65890 m!104723))

(declare-fun m!104725 () Bool)

(assert (=> b!65890 m!104725))

(declare-fun m!104727 () Bool)

(assert (=> b!65890 m!104727))

(declare-fun m!104729 () Bool)

(assert (=> d!20618 m!104729))

(assert (=> d!20618 m!103917))

(assert (=> d!20618 m!104283))

(assert (=> d!20618 m!104291))

(declare-fun m!104731 () Bool)

(assert (=> b!65887 m!104731))

(declare-fun m!104733 () Bool)

(assert (=> b!65889 m!104733))

(declare-fun m!104735 () Bool)

(assert (=> bm!841 m!104735))

(assert (=> b!65415 d!20618))

(declare-fun d!20716 () Bool)

(assert (=> d!20716 (= (array_inv!1184 (buf!1686 thiss!1379)) (bvsge (size!1305 (buf!1686 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!65414 d!20716))

(declare-fun d!20718 () Bool)

(assert (=> d!20718 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103644)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103644))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103644))) lt!103648) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103644)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103644))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103644)))) lt!103648))))

(declare-fun bs!5042 () Bool)

(assert (= bs!5042 d!20718))

(declare-fun m!104737 () Bool)

(assert (=> bs!5042 m!104737))

(assert (=> b!65425 d!20718))

(declare-fun d!20720 () Bool)

(assert (=> d!20720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!103648) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641)))) lt!103648))))

(declare-fun bs!5043 () Bool)

(assert (= bs!5043 d!20720))

(declare-fun m!104739 () Bool)

(assert (=> bs!5043 m!104739))

(assert (=> b!65424 d!20720))

(declare-fun d!20722 () Bool)

(assert (=> d!20722 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!104645 () Unit!4423)

(assert (=> d!20722 (= lt!104645 (choose!9 thiss!1379 (buf!1686 (_2!3017 lt!103646)) (bvsub to!314 i!635) (BitStream!2251 (buf!1686 (_2!3017 lt!103646)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379))))))

(assert (=> d!20722 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1686 (_2!3017 lt!103646)) (bvsub to!314 i!635)) lt!104645)))

(declare-fun bs!5044 () Bool)

(assert (= bs!5044 d!20722))

(assert (=> bs!5044 m!103859))

(declare-fun m!104741 () Bool)

(assert (=> bs!5044 m!104741))

(assert (=> b!65424 d!20722))

(declare-fun b!65894 () Bool)

(declare-fun e!43299 () Unit!4423)

(declare-fun lt!104661 () Unit!4423)

(assert (=> b!65894 (= e!43299 lt!104661)))

(declare-fun lt!104663 () (_ BitVec 64))

(assert (=> b!65894 (= lt!104663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104662 () (_ BitVec 64))

(assert (=> b!65894 (= lt!104662 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(assert (=> b!65894 (= lt!104661 (arrayBitRangesEqSymmetric!0 (buf!1686 thiss!1379) (buf!1686 (_2!3017 lt!103646)) lt!104663 lt!104662))))

(assert (=> b!65894 (arrayBitRangesEq!0 (buf!1686 (_2!3017 lt!103646)) (buf!1686 thiss!1379) lt!104663 lt!104662)))

(declare-fun b!65896 () Bool)

(declare-fun res!54610 () Bool)

(declare-fun e!43300 () Bool)

(assert (=> b!65896 (=> (not res!54610) (not e!43300))))

(declare-fun lt!104654 () tuple2!5814)

(assert (=> b!65896 (= res!54610 (isPrefixOf!0 (_2!3018 lt!104654) (_2!3017 lt!103646)))))

(declare-fun b!65897 () Bool)

(declare-fun res!54612 () Bool)

(assert (=> b!65897 (=> (not res!54612) (not e!43300))))

(assert (=> b!65897 (= res!54612 (isPrefixOf!0 (_1!3018 lt!104654) thiss!1379))))

(declare-fun b!65898 () Bool)

(declare-fun Unit!4452 () Unit!4423)

(assert (=> b!65898 (= e!43299 Unit!4452)))

(declare-fun d!20724 () Bool)

(assert (=> d!20724 e!43300))

(declare-fun res!54611 () Bool)

(assert (=> d!20724 (=> (not res!54611) (not e!43300))))

(assert (=> d!20724 (= res!54611 (isPrefixOf!0 (_1!3018 lt!104654) (_2!3018 lt!104654)))))

(declare-fun lt!104649 () BitStream!2250)

(assert (=> d!20724 (= lt!104654 (tuple2!5815 lt!104649 (_2!3017 lt!103646)))))

(declare-fun lt!104648 () Unit!4423)

(declare-fun lt!104658 () Unit!4423)

(assert (=> d!20724 (= lt!104648 lt!104658)))

(assert (=> d!20724 (isPrefixOf!0 lt!104649 (_2!3017 lt!103646))))

(assert (=> d!20724 (= lt!104658 (lemmaIsPrefixTransitive!0 lt!104649 (_2!3017 lt!103646) (_2!3017 lt!103646)))))

(declare-fun lt!104653 () Unit!4423)

(declare-fun lt!104650 () Unit!4423)

(assert (=> d!20724 (= lt!104653 lt!104650)))

(assert (=> d!20724 (isPrefixOf!0 lt!104649 (_2!3017 lt!103646))))

(assert (=> d!20724 (= lt!104650 (lemmaIsPrefixTransitive!0 lt!104649 thiss!1379 (_2!3017 lt!103646)))))

(declare-fun lt!104665 () Unit!4423)

(assert (=> d!20724 (= lt!104665 e!43299)))

(declare-fun c!4789 () Bool)

(assert (=> d!20724 (= c!4789 (not (= (size!1305 (buf!1686 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!104652 () Unit!4423)

(declare-fun lt!104646 () Unit!4423)

(assert (=> d!20724 (= lt!104652 lt!104646)))

(assert (=> d!20724 (isPrefixOf!0 (_2!3017 lt!103646) (_2!3017 lt!103646))))

(assert (=> d!20724 (= lt!104646 (lemmaIsPrefixRefl!0 (_2!3017 lt!103646)))))

(declare-fun lt!104651 () Unit!4423)

(declare-fun lt!104656 () Unit!4423)

(assert (=> d!20724 (= lt!104651 lt!104656)))

(assert (=> d!20724 (= lt!104656 (lemmaIsPrefixRefl!0 (_2!3017 lt!103646)))))

(declare-fun lt!104647 () Unit!4423)

(declare-fun lt!104664 () Unit!4423)

(assert (=> d!20724 (= lt!104647 lt!104664)))

(assert (=> d!20724 (isPrefixOf!0 lt!104649 lt!104649)))

(assert (=> d!20724 (= lt!104664 (lemmaIsPrefixRefl!0 lt!104649))))

(declare-fun lt!104655 () Unit!4423)

(declare-fun lt!104659 () Unit!4423)

(assert (=> d!20724 (= lt!104655 lt!104659)))

(assert (=> d!20724 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20724 (= lt!104659 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20724 (= lt!104649 (BitStream!2251 (buf!1686 (_2!3017 lt!103646)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(assert (=> d!20724 (isPrefixOf!0 thiss!1379 (_2!3017 lt!103646))))

(assert (=> d!20724 (= (reader!0 thiss!1379 (_2!3017 lt!103646)) lt!104654)))

(declare-fun lt!104657 () (_ BitVec 64))

(declare-fun b!65895 () Bool)

(declare-fun lt!104660 () (_ BitVec 64))

(assert (=> b!65895 (= e!43300 (= (_1!3018 lt!104654) (withMovedBitIndex!0 (_2!3018 lt!104654) (bvsub lt!104660 lt!104657))))))

(assert (=> b!65895 (or (= (bvand lt!104660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104657 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104660 lt!104657) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65895 (= lt!104657 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646))))))

(assert (=> b!65895 (= lt!104660 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)))))

(assert (= (and d!20724 c!4789) b!65894))

(assert (= (and d!20724 (not c!4789)) b!65898))

(assert (= (and d!20724 res!54611) b!65897))

(assert (= (and b!65897 res!54612) b!65896))

(assert (= (and b!65896 res!54610) b!65895))

(declare-fun m!104743 () Bool)

(assert (=> b!65896 m!104743))

(declare-fun m!104745 () Bool)

(assert (=> d!20724 m!104745))

(assert (=> d!20724 m!103873))

(declare-fun m!104747 () Bool)

(assert (=> d!20724 m!104747))

(declare-fun m!104749 () Bool)

(assert (=> d!20724 m!104749))

(declare-fun m!104751 () Bool)

(assert (=> d!20724 m!104751))

(declare-fun m!104753 () Bool)

(assert (=> d!20724 m!104753))

(declare-fun m!104755 () Bool)

(assert (=> d!20724 m!104755))

(declare-fun m!104757 () Bool)

(assert (=> d!20724 m!104757))

(assert (=> d!20724 m!103871))

(declare-fun m!104759 () Bool)

(assert (=> d!20724 m!104759))

(assert (=> d!20724 m!103901))

(assert (=> b!65894 m!103875))

(declare-fun m!104761 () Bool)

(assert (=> b!65894 m!104761))

(declare-fun m!104763 () Bool)

(assert (=> b!65894 m!104763))

(declare-fun m!104765 () Bool)

(assert (=> b!65895 m!104765))

(assert (=> b!65895 m!103847))

(assert (=> b!65895 m!103875))

(declare-fun m!104767 () Bool)

(assert (=> b!65897 m!104767))

(assert (=> b!65424 d!20724))

(declare-fun b!65901 () Bool)

(declare-fun e!43302 () Bool)

(declare-fun lt!104667 () List!700)

(assert (=> b!65901 (= e!43302 (isEmpty!206 lt!104667))))

(declare-fun b!65902 () Bool)

(assert (=> b!65902 (= e!43302 (> (length!328 lt!104667) 0))))

(declare-fun d!20726 () Bool)

(assert (=> d!20726 e!43302))

(declare-fun c!4790 () Bool)

(assert (=> d!20726 (= c!4790 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43301 () tuple2!5834)

(assert (=> d!20726 (= lt!104667 (_1!3028 e!43301))))

(declare-fun c!4791 () Bool)

(assert (=> d!20726 (= c!4791 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20726 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20726 (= (bitStreamReadBitsIntoList!0 (_2!3017 lt!103646) (_1!3018 lt!103640) (bvsub to!314 i!635)) lt!104667)))

(declare-fun b!65899 () Bool)

(assert (=> b!65899 (= e!43301 (tuple2!5835 Nil!697 (_1!3018 lt!103640)))))

(declare-fun lt!104666 () tuple2!5836)

(declare-fun lt!104668 () (_ BitVec 64))

(declare-fun b!65900 () Bool)

(assert (=> b!65900 (= e!43301 (tuple2!5835 (Cons!696 (_1!3029 lt!104666) (bitStreamReadBitsIntoList!0 (_2!3017 lt!103646) (_2!3029 lt!104666) (bvsub (bvsub to!314 i!635) lt!104668))) (_2!3029 lt!104666)))))

(assert (=> b!65900 (= lt!104666 (readBit!0 (_1!3018 lt!103640)))))

(assert (=> b!65900 (= lt!104668 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20726 c!4791) b!65899))

(assert (= (and d!20726 (not c!4791)) b!65900))

(assert (= (and d!20726 c!4790) b!65901))

(assert (= (and d!20726 (not c!4790)) b!65902))

(declare-fun m!104769 () Bool)

(assert (=> b!65901 m!104769))

(declare-fun m!104771 () Bool)

(assert (=> b!65902 m!104771))

(declare-fun m!104773 () Bool)

(assert (=> b!65900 m!104773))

(declare-fun m!104775 () Bool)

(assert (=> b!65900 m!104775))

(assert (=> b!65424 d!20726))

(declare-fun b!65905 () Bool)

(declare-fun e!43304 () Bool)

(declare-fun lt!104670 () List!700)

(assert (=> b!65905 (= e!43304 (isEmpty!206 lt!104670))))

(declare-fun b!65906 () Bool)

(assert (=> b!65906 (= e!43304 (> (length!328 lt!104670) 0))))

(declare-fun d!20728 () Bool)

(assert (=> d!20728 e!43304))

(declare-fun c!4792 () Bool)

(assert (=> d!20728 (= c!4792 (= lt!103648 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43303 () tuple2!5834)

(assert (=> d!20728 (= lt!104670 (_1!3028 e!43303))))

(declare-fun c!4793 () Bool)

(assert (=> d!20728 (= c!4793 (= lt!103648 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20728 (bvsge lt!103648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20728 (= (bitStreamReadBitsIntoList!0 (_2!3017 lt!103646) (_1!3018 lt!103644) lt!103648) lt!104670)))

(declare-fun b!65903 () Bool)

(assert (=> b!65903 (= e!43303 (tuple2!5835 Nil!697 (_1!3018 lt!103644)))))

(declare-fun b!65904 () Bool)

(declare-fun lt!104669 () tuple2!5836)

(declare-fun lt!104671 () (_ BitVec 64))

(assert (=> b!65904 (= e!43303 (tuple2!5835 (Cons!696 (_1!3029 lt!104669) (bitStreamReadBitsIntoList!0 (_2!3017 lt!103646) (_2!3029 lt!104669) (bvsub lt!103648 lt!104671))) (_2!3029 lt!104669)))))

(assert (=> b!65904 (= lt!104669 (readBit!0 (_1!3018 lt!103644)))))

(assert (=> b!65904 (= lt!104671 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20728 c!4793) b!65903))

(assert (= (and d!20728 (not c!4793)) b!65904))

(assert (= (and d!20728 c!4792) b!65905))

(assert (= (and d!20728 (not c!4792)) b!65906))

(declare-fun m!104777 () Bool)

(assert (=> b!65905 m!104777))

(declare-fun m!104779 () Bool)

(assert (=> b!65906 m!104779))

(declare-fun m!104781 () Bool)

(assert (=> b!65904 m!104781))

(declare-fun m!104783 () Bool)

(assert (=> b!65904 m!104783))

(assert (=> b!65424 d!20728))

(declare-fun d!20730 () Bool)

(assert (=> d!20730 (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 (_2!3017 lt!103641))) ((_ sign_extend 32) (currentBit!3347 (_2!3017 lt!103641))) lt!103648)))

(declare-fun lt!104672 () Unit!4423)

(assert (=> d!20730 (= lt!104672 (choose!9 (_2!3017 lt!103641) (buf!1686 (_2!3017 lt!103646)) lt!103648 (BitStream!2251 (buf!1686 (_2!3017 lt!103646)) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641)))))))

(assert (=> d!20730 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3017 lt!103641) (buf!1686 (_2!3017 lt!103646)) lt!103648) lt!104672)))

(declare-fun bs!5045 () Bool)

(assert (= bs!5045 d!20730))

(assert (=> bs!5045 m!103851))

(declare-fun m!104785 () Bool)

(assert (=> bs!5045 m!104785))

(assert (=> b!65424 d!20730))

(declare-fun b!65907 () Bool)

(declare-fun e!43305 () Unit!4423)

(declare-fun lt!104688 () Unit!4423)

(assert (=> b!65907 (= e!43305 lt!104688)))

(declare-fun lt!104690 () (_ BitVec 64))

(assert (=> b!65907 (= lt!104690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104689 () (_ BitVec 64))

(assert (=> b!65907 (= lt!104689 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))))))

(assert (=> b!65907 (= lt!104688 (arrayBitRangesEqSymmetric!0 (buf!1686 (_2!3017 lt!103641)) (buf!1686 (_2!3017 lt!103646)) lt!104690 lt!104689))))

(assert (=> b!65907 (arrayBitRangesEq!0 (buf!1686 (_2!3017 lt!103646)) (buf!1686 (_2!3017 lt!103641)) lt!104690 lt!104689)))

(declare-fun b!65909 () Bool)

(declare-fun res!54613 () Bool)

(declare-fun e!43306 () Bool)

(assert (=> b!65909 (=> (not res!54613) (not e!43306))))

(declare-fun lt!104681 () tuple2!5814)

(assert (=> b!65909 (= res!54613 (isPrefixOf!0 (_2!3018 lt!104681) (_2!3017 lt!103646)))))

(declare-fun b!65910 () Bool)

(declare-fun res!54615 () Bool)

(assert (=> b!65910 (=> (not res!54615) (not e!43306))))

(assert (=> b!65910 (= res!54615 (isPrefixOf!0 (_1!3018 lt!104681) (_2!3017 lt!103641)))))

(declare-fun b!65911 () Bool)

(declare-fun Unit!4453 () Unit!4423)

(assert (=> b!65911 (= e!43305 Unit!4453)))

(declare-fun d!20732 () Bool)

(assert (=> d!20732 e!43306))

(declare-fun res!54614 () Bool)

(assert (=> d!20732 (=> (not res!54614) (not e!43306))))

(assert (=> d!20732 (= res!54614 (isPrefixOf!0 (_1!3018 lt!104681) (_2!3018 lt!104681)))))

(declare-fun lt!104676 () BitStream!2250)

(assert (=> d!20732 (= lt!104681 (tuple2!5815 lt!104676 (_2!3017 lt!103646)))))

(declare-fun lt!104675 () Unit!4423)

(declare-fun lt!104685 () Unit!4423)

(assert (=> d!20732 (= lt!104675 lt!104685)))

(assert (=> d!20732 (isPrefixOf!0 lt!104676 (_2!3017 lt!103646))))

(assert (=> d!20732 (= lt!104685 (lemmaIsPrefixTransitive!0 lt!104676 (_2!3017 lt!103646) (_2!3017 lt!103646)))))

(declare-fun lt!104680 () Unit!4423)

(declare-fun lt!104677 () Unit!4423)

(assert (=> d!20732 (= lt!104680 lt!104677)))

(assert (=> d!20732 (isPrefixOf!0 lt!104676 (_2!3017 lt!103646))))

(assert (=> d!20732 (= lt!104677 (lemmaIsPrefixTransitive!0 lt!104676 (_2!3017 lt!103641) (_2!3017 lt!103646)))))

(declare-fun lt!104692 () Unit!4423)

(assert (=> d!20732 (= lt!104692 e!43305)))

(declare-fun c!4794 () Bool)

(assert (=> d!20732 (= c!4794 (not (= (size!1305 (buf!1686 (_2!3017 lt!103641))) #b00000000000000000000000000000000)))))

(declare-fun lt!104679 () Unit!4423)

(declare-fun lt!104673 () Unit!4423)

(assert (=> d!20732 (= lt!104679 lt!104673)))

(assert (=> d!20732 (isPrefixOf!0 (_2!3017 lt!103646) (_2!3017 lt!103646))))

(assert (=> d!20732 (= lt!104673 (lemmaIsPrefixRefl!0 (_2!3017 lt!103646)))))

(declare-fun lt!104678 () Unit!4423)

(declare-fun lt!104683 () Unit!4423)

(assert (=> d!20732 (= lt!104678 lt!104683)))

(assert (=> d!20732 (= lt!104683 (lemmaIsPrefixRefl!0 (_2!3017 lt!103646)))))

(declare-fun lt!104674 () Unit!4423)

(declare-fun lt!104691 () Unit!4423)

(assert (=> d!20732 (= lt!104674 lt!104691)))

(assert (=> d!20732 (isPrefixOf!0 lt!104676 lt!104676)))

(assert (=> d!20732 (= lt!104691 (lemmaIsPrefixRefl!0 lt!104676))))

(declare-fun lt!104682 () Unit!4423)

(declare-fun lt!104686 () Unit!4423)

(assert (=> d!20732 (= lt!104682 lt!104686)))

(assert (=> d!20732 (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!103641))))

(assert (=> d!20732 (= lt!104686 (lemmaIsPrefixRefl!0 (_2!3017 lt!103641)))))

(assert (=> d!20732 (= lt!104676 (BitStream!2251 (buf!1686 (_2!3017 lt!103646)) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))))))

(assert (=> d!20732 (isPrefixOf!0 (_2!3017 lt!103641) (_2!3017 lt!103646))))

(assert (=> d!20732 (= (reader!0 (_2!3017 lt!103641) (_2!3017 lt!103646)) lt!104681)))

(declare-fun lt!104687 () (_ BitVec 64))

(declare-fun lt!104684 () (_ BitVec 64))

(declare-fun b!65908 () Bool)

(assert (=> b!65908 (= e!43306 (= (_1!3018 lt!104681) (withMovedBitIndex!0 (_2!3018 lt!104681) (bvsub lt!104687 lt!104684))))))

(assert (=> b!65908 (or (= (bvand lt!104687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104687 lt!104684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65908 (= lt!104684 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646))))))

(assert (=> b!65908 (= lt!104687 (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103641))) (currentByte!3352 (_2!3017 lt!103641)) (currentBit!3347 (_2!3017 lt!103641))))))

(assert (= (and d!20732 c!4794) b!65907))

(assert (= (and d!20732 (not c!4794)) b!65911))

(assert (= (and d!20732 res!54614) b!65910))

(assert (= (and b!65910 res!54615) b!65909))

(assert (= (and b!65909 res!54613) b!65908))

(declare-fun m!104787 () Bool)

(assert (=> b!65909 m!104787))

(assert (=> d!20732 m!104745))

(assert (=> d!20732 m!104291))

(declare-fun m!104789 () Bool)

(assert (=> d!20732 m!104789))

(declare-fun m!104791 () Bool)

(assert (=> d!20732 m!104791))

(declare-fun m!104793 () Bool)

(assert (=> d!20732 m!104793))

(assert (=> d!20732 m!104753))

(declare-fun m!104795 () Bool)

(assert (=> d!20732 m!104795))

(declare-fun m!104797 () Bool)

(assert (=> d!20732 m!104797))

(assert (=> d!20732 m!104283))

(declare-fun m!104799 () Bool)

(assert (=> d!20732 m!104799))

(assert (=> d!20732 m!103899))

(assert (=> b!65907 m!103917))

(declare-fun m!104801 () Bool)

(assert (=> b!65907 m!104801))

(declare-fun m!104803 () Bool)

(assert (=> b!65907 m!104803))

(declare-fun m!104805 () Bool)

(assert (=> b!65908 m!104805))

(assert (=> b!65908 m!103847))

(assert (=> b!65908 m!103917))

(declare-fun m!104807 () Bool)

(assert (=> b!65910 m!104807))

(assert (=> b!65424 d!20732))

(declare-fun d!20734 () Bool)

(assert (=> d!20734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_2!3017 lt!103646)))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5046 () Bool)

(assert (= bs!5046 d!20734))

(declare-fun m!104809 () Bool)

(assert (=> bs!5046 m!104809))

(assert (=> b!65424 d!20734))

(declare-fun d!20736 () Bool)

(declare-fun res!54617 () Bool)

(declare-fun e!43307 () Bool)

(assert (=> d!20736 (=> (not res!54617) (not e!43307))))

(assert (=> d!20736 (= res!54617 (= (size!1305 (buf!1686 (_1!3018 lt!103644))) (size!1305 (buf!1686 (_2!3017 lt!103646)))))))

(assert (=> d!20736 (= (isPrefixOf!0 (_1!3018 lt!103644) (_2!3017 lt!103646)) e!43307)))

(declare-fun b!65912 () Bool)

(declare-fun res!54616 () Bool)

(assert (=> b!65912 (=> (not res!54616) (not e!43307))))

(assert (=> b!65912 (= res!54616 (bvsle (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103644))) (currentByte!3352 (_1!3018 lt!103644)) (currentBit!3347 (_1!3018 lt!103644))) (bitIndex!0 (size!1305 (buf!1686 (_2!3017 lt!103646))) (currentByte!3352 (_2!3017 lt!103646)) (currentBit!3347 (_2!3017 lt!103646)))))))

(declare-fun b!65913 () Bool)

(declare-fun e!43308 () Bool)

(assert (=> b!65913 (= e!43307 e!43308)))

(declare-fun res!54618 () Bool)

(assert (=> b!65913 (=> res!54618 e!43308)))

(assert (=> b!65913 (= res!54618 (= (size!1305 (buf!1686 (_1!3018 lt!103644))) #b00000000000000000000000000000000))))

(declare-fun b!65914 () Bool)

(assert (=> b!65914 (= e!43308 (arrayBitRangesEq!0 (buf!1686 (_1!3018 lt!103644)) (buf!1686 (_2!3017 lt!103646)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103644))) (currentByte!3352 (_1!3018 lt!103644)) (currentBit!3347 (_1!3018 lt!103644)))))))

(assert (= (and d!20736 res!54617) b!65912))

(assert (= (and b!65912 res!54616) b!65913))

(assert (= (and b!65913 (not res!54618)) b!65914))

(assert (=> b!65912 m!103925))

(assert (=> b!65912 m!103847))

(assert (=> b!65914 m!103925))

(assert (=> b!65914 m!103925))

(declare-fun m!104811 () Bool)

(assert (=> b!65914 m!104811))

(assert (=> b!65407 d!20736))

(declare-fun d!20738 () Bool)

(declare-fun res!54620 () Bool)

(declare-fun e!43309 () Bool)

(assert (=> d!20738 (=> (not res!54620) (not e!43309))))

(assert (=> d!20738 (= res!54620 (= (size!1305 (buf!1686 thiss!1379)) (size!1305 (buf!1686 thiss!1379))))))

(assert (=> d!20738 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43309)))

(declare-fun b!65915 () Bool)

(declare-fun res!54619 () Bool)

(assert (=> b!65915 (=> (not res!54619) (not e!43309))))

(assert (=> b!65915 (= res!54619 (bvsle (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)) (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379))))))

(declare-fun b!65916 () Bool)

(declare-fun e!43310 () Bool)

(assert (=> b!65916 (= e!43309 e!43310)))

(declare-fun res!54621 () Bool)

(assert (=> b!65916 (=> res!54621 e!43310)))

(assert (=> b!65916 (= res!54621 (= (size!1305 (buf!1686 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65917 () Bool)

(assert (=> b!65917 (= e!43310 (arrayBitRangesEq!0 (buf!1686 thiss!1379) (buf!1686 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379))))))

(assert (= (and d!20738 res!54620) b!65915))

(assert (= (and b!65915 res!54619) b!65916))

(assert (= (and b!65916 (not res!54621)) b!65917))

(assert (=> b!65915 m!103875))

(assert (=> b!65915 m!103875))

(assert (=> b!65917 m!103875))

(assert (=> b!65917 m!103875))

(declare-fun m!104813 () Bool)

(assert (=> b!65917 m!104813))

(assert (=> b!65406 d!20738))

(declare-fun d!20740 () Bool)

(assert (=> d!20740 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!104695 () Unit!4423)

(declare-fun choose!11 (BitStream!2250) Unit!4423)

(assert (=> d!20740 (= lt!104695 (choose!11 thiss!1379))))

(assert (=> d!20740 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!104695)))

(declare-fun bs!5048 () Bool)

(assert (= bs!5048 d!20740))

(assert (=> bs!5048 m!103871))

(declare-fun m!104815 () Bool)

(assert (=> bs!5048 m!104815))

(assert (=> b!65406 d!20740))

(declare-fun d!20742 () Bool)

(declare-fun e!43311 () Bool)

(assert (=> d!20742 e!43311))

(declare-fun res!54622 () Bool)

(assert (=> d!20742 (=> (not res!54622) (not e!43311))))

(declare-fun lt!104698 () (_ BitVec 64))

(declare-fun lt!104696 () (_ BitVec 64))

(declare-fun lt!104699 () (_ BitVec 64))

(assert (=> d!20742 (= res!54622 (= lt!104698 (bvsub lt!104696 lt!104699)))))

(assert (=> d!20742 (or (= (bvand lt!104696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104696 lt!104699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20742 (= lt!104699 (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 thiss!1379))) ((_ sign_extend 32) (currentByte!3352 thiss!1379)) ((_ sign_extend 32) (currentBit!3347 thiss!1379))))))

(declare-fun lt!104697 () (_ BitVec 64))

(declare-fun lt!104700 () (_ BitVec 64))

(assert (=> d!20742 (= lt!104696 (bvmul lt!104697 lt!104700))))

(assert (=> d!20742 (or (= lt!104697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104700 (bvsdiv (bvmul lt!104697 lt!104700) lt!104697)))))

(assert (=> d!20742 (= lt!104700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20742 (= lt!104697 ((_ sign_extend 32) (size!1305 (buf!1686 thiss!1379))))))

(assert (=> d!20742 (= lt!104698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3352 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3347 thiss!1379))))))

(assert (=> d!20742 (invariant!0 (currentBit!3347 thiss!1379) (currentByte!3352 thiss!1379) (size!1305 (buf!1686 thiss!1379)))))

(assert (=> d!20742 (= (bitIndex!0 (size!1305 (buf!1686 thiss!1379)) (currentByte!3352 thiss!1379) (currentBit!3347 thiss!1379)) lt!104698)))

(declare-fun b!65918 () Bool)

(declare-fun res!54623 () Bool)

(assert (=> b!65918 (=> (not res!54623) (not e!43311))))

(assert (=> b!65918 (= res!54623 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104698))))

(declare-fun b!65919 () Bool)

(declare-fun lt!104701 () (_ BitVec 64))

(assert (=> b!65919 (= e!43311 (bvsle lt!104698 (bvmul lt!104701 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65919 (or (= lt!104701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104701)))))

(assert (=> b!65919 (= lt!104701 ((_ sign_extend 32) (size!1305 (buf!1686 thiss!1379))))))

(assert (= (and d!20742 res!54622) b!65918))

(assert (= (and b!65918 res!54623) b!65919))

(assert (=> d!20742 m!104053))

(assert (=> d!20742 m!104187))

(assert (=> b!65406 d!20742))

(declare-fun d!20744 () Bool)

(declare-fun e!43312 () Bool)

(assert (=> d!20744 e!43312))

(declare-fun res!54624 () Bool)

(assert (=> d!20744 (=> (not res!54624) (not e!43312))))

(declare-fun lt!104702 () (_ BitVec 64))

(declare-fun lt!104705 () (_ BitVec 64))

(declare-fun lt!104704 () (_ BitVec 64))

(assert (=> d!20744 (= res!54624 (= lt!104704 (bvsub lt!104702 lt!104705)))))

(assert (=> d!20744 (or (= (bvand lt!104702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104702 lt!104705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20744 (= lt!104705 (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103640)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103640))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103640)))))))

(declare-fun lt!104703 () (_ BitVec 64))

(declare-fun lt!104706 () (_ BitVec 64))

(assert (=> d!20744 (= lt!104702 (bvmul lt!104703 lt!104706))))

(assert (=> d!20744 (or (= lt!104703 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104706 (bvsdiv (bvmul lt!104703 lt!104706) lt!104703)))))

(assert (=> d!20744 (= lt!104706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20744 (= lt!104703 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103640)))))))

(assert (=> d!20744 (= lt!104704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103640))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103640)))))))

(assert (=> d!20744 (invariant!0 (currentBit!3347 (_1!3018 lt!103640)) (currentByte!3352 (_1!3018 lt!103640)) (size!1305 (buf!1686 (_1!3018 lt!103640))))))

(assert (=> d!20744 (= (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103640))) (currentByte!3352 (_1!3018 lt!103640)) (currentBit!3347 (_1!3018 lt!103640))) lt!104704)))

(declare-fun b!65920 () Bool)

(declare-fun res!54625 () Bool)

(assert (=> b!65920 (=> (not res!54625) (not e!43312))))

(assert (=> b!65920 (= res!54625 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104704))))

(declare-fun b!65921 () Bool)

(declare-fun lt!104707 () (_ BitVec 64))

(assert (=> b!65921 (= e!43312 (bvsle lt!104704 (bvmul lt!104707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65921 (or (= lt!104707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104707)))))

(assert (=> b!65921 (= lt!104707 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103640)))))))

(assert (= (and d!20744 res!54624) b!65920))

(assert (= (and b!65920 res!54625) b!65921))

(assert (=> d!20744 m!104025))

(declare-fun m!104817 () Bool)

(assert (=> d!20744 m!104817))

(assert (=> b!65417 d!20744))

(declare-fun d!20746 () Bool)

(declare-fun e!43313 () Bool)

(assert (=> d!20746 e!43313))

(declare-fun res!54626 () Bool)

(assert (=> d!20746 (=> (not res!54626) (not e!43313))))

(declare-fun lt!104710 () (_ BitVec 64))

(declare-fun lt!104711 () (_ BitVec 64))

(declare-fun lt!104708 () (_ BitVec 64))

(assert (=> d!20746 (= res!54626 (= lt!104710 (bvsub lt!104708 lt!104711)))))

(assert (=> d!20746 (or (= (bvand lt!104708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104711 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104708 lt!104711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20746 (= lt!104711 (remainingBits!0 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103644)))) ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103644))) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103644)))))))

(declare-fun lt!104709 () (_ BitVec 64))

(declare-fun lt!104712 () (_ BitVec 64))

(assert (=> d!20746 (= lt!104708 (bvmul lt!104709 lt!104712))))

(assert (=> d!20746 (or (= lt!104709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104712 (bvsdiv (bvmul lt!104709 lt!104712) lt!104709)))))

(assert (=> d!20746 (= lt!104712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20746 (= lt!104709 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103644)))))))

(assert (=> d!20746 (= lt!104710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3352 (_1!3018 lt!103644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3347 (_1!3018 lt!103644)))))))

(assert (=> d!20746 (invariant!0 (currentBit!3347 (_1!3018 lt!103644)) (currentByte!3352 (_1!3018 lt!103644)) (size!1305 (buf!1686 (_1!3018 lt!103644))))))

(assert (=> d!20746 (= (bitIndex!0 (size!1305 (buf!1686 (_1!3018 lt!103644))) (currentByte!3352 (_1!3018 lt!103644)) (currentBit!3347 (_1!3018 lt!103644))) lt!104710)))

(declare-fun b!65922 () Bool)

(declare-fun res!54627 () Bool)

(assert (=> b!65922 (=> (not res!54627) (not e!43313))))

(assert (=> b!65922 (= res!54627 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104710))))

(declare-fun b!65923 () Bool)

(declare-fun lt!104713 () (_ BitVec 64))

(assert (=> b!65923 (= e!43313 (bvsle lt!104710 (bvmul lt!104713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65923 (or (= lt!104713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104713)))))

(assert (=> b!65923 (= lt!104713 ((_ sign_extend 32) (size!1305 (buf!1686 (_1!3018 lt!103644)))))))

(assert (= (and d!20746 res!54626) b!65922))

(assert (= (and b!65922 res!54627) b!65923))

(assert (=> d!20746 m!104737))

(declare-fun m!104819 () Bool)

(assert (=> d!20746 m!104819))

(assert (=> b!65417 d!20746))

(declare-fun d!20748 () Bool)

(assert (=> d!20748 (= (invariant!0 (currentBit!3347 (_2!3017 lt!103646)) (currentByte!3352 (_2!3017 lt!103646)) (size!1305 (buf!1686 (_2!3017 lt!103646)))) (and (bvsge (currentBit!3347 (_2!3017 lt!103646)) #b00000000000000000000000000000000) (bvslt (currentBit!3347 (_2!3017 lt!103646)) #b00000000000000000000000000001000) (bvsge (currentByte!3352 (_2!3017 lt!103646)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3352 (_2!3017 lt!103646)) (size!1305 (buf!1686 (_2!3017 lt!103646)))) (and (= (currentBit!3347 (_2!3017 lt!103646)) #b00000000000000000000000000000000) (= (currentByte!3352 (_2!3017 lt!103646)) (size!1305 (buf!1686 (_2!3017 lt!103646))))))))))

(assert (=> b!65416 d!20748))

(check-sat (not b!65891) (not b!65905) (not d!20576) (not b!65894) (not d!20574) (not d!20500) (not b!65897) (not d!20746) (not b!65912) (not bm!841) (not d!20744) (not b!65915) (not b!65907) (not b!65909) (not b!65890) (not d!20594) (not b!65914) (not b!65662) (not b!65904) (not d!20502) (not b!65917) (not b!65886) (not b!65740) (not b!65658) (not d!20528) (not d!20598) (not b!65516) (not b!65902) (not b!65539) (not d!20580) (not d!20524) (not b!65657) (not b!65896) (not b!65906) (not b!65908) (not d!20530) (not b!65736) (not b!65521) (not d!20732) (not b!65653) (not b!65659) (not b!65895) (not d!20734) (not d!20618) (not b!65519) (not b!65738) (not b!65538) (not d!20614) (not b!65654) (not b!65652) (not d!20730) (not b!65655) (not b!65518) (not d!20532) (not b!65910) (not b!65545) (not b!65540) (not b!65888) (not b!65900) (not d!20718) (not b!65527) (not b!65664) (not d!20740) (not d!20724) (not b!65734) (not d!20722) (not b!65735) (not b!65889) (not b!65733) (not b!65901) (not d!20584) (not b!65887) (not b!65656) (not d!20720) (not b!65542) (not d!20742) (not b!65537))
(check-sat)
