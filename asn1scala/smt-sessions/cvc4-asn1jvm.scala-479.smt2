; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14098 () Bool)

(assert start!14098)

(declare-fun b!73166 () Bool)

(declare-fun e!47773 () Bool)

(declare-fun e!47781 () Bool)

(assert (=> b!73166 (= e!47773 e!47781)))

(declare-fun res!60467 () Bool)

(assert (=> b!73166 (=> res!60467 e!47781)))

(declare-datatypes ((List!758 0))(
  ( (Nil!755) (Cons!754 (h!873 Bool) (t!1508 List!758)) )
))
(declare-fun lt!117764 () List!758)

(declare-fun lt!117778 () List!758)

(assert (=> b!73166 (= res!60467 (not (= lt!117764 lt!117778)))))

(assert (=> b!73166 (= lt!117778 lt!117764)))

(declare-fun lt!117770 () List!758)

(declare-fun tail!362 (List!758) List!758)

(assert (=> b!73166 (= lt!117764 (tail!362 lt!117770))))

(declare-datatypes ((Unit!4839 0))(
  ( (Unit!4840) )
))
(declare-fun lt!117775 () Unit!4839)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!2981 0))(
  ( (array!2982 (arr!1984 (Array (_ BitVec 32) (_ BitVec 8))) (size!1393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2366 0))(
  ( (BitStream!2367 (buf!1774 array!2981) (currentByte!3500 (_ BitVec 32)) (currentBit!3495 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6330 0))(
  ( (tuple2!6331 (_1!3279 BitStream!2366) (_2!3279 BitStream!2366)) )
))
(declare-fun lt!117774 () tuple2!6330)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!117759 () tuple2!6330)

(declare-datatypes ((tuple2!6332 0))(
  ( (tuple2!6333 (_1!3280 Unit!4839) (_2!3280 BitStream!2366)) )
))
(declare-fun lt!117766 () tuple2!6332)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2366 BitStream!2366 BitStream!2366 BitStream!2366 (_ BitVec 64) List!758) Unit!4839)

(assert (=> b!73166 (= lt!117775 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3280 lt!117766) (_2!3280 lt!117766) (_1!3279 lt!117759) (_1!3279 lt!117774) (bvsub to!314 i!635) lt!117770))))

(declare-fun res!60473 () Bool)

(declare-fun e!47780 () Bool)

(assert (=> start!14098 (=> (not res!60473) (not e!47780))))

(declare-fun srcBuffer!2 () array!2981)

(assert (=> start!14098 (= res!60473 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1393 srcBuffer!2))))))))

(assert (=> start!14098 e!47780))

(assert (=> start!14098 true))

(declare-fun array_inv!1242 (array!2981) Bool)

(assert (=> start!14098 (array_inv!1242 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2366)

(declare-fun e!47782 () Bool)

(declare-fun inv!12 (BitStream!2366) Bool)

(assert (=> start!14098 (and (inv!12 thiss!1379) e!47782)))

(declare-fun b!73167 () Bool)

(declare-fun e!47775 () Bool)

(declare-fun e!47786 () Bool)

(assert (=> b!73167 (= e!47775 e!47786)))

(declare-fun res!60468 () Bool)

(assert (=> b!73167 (=> res!60468 e!47786)))

(declare-fun lt!117768 () tuple2!6332)

(declare-fun isPrefixOf!0 (BitStream!2366 BitStream!2366) Bool)

(assert (=> b!73167 (= res!60468 (not (isPrefixOf!0 (_2!3280 lt!117768) (_2!3280 lt!117766))))))

(assert (=> b!73167 (isPrefixOf!0 thiss!1379 (_2!3280 lt!117766))))

(declare-fun lt!117758 () Unit!4839)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2366 BitStream!2366 BitStream!2366) Unit!4839)

(assert (=> b!73167 (= lt!117758 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3280 lt!117768) (_2!3280 lt!117766)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2366 array!2981 (_ BitVec 64) (_ BitVec 64)) tuple2!6332)

