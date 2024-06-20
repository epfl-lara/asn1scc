; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12768 () Bool)

(assert start!12768)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!65338 () Bool)

(declare-fun lt!103586 () (_ BitVec 64))

(declare-datatypes ((array!2833 0))(
  ( (array!2834 (arr!1868 (Array (_ BitVec 32) (_ BitVec 8))) (size!1304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2248 0))(
  ( (BitStream!2249 (buf!1685 array!2833) (currentByte!3351 (_ BitVec 32)) (currentBit!3346 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4421 0))(
  ( (Unit!4422) )
))
(declare-datatypes ((tuple2!5808 0))(
  ( (tuple2!5809 (_1!3015 Unit!4421) (_2!3015 BitStream!2248)) )
))
(declare-fun lt!103595 () tuple2!5808)

(declare-fun e!43020 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!65338 (= e!43020 (= lt!103586 (bvsub (bvsub (bvadd (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65339 () Bool)

(declare-fun e!43018 () Bool)

(declare-datatypes ((tuple2!5810 0))(
  ( (tuple2!5811 (_1!3016 BitStream!2248) (_2!3016 BitStream!2248)) )
))
(declare-fun lt!103593 () tuple2!5810)

(declare-fun lt!103600 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65339 (= e!43018 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103593)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103593))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103593))) lt!103600))))

(declare-fun b!65340 () Bool)

(declare-fun res!54194 () Bool)

(declare-fun e!43022 () Bool)

(assert (=> b!65340 (=> res!54194 e!43022)))

(declare-fun lt!103591 () tuple2!5808)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!65340 (= res!54194 (not (invariant!0 (currentBit!3346 (_2!3015 lt!103591)) (currentByte!3351 (_2!3015 lt!103591)) (size!1304 (buf!1685 (_2!3015 lt!103591))))))))

(declare-fun b!65341 () Bool)

(declare-fun e!43016 () Bool)

(declare-fun e!43021 () Bool)

(assert (=> b!65341 (= e!43016 (not e!43021))))

(declare-fun res!54192 () Bool)

(assert (=> b!65341 (=> res!54192 e!43021)))

(assert (=> b!65341 (= res!54192 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2248)

(declare-fun isPrefixOf!0 (BitStream!2248 BitStream!2248) Bool)

(assert (=> b!65341 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!103585 () Unit!4421)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2248) Unit!4421)

(assert (=> b!65341 (= lt!103585 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!103590 () (_ BitVec 64))

(assert (=> b!65341 (= lt!103590 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(declare-fun b!65342 () Bool)

(declare-fun res!54195 () Bool)

(assert (=> b!65342 (=> res!54195 e!43018)))

(declare-datatypes ((List!699 0))(
  ( (Nil!696) (Cons!695 (h!814 Bool) (t!1449 List!699)) )
))
(declare-fun lt!103594 () List!699)

(declare-fun length!327 (List!699) Int)

(assert (=> b!65342 (= res!54195 (<= (length!327 lt!103594) 0))))

(declare-fun b!65343 () Bool)

(declare-fun e!43017 () Bool)

(assert (=> b!65343 (= e!43022 e!43017)))

(declare-fun res!54183 () Bool)

(assert (=> b!65343 (=> res!54183 e!43017)))

(assert (=> b!65343 (= res!54183 (not (= (size!1304 (buf!1685 (_2!3015 lt!103595))) (size!1304 (buf!1685 (_2!3015 lt!103591))))))))

(assert (=> b!65343 e!43020))

(declare-fun res!54196 () Bool)

(assert (=> b!65343 (=> (not res!54196) (not e!43020))))

(assert (=> b!65343 (= res!54196 (= (size!1304 (buf!1685 (_2!3015 lt!103591))) (size!1304 (buf!1685 thiss!1379))))))

(declare-fun b!65344 () Bool)

(declare-fun res!54186 () Bool)

(assert (=> b!65344 (=> res!54186 e!43018)))

(declare-fun lt!103598 () tuple2!5810)

(assert (=> b!65344 (= res!54186 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103598))) (currentByte!3351 (_1!3016 lt!103598)) (currentBit!3346 (_1!3016 lt!103598)))) (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103593))) (currentByte!3351 (_1!3016 lt!103593)) (currentBit!3346 (_1!3016 lt!103593))))))))

(declare-fun b!65345 () Bool)

(declare-fun res!54187 () Bool)

(assert (=> b!65345 (=> res!54187 e!43018)))

(assert (=> b!65345 (= res!54187 (or (not (= (buf!1685 (_1!3016 lt!103598)) (buf!1685 (_1!3016 lt!103593)))) (not (= (buf!1685 (_1!3016 lt!103598)) (buf!1685 (_2!3015 lt!103591)))) (bvsge lt!103586 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!65347 () Bool)

(declare-fun res!54184 () Bool)

(assert (=> b!65347 (=> res!54184 e!43017)))

(assert (=> b!65347 (= res!54184 (not (invariant!0 (currentBit!3346 (_2!3015 lt!103595)) (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103591))))))))

(declare-fun srcBuffer!2 () array!2833)

(declare-fun lt!103587 () tuple2!5810)

(declare-fun e!43023 () Bool)

(declare-fun b!65348 () Bool)

(declare-fun head!518 (List!699) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2248 array!2833 (_ BitVec 64) (_ BitVec 64)) List!699)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2248 BitStream!2248 (_ BitVec 64)) List!699)

(assert (=> b!65348 (= e!43023 (= (head!518 (byteArrayBitContentToList!0 (_2!3015 lt!103595) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!518 (bitStreamReadBitsIntoList!0 (_2!3015 lt!103595) (_1!3016 lt!103587) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!65349 () Bool)

(declare-fun res!54179 () Bool)

(assert (=> b!65349 (=> res!54179 e!43018)))

(assert (=> b!65349 (= res!54179 (not (isPrefixOf!0 (_1!3016 lt!103598) (_1!3016 lt!103593))))))

(declare-fun b!65350 () Bool)

(declare-fun res!54190 () Bool)

(assert (=> b!65350 (=> res!54190 e!43018)))

(assert (=> b!65350 (= res!54190 (not (isPrefixOf!0 (_1!3016 lt!103598) (_2!3015 lt!103591))))))

(declare-fun b!65351 () Bool)

(declare-fun res!54181 () Bool)

(assert (=> b!65351 (=> res!54181 e!43018)))

(assert (=> b!65351 (= res!54181 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103598)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103598))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103598))) (bvsub to!314 i!635))))))

(declare-fun b!65352 () Bool)

(declare-fun e!43014 () Bool)

(assert (=> b!65352 (= e!43021 e!43014)))

(declare-fun res!54178 () Bool)

(assert (=> b!65352 (=> res!54178 e!43014)))

(assert (=> b!65352 (= res!54178 (not (isPrefixOf!0 thiss!1379 (_2!3015 lt!103595))))))

(assert (=> b!65352 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!103600)))

(assert (=> b!65352 (= lt!103600 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103599 () Unit!4421)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2248 BitStream!2248 (_ BitVec 64) (_ BitVec 64)) Unit!4421)

(assert (=> b!65352 (= lt!103599 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3015 lt!103595) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2248 (_ BitVec 8) (_ BitVec 32)) tuple2!5808)

(assert (=> b!65352 (= lt!103595 (appendBitFromByte!0 thiss!1379 (select (arr!1868 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!65353 () Bool)

(declare-fun res!54185 () Bool)

(assert (=> b!65353 (=> res!54185 e!43017)))

(assert (=> b!65353 (= res!54185 (not (invariant!0 (currentBit!3346 (_2!3015 lt!103595)) (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103595))))))))

(declare-fun b!65354 () Bool)

(assert (=> b!65354 (= e!43017 e!43018)))

(declare-fun res!54193 () Bool)

(assert (=> b!65354 (=> res!54193 e!43018)))

(assert (=> b!65354 (= res!54193 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103592 () List!699)

(assert (=> b!65354 (= lt!103592 (bitStreamReadBitsIntoList!0 (_2!3015 lt!103591) (_1!3016 lt!103593) lt!103600))))

(assert (=> b!65354 (= lt!103594 (bitStreamReadBitsIntoList!0 (_2!3015 lt!103591) (_1!3016 lt!103598) (bvsub to!314 i!635)))))

(assert (=> b!65354 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!103600)))

(declare-fun lt!103589 () Unit!4421)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2248 array!2833 (_ BitVec 64)) Unit!4421)

(assert (=> b!65354 (= lt!103589 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3015 lt!103595) (buf!1685 (_2!3015 lt!103591)) lt!103600))))

(declare-fun reader!0 (BitStream!2248 BitStream!2248) tuple2!5810)

(assert (=> b!65354 (= lt!103593 (reader!0 (_2!3015 lt!103595) (_2!3015 lt!103591)))))

(assert (=> b!65354 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!103596 () Unit!4421)

(assert (=> b!65354 (= lt!103596 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1685 (_2!3015 lt!103591)) (bvsub to!314 i!635)))))

(assert (=> b!65354 (= lt!103598 (reader!0 thiss!1379 (_2!3015 lt!103591)))))

(declare-fun b!65355 () Bool)

(declare-fun res!54198 () Bool)

(assert (=> b!65355 (=> res!54198 e!43018)))

(assert (=> b!65355 (= res!54198 (not (isPrefixOf!0 (_1!3016 lt!103593) (_2!3015 lt!103591))))))

(declare-fun b!65356 () Bool)

(declare-fun res!54191 () Bool)

(assert (=> b!65356 (=> (not res!54191) (not e!43016))))

(assert (=> b!65356 (= res!54191 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 thiss!1379))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!65357 () Bool)

(declare-fun res!54189 () Bool)

(assert (=> b!65357 (=> res!54189 e!43022)))

(assert (=> b!65357 (= res!54189 (not (= (size!1304 (buf!1685 thiss!1379)) (size!1304 (buf!1685 (_2!3015 lt!103591))))))))

(declare-fun b!65358 () Bool)

(declare-fun e!43019 () Bool)

(assert (=> b!65358 (= e!43014 e!43019)))

(declare-fun res!54180 () Bool)

(assert (=> b!65358 (=> res!54180 e!43019)))

(assert (=> b!65358 (= res!54180 (not (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!103591))))))

(assert (=> b!65358 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103591))))

(declare-fun lt!103597 () Unit!4421)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2248 BitStream!2248 BitStream!2248) Unit!4421)

(assert (=> b!65358 (= lt!103597 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3015 lt!103595) (_2!3015 lt!103591)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2248 array!2833 (_ BitVec 64) (_ BitVec 64)) tuple2!5808)

(assert (=> b!65358 (= lt!103591 (appendBitsMSBFirstLoop!0 (_2!3015 lt!103595) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!65358 e!43023))

(declare-fun res!54197 () Bool)

(assert (=> b!65358 (=> (not res!54197) (not e!43023))))

(assert (=> b!65358 (= res!54197 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103588 () Unit!4421)

(assert (=> b!65358 (= lt!103588 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1685 (_2!3015 lt!103595)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!65358 (= lt!103587 (reader!0 thiss!1379 (_2!3015 lt!103595)))))

(declare-fun b!65359 () Bool)

(assert (=> b!65359 (= e!43019 e!43022)))

(declare-fun res!54182 () Bool)

(assert (=> b!65359 (=> res!54182 e!43022)))

(assert (=> b!65359 (= res!54182 (not (= lt!103586 (bvsub (bvadd lt!103590 to!314) i!635))))))

(assert (=> b!65359 (= lt!103586 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591))))))

(declare-fun res!54188 () Bool)

(assert (=> start!12768 (=> (not res!54188) (not e!43016))))

(assert (=> start!12768 (= res!54188 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1304 srcBuffer!2))))))))

(assert (=> start!12768 e!43016))

(assert (=> start!12768 true))

(declare-fun array_inv!1183 (array!2833) Bool)

(assert (=> start!12768 (array_inv!1183 srcBuffer!2)))

(declare-fun e!43025 () Bool)

(declare-fun inv!12 (BitStream!2248) Bool)

(assert (=> start!12768 (and (inv!12 thiss!1379) e!43025)))

(declare-fun b!65346 () Bool)

(assert (=> b!65346 (= e!43025 (array_inv!1183 (buf!1685 thiss!1379)))))

(assert (= (and start!12768 res!54188) b!65356))

(assert (= (and b!65356 res!54191) b!65341))

(assert (= (and b!65341 (not res!54192)) b!65352))

(assert (= (and b!65352 (not res!54178)) b!65358))

(assert (= (and b!65358 res!54197) b!65348))

(assert (= (and b!65358 (not res!54180)) b!65359))

(assert (= (and b!65359 (not res!54182)) b!65340))

(assert (= (and b!65340 (not res!54194)) b!65357))

(assert (= (and b!65357 (not res!54189)) b!65343))

(assert (= (and b!65343 res!54196) b!65338))

(assert (= (and b!65343 (not res!54183)) b!65353))

(assert (= (and b!65353 (not res!54185)) b!65347))

(assert (= (and b!65347 (not res!54184)) b!65354))

(assert (= (and b!65354 (not res!54193)) b!65342))

(assert (= (and b!65342 (not res!54195)) b!65350))

(assert (= (and b!65350 (not res!54190)) b!65355))

(assert (= (and b!65355 (not res!54198)) b!65349))

(assert (= (and b!65349 (not res!54179)) b!65345))

(assert (= (and b!65345 (not res!54187)) b!65344))

(assert (= (and b!65344 (not res!54186)) b!65351))

(assert (= (and b!65351 (not res!54181)) b!65339))

(assert (= start!12768 b!65346))

(declare-fun m!103759 () Bool)

(assert (=> b!65352 m!103759))

(declare-fun m!103761 () Bool)

(assert (=> b!65352 m!103761))

(declare-fun m!103763 () Bool)

(assert (=> b!65352 m!103763))

(declare-fun m!103765 () Bool)

(assert (=> b!65352 m!103765))

(assert (=> b!65352 m!103763))

(declare-fun m!103767 () Bool)

