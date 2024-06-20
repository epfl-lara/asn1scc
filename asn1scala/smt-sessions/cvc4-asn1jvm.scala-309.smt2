; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6258 () Bool)

(assert start!6258)

(declare-fun b!29488 () Bool)

(declare-fun res!25464 () Bool)

(declare-fun e!19758 () Bool)

(assert (=> b!29488 (=> (not res!25464) (not e!19758))))

(declare-datatypes ((array!1773 0))(
  ( (array!1774 (arr!1234 (Array (_ BitVec 32) (_ BitVec 8))) (size!771 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1364 0))(
  ( (BitStream!1365 (buf!1099 array!1773) (currentByte!2436 (_ BitVec 32)) (currentBit!2431 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1364)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29488 (= res!25464 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 thiss!1379))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!29489 () Bool)

(declare-fun e!19755 () Bool)

(declare-fun array_inv!735 (array!1773) Bool)

(assert (=> b!29489 (= e!19755 (array_inv!735 (buf!1099 thiss!1379)))))

(declare-fun b!29490 () Bool)

(declare-fun e!19753 () Bool)

(declare-fun e!19760 () Bool)

(assert (=> b!29490 (= e!19753 e!19760)))

(declare-fun res!25461 () Bool)

(assert (=> b!29490 (=> res!25461 e!19760)))

(assert (=> b!29490 (= res!25461 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3142 0))(
  ( (tuple2!3143 (_1!1658 BitStream!1364) (_2!1658 BitStream!1364)) )
))
(declare-fun lt!42199 () tuple2!3142)

(declare-datatypes ((List!383 0))(
  ( (Nil!380) (Cons!379 (h!498 Bool) (t!1133 List!383)) )
))
(declare-fun lt!42194 () List!383)

(declare-fun lt!42190 () (_ BitVec 64))

(declare-datatypes ((Unit!2287 0))(
  ( (Unit!2288) )
))
(declare-datatypes ((tuple2!3144 0))(
  ( (tuple2!3145 (_1!1659 Unit!2287) (_2!1659 BitStream!1364)) )
))
(declare-fun lt!42192 () tuple2!3144)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1364 BitStream!1364 (_ BitVec 64)) List!383)

(assert (=> b!29490 (= lt!42194 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_1!1658 lt!42199) lt!42190))))

(declare-fun lt!42191 () tuple2!3142)

(declare-fun lt!42198 () List!383)

(assert (=> b!29490 (= lt!42198 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_1!1658 lt!42191) (bvsub to!314 i!635)))))

(declare-fun lt!42196 () tuple2!3144)

(assert (=> b!29490 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42190)))

(declare-fun lt!42188 () Unit!2287)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1364 array!1773 (_ BitVec 64)) Unit!2287)

(assert (=> b!29490 (= lt!42188 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1659 lt!42196) (buf!1099 (_2!1659 lt!42192)) lt!42190))))

(declare-fun reader!0 (BitStream!1364 BitStream!1364) tuple2!3142)

(assert (=> b!29490 (= lt!42199 (reader!0 (_2!1659 lt!42196) (_2!1659 lt!42192)))))

(assert (=> b!29490 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!42202 () Unit!2287)

(assert (=> b!29490 (= lt!42202 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1099 (_2!1659 lt!42192)) (bvsub to!314 i!635)))))

(assert (=> b!29490 (= lt!42191 (reader!0 thiss!1379 (_2!1659 lt!42192)))))

(declare-fun srcBuffer!2 () array!1773)

(declare-fun b!29491 () Bool)

(declare-fun e!19751 () Bool)

(declare-fun lt!42204 () tuple2!3142)

(declare-fun head!220 (List!383) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1364 array!1773 (_ BitVec 64) (_ BitVec 64)) List!383)

(assert (=> b!29491 (= e!19751 (= (head!220 (byteArrayBitContentToList!0 (_2!1659 lt!42196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!220 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42196) (_1!1658 lt!42204) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!29492 () Bool)

(declare-fun res!25466 () Bool)

(assert (=> b!29492 (=> res!25466 e!19753)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!29492 (= res!25466 (not (invariant!0 (currentBit!2431 (_2!1659 lt!42196)) (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42196))))))))

(declare-fun b!29494 () Bool)

(declare-fun e!19756 () Bool)

(declare-fun e!19757 () Bool)

(assert (=> b!29494 (= e!19756 e!19757)))

(declare-fun res!25465 () Bool)

(assert (=> b!29494 (=> res!25465 e!19757)))

(declare-fun isPrefixOf!0 (BitStream!1364 BitStream!1364) Bool)

(assert (=> b!29494 (= res!25465 (not (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42192))))))

(assert (=> b!29494 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42192))))

(declare-fun lt!42193 () Unit!2287)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1364 BitStream!1364 BitStream!1364) Unit!2287)

(assert (=> b!29494 (= lt!42193 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1659 lt!42196) (_2!1659 lt!42192)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1364 array!1773 (_ BitVec 64) (_ BitVec 64)) tuple2!3144)

(assert (=> b!29494 (= lt!42192 (appendBitsMSBFirstLoop!0 (_2!1659 lt!42196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!29494 e!19751))

(declare-fun res!25467 () Bool)

(assert (=> b!29494 (=> (not res!25467) (not e!19751))))

(assert (=> b!29494 (= res!25467 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42197 () Unit!2287)

(assert (=> b!29494 (= lt!42197 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1099 (_2!1659 lt!42196)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29494 (= lt!42204 (reader!0 thiss!1379 (_2!1659 lt!42196)))))

(declare-fun b!29495 () Bool)

(declare-fun res!25472 () Bool)

(declare-fun e!19754 () Bool)

(assert (=> b!29495 (=> res!25472 e!19754)))

(assert (=> b!29495 (= res!25472 (not (= (size!771 (buf!1099 thiss!1379)) (size!771 (buf!1099 (_2!1659 lt!42192))))))))

(declare-fun b!29496 () Bool)

(assert (=> b!29496 (= e!19754 e!19753)))

(declare-fun res!25473 () Bool)

(assert (=> b!29496 (=> res!25473 e!19753)))

(assert (=> b!29496 (= res!25473 (not (= (size!771 (buf!1099 (_2!1659 lt!42196))) (size!771 (buf!1099 (_2!1659 lt!42192))))))))

(declare-fun e!19759 () Bool)

(assert (=> b!29496 e!19759))

(declare-fun res!25469 () Bool)

(assert (=> b!29496 (=> (not res!25469) (not e!19759))))

(assert (=> b!29496 (= res!25469 (= (size!771 (buf!1099 (_2!1659 lt!42192))) (size!771 (buf!1099 thiss!1379))))))

(declare-fun b!29497 () Bool)

(declare-fun e!19762 () Bool)

(assert (=> b!29497 (= e!19762 e!19756)))

(declare-fun res!25459 () Bool)

(assert (=> b!29497 (=> res!25459 e!19756)))

(assert (=> b!29497 (= res!25459 (not (isPrefixOf!0 thiss!1379 (_2!1659 lt!42196))))))

(assert (=> b!29497 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42190)))

(assert (=> b!29497 (= lt!42190 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42201 () Unit!2287)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1364 BitStream!1364 (_ BitVec 64) (_ BitVec 64)) Unit!2287)

(assert (=> b!29497 (= lt!42201 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1659 lt!42196) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1364 (_ BitVec 8) (_ BitVec 32)) tuple2!3144)

(assert (=> b!29497 (= lt!42196 (appendBitFromByte!0 thiss!1379 (select (arr!1234 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!29498 () Bool)

(assert (=> b!29498 (= e!19757 e!19754)))

(declare-fun res!25462 () Bool)

(assert (=> b!29498 (=> res!25462 e!19754)))

(declare-fun lt!42200 () (_ BitVec 64))

(declare-fun lt!42195 () (_ BitVec 64))

(assert (=> b!29498 (= res!25462 (not (= lt!42200 (bvsub (bvadd lt!42195 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!29498 (= lt!42200 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42192))) (currentByte!2436 (_2!1659 lt!42192)) (currentBit!2431 (_2!1659 lt!42192))))))

(declare-fun b!29499 () Bool)

(assert (=> b!29499 (= e!19758 (not e!19762))))

(declare-fun res!25463 () Bool)

(assert (=> b!29499 (=> res!25463 e!19762)))

(assert (=> b!29499 (= res!25463 (bvsge i!635 to!314))))

(assert (=> b!29499 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!42205 () Unit!2287)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1364) Unit!2287)

(assert (=> b!29499 (= lt!42205 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!29499 (= lt!42195 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(declare-fun b!29500 () Bool)

(assert (=> b!29500 (= e!19759 (= lt!42200 (bvsub (bvsub (bvadd (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29501 () Bool)

(declare-fun res!25471 () Bool)

(assert (=> b!29501 (=> res!25471 e!19754)))

(assert (=> b!29501 (= res!25471 (not (invariant!0 (currentBit!2431 (_2!1659 lt!42192)) (currentByte!2436 (_2!1659 lt!42192)) (size!771 (buf!1099 (_2!1659 lt!42192))))))))

(declare-fun res!25460 () Bool)

(assert (=> start!6258 (=> (not res!25460) (not e!19758))))

(assert (=> start!6258 (= res!25460 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!771 srcBuffer!2))))))))

(assert (=> start!6258 e!19758))

(assert (=> start!6258 true))

(assert (=> start!6258 (array_inv!735 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1364) Bool)

(assert (=> start!6258 (and (inv!12 thiss!1379) e!19755)))

(declare-fun b!29493 () Bool)

(declare-fun res!25468 () Bool)

(assert (=> b!29493 (=> res!25468 e!19753)))

(assert (=> b!29493 (= res!25468 (not (invariant!0 (currentBit!2431 (_2!1659 lt!42196)) (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42192))))))))

(declare-fun b!29502 () Bool)

(declare-fun res!25470 () Bool)

(assert (=> b!29502 (=> res!25470 e!19760)))

(declare-fun length!109 (List!383) Int)

(assert (=> b!29502 (= res!25470 (<= (length!109 lt!42198) 0))))

(declare-fun lt!42203 () List!383)

(declare-fun b!29503 () Bool)

(assert (=> b!29503 (= e!19760 (or (not (= lt!42203 lt!42194)) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42195) (bvslt lt!42195 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!771 (buf!1099 (_1!1658 lt!42199)))))))))))

(assert (=> b!29503 (= lt!42194 lt!42203)))

(declare-fun tail!100 (List!383) List!383)

(assert (=> b!29503 (= lt!42203 (tail!100 lt!42198))))

(declare-fun lt!42189 () Unit!2287)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1364 BitStream!1364 BitStream!1364 BitStream!1364 (_ BitVec 64) List!383) Unit!2287)

(assert (=> b!29503 (= lt!42189 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1659 lt!42192) (_2!1659 lt!42192) (_1!1658 lt!42191) (_1!1658 lt!42199) (bvsub to!314 i!635) lt!42198))))

(assert (= (and start!6258 res!25460) b!29488))

(assert (= (and b!29488 res!25464) b!29499))

(assert (= (and b!29499 (not res!25463)) b!29497))

(assert (= (and b!29497 (not res!25459)) b!29494))

(assert (= (and b!29494 res!25467) b!29491))

(assert (= (and b!29494 (not res!25465)) b!29498))

(assert (= (and b!29498 (not res!25462)) b!29501))

(assert (= (and b!29501 (not res!25471)) b!29495))

(assert (= (and b!29495 (not res!25472)) b!29496))

(assert (= (and b!29496 res!25469) b!29500))

(assert (= (and b!29496 (not res!25473)) b!29492))

(assert (= (and b!29492 (not res!25466)) b!29493))

(assert (= (and b!29493 (not res!25468)) b!29490))

(assert (= (and b!29490 (not res!25461)) b!29502))

(assert (= (and b!29502 (not res!25470)) b!29503))

(assert (= start!6258 b!29489))

(declare-fun m!42693 () Bool)

(assert (=> b!29502 m!42693))

(declare-fun m!42695 () Bool)

(assert (=> b!29489 m!42695))

(declare-fun m!42697 () Bool)

(assert (=> b!29503 m!42697))

(declare-fun m!42699 () Bool)

(assert (=> b!29503 m!42699))

(declare-fun m!42701 () Bool)

(assert (=> b!29499 m!42701))

(declare-fun m!42703 () Bool)

(assert (=> b!29499 m!42703))

(declare-fun m!42705 () Bool)

(assert (=> b!29499 m!42705))

(declare-fun m!42707 () Bool)

(assert (=> b!29490 m!42707))

(declare-fun m!42709 () Bool)

(assert (=> b!29490 m!42709))

(declare-fun m!42711 () Bool)

(assert (=> b!29490 m!42711))

(declare-fun m!42713 () Bool)

(assert (=> b!29490 m!42713))

(declare-fun m!42715 () Bool)

(assert (=> b!29490 m!42715))

(declare-fun m!42717 () Bool)

(assert (=> b!29490 m!42717))

(declare-fun m!42719 () Bool)

(assert (=> b!29490 m!42719))

(declare-fun m!42721 () Bool)

(assert (=> b!29490 m!42721))

(declare-fun m!42723 () Bool)

(assert (=> b!29501 m!42723))

(declare-fun m!42725 () Bool)

(assert (=> b!29500 m!42725))

(declare-fun m!42727 () Bool)

(assert (=> b!29498 m!42727))

(declare-fun m!42729 () Bool)

(assert (=> b!29488 m!42729))

(declare-fun m!42731 () Bool)

(assert (=> start!6258 m!42731))

(declare-fun m!42733 () Bool)

(assert (=> start!6258 m!42733))

(declare-fun m!42735 () Bool)

(assert (=> b!29494 m!42735))

(declare-fun m!42737 () Bool)

(assert (=> b!29494 m!42737))

(declare-fun m!42739 () Bool)

(assert (=> b!29494 m!42739))

(declare-fun m!42741 () Bool)

(assert (=> b!29494 m!42741))

(declare-fun m!42743 () Bool)

(assert (=> b!29494 m!42743))

(declare-fun m!42745 () Bool)

(assert (=> b!29494 m!42745))

(declare-fun m!42747 () Bool)

(assert (=> b!29494 m!42747))

(declare-fun m!42749 () Bool)

(assert (=> b!29492 m!42749))

(declare-fun m!42751 () Bool)

(assert (=> b!29497 m!42751))

(declare-fun m!42753 () Bool)

(assert (=> b!29497 m!42753))

(declare-fun m!42755 () Bool)

(assert (=> b!29497 m!42755))

(declare-fun m!42757 () Bool)

(assert (=> b!29497 m!42757))

(assert (=> b!29497 m!42751))

(declare-fun m!42759 () Bool)

(assert (=> b!29497 m!42759))

(declare-fun m!42761 () Bool)

(assert (=> b!29491 m!42761))

(assert (=> b!29491 m!42761))

(declare-fun m!42763 () Bool)

(assert (=> b!29491 m!42763))

(declare-fun m!42765 () Bool)

(assert (=> b!29491 m!42765))

(assert (=> b!29491 m!42765))

(declare-fun m!42767 () Bool)

(assert (=> b!29491 m!42767))

(declare-fun m!42769 () Bool)

(assert (=> b!29493 m!42769))

(push 1)

(assert (not b!29502))

(assert (not b!29498))

(assert (not b!29489))

(assert (not b!29492))

(assert (not b!29490))

(assert (not b!29493))

(assert (not b!29501))

(assert (not b!29494))

(assert (not b!29488))

(assert (not b!29499))

(assert (not start!6258))

(assert (not b!29497))

(assert (not b!29500))

(assert (not b!29503))

(assert (not b!29491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8392 () Bool)

(declare-fun e!19813 () Bool)

(assert (=> d!8392 e!19813))

(declare-fun res!25536 () Bool)

(assert (=> d!8392 (=> (not res!25536) (not e!19813))))

(declare-fun lt!42385 () (_ BitVec 64))

(declare-fun lt!42383 () (_ BitVec 64))

(declare-fun lt!42381 () (_ BitVec 64))

(assert (=> d!8392 (= res!25536 (= lt!42385 (bvsub lt!42381 lt!42383)))))

(assert (=> d!8392 (or (= (bvand lt!42381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42381 lt!42383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8392 (= lt!42383 (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196)))))))

(declare-fun lt!42382 () (_ BitVec 64))

(declare-fun lt!42380 () (_ BitVec 64))

(assert (=> d!8392 (= lt!42381 (bvmul lt!42382 lt!42380))))

(assert (=> d!8392 (or (= lt!42382 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42380 (bvsdiv (bvmul lt!42382 lt!42380) lt!42382)))))

(assert (=> d!8392 (= lt!42380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8392 (= lt!42382 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))))))

(assert (=> d!8392 (= lt!42385 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196)))))))

(assert (=> d!8392 (invariant!0 (currentBit!2431 (_2!1659 lt!42196)) (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42196))))))