(assert (=> b!73167 (= lt!117766 (appendBitsMSBFirstLoop!0 (_2!3280 lt!117768) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!47772 () Bool)

(assert (=> b!73167 e!47772))

(declare-fun res!60482 () Bool)

(assert (=> b!73167 (=> (not res!60482) (not e!47772))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73167 (= res!60482 (validate_offset_bits!1 ((_ sign_extend 32) (size!1393 (buf!1774 (_2!3280 lt!117768)))) ((_ sign_extend 32) (currentByte!3500 thiss!1379)) ((_ sign_extend 32) (currentBit!3495 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117781 () Unit!4839)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2366 array!2981 (_ BitVec 64)) Unit!4839)

(assert (=> b!73167 (= lt!117781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1774 (_2!3280 lt!117768)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117760 () tuple2!6330)

(declare-fun reader!0 (BitStream!2366 BitStream!2366) tuple2!6330)

(assert (=> b!73167 (= lt!117760 (reader!0 thiss!1379 (_2!3280 lt!117768)))))

(declare-fun b!73168 () Bool)

(declare-fun e!47785 () Bool)

(assert (=> b!73168 (= e!47785 true)))

(declare-datatypes ((tuple2!6334 0))(
  ( (tuple2!6335 (_1!3281 BitStream!2366) (_2!3281 Bool)) )
))
(declare-fun lt!117780 () tuple2!6334)

(declare-fun readBitPure!0 (BitStream!2366) tuple2!6334)

(assert (=> b!73168 (= lt!117780 (readBitPure!0 (_1!3279 lt!117759)))))

(declare-fun b!73169 () Bool)

(declare-fun res!60479 () Bool)

(declare-fun e!47776 () Bool)

(assert (=> b!73169 (=> res!60479 e!47776)))

(declare-fun lt!117761 () Bool)

(declare-fun head!577 (List!758) Bool)

(assert (=> b!73169 (= res!60479 (not (= (head!577 lt!117770) lt!117761)))))

(declare-fun b!73170 () Bool)

(assert (=> b!73170 (= e!47781 e!47776)))

(declare-fun res!60469 () Bool)

(assert (=> b!73170 (=> res!60469 e!47776)))

(declare-fun lt!117777 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2981 (_ BitVec 64)) Bool)

(assert (=> b!73170 (= res!60469 (not (= lt!117761 (bitAt!0 (buf!1774 (_1!3279 lt!117774)) lt!117777))))))

(assert (=> b!73170 (= lt!117761 (bitAt!0 (buf!1774 (_1!3279 lt!117759)) lt!117777))))

(declare-fun b!73171 () Bool)

(declare-fun e!47778 () Bool)

(assert (=> b!73171 (= e!47780 (not e!47778))))

(declare-fun res!60472 () Bool)

(assert (=> b!73171 (=> res!60472 e!47778)))

(assert (=> b!73171 (= res!60472 (bvsge i!635 to!314))))

(assert (=> b!73171 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!117765 () Unit!4839)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2366) Unit!4839)

(assert (=> b!73171 (= lt!117765 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!73171 (= lt!117777 (bitIndex!0 (size!1393 (buf!1774 thiss!1379)) (currentByte!3500 thiss!1379) (currentBit!3495 thiss!1379)))))

(declare-fun b!73172 () Bool)

(assert (=> b!73172 (= e!47778 e!47775)))

(declare-fun res!60470 () Bool)

(assert (=> b!73172 (=> res!60470 e!47775)))

(assert (=> b!73172 (= res!60470 (not (isPrefixOf!0 thiss!1379 (_2!3280 lt!117768))))))

(declare-fun lt!117773 () (_ BitVec 64))

(assert (=> b!73172 (validate_offset_bits!1 ((_ sign_extend 32) (size!1393 (buf!1774 (_2!3280 lt!117768)))) ((_ sign_extend 32) (currentByte!3500 (_2!3280 lt!117768))) ((_ sign_extend 32) (currentBit!3495 (_2!3280 lt!117768))) lt!117773)))

(assert (=> b!73172 (= lt!117773 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117767 () Unit!4839)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2366 BitStream!2366 (_ BitVec 64) (_ BitVec 64)) Unit!4839)

(assert (=> b!73172 (= lt!117767 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3280 lt!117768) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2366 (_ BitVec 8) (_ BitVec 32)) tuple2!6332)

(assert (=> b!73172 (= lt!117768 (appendBitFromByte!0 thiss!1379 (select (arr!1984 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!73173 () Bool)

(declare-fun e!47783 () Bool)

(assert (=> b!73173 (= e!47783 e!47785)))

(declare-fun res!60485 () Bool)

(assert (=> b!73173 (=> res!60485 e!47785)))

(declare-fun lt!117762 () Bool)

(declare-fun lt!117772 () Bool)

(assert (=> b!73173 (= res!60485 (not (= lt!117762 lt!117772)))))

(declare-fun lt!117763 () Bool)

(assert (=> b!73173 (= lt!117763 lt!117762)))

(assert (=> b!73173 (= lt!117762 (bitAt!0 (buf!1774 (_2!3280 lt!117766)) lt!117777))))

(declare-fun lt!117779 () Unit!4839)

(declare-fun lt!117771 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2981 array!2981 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4839)

(assert (=> b!73173 (= lt!117779 (arrayBitRangesEqImpliesEq!0 (buf!1774 (_2!3280 lt!117768)) (buf!1774 (_2!3280 lt!117766)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!117777 lt!117771))))

(declare-fun b!73174 () Bool)

(declare-fun e!47779 () Bool)

(assert (=> b!73174 (= e!47779 e!47783)))

(declare-fun res!60474 () Bool)

(assert (=> b!73174 (=> res!60474 e!47783)))

(assert (=> b!73174 (= res!60474 (not (= lt!117763 lt!117772)))))

(assert (=> b!73174 (= lt!117763 (bitAt!0 (buf!1774 (_2!3280 lt!117768)) lt!117777))))

(declare-fun b!73175 () Bool)

(declare-fun e!47774 () Bool)

(assert (=> b!73175 (= e!47786 e!47774)))

(declare-fun res!60478 () Bool)

(assert (=> b!73175 (=> res!60478 e!47774)))

(declare-fun lt!117769 () (_ BitVec 64))

(assert (=> b!73175 (= res!60478 (not (= lt!117769 (bvsub (bvadd lt!117777 to!314) i!635))))))

(assert (=> b!73175 (= lt!117769 (bitIndex!0 (size!1393 (buf!1774 (_2!3280 lt!117766))) (currentByte!3500 (_2!3280 lt!117766)) (currentBit!3495 (_2!3280 lt!117766))))))

(declare-fun b!73176 () Bool)

(declare-fun res!60480 () Bool)

(declare-fun e!47771 () Bool)

(assert (=> b!73176 (=> res!60480 e!47771)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!73176 (= res!60480 (not (invariant!0 (currentBit!3495 (_2!3280 lt!117768)) (currentByte!3500 (_2!3280 lt!117768)) (size!1393 (buf!1774 (_2!3280 lt!117766))))))))

(declare-fun b!73177 () Bool)

(assert (=> b!73177 (= e!47771 e!47773)))

(declare-fun res!60486 () Bool)

(assert (=> b!73177 (=> res!60486 e!47773)))

(assert (=> b!73177 (= res!60486 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2366 BitStream!2366 (_ BitVec 64)) List!758)

(assert (=> b!73177 (= lt!117778 (bitStreamReadBitsIntoList!0 (_2!3280 lt!117766) (_1!3279 lt!117774) lt!117773))))

(assert (=> b!73177 (= lt!117770 (bitStreamReadBitsIntoList!0 (_2!3280 lt!117766) (_1!3279 lt!117759) (bvsub to!314 i!635)))))

(assert (=> b!73177 (validate_offset_bits!1 ((_ sign_extend 32) (size!1393 (buf!1774 (_2!3280 lt!117766)))) ((_ sign_extend 32) (currentByte!3500 (_2!3280 lt!117768))) ((_ sign_extend 32) (currentBit!3495 (_2!3280 lt!117768))) lt!117773)))

(declare-fun lt!117776 () Unit!4839)

(assert (=> b!73177 (= lt!117776 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3280 lt!117768) (buf!1774 (_2!3280 lt!117766)) lt!117773))))

(assert (=> b!73177 (= lt!117774 (reader!0 (_2!3280 lt!117768) (_2!3280 lt!117766)))))

(assert (=> b!73177 (validate_offset_bits!1 ((_ sign_extend 32) (size!1393 (buf!1774 (_2!3280 lt!117766)))) ((_ sign_extend 32) (currentByte!3500 thiss!1379)) ((_ sign_extend 32) (currentBit!3495 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!117757 () Unit!4839)

(assert (=> b!73177 (= lt!117757 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1774 (_2!3280 lt!117766)) (bvsub to!314 i!635)))))

(assert (=> b!73177 (= lt!117759 (reader!0 thiss!1379 (_2!3280 lt!117766)))))

(declare-fun b!73178 () Bool)

(declare-fun res!60475 () Bool)

(assert (=> b!73178 (=> res!60475 e!47774)))

(assert (=> b!73178 (= res!60475 (not (= (size!1393 (buf!1774 thiss!1379)) (size!1393 (buf!1774 (_2!3280 lt!117766))))))))

(declare-fun b!73179 () Bool)

(declare-fun res!60484 () Bool)

(assert (=> b!73179 (=> res!60484 e!47774)))

(assert (=> b!73179 (= res!60484 (not (invariant!0 (currentBit!3495 (_2!3280 lt!117766)) (currentByte!3500 (_2!3280 lt!117766)) (size!1393 (buf!1774 (_2!3280 lt!117766))))))))

(declare-fun b!73180 () Bool)

(declare-fun res!60483 () Bool)

(assert (=> b!73180 (=> res!60483 e!47773)))

(declare-fun length!386 (List!758) Int)

(assert (=> b!73180 (= res!60483 (<= (length!386 lt!117770) 0))))

(declare-fun b!73181 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2366 array!2981 (_ BitVec 64) (_ BitVec 64)) List!758)

(assert (=> b!73181 (= e!47772 (= (head!577 (byteArrayBitContentToList!0 (_2!3280 lt!117768) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!577 (bitStreamReadBitsIntoList!0 (_2!3280 lt!117768) (_1!3279 lt!117760) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!73182 () Bool)

(assert (=> b!73182 (= e!47776 e!47779)))

(declare-fun res!60477 () Bool)

(assert (=> b!73182 (=> res!60477 e!47779)))

(assert (=> b!73182 (= res!60477 (not (= (head!577 (byteArrayBitContentToList!0 (_2!3280 lt!117766) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!117772)))))

(assert (=> b!73182 (= lt!117772 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!73183 () Bool)

(declare-fun res!60481 () Bool)

(assert (=> b!73183 (=> (not res!60481) (not e!47780))))

(assert (=> b!73183 (= res!60481 (validate_offset_bits!1 ((_ sign_extend 32) (size!1393 (buf!1774 thiss!1379))) ((_ sign_extend 32) (currentByte!3500 thiss!1379)) ((_ sign_extend 32) (currentBit!3495 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!73184 () Bool)

(assert (=> b!73184 (= e!47782 (array_inv!1242 (buf!1774 thiss!1379)))))

(declare-fun b!73185 () Bool)

(assert (=> b!73185 (= e!47774 e!47771)))

(declare-fun res!60476 () Bool)

(assert (=> b!73185 (=> res!60476 e!47771)))

(assert (=> b!73185 (= res!60476 (not (= (size!1393 (buf!1774 (_2!3280 lt!117768))) (size!1393 (buf!1774 (_2!3280 lt!117766))))))))

(assert (=> b!73185 (= lt!117769 (bvsub (bvsub (bvadd lt!117771 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73185 (= lt!117771 (bitIndex!0 (size!1393 (buf!1774 (_2!3280 lt!117768))) (currentByte!3500 (_2!3280 lt!117768)) (currentBit!3495 (_2!3280 lt!117768))))))

(assert (=> b!73185 (= (size!1393 (buf!1774 (_2!3280 lt!117766))) (size!1393 (buf!1774 thiss!1379)))))

(declare-fun b!73186 () Bool)

(declare-fun res!60471 () Bool)

(assert (=> b!73186 (=> res!60471 e!47771)))

(assert (=> b!73186 (= res!60471 (not (invariant!0 (currentBit!3495 (_2!3280 lt!117768)) (currentByte!3500 (_2!3280 lt!117768)) (size!1393 (buf!1774 (_2!3280 lt!117768))))))))

(assert (= (and start!14098 res!60473) b!73183))

(assert (= (and b!73183 res!60481) b!73171))

(assert (= (and b!73171 (not res!60472)) b!73172))

(assert (= (and b!73172 (not res!60470)) b!73167))

(assert (= (and b!73167 res!60482) b!73181))

(assert (= (and b!73167 (not res!60468)) b!73175))

(assert (= (and b!73175 (not res!60478)) b!73179))

(assert (= (and b!73179 (not res!60484)) b!73178))

(assert (= (and b!73178 (not res!60475)) b!73185))

(assert (= (and b!73185 (not res!60476)) b!73186))

(assert (= (and b!73186 (not res!60471)) b!73176))

(assert (= (and b!73176 (not res!60480)) b!73177))

(assert (= (and b!73177 (not res!60486)) b!73180))

(assert (= (and b!73180 (not res!60483)) b!73166))

(assert (= (and b!73166 (not res!60467)) b!73170))

(assert (= (and b!73170 (not res!60469)) b!73169))

(assert (= (and b!73169 (not res!60479)) b!73182))

(assert (= (and b!73182 (not res!60477)) b!73174))

(assert (= (and b!73174 (not res!60474)) b!73173))

(assert (= (and b!73173 (not res!60485)) b!73168))

(assert (= start!14098 b!73184))

(declare-fun m!117341 () Bool)

(assert (=> b!73172 m!117341))

(declare-fun m!117343 () Bool)

(assert (=> b!73172 m!117343))

(declare-fun m!117345 () Bool)

(assert (=> b!73172 m!117345))

(assert (=> b!73172 m!117343))

(declare-fun m!117347 () Bool)

(assert (=> b!73172 m!117347))

(declare-fun m!117349 () Bool)

(assert (=> b!73172 m!117349))

(declare-fun m!117351 () Bool)

(assert (=> b!73175 m!117351))

(declare-fun m!117353 () Bool)

(assert (=> b!73177 m!117353))

(declare-fun m!117355 () Bool)

(assert (=> b!73177 m!117355))

(declare-fun m!117357 () Bool)

(assert (=> b!73177 m!117357))

(declare-fun m!117359 () Bool)

(assert (=> b!73177 m!117359))

(declare-fun m!117361 () Bool)

(assert (=> b!73177 m!117361))

(declare-fun m!117363 () Bool)

(assert (=> b!73177 m!117363))

(declare-fun m!117365 () Bool)

(assert (=> b!73177 m!117365))

(declare-fun m!117367 () Bool)

(assert (=> b!73177 m!117367))

(declare-fun m!117369 () Bool)

(assert (=> b!73171 m!117369))

(declare-fun m!117371 () Bool)

(assert (=> b!73171 m!117371))

(declare-fun m!117373 () Bool)

(assert (=> b!73171 m!117373))

(declare-fun m!117375 () Bool)

(assert (=> b!73179 m!117375))

(declare-fun m!117377 () Bool)

(assert (=> start!14098 m!117377))

(declare-fun m!117379 () Bool)

(assert (=> start!14098 m!117379))

(declare-fun m!117381 () Bool)

(assert (=> b!73186 m!117381))

(declare-fun m!117383 () Bool)

(assert (=> b!73167 m!117383))

(declare-fun m!117385 () Bool)

(assert (=> b!73167 m!117385))

(declare-fun m!117387 () Bool)

(assert (=> b!73167 m!117387))

(declare-fun m!117389 () Bool)

(assert (=> b!73167 m!117389))

(declare-fun m!117391 () Bool)

(assert (=> b!73167 m!117391))

(declare-fun m!117393 () Bool)

(assert (=> b!73167 m!117393))

(declare-fun m!117395 () Bool)

(assert (=> b!73167 m!117395))

(declare-fun m!117397 () Bool)

(assert (=> b!73170 m!117397))

(declare-fun m!117399 () Bool)

(assert (=> b!73170 m!117399))

(declare-fun m!117401 () Bool)

(assert (=> b!73182 m!117401))

(assert (=> b!73182 m!117401))

(declare-fun m!117403 () Bool)

(assert (=> b!73182 m!117403))

(declare-fun m!117405 () Bool)

(assert (=> b!73182 m!117405))

(declare-fun m!117407 () Bool)

(assert (=> b!73176 m!117407))

(declare-fun m!117409 () Bool)

(assert (=> b!73166 m!117409))

(declare-fun m!117411 () Bool)

(assert (=> b!73166 m!117411))

(declare-fun m!117413 () Bool)

(assert (=> b!73183 m!117413))

(declare-fun m!117415 () Bool)

(assert (=> b!73180 m!117415))

(declare-fun m!117417 () Bool)

(assert (=> b!73173 m!117417))

(declare-fun m!117419 () Bool)

(assert (=> b!73173 m!117419))

(declare-fun m!117421 () Bool)

(assert (=> b!73181 m!117421))

(assert (=> b!73181 m!117421))

(declare-fun m!117423 () Bool)

(assert (=> b!73181 m!117423))

(declare-fun m!117425 () Bool)

(assert (=> b!73181 m!117425))

(assert (=> b!73181 m!117425))

(declare-fun m!117427 () Bool)

(assert (=> b!73181 m!117427))

(declare-fun m!117429 () Bool)

(assert (=> b!73174 m!117429))

(declare-fun m!117431 () Bool)

(assert (=> b!73185 m!117431))

(declare-fun m!117433 () Bool)

(assert (=> b!73169 m!117433))

(declare-fun m!117435 () Bool)

(assert (=> b!73168 m!117435))

(declare-fun m!117437 () Bool)

(assert (=> b!73184 m!117437))

(push 1)

(assert (not b!73183))

(assert (not b!73167))

(assert (not b!73184))

(assert (not b!73173))

(assert (not b!73172))

(assert (not b!73175))

(assert (not b!73180))

(assert (not b!73170))

(assert (not b!73182))

(assert (not b!73185))

(assert (not b!73179))

(assert (not b!73181))

(assert (not b!73177))

(assert (not b!73168))

(assert (not b!73169))

(assert (not b!73186))

(assert (not b!73176))

(assert (not start!14098))

(assert (not b!73171))

(assert (not b!73166))

(assert (not b!73174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