(assert (=> b!65352 m!103767))

(declare-fun m!103769 () Bool)

(assert (=> b!65348 m!103769))

(assert (=> b!65348 m!103769))

(declare-fun m!103771 () Bool)

(assert (=> b!65348 m!103771))

(declare-fun m!103773 () Bool)

(assert (=> b!65348 m!103773))

(assert (=> b!65348 m!103773))

(declare-fun m!103775 () Bool)

(assert (=> b!65348 m!103775))

(declare-fun m!103777 () Bool)

(assert (=> b!65350 m!103777))

(declare-fun m!103779 () Bool)

(assert (=> b!65340 m!103779))

(declare-fun m!103781 () Bool)

(assert (=> b!65339 m!103781))

(declare-fun m!103783 () Bool)

(assert (=> b!65344 m!103783))

(declare-fun m!103785 () Bool)

(assert (=> b!65344 m!103785))

(declare-fun m!103787 () Bool)

(assert (=> b!65351 m!103787))

(declare-fun m!103789 () Bool)

(assert (=> b!65346 m!103789))

(declare-fun m!103791 () Bool)

(assert (=> b!65341 m!103791))

(declare-fun m!103793 () Bool)

(assert (=> b!65341 m!103793))

(declare-fun m!103795 () Bool)

(assert (=> b!65341 m!103795))

(declare-fun m!103797 () Bool)

(assert (=> b!65355 m!103797))

(declare-fun m!103799 () Bool)

(assert (=> b!65359 m!103799))

(declare-fun m!103801 () Bool)

(assert (=> b!65349 m!103801))

(declare-fun m!103803 () Bool)

(assert (=> b!65356 m!103803))

(declare-fun m!103805 () Bool)

(assert (=> start!12768 m!103805))

(declare-fun m!103807 () Bool)

(assert (=> start!12768 m!103807))

(declare-fun m!103809 () Bool)

(assert (=> b!65347 m!103809))

(declare-fun m!103811 () Bool)

(assert (=> b!65354 m!103811))

(declare-fun m!103813 () Bool)

(assert (=> b!65354 m!103813))

(declare-fun m!103815 () Bool)

(assert (=> b!65354 m!103815))

(declare-fun m!103817 () Bool)

(assert (=> b!65354 m!103817))

(declare-fun m!103819 () Bool)

(assert (=> b!65354 m!103819))

(declare-fun m!103821 () Bool)

(assert (=> b!65354 m!103821))

(declare-fun m!103823 () Bool)

(assert (=> b!65354 m!103823))

(declare-fun m!103825 () Bool)

(assert (=> b!65354 m!103825))

(declare-fun m!103827 () Bool)

(assert (=> b!65338 m!103827))

(declare-fun m!103829 () Bool)

(assert (=> b!65358 m!103829))

(declare-fun m!103831 () Bool)

(assert (=> b!65358 m!103831))

(declare-fun m!103833 () Bool)

(assert (=> b!65358 m!103833))

(declare-fun m!103835 () Bool)

(assert (=> b!65358 m!103835))

(declare-fun m!103837 () Bool)

(assert (=> b!65358 m!103837))

(declare-fun m!103839 () Bool)

(assert (=> b!65358 m!103839))

(declare-fun m!103841 () Bool)

(assert (=> b!65358 m!103841))

(declare-fun m!103843 () Bool)

(assert (=> b!65353 m!103843))

(declare-fun m!103845 () Bool)

(assert (=> b!65342 m!103845))

(push 1)

(assert (not b!65351))

(assert (not b!65344))

(assert (not b!65359))

(assert (not b!65354))

(assert (not b!65340))

(assert (not b!65338))

(assert (not b!65342))

(assert (not b!65358))

(assert (not b!65353))

(assert (not b!65347))

(assert (not b!65350))

(assert (not b!65355))

(assert (not b!65339))

(assert (not b!65341))

(assert (not b!65352))

(assert (not b!65348))

(assert (not b!65356))

(assert (not b!65346))

(assert (not b!65349))

(assert (not start!12768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!20492 () Bool)

(declare-fun size!1307 (List!699) Int)

(assert (=> d!20492 (= (length!327 lt!103594) (size!1307 lt!103594))))

(declare-fun bs!5004 () Bool)

(assert (= bs!5004 d!20492))

(declare-fun m!104023 () Bool)

(assert (=> bs!5004 m!104023))

(assert (=> b!65342 d!20492))

(declare-fun d!20496 () Bool)

(assert (=> d!20496 (= (invariant!0 (currentBit!3346 (_2!3015 lt!103595)) (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103595)))) (and (bvsge (currentBit!3346 (_2!3015 lt!103595)) #b00000000000000000000000000000000) (bvslt (currentBit!3346 (_2!3015 lt!103595)) #b00000000000000000000000000001000) (bvsge (currentByte!3351 (_2!3015 lt!103595)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103595)))) (and (= (currentBit!3346 (_2!3015 lt!103595)) #b00000000000000000000000000000000) (= (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103595))))))))))

(assert (=> b!65353 d!20496))

(declare-fun d!20498 () Bool)

(declare-fun res!54332 () Bool)

(declare-fun e!43103 () Bool)

(assert (=> d!20498 (=> (not res!54332) (not e!43103))))

(assert (=> d!20498 (= res!54332 (= (size!1304 (buf!1685 thiss!1379)) (size!1304 (buf!1685 (_2!3015 lt!103595)))))))

(assert (=> d!20498 (= (isPrefixOf!0 thiss!1379 (_2!3015 lt!103595)) e!43103)))

(declare-fun b!65498 () Bool)

(declare-fun res!54333 () Bool)

(assert (=> b!65498 (=> (not res!54333) (not e!43103))))

(assert (=> b!65498 (= res!54333 (bvsle (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595)))))))

(declare-fun b!65499 () Bool)

(declare-fun e!43102 () Bool)

(assert (=> b!65499 (= e!43103 e!43102)))

(declare-fun res!54331 () Bool)

(assert (=> b!65499 (=> res!54331 e!43102)))

(assert (=> b!65499 (= res!54331 (= (size!1304 (buf!1685 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65500 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2833 array!2833 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65500 (= e!43102 (arrayBitRangesEq!0 (buf!1685 thiss!1379) (buf!1685 (_2!3015 lt!103595)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379))))))

(assert (= (and d!20498 res!54332) b!65498))

(assert (= (and b!65498 res!54333) b!65499))

(assert (= (and b!65499 (not res!54331)) b!65500))

(assert (=> b!65498 m!103795))

(assert (=> b!65498 m!103827))

(assert (=> b!65500 m!103795))

(assert (=> b!65500 m!103795))

(declare-fun m!104027 () Bool)

(assert (=> b!65500 m!104027))

(assert (=> b!65352 d!20498))

(declare-fun d!20504 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20504 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!103600) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595)))) lt!103600))))

(declare-fun bs!5006 () Bool)

(assert (= bs!5006 d!20504))

(declare-fun m!104029 () Bool)

(assert (=> bs!5006 m!104029))

(assert (=> b!65352 d!20504))

(declare-fun d!20506 () Bool)

(declare-fun e!43106 () Bool)

(assert (=> d!20506 e!43106))

(declare-fun res!54336 () Bool)

(assert (=> d!20506 (=> (not res!54336) (not e!43106))))

(assert (=> d!20506 (= res!54336 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!103699 () Unit!4421)

(declare-fun choose!27 (BitStream!2248 BitStream!2248 (_ BitVec 64) (_ BitVec 64)) Unit!4421)

(assert (=> d!20506 (= lt!103699 (choose!27 thiss!1379 (_2!3015 lt!103595) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20506 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20506 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3015 lt!103595) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103699)))

(declare-fun b!65503 () Bool)

(assert (=> b!65503 (= e!43106 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20506 res!54336) b!65503))

(declare-fun m!104031 () Bool)

(assert (=> d!20506 m!104031))

(declare-fun m!104033 () Bool)

(assert (=> b!65503 m!104033))

(assert (=> b!65352 d!20506))

(declare-fun d!20508 () Bool)

(declare-fun e!43143 () Bool)

(assert (=> d!20508 e!43143))

(declare-fun res!54380 () Bool)

(assert (=> d!20508 (=> (not res!54380) (not e!43143))))

(declare-fun lt!103760 () tuple2!5808)

(assert (=> d!20508 (= res!54380 (= (size!1304 (buf!1685 (_2!3015 lt!103760))) (size!1304 (buf!1685 thiss!1379))))))

(declare-fun lt!103764 () (_ BitVec 8))

(declare-fun lt!103759 () array!2833)

(assert (=> d!20508 (= lt!103764 (select (arr!1868 lt!103759) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20508 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1304 lt!103759)))))

(assert (=> d!20508 (= lt!103759 (array!2834 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!103761 () tuple2!5808)

(assert (=> d!20508 (= lt!103760 (tuple2!5809 (_1!3015 lt!103761) (_2!3015 lt!103761)))))

(declare-fun lt!103765 () tuple2!5808)

(assert (=> d!20508 (= lt!103761 lt!103765)))

(declare-fun e!43140 () Bool)

(assert (=> d!20508 e!43140))

(declare-fun res!54379 () Bool)

(assert (=> d!20508 (=> (not res!54379) (not e!43140))))

(assert (=> d!20508 (= res!54379 (= (size!1304 (buf!1685 thiss!1379)) (size!1304 (buf!1685 (_2!3015 lt!103765)))))))

(declare-fun lt!103763 () Bool)

(declare-fun appendBit!0 (BitStream!2248 Bool) tuple2!5808)

(assert (=> d!20508 (= lt!103765 (appendBit!0 thiss!1379 lt!103763))))

(assert (=> d!20508 (= lt!103763 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1868 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20508 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20508 (= (appendBitFromByte!0 thiss!1379 (select (arr!1868 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!103760)))

(declare-fun b!65563 () Bool)

(declare-fun e!43141 () Bool)

(declare-datatypes ((tuple2!5820 0))(
  ( (tuple2!5821 (_1!3021 BitStream!2248) (_2!3021 Bool)) )
))
(declare-fun lt!103758 () tuple2!5820)

(assert (=> b!65563 (= e!43141 (= (bitIndex!0 (size!1304 (buf!1685 (_1!3021 lt!103758))) (currentByte!3351 (_1!3021 lt!103758)) (currentBit!3346 (_1!3021 lt!103758))) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103760))) (currentByte!3351 (_2!3015 lt!103760)) (currentBit!3346 (_2!3015 lt!103760)))))))

(declare-fun b!65564 () Bool)

(declare-fun res!54382 () Bool)

(assert (=> b!65564 (=> (not res!54382) (not e!43143))))

(declare-fun lt!103756 () (_ BitVec 64))

(declare-fun lt!103755 () (_ BitVec 64))

(assert (=> b!65564 (= res!54382 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103760))) (currentByte!3351 (_2!3015 lt!103760)) (currentBit!3346 (_2!3015 lt!103760))) (bvadd lt!103756 lt!103755)))))

