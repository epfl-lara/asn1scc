; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8080 () Bool)

(assert start!8080)

(declare-fun b!40331 () Bool)

(declare-fun res!34299 () Bool)

(declare-fun e!26556 () Bool)

(assert (=> b!40331 (=> res!34299 e!26556)))

(declare-datatypes ((List!478 0))(
  ( (Nil!475) (Cons!474 (h!593 Bool) (t!1228 List!478)) )
))
(declare-fun lt!61453 () List!478)

(declare-fun lt!61459 () Bool)

(declare-fun head!315 (List!478) Bool)

(assert (=> b!40331 (= res!34299 (not (= (head!315 lt!61453) lt!61459)))))

(declare-fun b!40332 () Bool)

(declare-fun e!26550 () Bool)

(assert (=> b!40332 (= e!26550 e!26556)))

(declare-fun res!34294 () Bool)

(assert (=> b!40332 (=> res!34294 e!26556)))

(declare-fun lt!61440 () (_ BitVec 64))

(declare-datatypes ((array!2002 0))(
  ( (array!2003 (arr!1404 (Array (_ BitVec 32) (_ BitVec 8))) (size!905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1554 0))(
  ( (BitStream!1555 (buf!1233 array!2002) (currentByte!2651 (_ BitVec 32)) (currentBit!2646 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3874 0))(
  ( (tuple2!3875 (_1!2024 BitStream!1554) (_2!2024 BitStream!1554)) )
))
(declare-fun lt!61447 () tuple2!3874)

(declare-fun bitAt!0 (array!2002 (_ BitVec 64)) Bool)

(assert (=> b!40332 (= res!34294 (not (= lt!61459 (bitAt!0 (buf!1233 (_1!2024 lt!61447)) lt!61440))))))

(declare-fun lt!61443 () tuple2!3874)

(assert (=> b!40332 (= lt!61459 (bitAt!0 (buf!1233 (_1!2024 lt!61443)) lt!61440))))

(declare-fun b!40333 () Bool)

(declare-fun e!26551 () Bool)

(declare-fun e!26552 () Bool)

(assert (=> b!40333 (= e!26551 e!26552)))

(declare-fun res!34280 () Bool)

(assert (=> b!40333 (=> res!34280 e!26552)))

(declare-fun lt!61442 () Bool)

(declare-fun lt!61446 () Bool)

(assert (=> b!40333 (= res!34280 (not (= lt!61442 lt!61446)))))

(declare-fun lt!61460 () Bool)

(assert (=> b!40333 (= lt!61460 lt!61442)))

(declare-datatypes ((Unit!2855 0))(
  ( (Unit!2856) )
))
(declare-datatypes ((tuple2!3876 0))(
  ( (tuple2!3877 (_1!2025 Unit!2855) (_2!2025 BitStream!1554)) )
))
(declare-fun lt!61461 () tuple2!3876)

(assert (=> b!40333 (= lt!61442 (bitAt!0 (buf!1233 (_2!2025 lt!61461)) lt!61440))))

(declare-fun lt!61456 () (_ BitVec 64))

(declare-fun lt!61451 () tuple2!3876)

(declare-fun lt!61452 () Unit!2855)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2002 array!2002 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2855)

(assert (=> b!40333 (= lt!61452 (arrayBitRangesEqImpliesEq!0 (buf!1233 (_2!2025 lt!61451)) (buf!1233 (_2!2025 lt!61461)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!61440 lt!61456))))

(declare-fun b!40334 () Bool)

(declare-fun res!34293 () Bool)

(declare-fun e!26558 () Bool)

(assert (=> b!40334 (=> (not res!34293) (not e!26558))))

(declare-fun thiss!1379 () BitStream!1554)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40334 (= res!34293 (validate_offset_bits!1 ((_ sign_extend 32) (size!905 (buf!1233 thiss!1379))) ((_ sign_extend 32) (currentByte!2651 thiss!1379)) ((_ sign_extend 32) (currentBit!2646 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40335 () Bool)

(declare-fun res!34286 () Bool)

(declare-fun e!26555 () Bool)

(assert (=> b!40335 (=> res!34286 e!26555)))

(assert (=> b!40335 (= res!34286 (not (= (size!905 (buf!1233 thiss!1379)) (size!905 (buf!1233 (_2!2025 lt!61461))))))))

(declare-fun b!40336 () Bool)

(declare-fun e!26549 () Bool)

(assert (=> b!40336 (= e!26549 e!26550)))

(declare-fun res!34296 () Bool)

(assert (=> b!40336 (=> res!34296 e!26550)))

(declare-fun lt!61450 () List!478)

(declare-fun lt!61444 () List!478)

(assert (=> b!40336 (= res!34296 (not (= lt!61450 lt!61444)))))

(assert (=> b!40336 (= lt!61444 lt!61450)))

(declare-fun tail!195 (List!478) List!478)

(assert (=> b!40336 (= lt!61450 (tail!195 lt!61453))))

(declare-fun lt!61455 () Unit!2855)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1554 BitStream!1554 BitStream!1554 BitStream!1554 (_ BitVec 64) List!478) Unit!2855)

(assert (=> b!40336 (= lt!61455 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2025 lt!61461) (_2!2025 lt!61461) (_1!2024 lt!61443) (_1!2024 lt!61447) (bvsub to!314 i!635) lt!61453))))

(declare-fun b!40337 () Bool)

(declare-fun e!26546 () Bool)

(assert (=> b!40337 (= e!26546 e!26551)))

(declare-fun res!34292 () Bool)

(assert (=> b!40337 (=> res!34292 e!26551)))

(assert (=> b!40337 (= res!34292 (not (= lt!61460 lt!61446)))))

(assert (=> b!40337 (= lt!61460 (bitAt!0 (buf!1233 (_2!2025 lt!61451)) lt!61440))))

(declare-fun b!40338 () Bool)

(assert (=> b!40338 (= e!26552 true)))

(declare-datatypes ((tuple2!3878 0))(
  ( (tuple2!3879 (_1!2026 BitStream!1554) (_2!2026 Bool)) )
))
(declare-fun lt!61449 () tuple2!3878)

(declare-fun readBitPure!0 (BitStream!1554) tuple2!3878)

(assert (=> b!40338 (= lt!61449 (readBitPure!0 (_1!2024 lt!61443)))))

(declare-fun res!34284 () Bool)

(assert (=> start!8080 (=> (not res!34284) (not e!26558))))

(declare-fun srcBuffer!2 () array!2002)

(assert (=> start!8080 (= res!34284 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!905 srcBuffer!2))))))))