(assert (=> d!8392 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))) lt!42385)))

(declare-fun b!29600 () Bool)

(declare-fun res!25535 () Bool)

(assert (=> b!29600 (=> (not res!25535) (not e!19813))))

(assert (=> b!29600 (= res!25535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42385))))

(declare-fun b!29601 () Bool)

(declare-fun lt!42384 () (_ BitVec 64))

(assert (=> b!29601 (= e!19813 (bvsle lt!42385 (bvmul lt!42384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29601 (or (= lt!42384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42384)))))

(assert (=> b!29601 (= lt!42384 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))))))

(assert (= (and d!8392 res!25536) b!29600))

(assert (= (and b!29600 res!25535) b!29601))

(declare-fun m!42901 () Bool)

(assert (=> d!8392 m!42901))

(assert (=> d!8392 m!42749))

(assert (=> b!29500 d!8392))

(declare-fun d!8400 () Bool)

(assert (=> d!8400 (= (array_inv!735 (buf!1099 thiss!1379)) (bvsge (size!771 (buf!1099 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!29489 d!8400))

(declare-fun d!8402 () Bool)

(assert (=> d!8402 (= (head!220 (byteArrayBitContentToList!0 (_2!1659 lt!42196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!498 (byteArrayBitContentToList!0 (_2!1659 lt!42196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29491 d!8402))

(declare-fun d!8404 () Bool)

(declare-fun c!1922 () Bool)

(assert (=> d!8404 (= c!1922 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19816 () List!383)

(assert (=> d!8404 (= (byteArrayBitContentToList!0 (_2!1659 lt!42196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19816)))

(declare-fun b!29606 () Bool)

(assert (=> b!29606 (= e!19816 Nil!380)))

(declare-fun b!29607 () Bool)

(assert (=> b!29607 (= e!19816 (Cons!379 (not (= (bvand ((_ sign_extend 24) (select (arr!1234 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1659 lt!42196) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8404 c!1922) b!29606))

(assert (= (and d!8404 (not c!1922)) b!29607))

(assert (=> b!29607 m!42751))

(declare-fun m!42903 () Bool)

(assert (=> b!29607 m!42903))

(declare-fun m!42905 () Bool)

(assert (=> b!29607 m!42905))

(assert (=> b!29491 d!8404))

(declare-fun d!8406 () Bool)

(assert (=> d!8406 (= (head!220 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42196) (_1!1658 lt!42204) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!498 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42196) (_1!1658 lt!42204) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29491 d!8406))

(declare-fun b!29622 () Bool)

(declare-datatypes ((tuple2!3154 0))(
  ( (tuple2!3155 (_1!1664 List!383) (_2!1664 BitStream!1364)) )
))
(declare-fun e!19824 () tuple2!3154)

(assert (=> b!29622 (= e!19824 (tuple2!3155 Nil!380 (_1!1658 lt!42204)))))

(declare-fun b!29625 () Bool)

(declare-fun e!19825 () Bool)

(declare-fun lt!42410 () List!383)

(assert (=> b!29625 (= e!19825 (> (length!109 lt!42410) 0))))

(declare-fun lt!42411 () (_ BitVec 64))

(declare-fun b!29623 () Bool)

(declare-datatypes ((tuple2!3156 0))(
  ( (tuple2!3157 (_1!1665 Bool) (_2!1665 BitStream!1364)) )
))
(declare-fun lt!42412 () tuple2!3156)

(assert (=> b!29623 (= e!19824 (tuple2!3155 (Cons!379 (_1!1665 lt!42412) (bitStreamReadBitsIntoList!0 (_2!1659 lt!42196) (_2!1665 lt!42412) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!42411))) (_2!1665 lt!42412)))))

(declare-fun readBit!0 (BitStream!1364) tuple2!3156)

(assert (=> b!29623 (= lt!42412 (readBit!0 (_1!1658 lt!42204)))))

(assert (=> b!29623 (= lt!42411 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!8408 () Bool)

(assert (=> d!8408 e!19825))

(declare-fun c!1927 () Bool)

(assert (=> d!8408 (= c!1927 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8408 (= lt!42410 (_1!1664 e!19824))))

(declare-fun c!1928 () Bool)

(assert (=> d!8408 (= c!1928 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8408 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8408 (= (bitStreamReadBitsIntoList!0 (_2!1659 lt!42196) (_1!1658 lt!42204) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42410)))

(declare-fun b!29624 () Bool)

(declare-fun isEmpty!77 (List!383) Bool)

(assert (=> b!29624 (= e!19825 (isEmpty!77 lt!42410))))

(assert (= (and d!8408 c!1928) b!29622))

(assert (= (and d!8408 (not c!1928)) b!29623))

(assert (= (and d!8408 c!1927) b!29624))

(assert (= (and d!8408 (not c!1927)) b!29625))

(declare-fun m!42909 () Bool)

(assert (=> b!29625 m!42909))

(declare-fun m!42911 () Bool)

(assert (=> b!29623 m!42911))

(declare-fun m!42913 () Bool)

(assert (=> b!29623 m!42913))

(declare-fun m!42915 () Bool)

(assert (=> b!29624 m!42915))

(assert (=> b!29491 d!8408))

(declare-fun d!8416 () Bool)

(assert (=> d!8416 (= (array_inv!735 srcBuffer!2) (bvsge (size!771 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6258 d!8416))

(declare-fun d!8418 () Bool)

(assert (=> d!8418 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2431 thiss!1379) (currentByte!2436 thiss!1379) (size!771 (buf!1099 thiss!1379))))))

(declare-fun bs!2379 () Bool)

(assert (= bs!2379 d!8418))

(declare-fun m!42917 () Bool)

(assert (=> bs!2379 m!42917))

(assert (=> start!6258 d!8418))

(declare-fun d!8420 () Bool)

(assert (=> d!8420 (= (invariant!0 (currentBit!2431 (_2!1659 lt!42192)) (currentByte!2436 (_2!1659 lt!42192)) (size!771 (buf!1099 (_2!1659 lt!42192)))) (and (bvsge (currentBit!2431 (_2!1659 lt!42192)) #b00000000000000000000000000000000) (bvslt (currentBit!2431 (_2!1659 lt!42192)) #b00000000000000000000000000001000) (bvsge (currentByte!2436 (_2!1659 lt!42192)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2436 (_2!1659 lt!42192)) (size!771 (buf!1099 (_2!1659 lt!42192)))) (and (= (currentBit!2431 (_2!1659 lt!42192)) #b00000000000000000000000000000000) (= (currentByte!2436 (_2!1659 lt!42192)) (size!771 (buf!1099 (_2!1659 lt!42192))))))))))

(assert (=> b!29501 d!8420))

(declare-fun b!29626 () Bool)

(declare-fun e!19826 () tuple2!3154)

(assert (=> b!29626 (= e!19826 (tuple2!3155 Nil!380 (_1!1658 lt!42191)))))

(declare-fun b!29629 () Bool)

(declare-fun e!19827 () Bool)

(declare-fun lt!42413 () List!383)

(assert (=> b!29629 (= e!19827 (> (length!109 lt!42413) 0))))

(declare-fun lt!42415 () tuple2!3156)

(declare-fun b!29627 () Bool)

(declare-fun lt!42414 () (_ BitVec 64))

(assert (=> b!29627 (= e!19826 (tuple2!3155 (Cons!379 (_1!1665 lt!42415) (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_2!1665 lt!42415) (bvsub (bvsub to!314 i!635) lt!42414))) (_2!1665 lt!42415)))))

(assert (=> b!29627 (= lt!42415 (readBit!0 (_1!1658 lt!42191)))))

(assert (=> b!29627 (= lt!42414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!8422 () Bool)

(assert (=> d!8422 e!19827))

(declare-fun c!1929 () Bool)

(assert (=> d!8422 (= c!1929 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8422 (= lt!42413 (_1!1664 e!19826))))

(declare-fun c!1930 () Bool)

(assert (=> d!8422 (= c!1930 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8422 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8422 (= (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_1!1658 lt!42191) (bvsub to!314 i!635)) lt!42413)))

(declare-fun b!29628 () Bool)

(assert (=> b!29628 (= e!19827 (isEmpty!77 lt!42413))))

(assert (= (and d!8422 c!1930) b!29626))

(assert (= (and d!8422 (not c!1930)) b!29627))

(assert (= (and d!8422 c!1929) b!29628))

(assert (= (and d!8422 (not c!1929)) b!29629))

(declare-fun m!42919 () Bool)

(assert (=> b!29629 m!42919))

(declare-fun m!42921 () Bool)

(assert (=> b!29627 m!42921))

(declare-fun m!42923 () Bool)

(assert (=> b!29627 m!42923))

(declare-fun m!42925 () Bool)

(assert (=> b!29628 m!42925))

(assert (=> b!29490 d!8422))

(declare-fun d!8424 () Bool)

(assert (=> d!8424 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42190) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196)))) lt!42190))))

(declare-fun bs!2380 () Bool)

(assert (= bs!2380 d!8424))

(declare-fun m!42927 () Bool)

(assert (=> bs!2380 m!42927))

(assert (=> b!29490 d!8424))

(declare-fun b!29655 () Bool)

(declare-fun e!19845 () Unit!2287)

(declare-fun lt!42470 () Unit!2287)

(assert (=> b!29655 (= e!19845 lt!42470)))

(declare-fun lt!42473 () (_ BitVec 64))

(assert (=> b!29655 (= lt!42473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42466 () (_ BitVec 64))

(assert (=> b!29655 (= lt!42466 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1773 array!1773 (_ BitVec 64) (_ BitVec 64)) Unit!2287)

(assert (=> b!29655 (= lt!42470 (arrayBitRangesEqSymmetric!0 (buf!1099 thiss!1379) (buf!1099 (_2!1659 lt!42192)) lt!42473 lt!42466))))

(declare-fun arrayBitRangesEq!0 (array!1773 array!1773 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29655 (arrayBitRangesEq!0 (buf!1099 (_2!1659 lt!42192)) (buf!1099 thiss!1379) lt!42473 lt!42466)))

(declare-fun b!29656 () Bool)

(declare-fun res!25565 () Bool)

(declare-fun e!19844 () Bool)

(assert (=> b!29656 (=> (not res!25565) (not e!19844))))

(declare-fun lt!42472 () tuple2!3142)

(assert (=> b!29656 (= res!25565 (isPrefixOf!0 (_1!1658 lt!42472) thiss!1379))))

(declare-fun b!29657 () Bool)

(declare-fun res!25566 () Bool)

(assert (=> b!29657 (=> (not res!25566) (not e!19844))))

(assert (=> b!29657 (= res!25566 (isPrefixOf!0 (_2!1658 lt!42472) (_2!1659 lt!42192)))))

(declare-fun d!8426 () Bool)

(assert (=> d!8426 e!19844))

(declare-fun res!25564 () Bool)

(assert (=> d!8426 (=> (not res!25564) (not e!19844))))

(assert (=> d!8426 (= res!25564 (isPrefixOf!0 (_1!1658 lt!42472) (_2!1658 lt!42472)))))

(declare-fun lt!42474 () BitStream!1364)

(assert (=> d!8426 (= lt!42472 (tuple2!3143 lt!42474 (_2!1659 lt!42192)))))

(declare-fun lt!42468 () Unit!2287)

(declare-fun lt!42465 () Unit!2287)

(assert (=> d!8426 (= lt!42468 lt!42465)))

(assert (=> d!8426 (isPrefixOf!0 lt!42474 (_2!1659 lt!42192))))

(assert (=> d!8426 (= lt!42465 (lemmaIsPrefixTransitive!0 lt!42474 (_2!1659 lt!42192) (_2!1659 lt!42192)))))

(declare-fun lt!42481 () Unit!2287)

(declare-fun lt!42477 () Unit!2287)

(assert (=> d!8426 (= lt!42481 lt!42477)))

(assert (=> d!8426 (isPrefixOf!0 lt!42474 (_2!1659 lt!42192))))

(assert (=> d!8426 (= lt!42477 (lemmaIsPrefixTransitive!0 lt!42474 thiss!1379 (_2!1659 lt!42192)))))

(declare-fun lt!42475 () Unit!2287)

(assert (=> d!8426 (= lt!42475 e!19845)))

(declare-fun c!1933 () Bool)

(assert (=> d!8426 (= c!1933 (not (= (size!771 (buf!1099 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!42480 () Unit!2287)

(declare-fun lt!42482 () Unit!2287)

(assert (=> d!8426 (= lt!42480 lt!42482)))

(assert (=> d!8426 (isPrefixOf!0 (_2!1659 lt!42192) (_2!1659 lt!42192))))

(assert (=> d!8426 (= lt!42482 (lemmaIsPrefixRefl!0 (_2!1659 lt!42192)))))

(declare-fun lt!42476 () Unit!2287)

(declare-fun lt!42479 () Unit!2287)

(assert (=> d!8426 (= lt!42476 lt!42479)))

(assert (=> d!8426 (= lt!42479 (lemmaIsPrefixRefl!0 (_2!1659 lt!42192)))))

(declare-fun lt!42471 () Unit!2287)

(declare-fun lt!42483 () Unit!2287)

(assert (=> d!8426 (= lt!42471 lt!42483)))

(assert (=> d!8426 (isPrefixOf!0 lt!42474 lt!42474)))

(assert (=> d!8426 (= lt!42483 (lemmaIsPrefixRefl!0 lt!42474))))

(declare-fun lt!42478 () Unit!2287)

(declare-fun lt!42467 () Unit!2287)

(assert (=> d!8426 (= lt!42478 lt!42467)))

(assert (=> d!8426 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8426 (= lt!42467 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8426 (= lt!42474 (BitStream!1365 (buf!1099 (_2!1659 lt!42192)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(assert (=> d!8426 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42192))))

(assert (=> d!8426 (= (reader!0 thiss!1379 (_2!1659 lt!42192)) lt!42472)))

(declare-fun lt!42469 () (_ BitVec 64))

(declare-fun lt!42484 () (_ BitVec 64))

(declare-fun b!29658 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1364 (_ BitVec 64)) BitStream!1364)

(assert (=> b!29658 (= e!19844 (= (_1!1658 lt!42472) (withMovedBitIndex!0 (_2!1658 lt!42472) (bvsub lt!42469 lt!42484))))))

(assert (=> b!29658 (or (= (bvand lt!42469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42469 lt!42484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29658 (= lt!42484 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42192))) (currentByte!2436 (_2!1659 lt!42192)) (currentBit!2431 (_2!1659 lt!42192))))))

(assert (=> b!29658 (= lt!42469 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(declare-fun b!29659 () Bool)

(declare-fun Unit!2299 () Unit!2287)

(assert (=> b!29659 (= e!19845 Unit!2299)))

(assert (= (and d!8426 c!1933) b!29655))

(assert (= (and d!8426 (not c!1933)) b!29659))

(assert (= (and d!8426 res!25564) b!29656))

(assert (= (and b!29656 res!25565) b!29657))

(assert (= (and b!29657 res!25566) b!29658))

(declare-fun m!42939 () Bool)

(assert (=> b!29658 m!42939))

(assert (=> b!29658 m!42727))

(assert (=> b!29658 m!42705))

(declare-fun m!42941 () Bool)

(assert (=> d!8426 m!42941))

(declare-fun m!42943 () Bool)

(assert (=> d!8426 m!42943))

(assert (=> d!8426 m!42701))

(assert (=> d!8426 m!42703))

(declare-fun m!42945 () Bool)

(assert (=> d!8426 m!42945))

(declare-fun m!42947 () Bool)

(assert (=> d!8426 m!42947))

(assert (=> d!8426 m!42741))

(declare-fun m!42949 () Bool)

(assert (=> d!8426 m!42949))

(declare-fun m!42951 () Bool)

(assert (=> d!8426 m!42951))

(declare-fun m!42953 () Bool)

(assert (=> d!8426 m!42953))

(declare-fun m!42955 () Bool)

(assert (=> d!8426 m!42955))

(assert (=> b!29655 m!42705))

(declare-fun m!42957 () Bool)

(assert (=> b!29655 m!42957))

(declare-fun m!42959 () Bool)

(assert (=> b!29655 m!42959))

(declare-fun m!42961 () Bool)

(assert (=> b!29656 m!42961))

(declare-fun m!42963 () Bool)

(assert (=> b!29657 m!42963))

(assert (=> b!29490 d!8426))

(declare-fun b!29660 () Bool)

(declare-fun e!19847 () Unit!2287)

(declare-fun lt!42490 () Unit!2287)

(assert (=> b!29660 (= e!19847 lt!42490)))

(declare-fun lt!42493 () (_ BitVec 64))

(assert (=> b!29660 (= lt!42493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42486 () (_ BitVec 64))

(assert (=> b!29660 (= lt!42486 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))))))

(assert (=> b!29660 (= lt!42490 (arrayBitRangesEqSymmetric!0 (buf!1099 (_2!1659 lt!42196)) (buf!1099 (_2!1659 lt!42192)) lt!42493 lt!42486))))

(assert (=> b!29660 (arrayBitRangesEq!0 (buf!1099 (_2!1659 lt!42192)) (buf!1099 (_2!1659 lt!42196)) lt!42493 lt!42486)))

(declare-fun b!29661 () Bool)

(declare-fun res!25568 () Bool)

(declare-fun e!19846 () Bool)

(assert (=> b!29661 (=> (not res!25568) (not e!19846))))

(declare-fun lt!42492 () tuple2!3142)

(assert (=> b!29661 (= res!25568 (isPrefixOf!0 (_1!1658 lt!42492) (_2!1659 lt!42196)))))

(declare-fun b!29662 () Bool)

(declare-fun res!25569 () Bool)

(assert (=> b!29662 (=> (not res!25569) (not e!19846))))

(assert (=> b!29662 (= res!25569 (isPrefixOf!0 (_2!1658 lt!42492) (_2!1659 lt!42192)))))

(declare-fun d!8436 () Bool)

(assert (=> d!8436 e!19846))

(declare-fun res!25567 () Bool)

(assert (=> d!8436 (=> (not res!25567) (not e!19846))))

(assert (=> d!8436 (= res!25567 (isPrefixOf!0 (_1!1658 lt!42492) (_2!1658 lt!42492)))))

(declare-fun lt!42494 () BitStream!1364)

(assert (=> d!8436 (= lt!42492 (tuple2!3143 lt!42494 (_2!1659 lt!42192)))))

(declare-fun lt!42488 () Unit!2287)

(declare-fun lt!42485 () Unit!2287)

(assert (=> d!8436 (= lt!42488 lt!42485)))

(assert (=> d!8436 (isPrefixOf!0 lt!42494 (_2!1659 lt!42192))))

(assert (=> d!8436 (= lt!42485 (lemmaIsPrefixTransitive!0 lt!42494 (_2!1659 lt!42192) (_2!1659 lt!42192)))))

(declare-fun lt!42501 () Unit!2287)

(declare-fun lt!42497 () Unit!2287)

(assert (=> d!8436 (= lt!42501 lt!42497)))

(assert (=> d!8436 (isPrefixOf!0 lt!42494 (_2!1659 lt!42192))))

(assert (=> d!8436 (= lt!42497 (lemmaIsPrefixTransitive!0 lt!42494 (_2!1659 lt!42196) (_2!1659 lt!42192)))))

(declare-fun lt!42495 () Unit!2287)

(assert (=> d!8436 (= lt!42495 e!19847)))

(declare-fun c!1934 () Bool)

(assert (=> d!8436 (= c!1934 (not (= (size!771 (buf!1099 (_2!1659 lt!42196))) #b00000000000000000000000000000000)))))

(declare-fun lt!42500 () Unit!2287)

(declare-fun lt!42502 () Unit!2287)

(assert (=> d!8436 (= lt!42500 lt!42502)))

(assert (=> d!8436 (isPrefixOf!0 (_2!1659 lt!42192) (_2!1659 lt!42192))))

(assert (=> d!8436 (= lt!42502 (lemmaIsPrefixRefl!0 (_2!1659 lt!42192)))))

(declare-fun lt!42496 () Unit!2287)

(declare-fun lt!42499 () Unit!2287)

(assert (=> d!8436 (= lt!42496 lt!42499)))

(assert (=> d!8436 (= lt!42499 (lemmaIsPrefixRefl!0 (_2!1659 lt!42192)))))

(declare-fun lt!42491 () Unit!2287)

(declare-fun lt!42503 () Unit!2287)

(assert (=> d!8436 (= lt!42491 lt!42503)))

(assert (=> d!8436 (isPrefixOf!0 lt!42494 lt!42494)))

(assert (=> d!8436 (= lt!42503 (lemmaIsPrefixRefl!0 lt!42494))))

(declare-fun lt!42498 () Unit!2287)

(declare-fun lt!42487 () Unit!2287)

(assert (=> d!8436 (= lt!42498 lt!42487)))

(assert (=> d!8436 (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42196))))

(assert (=> d!8436 (= lt!42487 (lemmaIsPrefixRefl!0 (_2!1659 lt!42196)))))

(assert (=> d!8436 (= lt!42494 (BitStream!1365 (buf!1099 (_2!1659 lt!42192)) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))))))

(assert (=> d!8436 (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42192))))

(assert (=> d!8436 (= (reader!0 (_2!1659 lt!42196) (_2!1659 lt!42192)) lt!42492)))

(declare-fun lt!42489 () (_ BitVec 64))

(declare-fun b!29663 () Bool)

(declare-fun lt!42504 () (_ BitVec 64))

(assert (=> b!29663 (= e!19846 (= (_1!1658 lt!42492) (withMovedBitIndex!0 (_2!1658 lt!42492) (bvsub lt!42489 lt!42504))))))

(assert (=> b!29663 (or (= (bvand lt!42489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42489 lt!42504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29663 (= lt!42504 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42192))) (currentByte!2436 (_2!1659 lt!42192)) (currentBit!2431 (_2!1659 lt!42192))))))

(assert (=> b!29663 (= lt!42489 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))))))

(declare-fun b!29664 () Bool)

(declare-fun Unit!2300 () Unit!2287)

(assert (=> b!29664 (= e!19847 Unit!2300)))

(assert (= (and d!8436 c!1934) b!29660))

(assert (= (and d!8436 (not c!1934)) b!29664))

(assert (= (and d!8436 res!25567) b!29661))

(assert (= (and b!29661 res!25568) b!29662))

(assert (= (and b!29662 res!25569) b!29663))

(declare-fun m!42965 () Bool)

(assert (=> b!29663 m!42965))

(assert (=> b!29663 m!42727))

(assert (=> b!29663 m!42725))

(assert (=> d!8436 m!42941))

(declare-fun m!42967 () Bool)

(assert (=> d!8436 m!42967))

(declare-fun m!42969 () Bool)

(assert (=> d!8436 m!42969))

(declare-fun m!42971 () Bool)

(assert (=> d!8436 m!42971))

(declare-fun m!42973 () Bool)

(assert (=> d!8436 m!42973))

(assert (=> d!8436 m!42947))

(assert (=> d!8436 m!42739))

(declare-fun m!42975 () Bool)

(assert (=> d!8436 m!42975))

(declare-fun m!42977 () Bool)

(assert (=> d!8436 m!42977))

(declare-fun m!42979 () Bool)

(assert (=> d!8436 m!42979))

(declare-fun m!42981 () Bool)

(assert (=> d!8436 m!42981))

(assert (=> b!29660 m!42725))

(declare-fun m!42983 () Bool)

(assert (=> b!29660 m!42983))

(declare-fun m!42985 () Bool)

(assert (=> b!29660 m!42985))

(declare-fun m!42987 () Bool)

(assert (=> b!29661 m!42987))

(declare-fun m!42989 () Bool)

(assert (=> b!29662 m!42989))

(assert (=> b!29490 d!8436))

(declare-fun d!8438 () Bool)

(assert (=> d!8438 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42190)))

(declare-fun lt!42507 () Unit!2287)

(declare-fun choose!9 (BitStream!1364 array!1773 (_ BitVec 64) BitStream!1364) Unit!2287)

(assert (=> d!8438 (= lt!42507 (choose!9 (_2!1659 lt!42196) (buf!1099 (_2!1659 lt!42192)) lt!42190 (BitStream!1365 (buf!1099 (_2!1659 lt!42192)) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196)))))))

(assert (=> d!8438 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1659 lt!42196) (buf!1099 (_2!1659 lt!42192)) lt!42190) lt!42507)))

(declare-fun bs!2382 () Bool)

(assert (= bs!2382 d!8438))

(assert (=> bs!2382 m!42707))

(declare-fun m!42991 () Bool)

(assert (=> bs!2382 m!42991))

(assert (=> b!29490 d!8438))

(declare-fun b!29665 () Bool)

(declare-fun e!19848 () tuple2!3154)

(assert (=> b!29665 (= e!19848 (tuple2!3155 Nil!380 (_1!1658 lt!42199)))))

(declare-fun b!29668 () Bool)

(declare-fun e!19849 () Bool)

(declare-fun lt!42508 () List!383)

(assert (=> b!29668 (= e!19849 (> (length!109 lt!42508) 0))))

(declare-fun lt!42509 () (_ BitVec 64))

(declare-fun lt!42510 () tuple2!3156)

(declare-fun b!29666 () Bool)

(assert (=> b!29666 (= e!19848 (tuple2!3155 (Cons!379 (_1!1665 lt!42510) (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_2!1665 lt!42510) (bvsub lt!42190 lt!42509))) (_2!1665 lt!42510)))))

(assert (=> b!29666 (= lt!42510 (readBit!0 (_1!1658 lt!42199)))))

(assert (=> b!29666 (= lt!42509 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!8440 () Bool)

(assert (=> d!8440 e!19849))

(declare-fun c!1935 () Bool)

(assert (=> d!8440 (= c!1935 (= lt!42190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8440 (= lt!42508 (_1!1664 e!19848))))

(declare-fun c!1936 () Bool)

(assert (=> d!8440 (= c!1936 (= lt!42190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8440 (bvsge lt!42190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8440 (= (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_1!1658 lt!42199) lt!42190) lt!42508)))

(declare-fun b!29667 () Bool)

(assert (=> b!29667 (= e!19849 (isEmpty!77 lt!42508))))

(assert (= (and d!8440 c!1936) b!29665))

(assert (= (and d!8440 (not c!1936)) b!29666))

(assert (= (and d!8440 c!1935) b!29667))

(assert (= (and d!8440 (not c!1935)) b!29668))

(declare-fun m!42993 () Bool)

(assert (=> b!29668 m!42993))

(declare-fun m!42995 () Bool)

(assert (=> b!29666 m!42995))

(declare-fun m!42997 () Bool)

(assert (=> b!29666 m!42997))

(declare-fun m!42999 () Bool)

(assert (=> b!29667 m!42999))

(assert (=> b!29490 d!8440))

(declare-fun d!8442 () Bool)

(assert (=> d!8442 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!42511 () Unit!2287)

(assert (=> d!8442 (= lt!42511 (choose!9 thiss!1379 (buf!1099 (_2!1659 lt!42192)) (bvsub to!314 i!635) (BitStream!1365 (buf!1099 (_2!1659 lt!42192)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379))))))

(assert (=> d!8442 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1099 (_2!1659 lt!42192)) (bvsub to!314 i!635)) lt!42511)))

(declare-fun bs!2383 () Bool)

(assert (= bs!2383 d!8442))

(assert (=> bs!2383 m!42715))

(declare-fun m!43001 () Bool)

(assert (=> bs!2383 m!43001))

(assert (=> b!29490 d!8442))

(declare-fun d!8444 () Bool)

(assert (=> d!8444 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2384 () Bool)

(assert (= bs!2384 d!8444))

(declare-fun m!43003 () Bool)

(assert (=> bs!2384 m!43003))

(assert (=> b!29490 d!8444))

(declare-fun d!8446 () Bool)

(declare-fun res!25578 () Bool)

(declare-fun e!19855 () Bool)

(assert (=> d!8446 (=> (not res!25578) (not e!19855))))

(assert (=> d!8446 (= res!25578 (= (size!771 (buf!1099 thiss!1379)) (size!771 (buf!1099 (_2!1659 lt!42196)))))))

(assert (=> d!8446 (= (isPrefixOf!0 thiss!1379 (_2!1659 lt!42196)) e!19855)))

(declare-fun b!29675 () Bool)

(declare-fun res!25576 () Bool)

(assert (=> b!29675 (=> (not res!25576) (not e!19855))))

(assert (=> b!29675 (= res!25576 (bvsle (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)) (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196)))))))

(declare-fun b!29676 () Bool)

(declare-fun e!19854 () Bool)

(assert (=> b!29676 (= e!19855 e!19854)))

(declare-fun res!25577 () Bool)

(assert (=> b!29676 (=> res!25577 e!19854)))

(assert (=> b!29676 (= res!25577 (= (size!771 (buf!1099 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29677 () Bool)

(assert (=> b!29677 (= e!19854 (arrayBitRangesEq!0 (buf!1099 thiss!1379) (buf!1099 (_2!1659 lt!42196)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379))))))

(assert (= (and d!8446 res!25578) b!29675))

(assert (= (and b!29675 res!25576) b!29676))

(assert (= (and b!29676 (not res!25577)) b!29677))

(assert (=> b!29675 m!42705))

(assert (=> b!29675 m!42725))

(assert (=> b!29677 m!42705))

(assert (=> b!29677 m!42705))

(declare-fun m!43005 () Bool)

(assert (=> b!29677 m!43005))

(assert (=> b!29497 d!8446))

(declare-fun d!8448 () Bool)

(assert (=> d!8448 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42190) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196)))) lt!42190))))

(declare-fun bs!2385 () Bool)

(assert (= bs!2385 d!8448))

(assert (=> bs!2385 m!42901))

(assert (=> b!29497 d!8448))

(declare-fun d!8450 () Bool)

(declare-fun e!19858 () Bool)

(assert (=> d!8450 e!19858))

(declare-fun res!25581 () Bool)

(assert (=> d!8450 (=> (not res!25581) (not e!19858))))

(assert (=> d!8450 (= res!25581 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42514 () Unit!2287)

(declare-fun choose!27 (BitStream!1364 BitStream!1364 (_ BitVec 64) (_ BitVec 64)) Unit!2287)

(assert (=> d!8450 (= lt!42514 (choose!27 thiss!1379 (_2!1659 lt!42196) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8450 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8450 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1659 lt!42196) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42514)))

(declare-fun b!29680 () Bool)

(assert (=> b!29680 (= e!19858 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8450 res!25581) b!29680))

(declare-fun m!43007 () Bool)

(assert (=> d!8450 m!43007))

(declare-fun m!43009 () Bool)

(assert (=> b!29680 m!43009))

(assert (=> b!29497 d!8450))

(declare-fun b!29728 () Bool)

(declare-fun e!19882 () Bool)

(declare-datatypes ((tuple2!3158 0))(
  ( (tuple2!3159 (_1!1666 BitStream!1364) (_2!1666 Bool)) )
))
(declare-fun lt!42593 () tuple2!3158)

(declare-fun lt!42587 () tuple2!3144)

(assert (=> b!29728 (= e!19882 (= (bitIndex!0 (size!771 (buf!1099 (_1!1666 lt!42593))) (currentByte!2436 (_1!1666 lt!42593)) (currentBit!2431 (_1!1666 lt!42593))) (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42587))) (currentByte!2436 (_2!1659 lt!42587)) (currentBit!2431 (_2!1659 lt!42587)))))))

(declare-fun b!29729 () Bool)

(declare-fun res!25628 () Bool)

(declare-fun e!19883 () Bool)

(assert (=> b!29729 (=> (not res!25628) (not e!19883))))

(assert (=> b!29729 (= res!25628 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42587)))))

(declare-fun b!29730 () Bool)

(declare-fun res!25633 () Bool)

(declare-fun e!19885 () Bool)

(assert (=> b!29730 (=> (not res!25633) (not e!19885))))

(declare-fun lt!42590 () (_ BitVec 64))

(declare-fun lt!42588 () tuple2!3144)

(declare-fun lt!42589 () (_ BitVec 64))

(assert (=> b!29730 (= res!25633 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42588))) (currentByte!2436 (_2!1659 lt!42588)) (currentBit!2431 (_2!1659 lt!42588))) (bvadd lt!42589 lt!42590)))))

(assert (=> b!29730 (or (not (= (bvand lt!42589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42590 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!42589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!42589 lt!42590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29730 (= lt!42590 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!29730 (= lt!42589 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(declare-fun b!29731 () Bool)

(assert (=> b!29731 (= e!19883 e!19882)))

(declare-fun res!25630 () Bool)

(assert (=> b!29731 (=> (not res!25630) (not e!19882))))

(declare-fun lt!42595 () Bool)

(assert (=> b!29731 (= res!25630 (and (= (_2!1666 lt!42593) lt!42595) (= (_1!1666 lt!42593) (_2!1659 lt!42587))))))

(declare-fun readBitPure!0 (BitStream!1364) tuple2!3158)

(declare-fun readerFrom!0 (BitStream!1364 (_ BitVec 32) (_ BitVec 32)) BitStream!1364)

(assert (=> b!29731 (= lt!42593 (readBitPure!0 (readerFrom!0 (_2!1659 lt!42587) (currentBit!2431 thiss!1379) (currentByte!2436 thiss!1379))))))

(declare-fun b!29732 () Bool)

(declare-fun e!19884 () Bool)

(declare-fun lt!42594 () tuple2!3158)

(assert (=> b!29732 (= e!19884 (= (bitIndex!0 (size!771 (buf!1099 (_1!1666 lt!42594))) (currentByte!2436 (_1!1666 lt!42594)) (currentBit!2431 (_1!1666 lt!42594))) (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42588))) (currentByte!2436 (_2!1659 lt!42588)) (currentBit!2431 (_2!1659 lt!42588)))))))

(declare-fun b!29733 () Bool)

(declare-fun res!25629 () Bool)

(assert (=> b!29733 (=> (not res!25629) (not e!19883))))

(assert (=> b!29733 (= res!25629 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42587))) (currentByte!2436 (_2!1659 lt!42587)) (currentBit!2431 (_2!1659 lt!42587))) (bvadd (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29735 () Bool)

(assert (=> b!29735 (= e!19885 e!19884)))

(declare-fun res!25634 () Bool)

(assert (=> b!29735 (=> (not res!25634) (not e!19884))))

(declare-fun lt!42591 () (_ BitVec 8))

(assert (=> b!29735 (= res!25634 (and (= (_2!1666 lt!42594) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1234 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!42591)) #b00000000000000000000000000000000))) (= (_1!1666 lt!42594) (_2!1659 lt!42588))))))

(declare-datatypes ((tuple2!3160 0))(
  ( (tuple2!3161 (_1!1667 array!1773) (_2!1667 BitStream!1364)) )
))
(declare-fun lt!42584 () tuple2!3160)

(declare-fun lt!42586 () BitStream!1364)

(declare-fun readBits!0 (BitStream!1364 (_ BitVec 64)) tuple2!3160)

(assert (=> b!29735 (= lt!42584 (readBits!0 lt!42586 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29735 (= lt!42594 (readBitPure!0 lt!42586))))

(assert (=> b!29735 (= lt!42586 (readerFrom!0 (_2!1659 lt!42588) (currentBit!2431 thiss!1379) (currentByte!2436 thiss!1379)))))

(declare-fun b!29734 () Bool)

(declare-fun res!25627 () Bool)

(assert (=> b!29734 (=> (not res!25627) (not e!19885))))

(assert (=> b!29734 (= res!25627 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42588)))))

(declare-fun d!8452 () Bool)

(assert (=> d!8452 e!19885))

(declare-fun res!25631 () Bool)

(assert (=> d!8452 (=> (not res!25631) (not e!19885))))

(assert (=> d!8452 (= res!25631 (= (size!771 (buf!1099 (_2!1659 lt!42588))) (size!771 (buf!1099 thiss!1379))))))

(declare-fun lt!42585 () array!1773)

(assert (=> d!8452 (= lt!42591 (select (arr!1234 lt!42585) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8452 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!771 lt!42585)))))

(assert (=> d!8452 (= lt!42585 (array!1774 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!42592 () tuple2!3144)

(assert (=> d!8452 (= lt!42588 (tuple2!3145 (_1!1659 lt!42592) (_2!1659 lt!42592)))))

(assert (=> d!8452 (= lt!42592 lt!42587)))

(assert (=> d!8452 e!19883))

(declare-fun res!25632 () Bool)

(assert (=> d!8452 (=> (not res!25632) (not e!19883))))

(assert (=> d!8452 (= res!25632 (= (size!771 (buf!1099 thiss!1379)) (size!771 (buf!1099 (_2!1659 lt!42587)))))))

(declare-fun appendBit!0 (BitStream!1364 Bool) tuple2!3144)

(assert (=> d!8452 (= lt!42587 (appendBit!0 thiss!1379 lt!42595))))

(assert (=> d!8452 (= lt!42595 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1234 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8452 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8452 (= (appendBitFromByte!0 thiss!1379 (select (arr!1234 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!42588)))

(assert (= (and d!8452 res!25632) b!29733))

(assert (= (and b!29733 res!25629) b!29729))

(assert (= (and b!29729 res!25628) b!29731))

(assert (= (and b!29731 res!25630) b!29728))

(assert (= (and d!8452 res!25631) b!29730))

(assert (= (and b!29730 res!25633) b!29734))

(assert (= (and b!29734 res!25627) b!29735))

(assert (= (and b!29735 res!25634) b!29732))

(declare-fun m!43049 () Bool)

(assert (=> b!29731 m!43049))

(assert (=> b!29731 m!43049))

(declare-fun m!43051 () Bool)

(assert (=> b!29731 m!43051))

(declare-fun m!43053 () Bool)

(assert (=> b!29733 m!43053))

(assert (=> b!29733 m!42705))

(declare-fun m!43055 () Bool)

(assert (=> b!29732 m!43055))

(declare-fun m!43057 () Bool)

(assert (=> b!29732 m!43057))

(declare-fun m!43059 () Bool)

(assert (=> b!29729 m!43059))

(assert (=> b!29730 m!43057))

(assert (=> b!29730 m!42705))

(declare-fun m!43061 () Bool)

(assert (=> d!8452 m!43061))

(declare-fun m!43063 () Bool)

(assert (=> d!8452 m!43063))

(assert (=> d!8452 m!42903))

(declare-fun m!43065 () Bool)

(assert (=> b!29735 m!43065))

(declare-fun m!43067 () Bool)

(assert (=> b!29735 m!43067))

(declare-fun m!43069 () Bool)

(assert (=> b!29735 m!43069))

(declare-fun m!43071 () Bool)

(assert (=> b!29734 m!43071))

(declare-fun m!43073 () Bool)

(assert (=> b!29728 m!43073))

(assert (=> b!29728 m!43053))

(assert (=> b!29497 d!8452))

(declare-fun d!8464 () Bool)

(declare-fun res!25637 () Bool)

(declare-fun e!19887 () Bool)

(assert (=> d!8464 (=> (not res!25637) (not e!19887))))

(assert (=> d!8464 (= res!25637 (= (size!771 (buf!1099 thiss!1379)) (size!771 (buf!1099 thiss!1379))))))

(assert (=> d!8464 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19887)))

(declare-fun b!29736 () Bool)

(declare-fun res!25635 () Bool)

(assert (=> b!29736 (=> (not res!25635) (not e!19887))))

(assert (=> b!29736 (= res!25635 (bvsle (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)) (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379))))))

(declare-fun b!29737 () Bool)

(declare-fun e!19886 () Bool)

(assert (=> b!29737 (= e!19887 e!19886)))

(declare-fun res!25636 () Bool)

(assert (=> b!29737 (=> res!25636 e!19886)))

(assert (=> b!29737 (= res!25636 (= (size!771 (buf!1099 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29738 () Bool)

(assert (=> b!29738 (= e!19886 (arrayBitRangesEq!0 (buf!1099 thiss!1379) (buf!1099 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379))))))

(assert (= (and d!8464 res!25637) b!29736))

(assert (= (and b!29736 res!25635) b!29737))

(assert (= (and b!29737 (not res!25636)) b!29738))

(assert (=> b!29736 m!42705))

(assert (=> b!29736 m!42705))

(assert (=> b!29738 m!42705))

(assert (=> b!29738 m!42705))

(declare-fun m!43075 () Bool)

(assert (=> b!29738 m!43075))

(assert (=> b!29499 d!8464))

(declare-fun d!8466 () Bool)

(assert (=> d!8466 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!42601 () Unit!2287)

(declare-fun choose!11 (BitStream!1364) Unit!2287)

(assert (=> d!8466 (= lt!42601 (choose!11 thiss!1379))))

(assert (=> d!8466 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!42601)))

(declare-fun bs!2391 () Bool)

(assert (= bs!2391 d!8466))

(assert (=> bs!2391 m!42701))

(declare-fun m!43079 () Bool)

(assert (=> bs!2391 m!43079))

(assert (=> b!29499 d!8466))

(declare-fun d!8470 () Bool)

(declare-fun e!19888 () Bool)

(assert (=> d!8470 e!19888))

(declare-fun res!25639 () Bool)

(assert (=> d!8470 (=> (not res!25639) (not e!19888))))

(declare-fun lt!42603 () (_ BitVec 64))

(declare-fun lt!42605 () (_ BitVec 64))

(declare-fun lt!42607 () (_ BitVec 64))

(assert (=> d!8470 (= res!25639 (= lt!42607 (bvsub lt!42603 lt!42605)))))

(assert (=> d!8470 (or (= (bvand lt!42603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42603 lt!42605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8470 (= lt!42605 (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 thiss!1379))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379))))))

(declare-fun lt!42604 () (_ BitVec 64))

(declare-fun lt!42602 () (_ BitVec 64))

(assert (=> d!8470 (= lt!42603 (bvmul lt!42604 lt!42602))))

(assert (=> d!8470 (or (= lt!42604 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42602 (bvsdiv (bvmul lt!42604 lt!42602) lt!42604)))))

(assert (=> d!8470 (= lt!42602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8470 (= lt!42604 ((_ sign_extend 32) (size!771 (buf!1099 thiss!1379))))))

(assert (=> d!8470 (= lt!42607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2436 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2431 thiss!1379))))))

(assert (=> d!8470 (invariant!0 (currentBit!2431 thiss!1379) (currentByte!2436 thiss!1379) (size!771 (buf!1099 thiss!1379)))))

(assert (=> d!8470 (= (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)) lt!42607)))

(declare-fun b!29739 () Bool)

(declare-fun res!25638 () Bool)

(assert (=> b!29739 (=> (not res!25638) (not e!19888))))

(assert (=> b!29739 (= res!25638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42607))))

(declare-fun b!29740 () Bool)

(declare-fun lt!42606 () (_ BitVec 64))

(assert (=> b!29740 (= e!19888 (bvsle lt!42607 (bvmul lt!42606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29740 (or (= lt!42606 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42606 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42606)))))

(assert (=> b!29740 (= lt!42606 ((_ sign_extend 32) (size!771 (buf!1099 thiss!1379))))))

(assert (= (and d!8470 res!25639) b!29739))

(assert (= (and b!29739 res!25638) b!29740))

(declare-fun m!43081 () Bool)

(assert (=> d!8470 m!43081))

(assert (=> d!8470 m!42917))

(assert (=> b!29499 d!8470))

(declare-fun d!8472 () Bool)

(assert (=> d!8472 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 thiss!1379))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 thiss!1379))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2392 () Bool)

(assert (= bs!2392 d!8472))

(assert (=> bs!2392 m!43081))

(assert (=> b!29488 d!8472))

(declare-fun d!8474 () Bool)

(declare-fun e!19889 () Bool)

(assert (=> d!8474 e!19889))

(declare-fun res!25641 () Bool)

(assert (=> d!8474 (=> (not res!25641) (not e!19889))))

(declare-fun lt!42611 () (_ BitVec 64))

(declare-fun lt!42609 () (_ BitVec 64))

(declare-fun lt!42613 () (_ BitVec 64))

(assert (=> d!8474 (= res!25641 (= lt!42613 (bvsub lt!42609 lt!42611)))))

(assert (=> d!8474 (or (= (bvand lt!42609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42609 lt!42611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8474 (= lt!42611 (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42192))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42192)))))))

(declare-fun lt!42610 () (_ BitVec 64))

(declare-fun lt!42608 () (_ BitVec 64))

(assert (=> d!8474 (= lt!42609 (bvmul lt!42610 lt!42608))))

(assert (=> d!8474 (or (= lt!42610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42608 (bvsdiv (bvmul lt!42610 lt!42608) lt!42610)))))

(assert (=> d!8474 (= lt!42608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8474 (= lt!42610 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))))))

(assert (=> d!8474 (= lt!42613 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42192))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42192)))))))

(assert (=> d!8474 (invariant!0 (currentBit!2431 (_2!1659 lt!42192)) (currentByte!2436 (_2!1659 lt!42192)) (size!771 (buf!1099 (_2!1659 lt!42192))))))

(assert (=> d!8474 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42192))) (currentByte!2436 (_2!1659 lt!42192)) (currentBit!2431 (_2!1659 lt!42192))) lt!42613)))

(declare-fun b!29741 () Bool)

(declare-fun res!25640 () Bool)

(assert (=> b!29741 (=> (not res!25640) (not e!19889))))

(assert (=> b!29741 (= res!25640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42613))))

(declare-fun b!29742 () Bool)

(declare-fun lt!42612 () (_ BitVec 64))

(assert (=> b!29742 (= e!19889 (bvsle lt!42613 (bvmul lt!42612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29742 (or (= lt!42612 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42612 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42612)))))

(assert (=> b!29742 (= lt!42612 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42192)))))))

(assert (= (and d!8474 res!25641) b!29741))

(assert (= (and b!29741 res!25640) b!29742))

(declare-fun m!43083 () Bool)

(assert (=> d!8474 m!43083))

(assert (=> d!8474 m!42723))

(assert (=> b!29498 d!8474))

(declare-fun b!29837 () Bool)

(declare-fun res!25702 () Bool)

(declare-fun e!19931 () Bool)

(assert (=> b!29837 (=> (not res!25702) (not e!19931))))

(declare-fun lt!42968 () tuple2!3144)

(assert (=> b!29837 (= res!25702 (= (size!771 (buf!1099 (_2!1659 lt!42196))) (size!771 (buf!1099 (_2!1659 lt!42968)))))))

(declare-fun b!29838 () Bool)

(declare-fun e!19933 () Bool)

(declare-fun lt!42981 () (_ BitVec 64))

(assert (=> b!29838 (= e!19933 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42981))))

(declare-fun d!8476 () Bool)

(assert (=> d!8476 e!19931))

(declare-fun res!25703 () Bool)

(assert (=> d!8476 (=> (not res!25703) (not e!19931))))

(declare-fun lt!42994 () (_ BitVec 64))

(assert (=> d!8476 (= res!25703 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42968))) (currentByte!2436 (_2!1659 lt!42968)) (currentBit!2431 (_2!1659 lt!42968))) (bvsub lt!42994 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8476 (or (= (bvand lt!42994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42994 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!42998 () (_ BitVec 64))

(assert (=> d!8476 (= lt!42994 (bvadd lt!42998 to!314))))

(assert (=> d!8476 (or (not (= (bvand lt!42998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!42998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!42998 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8476 (= lt!42998 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))))))

(declare-fun e!19932 () tuple2!3144)

(assert (=> d!8476 (= lt!42968 e!19932)))

(declare-fun c!1955 () Bool)

(assert (=> d!8476 (= c!1955 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!42985 () Unit!2287)

(declare-fun lt!42966 () Unit!2287)

(assert (=> d!8476 (= lt!42985 lt!42966)))

(assert (=> d!8476 (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42196))))

(assert (=> d!8476 (= lt!42966 (lemmaIsPrefixRefl!0 (_2!1659 lt!42196)))))

(declare-fun lt!43002 () (_ BitVec 64))

(assert (=> d!8476 (= lt!43002 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))))))

(assert (=> d!8476 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8476 (= (appendBitsMSBFirstLoop!0 (_2!1659 lt!42196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!42968)))

(declare-fun b!29839 () Bool)

(declare-fun res!25704 () Bool)

(assert (=> b!29839 (=> (not res!25704) (not e!19931))))

(assert (=> b!29839 (= res!25704 (invariant!0 (currentBit!2431 (_2!1659 lt!42968)) (currentByte!2436 (_2!1659 lt!42968)) (size!771 (buf!1099 (_2!1659 lt!42968)))))))

(declare-fun b!29840 () Bool)

(declare-fun lt!42977 () tuple2!3142)

(assert (=> b!29840 (= e!19931 (= (bitStreamReadBitsIntoList!0 (_2!1659 lt!42968) (_1!1658 lt!42977) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1659 lt!42968) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!29840 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29840 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!42999 () Unit!2287)

(declare-fun lt!43007 () Unit!2287)

(assert (=> b!29840 (= lt!42999 lt!43007)))

(assert (=> b!29840 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42968)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42981)))

(assert (=> b!29840 (= lt!43007 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1659 lt!42196) (buf!1099 (_2!1659 lt!42968)) lt!42981))))

(assert (=> b!29840 e!19933))

(declare-fun res!25701 () Bool)

(assert (=> b!29840 (=> (not res!25701) (not e!19933))))

(assert (=> b!29840 (= res!25701 (and (= (size!771 (buf!1099 (_2!1659 lt!42196))) (size!771 (buf!1099 (_2!1659 lt!42968)))) (bvsge lt!42981 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29840 (= lt!42981 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!29840 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29840 (= lt!42977 (reader!0 (_2!1659 lt!42196) (_2!1659 lt!42968)))))

(declare-fun b!29841 () Bool)

(declare-fun Unit!2301 () Unit!2287)

(assert (=> b!29841 (= e!19932 (tuple2!3145 Unit!2301 (_2!1659 lt!42196)))))

(assert (=> b!29841 (= (size!771 (buf!1099 (_2!1659 lt!42196))) (size!771 (buf!1099 (_2!1659 lt!42196))))))

(declare-fun lt!43004 () Unit!2287)

(declare-fun Unit!2302 () Unit!2287)

(assert (=> b!29841 (= lt!43004 Unit!2302)))

(declare-fun call!379 () tuple2!3142)

(declare-fun checkByteArrayBitContent!0 (BitStream!1364 array!1773 array!1773 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29841 (checkByteArrayBitContent!0 (_2!1659 lt!42196) srcBuffer!2 (_1!1667 (readBits!0 (_1!1658 call!379) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42970 () tuple2!3144)

(declare-fun bm!376 () Bool)

(assert (=> bm!376 (= call!379 (reader!0 (_2!1659 lt!42196) (ite c!1955 (_2!1659 lt!42970) (_2!1659 lt!42196))))))

(declare-fun b!29842 () Bool)

(declare-fun res!25705 () Bool)

(assert (=> b!29842 (=> (not res!25705) (not e!19931))))

(assert (=> b!29842 (= res!25705 (= (size!771 (buf!1099 (_2!1659 lt!42968))) (size!771 (buf!1099 (_2!1659 lt!42196)))))))

(declare-fun b!29843 () Bool)

(declare-fun res!25700 () Bool)

(assert (=> b!29843 (=> (not res!25700) (not e!19931))))

(assert (=> b!29843 (= res!25700 (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42968)))))

(declare-fun b!29844 () Bool)

(declare-fun Unit!2303 () Unit!2287)

(assert (=> b!29844 (= e!19932 (tuple2!3145 Unit!2303 (_2!1659 lt!42970)))))

(declare-fun lt!42979 () tuple2!3144)

(assert (=> b!29844 (= lt!42979 (appendBitFromByte!0 (_2!1659 lt!42196) (select (arr!1234 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!42987 () (_ BitVec 64))

(assert (=> b!29844 (= lt!42987 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43009 () (_ BitVec 64))

(assert (=> b!29844 (= lt!43009 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42975 () Unit!2287)

(assert (=> b!29844 (= lt!42975 (validateOffsetBitsIneqLemma!0 (_2!1659 lt!42196) (_2!1659 lt!42979) lt!42987 lt!43009))))

(assert (=> b!29844 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42979)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42979))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42979))) (bvsub lt!42987 lt!43009))))

(declare-fun lt!42993 () Unit!2287)

(assert (=> b!29844 (= lt!42993 lt!42975)))

(declare-fun lt!43005 () tuple2!3142)

(assert (=> b!29844 (= lt!43005 (reader!0 (_2!1659 lt!42196) (_2!1659 lt!42979)))))

(declare-fun lt!42972 () (_ BitVec 64))

(assert (=> b!29844 (= lt!42972 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42978 () Unit!2287)

(assert (=> b!29844 (= lt!42978 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1659 lt!42196) (buf!1099 (_2!1659 lt!42979)) lt!42972))))

(assert (=> b!29844 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42979)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42972)))

(declare-fun lt!42971 () Unit!2287)

(assert (=> b!29844 (= lt!42971 lt!42978)))

(assert (=> b!29844 (= (head!220 (byteArrayBitContentToList!0 (_2!1659 lt!42979) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!220 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42979) (_1!1658 lt!43005) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!42973 () Unit!2287)

(declare-fun Unit!2304 () Unit!2287)

(assert (=> b!29844 (= lt!42973 Unit!2304)))

(assert (=> b!29844 (= lt!42970 (appendBitsMSBFirstLoop!0 (_2!1659 lt!42979) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!42997 () Unit!2287)

(assert (=> b!29844 (= lt!42997 (lemmaIsPrefixTransitive!0 (_2!1659 lt!42196) (_2!1659 lt!42979) (_2!1659 lt!42970)))))

(assert (=> b!29844 (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42970))))

(declare-fun lt!42976 () Unit!2287)

(assert (=> b!29844 (= lt!42976 lt!42997)))

(assert (=> b!29844 (= (size!771 (buf!1099 (_2!1659 lt!42970))) (size!771 (buf!1099 (_2!1659 lt!42196))))))

(declare-fun lt!42995 () Unit!2287)

(declare-fun Unit!2305 () Unit!2287)

(assert (=> b!29844 (= lt!42995 Unit!2305)))

(assert (=> b!29844 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42970))) (currentByte!2436 (_2!1659 lt!42970)) (currentBit!2431 (_2!1659 lt!42970))) (bvsub (bvadd (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42991 () Unit!2287)

(declare-fun Unit!2306 () Unit!2287)

(assert (=> b!29844 (= lt!42991 Unit!2306)))

(assert (=> b!29844 (= (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42970))) (currentByte!2436 (_2!1659 lt!42970)) (currentBit!2431 (_2!1659 lt!42970))) (bvsub (bvsub (bvadd (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42979))) (currentByte!2436 (_2!1659 lt!42979)) (currentBit!2431 (_2!1659 lt!42979))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42989 () Unit!2287)

(declare-fun Unit!2307 () Unit!2287)

(assert (=> b!29844 (= lt!42989 Unit!2307)))

(declare-fun lt!43000 () tuple2!3142)

(assert (=> b!29844 (= lt!43000 call!379)))

(declare-fun lt!42996 () (_ BitVec 64))

(assert (=> b!29844 (= lt!42996 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43003 () Unit!2287)

(assert (=> b!29844 (= lt!43003 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1659 lt!42196) (buf!1099 (_2!1659 lt!42970)) lt!42996))))

(assert (=> b!29844 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42970)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42196))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42196))) lt!42996)))

(declare-fun lt!42986 () Unit!2287)

(assert (=> b!29844 (= lt!42986 lt!43003)))

(declare-fun lt!42992 () tuple2!3142)

(assert (=> b!29844 (= lt!42992 (reader!0 (_2!1659 lt!42979) (_2!1659 lt!42970)))))

(declare-fun lt!42990 () (_ BitVec 64))

(assert (=> b!29844 (= lt!42990 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43001 () Unit!2287)

(assert (=> b!29844 (= lt!43001 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1659 lt!42979) (buf!1099 (_2!1659 lt!42970)) lt!42990))))

(assert (=> b!29844 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42970)))) ((_ sign_extend 32) (currentByte!2436 (_2!1659 lt!42979))) ((_ sign_extend 32) (currentBit!2431 (_2!1659 lt!42979))) lt!42990)))

(declare-fun lt!42980 () Unit!2287)

(assert (=> b!29844 (= lt!42980 lt!43001)))

(declare-fun lt!43006 () List!383)

(assert (=> b!29844 (= lt!43006 (byteArrayBitContentToList!0 (_2!1659 lt!42970) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!42984 () List!383)

(assert (=> b!29844 (= lt!42984 (byteArrayBitContentToList!0 (_2!1659 lt!42970) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43008 () List!383)

(assert (=> b!29844 (= lt!43008 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42970) (_1!1658 lt!43000) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!42982 () List!383)

(assert (=> b!29844 (= lt!42982 (bitStreamReadBitsIntoList!0 (_2!1659 lt!42970) (_1!1658 lt!42992) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!42967 () (_ BitVec 64))

(assert (=> b!29844 (= lt!42967 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!42969 () Unit!2287)

(assert (=> b!29844 (= lt!42969 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1659 lt!42970) (_2!1659 lt!42970) (_1!1658 lt!43000) (_1!1658 lt!42992) lt!42967 lt!43008))))

(assert (=> b!29844 (= (bitStreamReadBitsIntoList!0 (_2!1659 lt!42970) (_1!1658 lt!42992) (bvsub lt!42967 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!100 lt!43008))))

(declare-fun lt!42988 () Unit!2287)

(assert (=> b!29844 (= lt!42988 lt!42969)))

(declare-fun lt!42983 () Unit!2287)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1773 array!1773 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2287)

(assert (=> b!29844 (= lt!42983 (arrayBitRangesEqImpliesEq!0 (buf!1099 (_2!1659 lt!42979)) (buf!1099 (_2!1659 lt!42970)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!43002 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42979))) (currentByte!2436 (_2!1659 lt!42979)) (currentBit!2431 (_2!1659 lt!42979)))))))

(declare-fun bitAt!0 (array!1773 (_ BitVec 64)) Bool)

(assert (=> b!29844 (= (bitAt!0 (buf!1099 (_2!1659 lt!42979)) lt!43002) (bitAt!0 (buf!1099 (_2!1659 lt!42970)) lt!43002))))

(declare-fun lt!42974 () Unit!2287)

(assert (=> b!29844 (= lt!42974 lt!42983)))

(assert (= (and d!8476 c!1955) b!29844))

(assert (= (and d!8476 (not c!1955)) b!29841))

(assert (= (or b!29844 b!29841) bm!376))

(assert (= (and d!8476 res!25703) b!29839))

(assert (= (and b!29839 res!25704) b!29837))

(assert (= (and b!29837 res!25702) b!29843))

(assert (= (and b!29843 res!25700) b!29842))

(assert (= (and b!29842 res!25705) b!29840))

(assert (= (and b!29840 res!25701) b!29838))

(declare-fun m!43285 () Bool)

(assert (=> b!29839 m!43285))

(declare-fun m!43287 () Bool)

(assert (=> d!8476 m!43287))

(assert (=> d!8476 m!42725))

(assert (=> d!8476 m!42969))

(assert (=> d!8476 m!42971))

(declare-fun m!43289 () Bool)

(assert (=> b!29843 m!43289))

(declare-fun m!43291 () Bool)

(assert (=> b!29840 m!43291))

(declare-fun m!43293 () Bool)

(assert (=> b!29840 m!43293))

(declare-fun m!43295 () Bool)

(assert (=> b!29840 m!43295))

(declare-fun m!43297 () Bool)

(assert (=> b!29840 m!43297))

(declare-fun m!43299 () Bool)

(assert (=> b!29840 m!43299))

(declare-fun m!43301 () Bool)

(assert (=> b!29838 m!43301))

(declare-fun m!43303 () Bool)

(assert (=> b!29841 m!43303))

(declare-fun m!43305 () Bool)

(assert (=> b!29841 m!43305))

(declare-fun m!43307 () Bool)

(assert (=> bm!376 m!43307))

(declare-fun m!43309 () Bool)

(assert (=> b!29844 m!43309))

(declare-fun m!43311 () Bool)

(assert (=> b!29844 m!43311))

(declare-fun m!43313 () Bool)

(assert (=> b!29844 m!43313))

(declare-fun m!43315 () Bool)

(assert (=> b!29844 m!43315))

(declare-fun m!43317 () Bool)

(assert (=> b!29844 m!43317))

(declare-fun m!43319 () Bool)

(assert (=> b!29844 m!43319))

(declare-fun m!43321 () Bool)

(assert (=> b!29844 m!43321))

(declare-fun m!43323 () Bool)

(assert (=> b!29844 m!43323))

(declare-fun m!43325 () Bool)

(assert (=> b!29844 m!43325))

(declare-fun m!43327 () Bool)

(assert (=> b!29844 m!43327))

(declare-fun m!43329 () Bool)

(assert (=> b!29844 m!43329))

(declare-fun m!43331 () Bool)

(assert (=> b!29844 m!43331))

(declare-fun m!43333 () Bool)

(assert (=> b!29844 m!43333))

(declare-fun m!43335 () Bool)

(assert (=> b!29844 m!43335))

(declare-fun m!43337 () Bool)

(assert (=> b!29844 m!43337))

(declare-fun m!43339 () Bool)

(assert (=> b!29844 m!43339))

(declare-fun m!43341 () Bool)

(assert (=> b!29844 m!43341))

(declare-fun m!43343 () Bool)

(assert (=> b!29844 m!43343))

(declare-fun m!43345 () Bool)

(assert (=> b!29844 m!43345))

(declare-fun m!43347 () Bool)

(assert (=> b!29844 m!43347))

(assert (=> b!29844 m!43345))

(declare-fun m!43349 () Bool)

(assert (=> b!29844 m!43349))

(declare-fun m!43351 () Bool)

(assert (=> b!29844 m!43351))

(declare-fun m!43353 () Bool)

(assert (=> b!29844 m!43353))

(assert (=> b!29844 m!43337))

(declare-fun m!43355 () Bool)

(assert (=> b!29844 m!43355))

(declare-fun m!43357 () Bool)

(assert (=> b!29844 m!43357))

(declare-fun m!43359 () Bool)

(assert (=> b!29844 m!43359))

(declare-fun m!43361 () Bool)

(assert (=> b!29844 m!43361))

(assert (=> b!29844 m!42725))

(declare-fun m!43363 () Bool)

(assert (=> b!29844 m!43363))

(declare-fun m!43365 () Bool)

(assert (=> b!29844 m!43365))

(assert (=> b!29844 m!43357))

(assert (=> b!29844 m!43343))

(declare-fun m!43367 () Bool)

(assert (=> b!29844 m!43367))

(declare-fun m!43369 () Bool)

(assert (=> b!29844 m!43369))

(assert (=> b!29494 d!8476))

(declare-fun d!8516 () Bool)

(assert (=> d!8516 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42192))))

(declare-fun lt!43012 () Unit!2287)

(declare-fun choose!30 (BitStream!1364 BitStream!1364 BitStream!1364) Unit!2287)

(assert (=> d!8516 (= lt!43012 (choose!30 thiss!1379 (_2!1659 lt!42196) (_2!1659 lt!42192)))))

(assert (=> d!8516 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42196))))

(assert (=> d!8516 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1659 lt!42196) (_2!1659 lt!42192)) lt!43012)))

(declare-fun bs!2402 () Bool)

(assert (= bs!2402 d!8516))

(assert (=> bs!2402 m!42741))

(declare-fun m!43371 () Bool)

(assert (=> bs!2402 m!43371))

(assert (=> bs!2402 m!42755))

(assert (=> b!29494 d!8516))

(declare-fun d!8518 () Bool)

(declare-fun res!25708 () Bool)

(declare-fun e!19935 () Bool)

(assert (=> d!8518 (=> (not res!25708) (not e!19935))))

(assert (=> d!8518 (= res!25708 (= (size!771 (buf!1099 (_2!1659 lt!42196))) (size!771 (buf!1099 (_2!1659 lt!42192)))))))

(assert (=> d!8518 (= (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42192)) e!19935)))

(declare-fun b!29845 () Bool)

(declare-fun res!25706 () Bool)

(assert (=> b!29845 (=> (not res!25706) (not e!19935))))

(assert (=> b!29845 (= res!25706 (bvsle (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))) (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42192))) (currentByte!2436 (_2!1659 lt!42192)) (currentBit!2431 (_2!1659 lt!42192)))))))

(declare-fun b!29846 () Bool)

(declare-fun e!19934 () Bool)

(assert (=> b!29846 (= e!19935 e!19934)))

(declare-fun res!25707 () Bool)

(assert (=> b!29846 (=> res!25707 e!19934)))

(assert (=> b!29846 (= res!25707 (= (size!771 (buf!1099 (_2!1659 lt!42196))) #b00000000000000000000000000000000))))

(declare-fun b!29847 () Bool)

(assert (=> b!29847 (= e!19934 (arrayBitRangesEq!0 (buf!1099 (_2!1659 lt!42196)) (buf!1099 (_2!1659 lt!42192)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196)))))))

(assert (= (and d!8518 res!25708) b!29845))

(assert (= (and b!29845 res!25706) b!29846))

(assert (= (and b!29846 (not res!25707)) b!29847))

(assert (=> b!29845 m!42725))

(assert (=> b!29845 m!42727))

(assert (=> b!29847 m!42725))

(assert (=> b!29847 m!42725))

(declare-fun m!43373 () Bool)

(assert (=> b!29847 m!43373))

(assert (=> b!29494 d!8518))

(declare-fun b!29848 () Bool)

(declare-fun e!19937 () Unit!2287)

(declare-fun lt!43018 () Unit!2287)

(assert (=> b!29848 (= e!19937 lt!43018)))

(declare-fun lt!43021 () (_ BitVec 64))

(assert (=> b!29848 (= lt!43021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43014 () (_ BitVec 64))

(assert (=> b!29848 (= lt!43014 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(assert (=> b!29848 (= lt!43018 (arrayBitRangesEqSymmetric!0 (buf!1099 thiss!1379) (buf!1099 (_2!1659 lt!42196)) lt!43021 lt!43014))))

(assert (=> b!29848 (arrayBitRangesEq!0 (buf!1099 (_2!1659 lt!42196)) (buf!1099 thiss!1379) lt!43021 lt!43014)))

(declare-fun b!29849 () Bool)

(declare-fun res!25710 () Bool)

(declare-fun e!19936 () Bool)

(assert (=> b!29849 (=> (not res!25710) (not e!19936))))

(declare-fun lt!43020 () tuple2!3142)

(assert (=> b!29849 (= res!25710 (isPrefixOf!0 (_1!1658 lt!43020) thiss!1379))))

(declare-fun b!29850 () Bool)

(declare-fun res!25711 () Bool)

(assert (=> b!29850 (=> (not res!25711) (not e!19936))))

(assert (=> b!29850 (= res!25711 (isPrefixOf!0 (_2!1658 lt!43020) (_2!1659 lt!42196)))))

(declare-fun d!8520 () Bool)

(assert (=> d!8520 e!19936))

(declare-fun res!25709 () Bool)

(assert (=> d!8520 (=> (not res!25709) (not e!19936))))

(assert (=> d!8520 (= res!25709 (isPrefixOf!0 (_1!1658 lt!43020) (_2!1658 lt!43020)))))

(declare-fun lt!43022 () BitStream!1364)

(assert (=> d!8520 (= lt!43020 (tuple2!3143 lt!43022 (_2!1659 lt!42196)))))

(declare-fun lt!43016 () Unit!2287)

(declare-fun lt!43013 () Unit!2287)

(assert (=> d!8520 (= lt!43016 lt!43013)))

(assert (=> d!8520 (isPrefixOf!0 lt!43022 (_2!1659 lt!42196))))

(assert (=> d!8520 (= lt!43013 (lemmaIsPrefixTransitive!0 lt!43022 (_2!1659 lt!42196) (_2!1659 lt!42196)))))

(declare-fun lt!43029 () Unit!2287)

(declare-fun lt!43025 () Unit!2287)

(assert (=> d!8520 (= lt!43029 lt!43025)))

(assert (=> d!8520 (isPrefixOf!0 lt!43022 (_2!1659 lt!42196))))

(assert (=> d!8520 (= lt!43025 (lemmaIsPrefixTransitive!0 lt!43022 thiss!1379 (_2!1659 lt!42196)))))

(declare-fun lt!43023 () Unit!2287)

(assert (=> d!8520 (= lt!43023 e!19937)))

(declare-fun c!1956 () Bool)

(assert (=> d!8520 (= c!1956 (not (= (size!771 (buf!1099 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!43028 () Unit!2287)

(declare-fun lt!43030 () Unit!2287)

(assert (=> d!8520 (= lt!43028 lt!43030)))

(assert (=> d!8520 (isPrefixOf!0 (_2!1659 lt!42196) (_2!1659 lt!42196))))

(assert (=> d!8520 (= lt!43030 (lemmaIsPrefixRefl!0 (_2!1659 lt!42196)))))

(declare-fun lt!43024 () Unit!2287)

(declare-fun lt!43027 () Unit!2287)

(assert (=> d!8520 (= lt!43024 lt!43027)))

(assert (=> d!8520 (= lt!43027 (lemmaIsPrefixRefl!0 (_2!1659 lt!42196)))))

(declare-fun lt!43019 () Unit!2287)

(declare-fun lt!43031 () Unit!2287)

(assert (=> d!8520 (= lt!43019 lt!43031)))

(assert (=> d!8520 (isPrefixOf!0 lt!43022 lt!43022)))

(assert (=> d!8520 (= lt!43031 (lemmaIsPrefixRefl!0 lt!43022))))

(declare-fun lt!43026 () Unit!2287)

(declare-fun lt!43015 () Unit!2287)

(assert (=> d!8520 (= lt!43026 lt!43015)))

(assert (=> d!8520 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8520 (= lt!43015 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8520 (= lt!43022 (BitStream!1365 (buf!1099 (_2!1659 lt!42196)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(assert (=> d!8520 (isPrefixOf!0 thiss!1379 (_2!1659 lt!42196))))

(assert (=> d!8520 (= (reader!0 thiss!1379 (_2!1659 lt!42196)) lt!43020)))

(declare-fun lt!43017 () (_ BitVec 64))

(declare-fun b!29851 () Bool)

(declare-fun lt!43032 () (_ BitVec 64))

(assert (=> b!29851 (= e!19936 (= (_1!1658 lt!43020) (withMovedBitIndex!0 (_2!1658 lt!43020) (bvsub lt!43017 lt!43032))))))

(assert (=> b!29851 (or (= (bvand lt!43017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43017 lt!43032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29851 (= lt!43032 (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42196))) (currentByte!2436 (_2!1659 lt!42196)) (currentBit!2431 (_2!1659 lt!42196))))))

(assert (=> b!29851 (= lt!43017 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)))))

(declare-fun b!29852 () Bool)

(declare-fun Unit!2309 () Unit!2287)

(assert (=> b!29852 (= e!19937 Unit!2309)))

(assert (= (and d!8520 c!1956) b!29848))

(assert (= (and d!8520 (not c!1956)) b!29852))

(assert (= (and d!8520 res!25709) b!29849))

(assert (= (and b!29849 res!25710) b!29850))

(assert (= (and b!29850 res!25711) b!29851))

(declare-fun m!43375 () Bool)

(assert (=> b!29851 m!43375))

(assert (=> b!29851 m!42725))

(assert (=> b!29851 m!42705))

(assert (=> d!8520 m!42969))

(declare-fun m!43377 () Bool)

(assert (=> d!8520 m!43377))

(assert (=> d!8520 m!42701))

(assert (=> d!8520 m!42703))

(declare-fun m!43379 () Bool)

(assert (=> d!8520 m!43379))

(assert (=> d!8520 m!42971))

(assert (=> d!8520 m!42755))

(declare-fun m!43381 () Bool)

(assert (=> d!8520 m!43381))

(declare-fun m!43383 () Bool)

(assert (=> d!8520 m!43383))

(declare-fun m!43385 () Bool)

(assert (=> d!8520 m!43385))

(declare-fun m!43387 () Bool)

(assert (=> d!8520 m!43387))

(assert (=> b!29848 m!42705))

(declare-fun m!43389 () Bool)

(assert (=> b!29848 m!43389))

(declare-fun m!43391 () Bool)

(assert (=> b!29848 m!43391))

(declare-fun m!43393 () Bool)

(assert (=> b!29849 m!43393))

(declare-fun m!43395 () Bool)

(assert (=> b!29850 m!43395))

(assert (=> b!29494 d!8520))

(declare-fun d!8522 () Bool)

(assert (=> d!8522 (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43033 () Unit!2287)

(assert (=> d!8522 (= lt!43033 (choose!9 thiss!1379 (buf!1099 (_2!1659 lt!42196)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1365 (buf!1099 (_2!1659 lt!42196)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379))))))

(assert (=> d!8522 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1099 (_2!1659 lt!42196)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43033)))

(declare-fun bs!2403 () Bool)

(assert (= bs!2403 d!8522))

(assert (=> bs!2403 m!42745))

(declare-fun m!43397 () Bool)

(assert (=> bs!2403 m!43397))

(assert (=> b!29494 d!8522))

(declare-fun d!8524 () Bool)

(assert (=> d!8524 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!771 (buf!1099 (_2!1659 lt!42196)))) ((_ sign_extend 32) (currentByte!2436 thiss!1379)) ((_ sign_extend 32) (currentBit!2431 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2404 () Bool)

(assert (= bs!2404 d!8524))

(declare-fun m!43399 () Bool)

(assert (=> bs!2404 m!43399))

(assert (=> b!29494 d!8524))

(declare-fun d!8526 () Bool)

(declare-fun res!25714 () Bool)

(declare-fun e!19939 () Bool)

(assert (=> d!8526 (=> (not res!25714) (not e!19939))))

(assert (=> d!8526 (= res!25714 (= (size!771 (buf!1099 thiss!1379)) (size!771 (buf!1099 (_2!1659 lt!42192)))))))

(assert (=> d!8526 (= (isPrefixOf!0 thiss!1379 (_2!1659 lt!42192)) e!19939)))

(declare-fun b!29853 () Bool)

(declare-fun res!25712 () Bool)

(assert (=> b!29853 (=> (not res!25712) (not e!19939))))

(assert (=> b!29853 (= res!25712 (bvsle (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379)) (bitIndex!0 (size!771 (buf!1099 (_2!1659 lt!42192))) (currentByte!2436 (_2!1659 lt!42192)) (currentBit!2431 (_2!1659 lt!42192)))))))

(declare-fun b!29854 () Bool)

(declare-fun e!19938 () Bool)

(assert (=> b!29854 (= e!19939 e!19938)))

(declare-fun res!25713 () Bool)

(assert (=> b!29854 (=> res!25713 e!19938)))

(assert (=> b!29854 (= res!25713 (= (size!771 (buf!1099 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29855 () Bool)

(assert (=> b!29855 (= e!19938 (arrayBitRangesEq!0 (buf!1099 thiss!1379) (buf!1099 (_2!1659 lt!42192)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!771 (buf!1099 thiss!1379)) (currentByte!2436 thiss!1379) (currentBit!2431 thiss!1379))))))

(assert (= (and d!8526 res!25714) b!29853))

(assert (= (and b!29853 res!25712) b!29854))

(assert (= (and b!29854 (not res!25713)) b!29855))

(assert (=> b!29853 m!42705))

(assert (=> b!29853 m!42727))

(assert (=> b!29855 m!42705))

(assert (=> b!29855 m!42705))

(declare-fun m!43401 () Bool)

(assert (=> b!29855 m!43401))

(assert (=> b!29494 d!8526))

(declare-fun d!8528 () Bool)

(assert (=> d!8528 (= (tail!100 lt!42198) (t!1133 lt!42198))))

(assert (=> b!29503 d!8528))

(declare-fun d!8530 () Bool)

(declare-fun e!19942 () Bool)

(assert (=> d!8530 e!19942))

(declare-fun res!25717 () Bool)

(assert (=> d!8530 (=> (not res!25717) (not e!19942))))

(declare-fun lt!43039 () (_ BitVec 64))

(assert (=> d!8530 (= res!25717 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!43039) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8530 (= lt!43039 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43038 () Unit!2287)

(declare-fun choose!42 (BitStream!1364 BitStream!1364 BitStream!1364 BitStream!1364 (_ BitVec 64) List!383) Unit!2287)

(assert (=> d!8530 (= lt!43038 (choose!42 (_2!1659 lt!42192) (_2!1659 lt!42192) (_1!1658 lt!42191) (_1!1658 lt!42199) (bvsub to!314 i!635) lt!42198))))

(assert (=> d!8530 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8530 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1659 lt!42192) (_2!1659 lt!42192) (_1!1658 lt!42191) (_1!1658 lt!42199) (bvsub to!314 i!635) lt!42198) lt!43038)))

(declare-fun b!29858 () Bool)

(assert (=> b!29858 (= e!19942 (= (bitStreamReadBitsIntoList!0 (_2!1659 lt!42192) (_1!1658 lt!42199) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!100 lt!42198)))))

(assert (= (and d!8530 res!25717) b!29858))

(declare-fun m!43403 () Bool)

(assert (=> d!8530 m!43403))

(declare-fun m!43405 () Bool)

(assert (=> b!29858 m!43405))

(assert (=> b!29858 m!42697))

(assert (=> b!29503 d!8530))

(declare-fun d!8532 () Bool)

(assert (=> d!8532 (= (invariant!0 (currentBit!2431 (_2!1659 lt!42196)) (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42196)))) (and (bvsge (currentBit!2431 (_2!1659 lt!42196)) #b00000000000000000000000000000000) (bvslt (currentBit!2431 (_2!1659 lt!42196)) #b00000000000000000000000000001000) (bvsge (currentByte!2436 (_2!1659 lt!42196)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42196)))) (and (= (currentBit!2431 (_2!1659 lt!42196)) #b00000000000000000000000000000000) (= (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42196))))))))))

(assert (=> b!29492 d!8532))

(declare-fun d!8534 () Bool)

(declare-fun size!774 (List!383) Int)

(assert (=> d!8534 (= (length!109 lt!42198) (size!774 lt!42198))))

(declare-fun bs!2405 () Bool)

(assert (= bs!2405 d!8534))

(declare-fun m!43407 () Bool)

(assert (=> bs!2405 m!43407))

(assert (=> b!29502 d!8534))

(declare-fun d!8536 () Bool)

(assert (=> d!8536 (= (invariant!0 (currentBit!2431 (_2!1659 lt!42196)) (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42192)))) (and (bvsge (currentBit!2431 (_2!1659 lt!42196)) #b00000000000000000000000000000000) (bvslt (currentBit!2431 (_2!1659 lt!42196)) #b00000000000000000000000000001000) (bvsge (currentByte!2436 (_2!1659 lt!42196)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42192)))) (and (= (currentBit!2431 (_2!1659 lt!42196)) #b00000000000000000000000000000000) (= (currentByte!2436 (_2!1659 lt!42196)) (size!771 (buf!1099 (_2!1659 lt!42192))))))))))

(assert (=> b!29493 d!8536))

(push 1)

(assert (not b!29858))

(assert (not b!29738))

(assert (not b!29657))

(assert (not d!8436))

(assert (not d!8438))

(assert (not bm!376))

(assert (not b!29668))

(assert (not b!29730))

(assert (not b!29628))

(assert (not d!8466))

(assert (not b!29849))

(assert (not b!29660))

(assert (not d!8452))

(assert (not b!29845))

(assert (not b!29843))

(assert (not b!29850))

(assert (not b!29732))

(assert (not b!29662))

(assert (not d!8530))

(assert (not b!29848))

(assert (not b!29624))

(assert (not d!8520))

(assert (not b!29658))

(assert (not b!29735))

(assert (not b!29655))

(assert (not b!29675))

(assert (not d!8418))

(assert (not b!29607))

(assert (not b!29855))

(assert (not b!29853))

(assert (not b!29627))

(assert (not d!8448))

(assert (not d!8392))

(assert (not b!29844))

(assert (not b!29663))

(assert (not d!8442))

(assert (not b!29666))

(assert (not b!29661))

(assert (not d!8522))

(assert (not d!8450))

(assert (not b!29840))

(assert (not d!8524))

(assert (not b!29731))

(assert (not d!8534))

(assert (not d!8444))

(assert (not b!29851))

(assert (not b!29839))

(assert (not b!29847))

(assert (not b!29841))

(assert (not b!29728))

(assert (not d!8426))

(assert (not d!8472))

(assert (not b!29656))

(assert (not b!29625))

(assert (not d!8470))

(assert (not b!29680))

(assert (not b!29838))

(assert (not d!8424))

(assert (not b!29736))

(assert (not d!8476))

(assert (not b!29677))

(assert (not d!8474))

(assert (not b!29729))

(assert (not b!29629))

(assert (not b!29623))

(assert (not b!29733))

(assert (not d!8516))

(assert (not b!29734))

(assert (not b!29667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