(assert (=> b!65564 (or (not (= (bvand lt!103756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103755 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103756 lt!103755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65564 (= lt!103755 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!65564 (= lt!103756 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(declare-fun b!65565 () Bool)

(declare-fun e!43142 () Bool)

(assert (=> b!65565 (= e!43140 e!43142)))

(declare-fun res!54377 () Bool)

(assert (=> b!65565 (=> (not res!54377) (not e!43142))))

(declare-fun lt!103757 () tuple2!5820)

(assert (=> b!65565 (= res!54377 (and (= (_2!3021 lt!103757) lt!103763) (= (_1!3021 lt!103757) (_2!3015 lt!103765))))))

(declare-fun readBitPure!0 (BitStream!2248) tuple2!5820)

(declare-fun readerFrom!0 (BitStream!2248 (_ BitVec 32) (_ BitVec 32)) BitStream!2248)

(assert (=> b!65565 (= lt!103757 (readBitPure!0 (readerFrom!0 (_2!3015 lt!103765) (currentBit!3346 thiss!1379) (currentByte!3351 thiss!1379))))))

(declare-fun b!65566 () Bool)

(declare-fun res!54384 () Bool)

(assert (=> b!65566 (=> (not res!54384) (not e!43140))))

(assert (=> b!65566 (= res!54384 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103765))) (currentByte!3351 (_2!3015 lt!103765)) (currentBit!3346 (_2!3015 lt!103765))) (bvadd (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65567 () Bool)

(assert (=> b!65567 (= e!43143 e!43141)))

(declare-fun res!54383 () Bool)

(assert (=> b!65567 (=> (not res!54383) (not e!43141))))

(assert (=> b!65567 (= res!54383 (and (= (_2!3021 lt!103758) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1868 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!103764)) #b00000000000000000000000000000000))) (= (_1!3021 lt!103758) (_2!3015 lt!103760))))))

(declare-datatypes ((tuple2!5822 0))(
  ( (tuple2!5823 (_1!3022 array!2833) (_2!3022 BitStream!2248)) )
))
(declare-fun lt!103754 () tuple2!5822)

(declare-fun lt!103762 () BitStream!2248)

(declare-fun readBits!0 (BitStream!2248 (_ BitVec 64)) tuple2!5822)

(assert (=> b!65567 (= lt!103754 (readBits!0 lt!103762 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!65567 (= lt!103758 (readBitPure!0 lt!103762))))

(assert (=> b!65567 (= lt!103762 (readerFrom!0 (_2!3015 lt!103760) (currentBit!3346 thiss!1379) (currentByte!3351 thiss!1379)))))

(declare-fun b!65568 () Bool)

(declare-fun res!54381 () Bool)

(assert (=> b!65568 (=> (not res!54381) (not e!43140))))

(assert (=> b!65568 (= res!54381 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103765)))))

(declare-fun b!65569 () Bool)

(declare-fun res!54378 () Bool)

(assert (=> b!65569 (=> (not res!54378) (not e!43143))))

(assert (=> b!65569 (= res!54378 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103760)))))

(declare-fun b!65570 () Bool)

(assert (=> b!65570 (= e!43142 (= (bitIndex!0 (size!1304 (buf!1685 (_1!3021 lt!103757))) (currentByte!3351 (_1!3021 lt!103757)) (currentBit!3346 (_1!3021 lt!103757))) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103765))) (currentByte!3351 (_2!3015 lt!103765)) (currentBit!3346 (_2!3015 lt!103765)))))))

(assert (= (and d!20508 res!54379) b!65566))

(assert (= (and b!65566 res!54384) b!65568))

(assert (= (and b!65568 res!54381) b!65565))

(assert (= (and b!65565 res!54377) b!65570))

(assert (= (and d!20508 res!54380) b!65564))

(assert (= (and b!65564 res!54382) b!65569))

(assert (= (and b!65569 res!54378) b!65567))

(assert (= (and b!65567 res!54383) b!65563))

(declare-fun m!104061 () Bool)

(assert (=> b!65567 m!104061))

(declare-fun m!104063 () Bool)

(assert (=> b!65567 m!104063))

(declare-fun m!104065 () Bool)

(assert (=> b!65567 m!104065))

(declare-fun m!104067 () Bool)

(assert (=> b!65563 m!104067))

(declare-fun m!104069 () Bool)

(assert (=> b!65563 m!104069))

(declare-fun m!104071 () Bool)

(assert (=> b!65570 m!104071))

(declare-fun m!104073 () Bool)

(assert (=> b!65570 m!104073))

(declare-fun m!104075 () Bool)

(assert (=> b!65568 m!104075))

(declare-fun m!104077 () Bool)

(assert (=> d!20508 m!104077))

(declare-fun m!104079 () Bool)

(assert (=> d!20508 m!104079))

(declare-fun m!104081 () Bool)

(assert (=> d!20508 m!104081))

(assert (=> b!65564 m!104069))

(assert (=> b!65564 m!103795))

(assert (=> b!65566 m!104073))

(assert (=> b!65566 m!103795))

(declare-fun m!104083 () Bool)

(assert (=> b!65565 m!104083))

(assert (=> b!65565 m!104083))

(declare-fun m!104085 () Bool)

(assert (=> b!65565 m!104085))

(declare-fun m!104087 () Bool)

(assert (=> b!65569 m!104087))

(assert (=> b!65352 d!20508))

(declare-fun d!20534 () Bool)

(declare-fun res!54386 () Bool)

(declare-fun e!43145 () Bool)

(assert (=> d!20534 (=> (not res!54386) (not e!43145))))

(assert (=> d!20534 (= res!54386 (= (size!1304 (buf!1685 thiss!1379)) (size!1304 (buf!1685 thiss!1379))))))

(assert (=> d!20534 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43145)))

(declare-fun b!65571 () Bool)

(declare-fun res!54387 () Bool)

(assert (=> b!65571 (=> (not res!54387) (not e!43145))))

(assert (=> b!65571 (= res!54387 (bvsle (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)) (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379))))))

(declare-fun b!65572 () Bool)

(declare-fun e!43144 () Bool)

(assert (=> b!65572 (= e!43145 e!43144)))

(declare-fun res!54385 () Bool)

(assert (=> b!65572 (=> res!54385 e!43144)))

(assert (=> b!65572 (= res!54385 (= (size!1304 (buf!1685 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65573 () Bool)

(assert (=> b!65573 (= e!43144 (arrayBitRangesEq!0 (buf!1685 thiss!1379) (buf!1685 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379))))))

(assert (= (and d!20534 res!54386) b!65571))

(assert (= (and b!65571 res!54387) b!65572))

(assert (= (and b!65572 (not res!54385)) b!65573))

(assert (=> b!65571 m!103795))

(assert (=> b!65571 m!103795))

(assert (=> b!65573 m!103795))

(assert (=> b!65573 m!103795))

(declare-fun m!104089 () Bool)

(assert (=> b!65573 m!104089))

(assert (=> b!65341 d!20534))

(declare-fun d!20538 () Bool)

(assert (=> d!20538 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!103768 () Unit!4421)

(declare-fun choose!11 (BitStream!2248) Unit!4421)

(assert (=> d!20538 (= lt!103768 (choose!11 thiss!1379))))

(assert (=> d!20538 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!103768)))

(declare-fun bs!5010 () Bool)

(assert (= bs!5010 d!20538))

(assert (=> bs!5010 m!103791))

(declare-fun m!104091 () Bool)

(assert (=> bs!5010 m!104091))

(assert (=> b!65341 d!20538))

(declare-fun d!20544 () Bool)

(declare-fun e!43151 () Bool)

(assert (=> d!20544 e!43151))

(declare-fun res!54392 () Bool)

(assert (=> d!20544 (=> (not res!54392) (not e!43151))))

(declare-fun lt!103781 () (_ BitVec 64))

(declare-fun lt!103785 () (_ BitVec 64))

(declare-fun lt!103784 () (_ BitVec 64))

(assert (=> d!20544 (= res!54392 (= lt!103781 (bvsub lt!103785 lt!103784)))))

(assert (=> d!20544 (or (= (bvand lt!103785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103785 lt!103784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20544 (= lt!103784 (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 thiss!1379))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379))))))

(declare-fun lt!103786 () (_ BitVec 64))

(declare-fun lt!103783 () (_ BitVec 64))

(assert (=> d!20544 (= lt!103785 (bvmul lt!103786 lt!103783))))

(assert (=> d!20544 (or (= lt!103786 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103783 (bvsdiv (bvmul lt!103786 lt!103783) lt!103786)))))

(assert (=> d!20544 (= lt!103783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20544 (= lt!103786 ((_ sign_extend 32) (size!1304 (buf!1685 thiss!1379))))))

(assert (=> d!20544 (= lt!103781 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3351 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3346 thiss!1379))))))

(assert (=> d!20544 (invariant!0 (currentBit!3346 thiss!1379) (currentByte!3351 thiss!1379) (size!1304 (buf!1685 thiss!1379)))))

(assert (=> d!20544 (= (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)) lt!103781)))

(declare-fun b!65584 () Bool)

(declare-fun res!54393 () Bool)

(assert (=> b!65584 (=> (not res!54393) (not e!43151))))

(assert (=> b!65584 (= res!54393 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103781))))

(declare-fun b!65585 () Bool)

(declare-fun lt!103782 () (_ BitVec 64))

(assert (=> b!65585 (= e!43151 (bvsle lt!103781 (bvmul lt!103782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65585 (or (= lt!103782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103782)))))

(assert (=> b!65585 (= lt!103782 ((_ sign_extend 32) (size!1304 (buf!1685 thiss!1379))))))

(assert (= (and d!20544 res!54392) b!65584))

(assert (= (and b!65584 res!54393) b!65585))

(declare-fun m!104097 () Bool)

(assert (=> d!20544 m!104097))

(declare-fun m!104099 () Bool)

(assert (=> d!20544 m!104099))

(assert (=> b!65341 d!20544))

(declare-fun d!20550 () Bool)

(assert (=> d!20550 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 thiss!1379))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 thiss!1379))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5011 () Bool)

(assert (= bs!5011 d!20550))

(assert (=> bs!5011 m!104097))

(assert (=> b!65356 d!20550))

(declare-fun d!20552 () Bool)

(declare-fun e!43152 () Bool)

(assert (=> d!20552 e!43152))

(declare-fun res!54394 () Bool)

(assert (=> d!20552 (=> (not res!54394) (not e!43152))))

(declare-fun lt!103790 () (_ BitVec 64))

(declare-fun lt!103787 () (_ BitVec 64))

(declare-fun lt!103791 () (_ BitVec 64))

(assert (=> d!20552 (= res!54394 (= lt!103787 (bvsub lt!103791 lt!103790)))))

(assert (=> d!20552 (or (= (bvand lt!103791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103791 lt!103790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20552 (= lt!103790 (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103598)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103598))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103598)))))))

(declare-fun lt!103792 () (_ BitVec 64))

(declare-fun lt!103789 () (_ BitVec 64))

(assert (=> d!20552 (= lt!103791 (bvmul lt!103792 lt!103789))))

(assert (=> d!20552 (or (= lt!103792 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103789 (bvsdiv (bvmul lt!103792 lt!103789) lt!103792)))))

(assert (=> d!20552 (= lt!103789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20552 (= lt!103792 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103598)))))))

(assert (=> d!20552 (= lt!103787 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103598))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103598)))))))

(assert (=> d!20552 (invariant!0 (currentBit!3346 (_1!3016 lt!103598)) (currentByte!3351 (_1!3016 lt!103598)) (size!1304 (buf!1685 (_1!3016 lt!103598))))))

(assert (=> d!20552 (= (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103598))) (currentByte!3351 (_1!3016 lt!103598)) (currentBit!3346 (_1!3016 lt!103598))) lt!103787)))

(declare-fun b!65586 () Bool)

(declare-fun res!54395 () Bool)

(assert (=> b!65586 (=> (not res!54395) (not e!43152))))

(assert (=> b!65586 (= res!54395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103787))))

(declare-fun b!65587 () Bool)

(declare-fun lt!103788 () (_ BitVec 64))

(assert (=> b!65587 (= e!43152 (bvsle lt!103787 (bvmul lt!103788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65587 (or (= lt!103788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103788)))))

(assert (=> b!65587 (= lt!103788 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103598)))))))

(assert (= (and d!20552 res!54394) b!65586))

(assert (= (and b!65586 res!54395) b!65587))

(declare-fun m!104101 () Bool)

(assert (=> d!20552 m!104101))

(declare-fun m!104103 () Bool)

(assert (=> d!20552 m!104103))

(assert (=> b!65344 d!20552))

(declare-fun d!20554 () Bool)

(declare-fun e!43153 () Bool)

(assert (=> d!20554 e!43153))

(declare-fun res!54396 () Bool)

(assert (=> d!20554 (=> (not res!54396) (not e!43153))))

(declare-fun lt!103793 () (_ BitVec 64))

(declare-fun lt!103796 () (_ BitVec 64))

(declare-fun lt!103797 () (_ BitVec 64))

(assert (=> d!20554 (= res!54396 (= lt!103793 (bvsub lt!103797 lt!103796)))))

(assert (=> d!20554 (or (= (bvand lt!103797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103797 lt!103796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20554 (= lt!103796 (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103593)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103593))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103593)))))))

(declare-fun lt!103798 () (_ BitVec 64))

(declare-fun lt!103795 () (_ BitVec 64))

(assert (=> d!20554 (= lt!103797 (bvmul lt!103798 lt!103795))))

(assert (=> d!20554 (or (= lt!103798 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103795 (bvsdiv (bvmul lt!103798 lt!103795) lt!103798)))))

(assert (=> d!20554 (= lt!103795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20554 (= lt!103798 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103593)))))))

(assert (=> d!20554 (= lt!103793 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103593))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103593)))))))

(assert (=> d!20554 (invariant!0 (currentBit!3346 (_1!3016 lt!103593)) (currentByte!3351 (_1!3016 lt!103593)) (size!1304 (buf!1685 (_1!3016 lt!103593))))))

(assert (=> d!20554 (= (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103593))) (currentByte!3351 (_1!3016 lt!103593)) (currentBit!3346 (_1!3016 lt!103593))) lt!103793)))

(declare-fun b!65588 () Bool)

(declare-fun res!54397 () Bool)

(assert (=> b!65588 (=> (not res!54397) (not e!43153))))

(assert (=> b!65588 (= res!54397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103793))))

(declare-fun b!65589 () Bool)

(declare-fun lt!103794 () (_ BitVec 64))

(assert (=> b!65589 (= e!43153 (bvsle lt!103793 (bvmul lt!103794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65589 (or (= lt!103794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103794)))))

(assert (=> b!65589 (= lt!103794 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103593)))))))

(assert (= (and d!20554 res!54396) b!65588))

(assert (= (and b!65588 res!54397) b!65589))

(declare-fun m!104105 () Bool)

(assert (=> d!20554 m!104105))

(declare-fun m!104107 () Bool)

(assert (=> d!20554 m!104107))

(assert (=> b!65344 d!20554))

(declare-fun d!20556 () Bool)

(declare-fun res!54399 () Bool)

(declare-fun e!43157 () Bool)

(assert (=> d!20556 (=> (not res!54399) (not e!43157))))

(assert (=> d!20556 (= res!54399 (= (size!1304 (buf!1685 (_1!3016 lt!103593))) (size!1304 (buf!1685 (_2!3015 lt!103591)))))))

(assert (=> d!20556 (= (isPrefixOf!0 (_1!3016 lt!103593) (_2!3015 lt!103591)) e!43157)))

(declare-fun b!65594 () Bool)

(declare-fun res!54400 () Bool)

(assert (=> b!65594 (=> (not res!54400) (not e!43157))))

(assert (=> b!65594 (= res!54400 (bvsle (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103593))) (currentByte!3351 (_1!3016 lt!103593)) (currentBit!3346 (_1!3016 lt!103593))) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591)))))))

(declare-fun b!65595 () Bool)

(declare-fun e!43156 () Bool)

(assert (=> b!65595 (= e!43157 e!43156)))

(declare-fun res!54398 () Bool)

(assert (=> b!65595 (=> res!54398 e!43156)))

(assert (=> b!65595 (= res!54398 (= (size!1304 (buf!1685 (_1!3016 lt!103593))) #b00000000000000000000000000000000))))

(declare-fun b!65596 () Bool)

(assert (=> b!65596 (= e!43156 (arrayBitRangesEq!0 (buf!1685 (_1!3016 lt!103593)) (buf!1685 (_2!3015 lt!103591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103593))) (currentByte!3351 (_1!3016 lt!103593)) (currentBit!3346 (_1!3016 lt!103593)))))))

(assert (= (and d!20556 res!54399) b!65594))

(assert (= (and b!65594 res!54400) b!65595))

(assert (= (and b!65595 (not res!54398)) b!65596))

(assert (=> b!65594 m!103785))

(assert (=> b!65594 m!103799))

(assert (=> b!65596 m!103785))

(assert (=> b!65596 m!103785))

(declare-fun m!104109 () Bool)

(assert (=> b!65596 m!104109))

(assert (=> b!65355 d!20556))

(declare-fun d!20558 () Bool)

(assert (=> d!20558 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!103600)))

(declare-fun lt!103810 () Unit!4421)

(declare-fun choose!9 (BitStream!2248 array!2833 (_ BitVec 64) BitStream!2248) Unit!4421)

(assert (=> d!20558 (= lt!103810 (choose!9 (_2!3015 lt!103595) (buf!1685 (_2!3015 lt!103591)) lt!103600 (BitStream!2249 (buf!1685 (_2!3015 lt!103591)) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595)))))))