(assert (=> start!8080 e!26558))

(assert (=> start!8080 true))

(declare-fun array_inv!830 (array!2002) Bool)

(assert (=> start!8080 (array_inv!830 srcBuffer!2)))

(declare-fun e!26548 () Bool)

(declare-fun inv!12 (BitStream!1554) Bool)

(assert (=> start!8080 (and (inv!12 thiss!1379) e!26548)))

(declare-fun b!40339 () Bool)

(declare-fun e!26559 () Bool)

(assert (=> b!40339 (= e!26555 e!26559)))

(declare-fun res!34298 () Bool)

(assert (=> b!40339 (=> res!34298 e!26559)))

(assert (=> b!40339 (= res!34298 (not (= (size!905 (buf!1233 (_2!2025 lt!61451))) (size!905 (buf!1233 (_2!2025 lt!61461))))))))

(declare-fun lt!61458 () (_ BitVec 64))

(assert (=> b!40339 (= lt!61458 (bvsub (bvsub (bvadd lt!61456 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40339 (= lt!61456 (bitIndex!0 (size!905 (buf!1233 (_2!2025 lt!61451))) (currentByte!2651 (_2!2025 lt!61451)) (currentBit!2646 (_2!2025 lt!61451))))))

(assert (=> b!40339 (= (size!905 (buf!1233 (_2!2025 lt!61461))) (size!905 (buf!1233 thiss!1379)))))

(declare-fun b!40340 () Bool)

(declare-fun e!26557 () Bool)

(declare-fun e!26554 () Bool)

(assert (=> b!40340 (= e!26557 e!26554)))

(declare-fun res!34291 () Bool)

(assert (=> b!40340 (=> res!34291 e!26554)))

(declare-fun isPrefixOf!0 (BitStream!1554 BitStream!1554) Bool)

(assert (=> b!40340 (= res!34291 (not (isPrefixOf!0 thiss!1379 (_2!2025 lt!61451))))))

(declare-fun lt!61462 () (_ BitVec 64))

(assert (=> b!40340 (validate_offset_bits!1 ((_ sign_extend 32) (size!905 (buf!1233 (_2!2025 lt!61451)))) ((_ sign_extend 32) (currentByte!2651 (_2!2025 lt!61451))) ((_ sign_extend 32) (currentBit!2646 (_2!2025 lt!61451))) lt!61462)))

(assert (=> b!40340 (= lt!61462 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61457 () Unit!2855)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1554 BitStream!1554 (_ BitVec 64) (_ BitVec 64)) Unit!2855)

(assert (=> b!40340 (= lt!61457 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2025 lt!61451) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1554 (_ BitVec 8) (_ BitVec 32)) tuple2!3876)

(assert (=> b!40340 (= lt!61451 (appendBitFromByte!0 thiss!1379 (select (arr!1404 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!40341 () Bool)

(assert (=> b!40341 (= e!26548 (array_inv!830 (buf!1233 thiss!1379)))))

(declare-fun b!40342 () Bool)

(declare-fun res!34282 () Bool)

(assert (=> b!40342 (=> res!34282 e!26555)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40342 (= res!34282 (not (invariant!0 (currentBit!2646 (_2!2025 lt!61461)) (currentByte!2651 (_2!2025 lt!61461)) (size!905 (buf!1233 (_2!2025 lt!61461))))))))

(declare-fun b!40343 () Bool)

(declare-fun res!34287 () Bool)

(assert (=> b!40343 (=> res!34287 e!26549)))

(declare-fun length!204 (List!478) Int)

(assert (=> b!40343 (= res!34287 (<= (length!204 lt!61453) 0))))

(declare-fun lt!61454 () tuple2!3874)

(declare-fun e!26547 () Bool)

(declare-fun b!40344 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1554 array!2002 (_ BitVec 64) (_ BitVec 64)) List!478)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1554 BitStream!1554 (_ BitVec 64)) List!478)

(assert (=> b!40344 (= e!26547 (= (head!315 (byteArrayBitContentToList!0 (_2!2025 lt!61451) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!315 (bitStreamReadBitsIntoList!0 (_2!2025 lt!61451) (_1!2024 lt!61454) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!40345 () Bool)

(assert (=> b!40345 (= e!26558 (not e!26557))))

(declare-fun res!34285 () Bool)

(assert (=> b!40345 (=> res!34285 e!26557)))

(assert (=> b!40345 (= res!34285 (bvsge i!635 to!314))))

(assert (=> b!40345 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61441 () Unit!2855)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1554) Unit!2855)

(assert (=> b!40345 (= lt!61441 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!40345 (= lt!61440 (bitIndex!0 (size!905 (buf!1233 thiss!1379)) (currentByte!2651 thiss!1379) (currentBit!2646 thiss!1379)))))

(declare-fun b!40346 () Bool)

(declare-fun res!34288 () Bool)

(assert (=> b!40346 (=> res!34288 e!26559)))

(assert (=> b!40346 (= res!34288 (not (invariant!0 (currentBit!2646 (_2!2025 lt!61451)) (currentByte!2651 (_2!2025 lt!61451)) (size!905 (buf!1233 (_2!2025 lt!61451))))))))

(declare-fun b!40347 () Bool)

(declare-fun e!26560 () Bool)

(assert (=> b!40347 (= e!26554 e!26560)))

(declare-fun res!34289 () Bool)

(assert (=> b!40347 (=> res!34289 e!26560)))

(assert (=> b!40347 (= res!34289 (not (isPrefixOf!0 (_2!2025 lt!61451) (_2!2025 lt!61461))))))

(assert (=> b!40347 (isPrefixOf!0 thiss!1379 (_2!2025 lt!61461))))

(declare-fun lt!61445 () Unit!2855)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1554 BitStream!1554 BitStream!1554) Unit!2855)

(assert (=> b!40347 (= lt!61445 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2025 lt!61451) (_2!2025 lt!61461)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1554 array!2002 (_ BitVec 64) (_ BitVec 64)) tuple2!3876)

(assert (=> b!40347 (= lt!61461 (appendBitsMSBFirstLoop!0 (_2!2025 lt!61451) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!40347 e!26547))

(declare-fun res!34281 () Bool)

(assert (=> b!40347 (=> (not res!34281) (not e!26547))))

(assert (=> b!40347 (= res!34281 (validate_offset_bits!1 ((_ sign_extend 32) (size!905 (buf!1233 (_2!2025 lt!61451)))) ((_ sign_extend 32) (currentByte!2651 thiss!1379)) ((_ sign_extend 32) (currentBit!2646 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61448 () Unit!2855)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1554 array!2002 (_ BitVec 64)) Unit!2855)

(assert (=> b!40347 (= lt!61448 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1233 (_2!2025 lt!61451)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1554 BitStream!1554) tuple2!3874)

(assert (=> b!40347 (= lt!61454 (reader!0 thiss!1379 (_2!2025 lt!61451)))))

(declare-fun b!40348 () Bool)

(assert (=> b!40348 (= e!26559 e!26549)))

(declare-fun res!34295 () Bool)

(assert (=> b!40348 (=> res!34295 e!26549)))

(assert (=> b!40348 (= res!34295 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40348 (= lt!61444 (bitStreamReadBitsIntoList!0 (_2!2025 lt!61461) (_1!2024 lt!61447) lt!61462))))

(assert (=> b!40348 (= lt!61453 (bitStreamReadBitsIntoList!0 (_2!2025 lt!61461) (_1!2024 lt!61443) (bvsub to!314 i!635)))))

(assert (=> b!40348 (validate_offset_bits!1 ((_ sign_extend 32) (size!905 (buf!1233 (_2!2025 lt!61461)))) ((_ sign_extend 32) (currentByte!2651 (_2!2025 lt!61451))) ((_ sign_extend 32) (currentBit!2646 (_2!2025 lt!61451))) lt!61462)))

(declare-fun lt!61439 () Unit!2855)

(assert (=> b!40348 (= lt!61439 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2025 lt!61451) (buf!1233 (_2!2025 lt!61461)) lt!61462))))

(assert (=> b!40348 (= lt!61447 (reader!0 (_2!2025 lt!61451) (_2!2025 lt!61461)))))

(assert (=> b!40348 (validate_offset_bits!1 ((_ sign_extend 32) (size!905 (buf!1233 (_2!2025 lt!61461)))) ((_ sign_extend 32) (currentByte!2651 thiss!1379)) ((_ sign_extend 32) (currentBit!2646 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!61438 () Unit!2855)

(assert (=> b!40348 (= lt!61438 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1233 (_2!2025 lt!61461)) (bvsub to!314 i!635)))))

(assert (=> b!40348 (= lt!61443 (reader!0 thiss!1379 (_2!2025 lt!61461)))))

(declare-fun b!40349 () Bool)

(assert (=> b!40349 (= e!26560 e!26555)))

(declare-fun res!34283 () Bool)

(assert (=> b!40349 (=> res!34283 e!26555)))

(assert (=> b!40349 (= res!34283 (not (= lt!61458 (bvsub (bvadd lt!61440 to!314) i!635))))))

(assert (=> b!40349 (= lt!61458 (bitIndex!0 (size!905 (buf!1233 (_2!2025 lt!61461))) (currentByte!2651 (_2!2025 lt!61461)) (currentBit!2646 (_2!2025 lt!61461))))))

(declare-fun b!40350 () Bool)

(assert (=> b!40350 (= e!26556 e!26546)))

(declare-fun res!34290 () Bool)

(assert (=> b!40350 (=> res!34290 e!26546)))

(assert (=> b!40350 (= res!34290 (not (= (head!315 (byteArrayBitContentToList!0 (_2!2025 lt!61461) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!61446)))))

(assert (=> b!40350 (= lt!61446 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!40351 () Bool)

(declare-fun res!34297 () Bool)

(assert (=> b!40351 (=> res!34297 e!26559)))

(assert (=> b!40351 (= res!34297 (not (invariant!0 (currentBit!2646 (_2!2025 lt!61451)) (currentByte!2651 (_2!2025 lt!61451)) (size!905 (buf!1233 (_2!2025 lt!61461))))))))

(assert (= (and start!8080 res!34284) b!40334))

(assert (= (and b!40334 res!34293) b!40345))

(assert (= (and b!40345 (not res!34285)) b!40340))

(assert (= (and b!40340 (not res!34291)) b!40347))

(assert (= (and b!40347 res!34281) b!40344))

(assert (= (and b!40347 (not res!34289)) b!40349))

(assert (= (and b!40349 (not res!34283)) b!40342))

(assert (= (and b!40342 (not res!34282)) b!40335))

(assert (= (and b!40335 (not res!34286)) b!40339))

(assert (= (and b!40339 (not res!34298)) b!40346))

(assert (= (and b!40346 (not res!34288)) b!40351))

(assert (= (and b!40351 (not res!34297)) b!40348))

(assert (= (and b!40348 (not res!34295)) b!40343))

(assert (= (and b!40343 (not res!34287)) b!40336))

(assert (= (and b!40336 (not res!34296)) b!40332))

(assert (= (and b!40332 (not res!34294)) b!40331))

(assert (= (and b!40331 (not res!34299)) b!40350))

(assert (= (and b!40350 (not res!34290)) b!40337))

(assert (= (and b!40337 (not res!34292)) b!40333))

(assert (= (and b!40333 (not res!34280)) b!40338))

(assert (= start!8080 b!40341))

(declare-fun m!61673 () Bool)

(assert (=> b!40331 m!61673))

(declare-fun m!61675 () Bool)

(assert (=> b!40334 m!61675))

(declare-fun m!61677 () Bool)

(assert (=> b!40342 m!61677))

(declare-fun m!61679 () Bool)

(assert (=> b!40345 m!61679))

(declare-fun m!61681 () Bool)

(assert (=> b!40345 m!61681))

(declare-fun m!61683 () Bool)

(assert (=> b!40345 m!61683))

(declare-fun m!61685 () Bool)

(assert (=> b!40351 m!61685))

(declare-fun m!61687 () Bool)

(assert (=> start!8080 m!61687))

(declare-fun m!61689 () Bool)

(assert (=> start!8080 m!61689))

(declare-fun m!61691 () Bool)

(assert (=> b!40349 m!61691))

(declare-fun m!61693 () Bool)

(assert (=> b!40341 m!61693))

(declare-fun m!61695 () Bool)

(assert (=> b!40339 m!61695))

(declare-fun m!61697 () Bool)

(assert (=> b!40336 m!61697))

(declare-fun m!61699 () Bool)

(assert (=> b!40336 m!61699))

(declare-fun m!61701 () Bool)

(assert (=> b!40333 m!61701))

(declare-fun m!61703 () Bool)

(assert (=> b!40333 m!61703))

(declare-fun m!61705 () Bool)

(assert (=> b!40350 m!61705))

(assert (=> b!40350 m!61705))

(declare-fun m!61707 () Bool)

(assert (=> b!40350 m!61707))

(declare-fun m!61709 () Bool)

(assert (=> b!40350 m!61709))

(declare-fun m!61711 () Bool)

(assert (=> b!40332 m!61711))

(declare-fun m!61713 () Bool)

(assert (=> b!40332 m!61713))

(declare-fun m!61715 () Bool)

(assert (=> b!40346 m!61715))

(declare-fun m!61717 () Bool)

(assert (=> b!40344 m!61717))

(assert (=> b!40344 m!61717))

(declare-fun m!61719 () Bool)

(assert (=> b!40344 m!61719))

(declare-fun m!61721 () Bool)

(assert (=> b!40344 m!61721))

(assert (=> b!40344 m!61721))

(declare-fun m!61723 () Bool)

(assert (=> b!40344 m!61723))

(declare-fun m!61725 () Bool)

(assert (=> b!40337 m!61725))

(declare-fun m!61727 () Bool)

(assert (=> b!40340 m!61727))

(assert (=> b!40340 m!61727))

(declare-fun m!61729 () Bool)

(assert (=> b!40340 m!61729))

(declare-fun m!61731 () Bool)

(assert (=> b!40340 m!61731))

(declare-fun m!61733 () Bool)

(assert (=> b!40340 m!61733))

(declare-fun m!61735 () Bool)

(assert (=> b!40340 m!61735))

(declare-fun m!61737 () Bool)

(assert (=> b!40347 m!61737))

(declare-fun m!61739 () Bool)

(assert (=> b!40347 m!61739))

(declare-fun m!61741 () Bool)

(assert (=> b!40347 m!61741))

(declare-fun m!61743 () Bool)

(assert (=> b!40347 m!61743))

(declare-fun m!61745 () Bool)

(assert (=> b!40347 m!61745))

(declare-fun m!61747 () Bool)

(assert (=> b!40347 m!61747))

(declare-fun m!61749 () Bool)

(assert (=> b!40347 m!61749))

(declare-fun m!61751 () Bool)

(assert (=> b!40348 m!61751))

(declare-fun m!61753 () Bool)

(assert (=> b!40348 m!61753))

(declare-fun m!61755 () Bool)

(assert (=> b!40348 m!61755))

(declare-fun m!61757 () Bool)

(assert (=> b!40348 m!61757))

(declare-fun m!61759 () Bool)

(assert (=> b!40348 m!61759))

(declare-fun m!61761 () Bool)

(assert (=> b!40348 m!61761))

(declare-fun m!61763 () Bool)

(assert (=> b!40348 m!61763))

(declare-fun m!61765 () Bool)

(assert (=> b!40348 m!61765))

(declare-fun m!61767 () Bool)

(assert (=> b!40343 m!61767))

(declare-fun m!61769 () Bool)

(assert (=> b!40338 m!61769))

(check-sat (not b!40347) (not b!40340) (not b!40346) (not b!40349) (not b!40345) (not b!40334) (not b!40343) (not b!40336) (not b!40348) (not b!40331) (not b!40333) (not b!40350) (not start!8080) (not b!40338) (not b!40351) (not b!40332) (not b!40339) (not b!40337) (not b!40344) (not b!40342) (not b!40341))