(assert (=> d!20558 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3015 lt!103595) (buf!1685 (_2!3015 lt!103591)) lt!103600) lt!103810)))

(declare-fun bs!5012 () Bool)

(assert (= bs!5012 d!20558))

(assert (=> bs!5012 m!103815))

(declare-fun m!104119 () Bool)

(assert (=> bs!5012 m!104119))

(assert (=> b!65354 d!20558))

(declare-fun lt!103890 () (_ BitVec 64))

(declare-fun e!43185 () Bool)

(declare-fun lt!103883 () (_ BitVec 64))

(declare-fun b!65647 () Bool)

(declare-fun lt!103893 () tuple2!5810)

(declare-fun withMovedBitIndex!0 (BitStream!2248 (_ BitVec 64)) BitStream!2248)

(assert (=> b!65647 (= e!43185 (= (_1!3016 lt!103893) (withMovedBitIndex!0 (_2!3016 lt!103893) (bvsub lt!103890 lt!103883))))))

(assert (=> b!65647 (or (= (bvand lt!103890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103883 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103890 lt!103883) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65647 (= lt!103883 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591))))))

(assert (=> b!65647 (= lt!103890 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(declare-fun b!65648 () Bool)

(declare-fun e!43186 () Unit!4421)

(declare-fun lt!103882 () Unit!4421)

(assert (=> b!65648 (= e!43186 lt!103882)))

(declare-fun lt!103884 () (_ BitVec 64))

(assert (=> b!65648 (= lt!103884 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!103888 () (_ BitVec 64))

(assert (=> b!65648 (= lt!103888 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2833 array!2833 (_ BitVec 64) (_ BitVec 64)) Unit!4421)

(assert (=> b!65648 (= lt!103882 (arrayBitRangesEqSymmetric!0 (buf!1685 thiss!1379) (buf!1685 (_2!3015 lt!103591)) lt!103884 lt!103888))))

(assert (=> b!65648 (arrayBitRangesEq!0 (buf!1685 (_2!3015 lt!103591)) (buf!1685 thiss!1379) lt!103884 lt!103888)))

(declare-fun b!65649 () Bool)

(declare-fun res!54439 () Bool)

(assert (=> b!65649 (=> (not res!54439) (not e!43185))))

(assert (=> b!65649 (= res!54439 (isPrefixOf!0 (_2!3016 lt!103893) (_2!3015 lt!103591)))))

(declare-fun d!20562 () Bool)

(assert (=> d!20562 e!43185))

(declare-fun res!54438 () Bool)

(assert (=> d!20562 (=> (not res!54438) (not e!43185))))

(assert (=> d!20562 (= res!54438 (isPrefixOf!0 (_1!3016 lt!103893) (_2!3016 lt!103893)))))

(declare-fun lt!103881 () BitStream!2248)

(assert (=> d!20562 (= lt!103893 (tuple2!5811 lt!103881 (_2!3015 lt!103591)))))

(declare-fun lt!103894 () Unit!4421)

(declare-fun lt!103892 () Unit!4421)

(assert (=> d!20562 (= lt!103894 lt!103892)))

(assert (=> d!20562 (isPrefixOf!0 lt!103881 (_2!3015 lt!103591))))

(assert (=> d!20562 (= lt!103892 (lemmaIsPrefixTransitive!0 lt!103881 (_2!3015 lt!103591) (_2!3015 lt!103591)))))

(declare-fun lt!103891 () Unit!4421)

(declare-fun lt!103887 () Unit!4421)

(assert (=> d!20562 (= lt!103891 lt!103887)))

(assert (=> d!20562 (isPrefixOf!0 lt!103881 (_2!3015 lt!103591))))

(assert (=> d!20562 (= lt!103887 (lemmaIsPrefixTransitive!0 lt!103881 thiss!1379 (_2!3015 lt!103591)))))

(declare-fun lt!103885 () Unit!4421)

(assert (=> d!20562 (= lt!103885 e!43186)))

(declare-fun c!4752 () Bool)

(assert (=> d!20562 (= c!4752 (not (= (size!1304 (buf!1685 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!103896 () Unit!4421)

(declare-fun lt!103878 () Unit!4421)

(assert (=> d!20562 (= lt!103896 lt!103878)))

(assert (=> d!20562 (isPrefixOf!0 (_2!3015 lt!103591) (_2!3015 lt!103591))))

(assert (=> d!20562 (= lt!103878 (lemmaIsPrefixRefl!0 (_2!3015 lt!103591)))))

(declare-fun lt!103897 () Unit!4421)

(declare-fun lt!103880 () Unit!4421)

(assert (=> d!20562 (= lt!103897 lt!103880)))

(assert (=> d!20562 (= lt!103880 (lemmaIsPrefixRefl!0 (_2!3015 lt!103591)))))

(declare-fun lt!103886 () Unit!4421)

(declare-fun lt!103889 () Unit!4421)

(assert (=> d!20562 (= lt!103886 lt!103889)))

(assert (=> d!20562 (isPrefixOf!0 lt!103881 lt!103881)))

(assert (=> d!20562 (= lt!103889 (lemmaIsPrefixRefl!0 lt!103881))))

(declare-fun lt!103895 () Unit!4421)

(declare-fun lt!103879 () Unit!4421)

(assert (=> d!20562 (= lt!103895 lt!103879)))

(assert (=> d!20562 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20562 (= lt!103879 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20562 (= lt!103881 (BitStream!2249 (buf!1685 (_2!3015 lt!103591)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(assert (=> d!20562 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103591))))

(assert (=> d!20562 (= (reader!0 thiss!1379 (_2!3015 lt!103591)) lt!103893)))

(declare-fun b!65650 () Bool)

(declare-fun Unit!4427 () Unit!4421)

(assert (=> b!65650 (= e!43186 Unit!4427)))

(declare-fun b!65651 () Bool)

(declare-fun res!54440 () Bool)

(assert (=> b!65651 (=> (not res!54440) (not e!43185))))

(assert (=> b!65651 (= res!54440 (isPrefixOf!0 (_1!3016 lt!103893) thiss!1379))))

(assert (= (and d!20562 c!4752) b!65648))

(assert (= (and d!20562 (not c!4752)) b!65650))

(assert (= (and d!20562 res!54438) b!65651))

(assert (= (and b!65651 res!54440) b!65649))

(assert (= (and b!65649 res!54439) b!65647))

(assert (=> b!65648 m!103795))

(declare-fun m!104131 () Bool)

(assert (=> b!65648 m!104131))

(declare-fun m!104133 () Bool)

(assert (=> b!65648 m!104133))

(declare-fun m!104135 () Bool)

(assert (=> d!20562 m!104135))

(assert (=> d!20562 m!103831))

(declare-fun m!104137 () Bool)

(assert (=> d!20562 m!104137))

(declare-fun m!104139 () Bool)

(assert (=> d!20562 m!104139))

(assert (=> d!20562 m!103793))

(declare-fun m!104141 () Bool)

(assert (=> d!20562 m!104141))

(declare-fun m!104143 () Bool)

(assert (=> d!20562 m!104143))

(assert (=> d!20562 m!103791))

(declare-fun m!104145 () Bool)

(assert (=> d!20562 m!104145))

(declare-fun m!104147 () Bool)

(assert (=> d!20562 m!104147))

(declare-fun m!104149 () Bool)

(assert (=> d!20562 m!104149))

(declare-fun m!104151 () Bool)

(assert (=> b!65647 m!104151))

(assert (=> b!65647 m!103799))

(assert (=> b!65647 m!103795))

(declare-fun m!104153 () Bool)

(assert (=> b!65649 m!104153))

(declare-fun m!104155 () Bool)

(assert (=> b!65651 m!104155))

(assert (=> b!65354 d!20562))

(declare-fun b!65675 () Bool)

(declare-fun e!43198 () Bool)

(declare-fun lt!103922 () List!699)

(declare-fun isEmpty!204 (List!699) Bool)

(assert (=> b!65675 (= e!43198 (isEmpty!204 lt!103922))))

(declare-fun b!65676 () Bool)

(assert (=> b!65676 (= e!43198 (> (length!327 lt!103922) 0))))

(declare-datatypes ((tuple2!5824 0))(
  ( (tuple2!5825 (_1!3023 Bool) (_2!3023 BitStream!2248)) )
))
(declare-fun lt!103923 () tuple2!5824)

(declare-fun lt!103924 () (_ BitVec 64))

(declare-fun b!65674 () Bool)

(declare-datatypes ((tuple2!5826 0))(
  ( (tuple2!5827 (_1!3024 List!699) (_2!3024 BitStream!2248)) )
))
(declare-fun e!43199 () tuple2!5826)

(assert (=> b!65674 (= e!43199 (tuple2!5827 (Cons!695 (_1!3023 lt!103923) (bitStreamReadBitsIntoList!0 (_2!3015 lt!103591) (_2!3023 lt!103923) (bvsub lt!103600 lt!103924))) (_2!3023 lt!103923)))))

(declare-fun readBit!0 (BitStream!2248) tuple2!5824)

(assert (=> b!65674 (= lt!103923 (readBit!0 (_1!3016 lt!103593)))))

(assert (=> b!65674 (= lt!103924 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!20572 () Bool)

(assert (=> d!20572 e!43198))

(declare-fun c!4758 () Bool)

(assert (=> d!20572 (= c!4758 (= lt!103600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20572 (= lt!103922 (_1!3024 e!43199))))

(declare-fun c!4757 () Bool)

(assert (=> d!20572 (= c!4757 (= lt!103600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20572 (bvsge lt!103600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20572 (= (bitStreamReadBitsIntoList!0 (_2!3015 lt!103591) (_1!3016 lt!103593) lt!103600) lt!103922)))

(declare-fun b!65673 () Bool)

(assert (=> b!65673 (= e!43199 (tuple2!5827 Nil!696 (_1!3016 lt!103593)))))

(assert (= (and d!20572 c!4757) b!65673))

(assert (= (and d!20572 (not c!4757)) b!65674))

(assert (= (and d!20572 c!4758) b!65675))

(assert (= (and d!20572 (not c!4758)) b!65676))

(declare-fun m!104191 () Bool)

(assert (=> b!65675 m!104191))

(declare-fun m!104193 () Bool)

(assert (=> b!65676 m!104193))

(declare-fun m!104195 () Bool)

(assert (=> b!65674 m!104195))

(declare-fun m!104197 () Bool)

(assert (=> b!65674 m!104197))

(assert (=> b!65354 d!20572))

(declare-fun b!65679 () Bool)

(declare-fun e!43200 () Bool)

(declare-fun lt!103925 () List!699)

(assert (=> b!65679 (= e!43200 (isEmpty!204 lt!103925))))

(declare-fun b!65680 () Bool)

(assert (=> b!65680 (= e!43200 (> (length!327 lt!103925) 0))))

(declare-fun e!43201 () tuple2!5826)

(declare-fun b!65678 () Bool)

(declare-fun lt!103927 () (_ BitVec 64))

(declare-fun lt!103926 () tuple2!5824)

(assert (=> b!65678 (= e!43201 (tuple2!5827 (Cons!695 (_1!3023 lt!103926) (bitStreamReadBitsIntoList!0 (_2!3015 lt!103591) (_2!3023 lt!103926) (bvsub (bvsub to!314 i!635) lt!103927))) (_2!3023 lt!103926)))))

(assert (=> b!65678 (= lt!103926 (readBit!0 (_1!3016 lt!103598)))))

(assert (=> b!65678 (= lt!103927 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!20586 () Bool)

(assert (=> d!20586 e!43200))

(declare-fun c!4760 () Bool)

(assert (=> d!20586 (= c!4760 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20586 (= lt!103925 (_1!3024 e!43201))))

(declare-fun c!4759 () Bool)

(assert (=> d!20586 (= c!4759 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20586 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20586 (= (bitStreamReadBitsIntoList!0 (_2!3015 lt!103591) (_1!3016 lt!103598) (bvsub to!314 i!635)) lt!103925)))

(declare-fun b!65677 () Bool)

(assert (=> b!65677 (= e!43201 (tuple2!5827 Nil!696 (_1!3016 lt!103598)))))

(assert (= (and d!20586 c!4759) b!65677))

(assert (= (and d!20586 (not c!4759)) b!65678))

(assert (= (and d!20586 c!4760) b!65679))

(assert (= (and d!20586 (not c!4760)) b!65680))

(declare-fun m!104199 () Bool)

(assert (=> b!65679 m!104199))

(declare-fun m!104201 () Bool)

(assert (=> b!65680 m!104201))

(declare-fun m!104203 () Bool)

(assert (=> b!65678 m!104203))

(declare-fun m!104205 () Bool)

(assert (=> b!65678 m!104205))

(assert (=> b!65354 d!20586))

(declare-fun d!20588 () Bool)

(assert (=> d!20588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!103930 () Unit!4421)

(assert (=> d!20588 (= lt!103930 (choose!9 thiss!1379 (buf!1685 (_2!3015 lt!103591)) (bvsub to!314 i!635) (BitStream!2249 (buf!1685 (_2!3015 lt!103591)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379))))))

(assert (=> d!20588 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1685 (_2!3015 lt!103591)) (bvsub to!314 i!635)) lt!103930)))

(declare-fun bs!5016 () Bool)

(assert (= bs!5016 d!20588))

(assert (=> bs!5016 m!103825))

(declare-fun m!104207 () Bool)

(assert (=> bs!5016 m!104207))

(assert (=> b!65354 d!20588))

(declare-fun d!20590 () Bool)

(assert (=> d!20590 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5017 () Bool)

(assert (= bs!5017 d!20590))

(declare-fun m!104209 () Bool)

(assert (=> bs!5017 m!104209))

(assert (=> b!65354 d!20590))

(declare-fun d!20592 () Bool)

(assert (=> d!20592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!103600) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595)))) lt!103600))))

(declare-fun bs!5019 () Bool)

(assert (= bs!5019 d!20592))

(declare-fun m!104213 () Bool)

(assert (=> bs!5019 m!104213))

(assert (=> b!65354 d!20592))

(declare-fun lt!103937 () (_ BitVec 64))

(declare-fun lt!103944 () (_ BitVec 64))

(declare-fun b!65681 () Bool)

(declare-fun e!43202 () Bool)

(declare-fun lt!103947 () tuple2!5810)

(assert (=> b!65681 (= e!43202 (= (_1!3016 lt!103947) (withMovedBitIndex!0 (_2!3016 lt!103947) (bvsub lt!103944 lt!103937))))))

(assert (=> b!65681 (or (= (bvand lt!103944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103944 lt!103937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65681 (= lt!103937 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591))))))

(assert (=> b!65681 (= lt!103944 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))))))

(declare-fun b!65682 () Bool)

(declare-fun e!43203 () Unit!4421)

(declare-fun lt!103936 () Unit!4421)

(assert (=> b!65682 (= e!43203 lt!103936)))

(declare-fun lt!103938 () (_ BitVec 64))

(assert (=> b!65682 (= lt!103938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!103942 () (_ BitVec 64))

(assert (=> b!65682 (= lt!103942 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))))))

(assert (=> b!65682 (= lt!103936 (arrayBitRangesEqSymmetric!0 (buf!1685 (_2!3015 lt!103595)) (buf!1685 (_2!3015 lt!103591)) lt!103938 lt!103942))))

(assert (=> b!65682 (arrayBitRangesEq!0 (buf!1685 (_2!3015 lt!103591)) (buf!1685 (_2!3015 lt!103595)) lt!103938 lt!103942)))

(declare-fun b!65683 () Bool)

(declare-fun res!54455 () Bool)

(assert (=> b!65683 (=> (not res!54455) (not e!43202))))

(assert (=> b!65683 (= res!54455 (isPrefixOf!0 (_2!3016 lt!103947) (_2!3015 lt!103591)))))

(declare-fun d!20596 () Bool)

(assert (=> d!20596 e!43202))

(declare-fun res!54454 () Bool)

(assert (=> d!20596 (=> (not res!54454) (not e!43202))))

(assert (=> d!20596 (= res!54454 (isPrefixOf!0 (_1!3016 lt!103947) (_2!3016 lt!103947)))))

(declare-fun lt!103935 () BitStream!2248)

(assert (=> d!20596 (= lt!103947 (tuple2!5811 lt!103935 (_2!3015 lt!103591)))))

(declare-fun lt!103948 () Unit!4421)

(declare-fun lt!103946 () Unit!4421)

(assert (=> d!20596 (= lt!103948 lt!103946)))

(assert (=> d!20596 (isPrefixOf!0 lt!103935 (_2!3015 lt!103591))))

(assert (=> d!20596 (= lt!103946 (lemmaIsPrefixTransitive!0 lt!103935 (_2!3015 lt!103591) (_2!3015 lt!103591)))))

(declare-fun lt!103945 () Unit!4421)

(declare-fun lt!103941 () Unit!4421)

(assert (=> d!20596 (= lt!103945 lt!103941)))

(assert (=> d!20596 (isPrefixOf!0 lt!103935 (_2!3015 lt!103591))))

(assert (=> d!20596 (= lt!103941 (lemmaIsPrefixTransitive!0 lt!103935 (_2!3015 lt!103595) (_2!3015 lt!103591)))))

(declare-fun lt!103939 () Unit!4421)

(assert (=> d!20596 (= lt!103939 e!43203)))

(declare-fun c!4761 () Bool)

(assert (=> d!20596 (= c!4761 (not (= (size!1304 (buf!1685 (_2!3015 lt!103595))) #b00000000000000000000000000000000)))))

(declare-fun lt!103950 () Unit!4421)

(declare-fun lt!103932 () Unit!4421)

(assert (=> d!20596 (= lt!103950 lt!103932)))

(assert (=> d!20596 (isPrefixOf!0 (_2!3015 lt!103591) (_2!3015 lt!103591))))

(assert (=> d!20596 (= lt!103932 (lemmaIsPrefixRefl!0 (_2!3015 lt!103591)))))

(declare-fun lt!103951 () Unit!4421)

(declare-fun lt!103934 () Unit!4421)

(assert (=> d!20596 (= lt!103951 lt!103934)))

(assert (=> d!20596 (= lt!103934 (lemmaIsPrefixRefl!0 (_2!3015 lt!103591)))))

(declare-fun lt!103940 () Unit!4421)

(declare-fun lt!103943 () Unit!4421)

(assert (=> d!20596 (= lt!103940 lt!103943)))

(assert (=> d!20596 (isPrefixOf!0 lt!103935 lt!103935)))

(assert (=> d!20596 (= lt!103943 (lemmaIsPrefixRefl!0 lt!103935))))

(declare-fun lt!103949 () Unit!4421)

(declare-fun lt!103933 () Unit!4421)

(assert (=> d!20596 (= lt!103949 lt!103933)))

(assert (=> d!20596 (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!103595))))

(assert (=> d!20596 (= lt!103933 (lemmaIsPrefixRefl!0 (_2!3015 lt!103595)))))

(assert (=> d!20596 (= lt!103935 (BitStream!2249 (buf!1685 (_2!3015 lt!103591)) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))))))

(assert (=> d!20596 (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!103591))))

(assert (=> d!20596 (= (reader!0 (_2!3015 lt!103595) (_2!3015 lt!103591)) lt!103947)))

(declare-fun b!65684 () Bool)

(declare-fun Unit!4428 () Unit!4421)

(assert (=> b!65684 (= e!43203 Unit!4428)))

(declare-fun b!65685 () Bool)

(declare-fun res!54456 () Bool)

(assert (=> b!65685 (=> (not res!54456) (not e!43202))))

(assert (=> b!65685 (= res!54456 (isPrefixOf!0 (_1!3016 lt!103947) (_2!3015 lt!103595)))))

(assert (= (and d!20596 c!4761) b!65682))

(assert (= (and d!20596 (not c!4761)) b!65684))

(assert (= (and d!20596 res!54454) b!65685))

(assert (= (and b!65685 res!54456) b!65683))

(assert (= (and b!65683 res!54455) b!65681))

(assert (=> b!65682 m!103827))

(declare-fun m!104217 () Bool)

(assert (=> b!65682 m!104217))

(declare-fun m!104219 () Bool)

(assert (=> b!65682 m!104219))

(declare-fun m!104221 () Bool)

(assert (=> d!20596 m!104221))

(assert (=> d!20596 m!103835))

(assert (=> d!20596 m!104137))

(declare-fun m!104223 () Bool)

(assert (=> d!20596 m!104223))

(declare-fun m!104225 () Bool)

(assert (=> d!20596 m!104225))

(declare-fun m!104227 () Bool)

(assert (=> d!20596 m!104227))

(assert (=> d!20596 m!104143))

(declare-fun m!104229 () Bool)

(assert (=> d!20596 m!104229))

(declare-fun m!104231 () Bool)

(assert (=> d!20596 m!104231))

(declare-fun m!104233 () Bool)

(assert (=> d!20596 m!104233))

(declare-fun m!104235 () Bool)

(assert (=> d!20596 m!104235))

(declare-fun m!104237 () Bool)

(assert (=> b!65681 m!104237))

(assert (=> b!65681 m!103799))

(assert (=> b!65681 m!103827))

(declare-fun m!104239 () Bool)

(assert (=> b!65683 m!104239))

(declare-fun m!104241 () Bool)

(assert (=> b!65685 m!104241))

(assert (=> b!65354 d!20596))

(declare-fun d!20600 () Bool)

(assert (=> d!20600 (= (head!518 (byteArrayBitContentToList!0 (_2!3015 lt!103595) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!814 (byteArrayBitContentToList!0 (_2!3015 lt!103595) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!65348 d!20600))

(declare-fun d!20602 () Bool)

(declare-fun c!4764 () Bool)

(assert (=> d!20602 (= c!4764 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43206 () List!699)

(assert (=> d!20602 (= (byteArrayBitContentToList!0 (_2!3015 lt!103595) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43206)))

(declare-fun b!65690 () Bool)

(assert (=> b!65690 (= e!43206 Nil!696)))

(declare-fun b!65691 () Bool)

(assert (=> b!65691 (= e!43206 (Cons!695 (not (= (bvand ((_ sign_extend 24) (select (arr!1868 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3015 lt!103595) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20602 c!4764) b!65690))

(assert (= (and d!20602 (not c!4764)) b!65691))

(assert (=> b!65691 m!103763))

(assert (=> b!65691 m!104081))

(declare-fun m!104243 () Bool)

(assert (=> b!65691 m!104243))

(assert (=> b!65348 d!20602))

(declare-fun d!20604 () Bool)

(assert (=> d!20604 (= (head!518 (bitStreamReadBitsIntoList!0 (_2!3015 lt!103595) (_1!3016 lt!103587) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!814 (bitStreamReadBitsIntoList!0 (_2!3015 lt!103595) (_1!3016 lt!103587) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!65348 d!20604))

(declare-fun b!65694 () Bool)

(declare-fun e!43207 () Bool)

(declare-fun lt!103952 () List!699)

(assert (=> b!65694 (= e!43207 (isEmpty!204 lt!103952))))

(declare-fun b!65695 () Bool)

(assert (=> b!65695 (= e!43207 (> (length!327 lt!103952) 0))))

(declare-fun e!43208 () tuple2!5826)

(declare-fun lt!103953 () tuple2!5824)

(declare-fun b!65693 () Bool)

(declare-fun lt!103954 () (_ BitVec 64))

(assert (=> b!65693 (= e!43208 (tuple2!5827 (Cons!695 (_1!3023 lt!103953) (bitStreamReadBitsIntoList!0 (_2!3015 lt!103595) (_2!3023 lt!103953) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!103954))) (_2!3023 lt!103953)))))

(assert (=> b!65693 (= lt!103953 (readBit!0 (_1!3016 lt!103587)))))

(assert (=> b!65693 (= lt!103954 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!20606 () Bool)

(assert (=> d!20606 e!43207))

(declare-fun c!4766 () Bool)

(assert (=> d!20606 (= c!4766 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20606 (= lt!103952 (_1!3024 e!43208))))

(declare-fun c!4765 () Bool)

(assert (=> d!20606 (= c!4765 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20606 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20606 (= (bitStreamReadBitsIntoList!0 (_2!3015 lt!103595) (_1!3016 lt!103587) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103952)))

(declare-fun b!65692 () Bool)

(assert (=> b!65692 (= e!43208 (tuple2!5827 Nil!696 (_1!3016 lt!103587)))))

(assert (= (and d!20606 c!4765) b!65692))

(assert (= (and d!20606 (not c!4765)) b!65693))

(assert (= (and d!20606 c!4766) b!65694))

(assert (= (and d!20606 (not c!4766)) b!65695))

(declare-fun m!104245 () Bool)

(assert (=> b!65694 m!104245))

(declare-fun m!104247 () Bool)

(assert (=> b!65695 m!104247))

(declare-fun m!104249 () Bool)

(assert (=> b!65693 m!104249))

(declare-fun m!104251 () Bool)

(assert (=> b!65693 m!104251))

(assert (=> b!65348 d!20606))

(declare-fun d!20608 () Bool)

(declare-fun e!43209 () Bool)

(assert (=> d!20608 e!43209))

(declare-fun res!54457 () Bool)

(assert (=> d!20608 (=> (not res!54457) (not e!43209))))

(declare-fun lt!103959 () (_ BitVec 64))

(declare-fun lt!103958 () (_ BitVec 64))

(declare-fun lt!103955 () (_ BitVec 64))

(assert (=> d!20608 (= res!54457 (= lt!103955 (bvsub lt!103959 lt!103958)))))

(assert (=> d!20608 (or (= (bvand lt!103959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103959 lt!103958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20608 (= lt!103958 (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103591))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103591)))))))

(declare-fun lt!103960 () (_ BitVec 64))

(declare-fun lt!103957 () (_ BitVec 64))

(assert (=> d!20608 (= lt!103959 (bvmul lt!103960 lt!103957))))

(assert (=> d!20608 (or (= lt!103960 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103957 (bvsdiv (bvmul lt!103960 lt!103957) lt!103960)))))

(assert (=> d!20608 (= lt!103957 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20608 (= lt!103960 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))))))

(assert (=> d!20608 (= lt!103955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103591)))))))

(assert (=> d!20608 (invariant!0 (currentBit!3346 (_2!3015 lt!103591)) (currentByte!3351 (_2!3015 lt!103591)) (size!1304 (buf!1685 (_2!3015 lt!103591))))))

(assert (=> d!20608 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591))) lt!103955)))

(declare-fun b!65696 () Bool)

(declare-fun res!54458 () Bool)

(assert (=> b!65696 (=> (not res!54458) (not e!43209))))

(assert (=> b!65696 (= res!54458 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103955))))

(declare-fun b!65697 () Bool)

(declare-fun lt!103956 () (_ BitVec 64))

(assert (=> b!65697 (= e!43209 (bvsle lt!103955 (bvmul lt!103956 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65697 (or (= lt!103956 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103956 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103956)))))

(assert (=> b!65697 (= lt!103956 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103591)))))))

(assert (= (and d!20608 res!54457) b!65696))

(assert (= (and b!65696 res!54458) b!65697))

(declare-fun m!104253 () Bool)

(assert (=> d!20608 m!104253))

(assert (=> d!20608 m!103779))

(assert (=> b!65359 d!20608))

(declare-fun b!65771 () Bool)

(declare-fun res!54524 () Bool)

(declare-fun e!43245 () Bool)

(assert (=> b!65771 (=> (not res!54524) (not e!43245))))

(declare-fun lt!104196 () tuple2!5808)

(assert (=> b!65771 (= res!54524 (= (size!1304 (buf!1685 (_2!3015 lt!103595))) (size!1304 (buf!1685 (_2!3015 lt!104196)))))))

(declare-fun lt!104192 () tuple2!5808)

(declare-fun call!838 () tuple2!5810)

(declare-fun bm!835 () Bool)

(declare-fun c!4772 () Bool)

(assert (=> bm!835 (= call!838 (reader!0 (_2!3015 lt!103595) (ite c!4772 (_2!3015 lt!104192) (_2!3015 lt!103595))))))

(declare-fun b!65772 () Bool)

(declare-fun res!54525 () Bool)

(assert (=> b!65772 (=> (not res!54525) (not e!43245))))

(assert (=> b!65772 (= res!54525 (invariant!0 (currentBit!3346 (_2!3015 lt!104196)) (currentByte!3351 (_2!3015 lt!104196)) (size!1304 (buf!1685 (_2!3015 lt!104196)))))))

(declare-fun b!65773 () Bool)

(declare-fun e!43246 () tuple2!5808)

(declare-fun Unit!4429 () Unit!4421)

(assert (=> b!65773 (= e!43246 (tuple2!5809 Unit!4429 (_2!3015 lt!103595)))))

(assert (=> b!65773 (= (size!1304 (buf!1685 (_2!3015 lt!103595))) (size!1304 (buf!1685 (_2!3015 lt!103595))))))

(declare-fun lt!104203 () Unit!4421)

(declare-fun Unit!4430 () Unit!4421)

(assert (=> b!65773 (= lt!104203 Unit!4430)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2248 array!2833 array!2833 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65773 (checkByteArrayBitContent!0 (_2!3015 lt!103595) srcBuffer!2 (_1!3022 (readBits!0 (_1!3016 call!838) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!65774 () Bool)

(declare-fun lt!104194 () tuple2!5808)

(declare-fun Unit!4431 () Unit!4421)

(assert (=> b!65774 (= e!43246 (tuple2!5809 Unit!4431 (_2!3015 lt!104194)))))

(assert (=> b!65774 (= lt!104192 (appendBitFromByte!0 (_2!3015 lt!103595) (select (arr!1868 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!104176 () (_ BitVec 64))

(assert (=> b!65774 (= lt!104176 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104207 () (_ BitVec 64))

(assert (=> b!65774 (= lt!104207 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104175 () Unit!4421)

(assert (=> b!65774 (= lt!104175 (validateOffsetBitsIneqLemma!0 (_2!3015 lt!103595) (_2!3015 lt!104192) lt!104176 lt!104207))))

(assert (=> b!65774 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!104192)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!104192))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!104192))) (bvsub lt!104176 lt!104207))))

(declare-fun lt!104199 () Unit!4421)

(assert (=> b!65774 (= lt!104199 lt!104175)))

(declare-fun lt!104193 () tuple2!5810)

(assert (=> b!65774 (= lt!104193 call!838)))

(declare-fun lt!104181 () (_ BitVec 64))

(assert (=> b!65774 (= lt!104181 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104211 () Unit!4421)

(assert (=> b!65774 (= lt!104211 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3015 lt!103595) (buf!1685 (_2!3015 lt!104192)) lt!104181))))

(assert (=> b!65774 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!104192)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!104181)))

(declare-fun lt!104195 () Unit!4421)

(assert (=> b!65774 (= lt!104195 lt!104211)))

(assert (=> b!65774 (= (head!518 (byteArrayBitContentToList!0 (_2!3015 lt!104192) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!518 (bitStreamReadBitsIntoList!0 (_2!3015 lt!104192) (_1!3016 lt!104193) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104179 () Unit!4421)

(declare-fun Unit!4432 () Unit!4421)

(assert (=> b!65774 (= lt!104179 Unit!4432)))

(assert (=> b!65774 (= lt!104194 (appendBitsMSBFirstLoop!0 (_2!3015 lt!104192) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!104213 () Unit!4421)

(assert (=> b!65774 (= lt!104213 (lemmaIsPrefixTransitive!0 (_2!3015 lt!103595) (_2!3015 lt!104192) (_2!3015 lt!104194)))))

(assert (=> b!65774 (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!104194))))

(declare-fun lt!104216 () Unit!4421)

(assert (=> b!65774 (= lt!104216 lt!104213)))

(assert (=> b!65774 (= (size!1304 (buf!1685 (_2!3015 lt!104194))) (size!1304 (buf!1685 (_2!3015 lt!103595))))))

(declare-fun lt!104200 () Unit!4421)

(declare-fun Unit!4433 () Unit!4421)

(assert (=> b!65774 (= lt!104200 Unit!4433)))

(assert (=> b!65774 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!104194))) (currentByte!3351 (_2!3015 lt!104194)) (currentBit!3346 (_2!3015 lt!104194))) (bvsub (bvadd (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104212 () Unit!4421)

(declare-fun Unit!4434 () Unit!4421)

(assert (=> b!65774 (= lt!104212 Unit!4434)))

(assert (=> b!65774 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!104194))) (currentByte!3351 (_2!3015 lt!104194)) (currentBit!3346 (_2!3015 lt!104194))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!104192))) (currentByte!3351 (_2!3015 lt!104192)) (currentBit!3346 (_2!3015 lt!104192))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104183 () Unit!4421)

(declare-fun Unit!4435 () Unit!4421)

(assert (=> b!65774 (= lt!104183 Unit!4435)))

(declare-fun lt!104202 () tuple2!5810)

(assert (=> b!65774 (= lt!104202 (reader!0 (_2!3015 lt!103595) (_2!3015 lt!104194)))))

(declare-fun lt!104218 () (_ BitVec 64))

(assert (=> b!65774 (= lt!104218 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104189 () Unit!4421)

(assert (=> b!65774 (= lt!104189 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3015 lt!103595) (buf!1685 (_2!3015 lt!104194)) lt!104218))))

(assert (=> b!65774 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!104194)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!104218)))

(declare-fun lt!104185 () Unit!4421)

(assert (=> b!65774 (= lt!104185 lt!104189)))

(declare-fun lt!104204 () tuple2!5810)

(assert (=> b!65774 (= lt!104204 (reader!0 (_2!3015 lt!104192) (_2!3015 lt!104194)))))

(declare-fun lt!104180 () (_ BitVec 64))

(assert (=> b!65774 (= lt!104180 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104197 () Unit!4421)

(assert (=> b!65774 (= lt!104197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3015 lt!104192) (buf!1685 (_2!3015 lt!104194)) lt!104180))))

(assert (=> b!65774 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!104194)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!104192))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!104192))) lt!104180)))

(declare-fun lt!104177 () Unit!4421)

(assert (=> b!65774 (= lt!104177 lt!104197)))

(declare-fun lt!104178 () List!699)

(assert (=> b!65774 (= lt!104178 (byteArrayBitContentToList!0 (_2!3015 lt!104194) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!104205 () List!699)

(assert (=> b!65774 (= lt!104205 (byteArrayBitContentToList!0 (_2!3015 lt!104194) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104187 () List!699)

(assert (=> b!65774 (= lt!104187 (bitStreamReadBitsIntoList!0 (_2!3015 lt!104194) (_1!3016 lt!104202) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!104182 () List!699)

(assert (=> b!65774 (= lt!104182 (bitStreamReadBitsIntoList!0 (_2!3015 lt!104194) (_1!3016 lt!104204) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104188 () (_ BitVec 64))

(assert (=> b!65774 (= lt!104188 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104209 () Unit!4421)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2248 BitStream!2248 BitStream!2248 BitStream!2248 (_ BitVec 64) List!699) Unit!4421)

(assert (=> b!65774 (= lt!104209 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3015 lt!104194) (_2!3015 lt!104194) (_1!3016 lt!104202) (_1!3016 lt!104204) lt!104188 lt!104187))))

(declare-fun tail!306 (List!699) List!699)

(assert (=> b!65774 (= (bitStreamReadBitsIntoList!0 (_2!3015 lt!104194) (_1!3016 lt!104204) (bvsub lt!104188 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!306 lt!104187))))

(declare-fun lt!104184 () Unit!4421)

(assert (=> b!65774 (= lt!104184 lt!104209)))

(declare-fun lt!104201 () Unit!4421)

(declare-fun lt!104217 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2833 array!2833 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4421)

(assert (=> b!65774 (= lt!104201 (arrayBitRangesEqImpliesEq!0 (buf!1685 (_2!3015 lt!104192)) (buf!1685 (_2!3015 lt!104194)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!104217 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!104192))) (currentByte!3351 (_2!3015 lt!104192)) (currentBit!3346 (_2!3015 lt!104192)))))))

(declare-fun bitAt!0 (array!2833 (_ BitVec 64)) Bool)

(assert (=> b!65774 (= (bitAt!0 (buf!1685 (_2!3015 lt!104192)) lt!104217) (bitAt!0 (buf!1685 (_2!3015 lt!104194)) lt!104217))))

(declare-fun lt!104186 () Unit!4421)

(assert (=> b!65774 (= lt!104186 lt!104201)))

(declare-fun b!65775 () Bool)

(declare-fun e!43244 () Bool)

(declare-fun lt!104198 () (_ BitVec 64))

(assert (=> b!65775 (= e!43244 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!104198))))

(declare-fun b!65776 () Bool)

(declare-fun res!54523 () Bool)

(assert (=> b!65776 (=> (not res!54523) (not e!43245))))

(assert (=> b!65776 (= res!54523 (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!104196)))))

(declare-fun d!20610 () Bool)

(assert (=> d!20610 e!43245))

(declare-fun res!54521 () Bool)

(assert (=> d!20610 (=> (not res!54521) (not e!43245))))

(declare-fun lt!104214 () (_ BitVec 64))

(assert (=> d!20610 (= res!54521 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!104196))) (currentByte!3351 (_2!3015 lt!104196)) (currentBit!3346 (_2!3015 lt!104196))) (bvsub lt!104214 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20610 (or (= (bvand lt!104214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104214 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!104208 () (_ BitVec 64))

(assert (=> d!20610 (= lt!104214 (bvadd lt!104208 to!314))))

(assert (=> d!20610 (or (not (= (bvand lt!104208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!104208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!104208 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20610 (= lt!104208 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))))))

(assert (=> d!20610 (= lt!104196 e!43246)))

(assert (=> d!20610 (= c!4772 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!104206 () Unit!4421)

(declare-fun lt!104215 () Unit!4421)

(assert (=> d!20610 (= lt!104206 lt!104215)))

(assert (=> d!20610 (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!103595))))

(assert (=> d!20610 (= lt!104215 (lemmaIsPrefixRefl!0 (_2!3015 lt!103595)))))

(assert (=> d!20610 (= lt!104217 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))))))

(assert (=> d!20610 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20610 (= (appendBitsMSBFirstLoop!0 (_2!3015 lt!103595) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!104196)))

(declare-fun b!65777 () Bool)

(declare-fun res!54526 () Bool)

(assert (=> b!65777 (=> (not res!54526) (not e!43245))))

(assert (=> b!65777 (= res!54526 (= (size!1304 (buf!1685 (_2!3015 lt!104196))) (size!1304 (buf!1685 (_2!3015 lt!103595)))))))

(declare-fun lt!104210 () tuple2!5810)

(declare-fun b!65778 () Bool)

(assert (=> b!65778 (= e!43245 (= (bitStreamReadBitsIntoList!0 (_2!3015 lt!104196) (_1!3016 lt!104210) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3015 lt!104196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!65778 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65778 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!104191 () Unit!4421)

(declare-fun lt!104190 () Unit!4421)

(assert (=> b!65778 (= lt!104191 lt!104190)))

(assert (=> b!65778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!104196)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595))) lt!104198)))

(assert (=> b!65778 (= lt!104190 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3015 lt!103595) (buf!1685 (_2!3015 lt!104196)) lt!104198))))

(assert (=> b!65778 e!43244))

(declare-fun res!54522 () Bool)

(assert (=> b!65778 (=> (not res!54522) (not e!43244))))

(assert (=> b!65778 (= res!54522 (and (= (size!1304 (buf!1685 (_2!3015 lt!103595))) (size!1304 (buf!1685 (_2!3015 lt!104196)))) (bvsge lt!104198 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65778 (= lt!104198 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!65778 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65778 (= lt!104210 (reader!0 (_2!3015 lt!103595) (_2!3015 lt!104196)))))

(assert (= (and d!20610 c!4772) b!65774))

(assert (= (and d!20610 (not c!4772)) b!65773))

(assert (= (or b!65774 b!65773) bm!835))

(assert (= (and d!20610 res!54521) b!65772))

(assert (= (and b!65772 res!54525) b!65771))

(assert (= (and b!65771 res!54524) b!65776))

(assert (= (and b!65776 res!54523) b!65777))

(assert (= (and b!65777 res!54526) b!65778))

(assert (= (and b!65778 res!54522) b!65775))

(declare-fun m!104325 () Bool)

(assert (=> b!65774 m!104325))

(declare-fun m!104327 () Bool)

(assert (=> b!65774 m!104327))

(declare-fun m!104329 () Bool)

(assert (=> b!65774 m!104329))

(declare-fun m!104331 () Bool)

(assert (=> b!65774 m!104331))

(assert (=> b!65774 m!104329))

(declare-fun m!104333 () Bool)

(assert (=> b!65774 m!104333))

(declare-fun m!104335 () Bool)

(assert (=> b!65774 m!104335))

(declare-fun m!104337 () Bool)

(assert (=> b!65774 m!104337))

(declare-fun m!104339 () Bool)

(assert (=> b!65774 m!104339))

(declare-fun m!104341 () Bool)

(assert (=> b!65774 m!104341))

(declare-fun m!104343 () Bool)

(assert (=> b!65774 m!104343))

(declare-fun m!104345 () Bool)

(assert (=> b!65774 m!104345))

(declare-fun m!104347 () Bool)

(assert (=> b!65774 m!104347))

(declare-fun m!104349 () Bool)

(assert (=> b!65774 m!104349))

(declare-fun m!104351 () Bool)

(assert (=> b!65774 m!104351))

(declare-fun m!104353 () Bool)

(assert (=> b!65774 m!104353))

(declare-fun m!104355 () Bool)

(assert (=> b!65774 m!104355))

(declare-fun m!104357 () Bool)

(assert (=> b!65774 m!104357))

(assert (=> b!65774 m!104345))

(declare-fun m!104359 () Bool)

(assert (=> b!65774 m!104359))

(assert (=> b!65774 m!103827))

(declare-fun m!104361 () Bool)

(assert (=> b!65774 m!104361))

(assert (=> b!65774 m!104353))

(declare-fun m!104363 () Bool)

(assert (=> b!65774 m!104363))

(declare-fun m!104365 () Bool)

(assert (=> b!65774 m!104365))

(declare-fun m!104367 () Bool)

(assert (=> b!65774 m!104367))

(declare-fun m!104369 () Bool)

(assert (=> b!65774 m!104369))

(declare-fun m!104371 () Bool)

(assert (=> b!65774 m!104371))

(declare-fun m!104373 () Bool)

(assert (=> b!65774 m!104373))

(declare-fun m!104375 () Bool)

(assert (=> b!65774 m!104375))

(declare-fun m!104377 () Bool)

(assert (=> b!65774 m!104377))

(declare-fun m!104379 () Bool)

(assert (=> b!65774 m!104379))

(assert (=> b!65774 m!104373))

(declare-fun m!104381 () Bool)

(assert (=> b!65774 m!104381))

(declare-fun m!104383 () Bool)

(assert (=> b!65774 m!104383))

(declare-fun m!104385 () Bool)

(assert (=> b!65774 m!104385))

(declare-fun m!104387 () Bool)

(assert (=> b!65775 m!104387))

(declare-fun m!104389 () Bool)

(assert (=> b!65776 m!104389))

(declare-fun m!104391 () Bool)

(assert (=> b!65778 m!104391))

(declare-fun m!104393 () Bool)

(assert (=> b!65778 m!104393))

(declare-fun m!104395 () Bool)

(assert (=> b!65778 m!104395))

(declare-fun m!104397 () Bool)

(assert (=> b!65778 m!104397))

(declare-fun m!104399 () Bool)

(assert (=> b!65778 m!104399))

(declare-fun m!104401 () Bool)

(assert (=> b!65773 m!104401))

(declare-fun m!104403 () Bool)

(assert (=> b!65773 m!104403))

(declare-fun m!104405 () Bool)

(assert (=> b!65772 m!104405))

(declare-fun m!104407 () Bool)

(assert (=> d!20610 m!104407))

(assert (=> d!20610 m!103827))

(assert (=> d!20610 m!104229))

(assert (=> d!20610 m!104225))

(declare-fun m!104409 () Bool)

(assert (=> bm!835 m!104409))

(assert (=> b!65358 d!20610))

(declare-fun d!20644 () Bool)

(assert (=> d!20644 (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104219 () Unit!4421)

(assert (=> d!20644 (= lt!104219 (choose!9 thiss!1379 (buf!1685 (_2!3015 lt!103595)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2249 (buf!1685 (_2!3015 lt!103595)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379))))))

(assert (=> d!20644 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1685 (_2!3015 lt!103595)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!104219)))

(declare-fun bs!5028 () Bool)

(assert (= bs!5028 d!20644))

(assert (=> bs!5028 m!103833))

(declare-fun m!104411 () Bool)

(assert (=> bs!5028 m!104411))

(assert (=> b!65358 d!20644))

(declare-fun d!20646 () Bool)

(assert (=> d!20646 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103591))))

(declare-fun lt!104222 () Unit!4421)

(declare-fun choose!30 (BitStream!2248 BitStream!2248 BitStream!2248) Unit!4421)

(assert (=> d!20646 (= lt!104222 (choose!30 thiss!1379 (_2!3015 lt!103595) (_2!3015 lt!103591)))))

(assert (=> d!20646 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103595))))

(assert (=> d!20646 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3015 lt!103595) (_2!3015 lt!103591)) lt!104222)))

(declare-fun bs!5029 () Bool)

(assert (= bs!5029 d!20646))

(assert (=> bs!5029 m!103831))

(declare-fun m!104413 () Bool)

(assert (=> bs!5029 m!104413))

(assert (=> bs!5029 m!103761))

(assert (=> b!65358 d!20646))

(declare-fun d!20648 () Bool)

(declare-fun res!54528 () Bool)

(declare-fun e!43248 () Bool)

(assert (=> d!20648 (=> (not res!54528) (not e!43248))))

(assert (=> d!20648 (= res!54528 (= (size!1304 (buf!1685 thiss!1379)) (size!1304 (buf!1685 (_2!3015 lt!103591)))))))

(assert (=> d!20648 (= (isPrefixOf!0 thiss!1379 (_2!3015 lt!103591)) e!43248)))

(declare-fun b!65779 () Bool)

(declare-fun res!54529 () Bool)

(assert (=> b!65779 (=> (not res!54529) (not e!43248))))

(assert (=> b!65779 (= res!54529 (bvsle (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591)))))))

(declare-fun b!65780 () Bool)

(declare-fun e!43247 () Bool)

(assert (=> b!65780 (= e!43248 e!43247)))

(declare-fun res!54527 () Bool)

(assert (=> b!65780 (=> res!54527 e!43247)))

(assert (=> b!65780 (= res!54527 (= (size!1304 (buf!1685 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65781 () Bool)

(assert (=> b!65781 (= e!43247 (arrayBitRangesEq!0 (buf!1685 thiss!1379) (buf!1685 (_2!3015 lt!103591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379))))))

(assert (= (and d!20648 res!54528) b!65779))

(assert (= (and b!65779 res!54529) b!65780))

(assert (= (and b!65780 (not res!54527)) b!65781))

(assert (=> b!65779 m!103795))

(assert (=> b!65779 m!103799))

(assert (=> b!65781 m!103795))

(assert (=> b!65781 m!103795))

(declare-fun m!104415 () Bool)

(assert (=> b!65781 m!104415))

(assert (=> b!65358 d!20648))

(declare-fun d!20650 () Bool)

(declare-fun res!54531 () Bool)

(declare-fun e!43250 () Bool)

(assert (=> d!20650 (=> (not res!54531) (not e!43250))))

(assert (=> d!20650 (= res!54531 (= (size!1304 (buf!1685 (_2!3015 lt!103595))) (size!1304 (buf!1685 (_2!3015 lt!103591)))))))

(assert (=> d!20650 (= (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!103591)) e!43250)))

(declare-fun b!65782 () Bool)

(declare-fun res!54532 () Bool)

(assert (=> b!65782 (=> (not res!54532) (not e!43250))))

(assert (=> b!65782 (= res!54532 (bvsle (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591)))))))

(declare-fun b!65783 () Bool)

(declare-fun e!43249 () Bool)

(assert (=> b!65783 (= e!43250 e!43249)))

(declare-fun res!54530 () Bool)

(assert (=> b!65783 (=> res!54530 e!43249)))

(assert (=> b!65783 (= res!54530 (= (size!1304 (buf!1685 (_2!3015 lt!103595))) #b00000000000000000000000000000000))))

(declare-fun b!65784 () Bool)

(assert (=> b!65784 (= e!43249 (arrayBitRangesEq!0 (buf!1685 (_2!3015 lt!103595)) (buf!1685 (_2!3015 lt!103591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595)))))))

(assert (= (and d!20650 res!54531) b!65782))

(assert (= (and b!65782 res!54532) b!65783))

(assert (= (and b!65783 (not res!54530)) b!65784))

(assert (=> b!65782 m!103827))

(assert (=> b!65782 m!103799))

(assert (=> b!65784 m!103827))

(assert (=> b!65784 m!103827))

(declare-fun m!104417 () Bool)

(assert (=> b!65784 m!104417))

(assert (=> b!65358 d!20650))

(declare-fun lt!104228 () (_ BitVec 64))

(declare-fun lt!104238 () tuple2!5810)

(declare-fun lt!104235 () (_ BitVec 64))

(declare-fun b!65785 () Bool)

(declare-fun e!43251 () Bool)

(assert (=> b!65785 (= e!43251 (= (_1!3016 lt!104238) (withMovedBitIndex!0 (_2!3016 lt!104238) (bvsub lt!104235 lt!104228))))))

(assert (=> b!65785 (or (= (bvand lt!104235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104235 lt!104228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65785 (= lt!104228 (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))))))

(assert (=> b!65785 (= lt!104235 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(declare-fun b!65786 () Bool)

(declare-fun e!43252 () Unit!4421)

(declare-fun lt!104227 () Unit!4421)

(assert (=> b!65786 (= e!43252 lt!104227)))

(declare-fun lt!104229 () (_ BitVec 64))

(assert (=> b!65786 (= lt!104229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104233 () (_ BitVec 64))

(assert (=> b!65786 (= lt!104233 (bitIndex!0 (size!1304 (buf!1685 thiss!1379)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(assert (=> b!65786 (= lt!104227 (arrayBitRangesEqSymmetric!0 (buf!1685 thiss!1379) (buf!1685 (_2!3015 lt!103595)) lt!104229 lt!104233))))

(assert (=> b!65786 (arrayBitRangesEq!0 (buf!1685 (_2!3015 lt!103595)) (buf!1685 thiss!1379) lt!104229 lt!104233)))

(declare-fun b!65787 () Bool)

(declare-fun res!54534 () Bool)

(assert (=> b!65787 (=> (not res!54534) (not e!43251))))

(assert (=> b!65787 (= res!54534 (isPrefixOf!0 (_2!3016 lt!104238) (_2!3015 lt!103595)))))

(declare-fun d!20652 () Bool)

(assert (=> d!20652 e!43251))

(declare-fun res!54533 () Bool)

(assert (=> d!20652 (=> (not res!54533) (not e!43251))))

(assert (=> d!20652 (= res!54533 (isPrefixOf!0 (_1!3016 lt!104238) (_2!3016 lt!104238)))))

(declare-fun lt!104226 () BitStream!2248)

(assert (=> d!20652 (= lt!104238 (tuple2!5811 lt!104226 (_2!3015 lt!103595)))))

(declare-fun lt!104239 () Unit!4421)

(declare-fun lt!104237 () Unit!4421)

(assert (=> d!20652 (= lt!104239 lt!104237)))

(assert (=> d!20652 (isPrefixOf!0 lt!104226 (_2!3015 lt!103595))))

(assert (=> d!20652 (= lt!104237 (lemmaIsPrefixTransitive!0 lt!104226 (_2!3015 lt!103595) (_2!3015 lt!103595)))))

(declare-fun lt!104236 () Unit!4421)

(declare-fun lt!104232 () Unit!4421)

(assert (=> d!20652 (= lt!104236 lt!104232)))

(assert (=> d!20652 (isPrefixOf!0 lt!104226 (_2!3015 lt!103595))))

(assert (=> d!20652 (= lt!104232 (lemmaIsPrefixTransitive!0 lt!104226 thiss!1379 (_2!3015 lt!103595)))))

(declare-fun lt!104230 () Unit!4421)

(assert (=> d!20652 (= lt!104230 e!43252)))

(declare-fun c!4773 () Bool)

(assert (=> d!20652 (= c!4773 (not (= (size!1304 (buf!1685 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!104241 () Unit!4421)

(declare-fun lt!104223 () Unit!4421)

(assert (=> d!20652 (= lt!104241 lt!104223)))

(assert (=> d!20652 (isPrefixOf!0 (_2!3015 lt!103595) (_2!3015 lt!103595))))

(assert (=> d!20652 (= lt!104223 (lemmaIsPrefixRefl!0 (_2!3015 lt!103595)))))

(declare-fun lt!104242 () Unit!4421)

(declare-fun lt!104225 () Unit!4421)

(assert (=> d!20652 (= lt!104242 lt!104225)))

(assert (=> d!20652 (= lt!104225 (lemmaIsPrefixRefl!0 (_2!3015 lt!103595)))))

(declare-fun lt!104231 () Unit!4421)

(declare-fun lt!104234 () Unit!4421)

(assert (=> d!20652 (= lt!104231 lt!104234)))

(assert (=> d!20652 (isPrefixOf!0 lt!104226 lt!104226)))

(assert (=> d!20652 (= lt!104234 (lemmaIsPrefixRefl!0 lt!104226))))

(declare-fun lt!104240 () Unit!4421)

(declare-fun lt!104224 () Unit!4421)

(assert (=> d!20652 (= lt!104240 lt!104224)))

(assert (=> d!20652 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20652 (= lt!104224 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20652 (= lt!104226 (BitStream!2249 (buf!1685 (_2!3015 lt!103595)) (currentByte!3351 thiss!1379) (currentBit!3346 thiss!1379)))))

(assert (=> d!20652 (isPrefixOf!0 thiss!1379 (_2!3015 lt!103595))))

(assert (=> d!20652 (= (reader!0 thiss!1379 (_2!3015 lt!103595)) lt!104238)))

(declare-fun b!65788 () Bool)

(declare-fun Unit!4436 () Unit!4421)

(assert (=> b!65788 (= e!43252 Unit!4436)))

(declare-fun b!65789 () Bool)

(declare-fun res!54535 () Bool)

(assert (=> b!65789 (=> (not res!54535) (not e!43251))))

(assert (=> b!65789 (= res!54535 (isPrefixOf!0 (_1!3016 lt!104238) thiss!1379))))

(assert (= (and d!20652 c!4773) b!65786))

(assert (= (and d!20652 (not c!4773)) b!65788))

(assert (= (and d!20652 res!54533) b!65789))

(assert (= (and b!65789 res!54535) b!65787))

(assert (= (and b!65787 res!54534) b!65785))

(assert (=> b!65786 m!103795))

(declare-fun m!104419 () Bool)

(assert (=> b!65786 m!104419))

(declare-fun m!104421 () Bool)

(assert (=> b!65786 m!104421))

(declare-fun m!104423 () Bool)

(assert (=> d!20652 m!104423))

(assert (=> d!20652 m!103761))

(assert (=> d!20652 m!104225))

(declare-fun m!104425 () Bool)

(assert (=> d!20652 m!104425))

(assert (=> d!20652 m!103793))

(declare-fun m!104427 () Bool)

(assert (=> d!20652 m!104427))

(assert (=> d!20652 m!104229))

(assert (=> d!20652 m!103791))

(declare-fun m!104429 () Bool)

(assert (=> d!20652 m!104429))

(declare-fun m!104431 () Bool)

(assert (=> d!20652 m!104431))

(declare-fun m!104433 () Bool)

(assert (=> d!20652 m!104433))

(declare-fun m!104435 () Bool)

(assert (=> b!65785 m!104435))

(assert (=> b!65785 m!103827))

(assert (=> b!65785 m!103795))

(declare-fun m!104437 () Bool)

(assert (=> b!65787 m!104437))

(declare-fun m!104439 () Bool)

(assert (=> b!65789 m!104439))

(assert (=> b!65358 d!20652))

(declare-fun d!20654 () Bool)

(assert (=> d!20654 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 thiss!1379)) ((_ sign_extend 32) (currentBit!3346 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5030 () Bool)

(assert (= bs!5030 d!20654))

(declare-fun m!104441 () Bool)

(assert (=> bs!5030 m!104441))

(assert (=> b!65358 d!20654))

(declare-fun d!20656 () Bool)

(assert (=> d!20656 (= (invariant!0 (currentBit!3346 (_2!3015 lt!103595)) (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103591)))) (and (bvsge (currentBit!3346 (_2!3015 lt!103595)) #b00000000000000000000000000000000) (bvslt (currentBit!3346 (_2!3015 lt!103595)) #b00000000000000000000000000001000) (bvsge (currentByte!3351 (_2!3015 lt!103595)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103591)))) (and (= (currentBit!3346 (_2!3015 lt!103595)) #b00000000000000000000000000000000) (= (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103591))))))))))

(assert (=> b!65347 d!20656))

(declare-fun d!20658 () Bool)

(assert (=> d!20658 (= (array_inv!1183 (buf!1685 thiss!1379)) (bvsge (size!1304 (buf!1685 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!65346 d!20658))

(declare-fun d!20660 () Bool)

(assert (=> d!20660 (= (invariant!0 (currentBit!3346 (_2!3015 lt!103591)) (currentByte!3351 (_2!3015 lt!103591)) (size!1304 (buf!1685 (_2!3015 lt!103591)))) (and (bvsge (currentBit!3346 (_2!3015 lt!103591)) #b00000000000000000000000000000000) (bvslt (currentBit!3346 (_2!3015 lt!103591)) #b00000000000000000000000000001000) (bvsge (currentByte!3351 (_2!3015 lt!103591)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3351 (_2!3015 lt!103591)) (size!1304 (buf!1685 (_2!3015 lt!103591)))) (and (= (currentBit!3346 (_2!3015 lt!103591)) #b00000000000000000000000000000000) (= (currentByte!3351 (_2!3015 lt!103591)) (size!1304 (buf!1685 (_2!3015 lt!103591))))))))))

(assert (=> b!65340 d!20660))

(declare-fun d!20662 () Bool)

(assert (=> d!20662 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103598)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103598))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103598))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103598)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103598))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103598)))) (bvsub to!314 i!635)))))

(declare-fun bs!5031 () Bool)

(assert (= bs!5031 d!20662))

(assert (=> bs!5031 m!104101))

(assert (=> b!65351 d!20662))

(declare-fun d!20664 () Bool)

(declare-fun res!54537 () Bool)

(declare-fun e!43254 () Bool)

(assert (=> d!20664 (=> (not res!54537) (not e!43254))))

(assert (=> d!20664 (= res!54537 (= (size!1304 (buf!1685 (_1!3016 lt!103598))) (size!1304 (buf!1685 (_2!3015 lt!103591)))))))

(assert (=> d!20664 (= (isPrefixOf!0 (_1!3016 lt!103598) (_2!3015 lt!103591)) e!43254)))

(declare-fun b!65790 () Bool)

(declare-fun res!54538 () Bool)

(assert (=> b!65790 (=> (not res!54538) (not e!43254))))

(assert (=> b!65790 (= res!54538 (bvsle (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103598))) (currentByte!3351 (_1!3016 lt!103598)) (currentBit!3346 (_1!3016 lt!103598))) (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103591))) (currentByte!3351 (_2!3015 lt!103591)) (currentBit!3346 (_2!3015 lt!103591)))))))

(declare-fun b!65791 () Bool)

(declare-fun e!43253 () Bool)

(assert (=> b!65791 (= e!43254 e!43253)))

(declare-fun res!54536 () Bool)

(assert (=> b!65791 (=> res!54536 e!43253)))

(assert (=> b!65791 (= res!54536 (= (size!1304 (buf!1685 (_1!3016 lt!103598))) #b00000000000000000000000000000000))))

(declare-fun b!65792 () Bool)

(assert (=> b!65792 (= e!43253 (arrayBitRangesEq!0 (buf!1685 (_1!3016 lt!103598)) (buf!1685 (_2!3015 lt!103591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103598))) (currentByte!3351 (_1!3016 lt!103598)) (currentBit!3346 (_1!3016 lt!103598)))))))

(assert (= (and d!20664 res!54537) b!65790))

(assert (= (and b!65790 res!54538) b!65791))

(assert (= (and b!65791 (not res!54536)) b!65792))

(assert (=> b!65790 m!103783))

(assert (=> b!65790 m!103799))

(assert (=> b!65792 m!103783))

(assert (=> b!65792 m!103783))

(declare-fun m!104443 () Bool)

(assert (=> b!65792 m!104443))

(assert (=> b!65350 d!20664))

(declare-fun d!20666 () Bool)

(assert (=> d!20666 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103593)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103593))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103593))) lt!103600) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_1!3016 lt!103593)))) ((_ sign_extend 32) (currentByte!3351 (_1!3016 lt!103593))) ((_ sign_extend 32) (currentBit!3346 (_1!3016 lt!103593)))) lt!103600))))

(declare-fun bs!5032 () Bool)

(assert (= bs!5032 d!20666))

(assert (=> bs!5032 m!104105))

(assert (=> b!65339 d!20666))

(declare-fun d!20668 () Bool)

(declare-fun e!43255 () Bool)

(assert (=> d!20668 e!43255))

(declare-fun res!54539 () Bool)

(assert (=> d!20668 (=> (not res!54539) (not e!43255))))

(declare-fun lt!104247 () (_ BitVec 64))

(declare-fun lt!104246 () (_ BitVec 64))

(declare-fun lt!104243 () (_ BitVec 64))

(assert (=> d!20668 (= res!54539 (= lt!104243 (bvsub lt!104247 lt!104246)))))

(assert (=> d!20668 (or (= (bvand lt!104247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104247 lt!104246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20668 (= lt!104246 (remainingBits!0 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))) ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595)))))))

(declare-fun lt!104248 () (_ BitVec 64))

(declare-fun lt!104245 () (_ BitVec 64))

(assert (=> d!20668 (= lt!104247 (bvmul lt!104248 lt!104245))))

(assert (=> d!20668 (or (= lt!104248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104245 (bvsdiv (bvmul lt!104248 lt!104245) lt!104248)))))

(assert (=> d!20668 (= lt!104245 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20668 (= lt!104248 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))))))

(assert (=> d!20668 (= lt!104243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3351 (_2!3015 lt!103595))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3346 (_2!3015 lt!103595)))))))

(assert (=> d!20668 (invariant!0 (currentBit!3346 (_2!3015 lt!103595)) (currentByte!3351 (_2!3015 lt!103595)) (size!1304 (buf!1685 (_2!3015 lt!103595))))))

(assert (=> d!20668 (= (bitIndex!0 (size!1304 (buf!1685 (_2!3015 lt!103595))) (currentByte!3351 (_2!3015 lt!103595)) (currentBit!3346 (_2!3015 lt!103595))) lt!104243)))

(declare-fun b!65793 () Bool)

(declare-fun res!54540 () Bool)

(assert (=> b!65793 (=> (not res!54540) (not e!43255))))

(assert (=> b!65793 (= res!54540 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104243))))

(declare-fun b!65794 () Bool)

(declare-fun lt!104244 () (_ BitVec 64))

(assert (=> b!65794 (= e!43255 (bvsle lt!104243 (bvmul lt!104244 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65794 (or (= lt!104244 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104244 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104244)))))

(assert (=> b!65794 (= lt!104244 ((_ sign_extend 32) (size!1304 (buf!1685 (_2!3015 lt!103595)))))))

(assert (= (and d!20668 res!54539) b!65793))

(assert (= (and b!65793 res!54540) b!65794))

(assert (=> d!20668 m!104029))

(assert (=> d!20668 m!103843))

(assert (=> b!65338 d!20668))

(declare-fun d!20670 () Bool)

(assert (=> d!20670 (= (array_inv!1183 srcBuffer!2) (bvsge (size!1304 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12768 d!20670))

(declare-fun d!20672 () Bool)

(assert (=> d!20672 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3346 thiss!1379) (currentByte!3351 thiss!1379) (size!1304 (buf!1685 thiss!1379))))))

(declare-fun bs!5033 () Bool)

(assert (= bs!5033 d!20672))

(assert (=> bs!5033 m!104099))

(assert (=> start!12768 d!20672))

(declare-fun d!20674 () Bool)

(declare-fun res!54542 () Bool)

(declare-fun e!43257 () Bool)

(assert (=> d!20674 (=> (not res!54542) (not e!43257))))

(assert (=> d!20674 (= res!54542 (= (size!1304 (buf!1685 (_1!3016 lt!103598))) (size!1304 (buf!1685 (_1!3016 lt!103593)))))))

(assert (=> d!20674 (= (isPrefixOf!0 (_1!3016 lt!103598) (_1!3016 lt!103593)) e!43257)))

(declare-fun b!65795 () Bool)

(declare-fun res!54543 () Bool)

(assert (=> b!65795 (=> (not res!54543) (not e!43257))))

(assert (=> b!65795 (= res!54543 (bvsle (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103598))) (currentByte!3351 (_1!3016 lt!103598)) (currentBit!3346 (_1!3016 lt!103598))) (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103593))) (currentByte!3351 (_1!3016 lt!103593)) (currentBit!3346 (_1!3016 lt!103593)))))))

(declare-fun b!65796 () Bool)

(declare-fun e!43256 () Bool)

(assert (=> b!65796 (= e!43257 e!43256)))

(declare-fun res!54541 () Bool)

(assert (=> b!65796 (=> res!54541 e!43256)))

(assert (=> b!65796 (= res!54541 (= (size!1304 (buf!1685 (_1!3016 lt!103598))) #b00000000000000000000000000000000))))

(declare-fun b!65797 () Bool)

(assert (=> b!65797 (= e!43256 (arrayBitRangesEq!0 (buf!1685 (_1!3016 lt!103598)) (buf!1685 (_1!3016 lt!103593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1304 (buf!1685 (_1!3016 lt!103598))) (currentByte!3351 (_1!3016 lt!103598)) (currentBit!3346 (_1!3016 lt!103598)))))))

(assert (= (and d!20674 res!54542) b!65795))

(assert (= (and b!65795 res!54543) b!65796))

(assert (= (and b!65796 (not res!54541)) b!65797))

(assert (=> b!65795 m!103783))

(assert (=> b!65795 m!103785))

(assert (=> b!65797 m!103783))

(assert (=> b!65797 m!103783))

(declare-fun m!104445 () Bool)

(assert (=> b!65797 m!104445))

(assert (=> b!65349 d!20674))

(push 1)

(assert (not d!20596))

(assert (not b!65565))

(assert (not b!65790))

(assert (not b!65498))

(assert (not d!20504))

(assert (not b!65776))

(assert (not d!20662))

(assert (not b!65774))

(assert (not d!20552))

(assert (not b!65651))

(assert (not d!20608))

(assert (not b!65682))

(assert (not d!20554))

(assert (not b!65564))

(assert (not b!65570))

(assert (not d!20590))

(assert (not d!20588))

(assert (not b!65569))

(assert (not b!65772))

(assert (not b!65797))

(assert (not b!65691))

(assert (not b!65683))

(assert (not b!65573))

(assert (not d!20558))

(assert (not b!65779))

(assert (not d!20644))

(assert (not b!65786))

(assert (not b!65792))

(assert (not b!65596))

(assert (not b!65594))

(assert (not b!65773))

(assert (not bm!835))

(assert (not b!65648))

(assert (not d!20544))

(assert (not b!65649))

(assert (not d!20672))

(assert (not d!20562))

(assert (not b!65568))

(assert (not b!65782))

(assert (not b!65784))

(assert (not b!65681))

(assert (not b!65567))

(assert (not d!20492))

(assert (not b!65694))

(assert (not b!65674))

(assert (not d!20610))

(assert (not b!65563))

(assert (not d!20668))

(assert (not d!20508))

(assert (not b!65693))

(assert (not b!65785))

(assert (not b!65778))

(assert (not b!65676))

(assert (not b!65675))

(assert (not d!20666))

(assert (not b!65775))

(assert (not b!65647))

(assert (not d!20592))

(assert (not d!20506))

(assert (not b!65695))

(assert (not b!65679))

(assert (not d!20538))

(assert (not b!65571))

(assert (not b!65678))

(assert (not b!65787))

(assert (not b!65503))

(assert (not b!65680))

(assert (not d!20654))

(assert (not d!20646))

(assert (not b!65566))

(assert (not d!20550))

(assert (not b!65500))

(assert (not b!65789))

(assert (not b!65781))

(assert (not b!65795))

(assert (not b!65685))

(assert (not d!20652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

