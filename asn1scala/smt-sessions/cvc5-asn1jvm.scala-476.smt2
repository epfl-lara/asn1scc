; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14076 () Bool)

(assert start!14076)

(declare-fun b!72457 () Bool)

(declare-fun res!59810 () Bool)

(declare-fun e!47234 () Bool)

(assert (=> b!72457 (=> res!59810 e!47234)))

(declare-datatypes ((array!2959 0))(
  ( (array!2960 (arr!1973 (Array (_ BitVec 32) (_ BitVec 8))) (size!1382 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2344 0))(
  ( (BitStream!2345 (buf!1763 array!2959) (currentByte!3489 (_ BitVec 32)) (currentBit!3484 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4817 0))(
  ( (Unit!4818) )
))
(declare-datatypes ((tuple2!6264 0))(
  ( (tuple2!6265 (_1!3246 Unit!4817) (_2!3246 BitStream!2344)) )
))
(declare-fun lt!116923 () tuple2!6264)

(declare-fun lt!116933 () tuple2!6264)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72457 (= res!59810 (not (invariant!0 (currentBit!3484 (_2!3246 lt!116923)) (currentByte!3489 (_2!3246 lt!116923)) (size!1382 (buf!1763 (_2!3246 lt!116933))))))))

(declare-fun b!72458 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!116934 () Bool)

(declare-fun lt!116919 () Bool)

(declare-fun e!47237 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!72458 (= e!47237 (or (not (= lt!116919 lt!116934)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!72459 () Bool)

(declare-fun res!59794 () Bool)

(declare-fun e!47241 () Bool)

(assert (=> b!72459 (=> res!59794 e!47241)))

(assert (=> b!72459 (= res!59794 (not (invariant!0 (currentBit!3484 (_2!3246 lt!116933)) (currentByte!3489 (_2!3246 lt!116933)) (size!1382 (buf!1763 (_2!3246 lt!116933))))))))

(declare-fun b!72460 () Bool)

(declare-fun e!47230 () Bool)

(declare-fun e!47227 () Bool)

(assert (=> b!72460 (= e!47230 e!47227)))

(declare-fun res!59805 () Bool)

(assert (=> b!72460 (=> res!59805 e!47227)))

(declare-fun lt!116940 () Bool)

(declare-fun lt!116926 () Bool)

(assert (=> b!72460 (= res!59805 (not (= lt!116940 lt!116926)))))

(declare-fun lt!116929 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2959 (_ BitVec 64)) Bool)

(assert (=> b!72460 (= lt!116940 (bitAt!0 (buf!1763 (_2!3246 lt!116923)) lt!116929))))

(declare-fun b!72461 () Bool)

(declare-fun res!59798 () Bool)

(assert (=> b!72461 (=> res!59798 e!47241)))

(declare-fun thiss!1379 () BitStream!2344)

(assert (=> b!72461 (= res!59798 (not (= (size!1382 (buf!1763 thiss!1379)) (size!1382 (buf!1763 (_2!3246 lt!116933))))))))

(declare-fun b!72462 () Bool)

(declare-fun e!47239 () Bool)

(declare-fun e!47229 () Bool)

(assert (=> b!72462 (= e!47239 e!47229)))

(declare-fun res!59793 () Bool)

(assert (=> b!72462 (=> res!59793 e!47229)))

(declare-fun isPrefixOf!0 (BitStream!2344 BitStream!2344) Bool)

(assert (=> b!72462 (= res!59793 (not (isPrefixOf!0 (_2!3246 lt!116923) (_2!3246 lt!116933))))))

(assert (=> b!72462 (isPrefixOf!0 thiss!1379 (_2!3246 lt!116933))))

(declare-fun lt!116941 () Unit!4817)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2344 BitStream!2344 BitStream!2344) Unit!4817)

(assert (=> b!72462 (= lt!116941 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3246 lt!116923) (_2!3246 lt!116933)))))

(declare-fun srcBuffer!2 () array!2959)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2344 array!2959 (_ BitVec 64) (_ BitVec 64)) tuple2!6264)

(assert (=> b!72462 (= lt!116933 (appendBitsMSBFirstLoop!0 (_2!3246 lt!116923) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!47238 () Bool)

(assert (=> b!72462 e!47238))

(declare-fun res!59801 () Bool)

(assert (=> b!72462 (=> (not res!59801) (not e!47238))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72462 (= res!59801 (validate_offset_bits!1 ((_ sign_extend 32) (size!1382 (buf!1763 (_2!3246 lt!116923)))) ((_ sign_extend 32) (currentByte!3489 thiss!1379)) ((_ sign_extend 32) (currentBit!3484 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116930 () Unit!4817)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2344 array!2959 (_ BitVec 64)) Unit!4817)

(assert (=> b!72462 (= lt!116930 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1763 (_2!3246 lt!116923)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!6266 0))(
  ( (tuple2!6267 (_1!3247 BitStream!2344) (_2!3247 BitStream!2344)) )
))
(declare-fun lt!116921 () tuple2!6266)

(declare-fun reader!0 (BitStream!2344 BitStream!2344) tuple2!6266)

(assert (=> b!72462 (= lt!116921 (reader!0 thiss!1379 (_2!3246 lt!116923)))))

(declare-fun b!72463 () Bool)

(assert (=> b!72463 (= e!47227 e!47237)))

(declare-fun res!59800 () Bool)

(assert (=> b!72463 (=> res!59800 e!47237)))

(declare-fun lt!116931 () Bool)

(assert (=> b!72463 (= res!59800 (not (= lt!116931 lt!116926)))))

(assert (=> b!72463 (= lt!116940 lt!116931)))

(assert (=> b!72463 (= lt!116931 (bitAt!0 (buf!1763 (_2!3246 lt!116933)) lt!116929))))

(declare-fun lt!116939 () Unit!4817)

(declare-fun lt!116936 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2959 array!2959 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4817)

(assert (=> b!72463 (= lt!116939 (arrayBitRangesEqImpliesEq!0 (buf!1763 (_2!3246 lt!116923)) (buf!1763 (_2!3246 lt!116933)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!116929 lt!116936))))

(declare-fun b!72464 () Bool)

(declare-fun res!59791 () Bool)

(assert (=> b!72464 (=> res!59791 e!47237)))

(declare-fun lt!116925 () tuple2!6266)

(declare-datatypes ((tuple2!6268 0))(
  ( (tuple2!6269 (_1!3248 BitStream!2344) (_2!3248 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2344) tuple2!6268)

(assert (=> b!72464 (= res!59791 (not (= (_2!3248 (readBitPure!0 (_1!3247 lt!116925))) lt!116926)))))

(declare-fun b!72465 () Bool)

(declare-fun e!47243 () Bool)

(declare-fun e!47235 () Bool)

(assert (=> b!72465 (= e!47243 (not e!47235))))

(declare-fun res!59795 () Bool)

(assert (=> b!72465 (=> res!59795 e!47235)))

(assert (=> b!72465 (= res!59795 (bvsge i!635 to!314))))

(assert (=> b!72465 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!116932 () Unit!4817)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2344) Unit!4817)

(assert (=> b!72465 (= lt!116932 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72465 (= lt!116929 (bitIndex!0 (size!1382 (buf!1763 thiss!1379)) (currentByte!3489 thiss!1379) (currentBit!3484 thiss!1379)))))

(declare-fun b!72466 () Bool)

(declare-fun e!47232 () Bool)

(assert (=> b!72466 (= e!47234 e!47232)))

(declare-fun res!59804 () Bool)

(assert (=> b!72466 (=> res!59804 e!47232)))

(assert (=> b!72466 (= res!59804 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!747 0))(
  ( (Nil!744) (Cons!743 (h!862 Bool) (t!1497 List!747)) )
))
(declare-fun lt!116920 () List!747)

(declare-fun lt!116916 () (_ BitVec 64))

(declare-fun lt!116922 () tuple2!6266)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2344 BitStream!2344 (_ BitVec 64)) List!747)

(assert (=> b!72466 (= lt!116920 (bitStreamReadBitsIntoList!0 (_2!3246 lt!116933) (_1!3247 lt!116922) lt!116916))))

(declare-fun lt!116918 () List!747)

(assert (=> b!72466 (= lt!116918 (bitStreamReadBitsIntoList!0 (_2!3246 lt!116933) (_1!3247 lt!116925) (bvsub to!314 i!635)))))

(assert (=> b!72466 (validate_offset_bits!1 ((_ sign_extend 32) (size!1382 (buf!1763 (_2!3246 lt!116933)))) ((_ sign_extend 32) (currentByte!3489 (_2!3246 lt!116923))) ((_ sign_extend 32) (currentBit!3484 (_2!3246 lt!116923))) lt!116916)))

(declare-fun lt!116927 () Unit!4817)

(assert (=> b!72466 (= lt!116927 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3246 lt!116923) (buf!1763 (_2!3246 lt!116933)) lt!116916))))

(assert (=> b!72466 (= lt!116922 (reader!0 (_2!3246 lt!116923) (_2!3246 lt!116933)))))

(assert (=> b!72466 (validate_offset_bits!1 ((_ sign_extend 32) (size!1382 (buf!1763 (_2!3246 lt!116933)))) ((_ sign_extend 32) (currentByte!3489 thiss!1379)) ((_ sign_extend 32) (currentBit!3484 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!116928 () Unit!4817)

(assert (=> b!72466 (= lt!116928 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1763 (_2!3246 lt!116933)) (bvsub to!314 i!635)))))

(assert (=> b!72466 (= lt!116925 (reader!0 thiss!1379 (_2!3246 lt!116933)))))

(declare-fun res!59799 () Bool)

(assert (=> start!14076 (=> (not res!59799) (not e!47243))))

(assert (=> start!14076 (= res!59799 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1382 srcBuffer!2))))))))

(assert (=> start!14076 e!47243))

(assert (=> start!14076 true))

(declare-fun array_inv!1231 (array!2959) Bool)

(assert (=> start!14076 (array_inv!1231 srcBuffer!2)))

(declare-fun e!47240 () Bool)

(declare-fun inv!12 (BitStream!2344) Bool)

(assert (=> start!14076 (and (inv!12 thiss!1379) e!47240)))

(declare-fun b!72467 () Bool)

(assert (=> b!72467 (= e!47240 (array_inv!1231 (buf!1763 thiss!1379)))))

(declare-fun b!72468 () Bool)

(assert (=> b!72468 (= e!47229 e!47241)))

(declare-fun res!59803 () Bool)

(assert (=> b!72468 (=> res!59803 e!47241)))

(declare-fun lt!116937 () (_ BitVec 64))

(assert (=> b!72468 (= res!59803 (not (= lt!116937 (bvsub (bvadd lt!116929 to!314) i!635))))))

(assert (=> b!72468 (= lt!116937 (bitIndex!0 (size!1382 (buf!1763 (_2!3246 lt!116933))) (currentByte!3489 (_2!3246 lt!116933)) (currentBit!3484 (_2!3246 lt!116933))))))

(declare-fun b!72469 () Bool)

(declare-fun e!47242 () Bool)

(declare-fun e!47231 () Bool)

(assert (=> b!72469 (= e!47242 e!47231)))

(declare-fun res!59796 () Bool)

(assert (=> b!72469 (=> res!59796 e!47231)))

(declare-fun lt!116924 () Bool)

(assert (=> b!72469 (= res!59796 (not (= lt!116919 lt!116924)))))

(declare-fun head!566 (List!747) Bool)

(assert (=> b!72469 (= lt!116919 (head!566 lt!116918))))

(declare-fun b!72470 () Bool)

(declare-fun res!59802 () Bool)

(assert (=> b!72470 (=> (not res!59802) (not e!47243))))

(assert (=> b!72470 (= res!59802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1382 (buf!1763 thiss!1379))) ((_ sign_extend 32) (currentByte!3489 thiss!1379)) ((_ sign_extend 32) (currentBit!3484 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72471 () Bool)

(declare-fun res!59797 () Bool)

(assert (=> b!72471 (=> res!59797 e!47232)))

(declare-fun length!375 (List!747) Int)

(assert (=> b!72471 (= res!59797 (<= (length!375 lt!116918) 0))))

(declare-fun b!72472 () Bool)

(assert (=> b!72472 (= e!47235 e!47239)))

(declare-fun res!59811 () Bool)

(assert (=> b!72472 (=> res!59811 e!47239)))

(assert (=> b!72472 (= res!59811 (not (isPrefixOf!0 thiss!1379 (_2!3246 lt!116923))))))

(assert (=> b!72472 (validate_offset_bits!1 ((_ sign_extend 32) (size!1382 (buf!1763 (_2!3246 lt!116923)))) ((_ sign_extend 32) (currentByte!3489 (_2!3246 lt!116923))) ((_ sign_extend 32) (currentBit!3484 (_2!3246 lt!116923))) lt!116916)))

(assert (=> b!72472 (= lt!116916 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116938 () Unit!4817)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2344 BitStream!2344 (_ BitVec 64) (_ BitVec 64)) Unit!4817)

(assert (=> b!72472 (= lt!116938 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3246 lt!116923) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2344 (_ BitVec 8) (_ BitVec 32)) tuple2!6264)

(assert (=> b!72472 (= lt!116923 (appendBitFromByte!0 thiss!1379 (select (arr!1973 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72473 () Bool)

(declare-fun e!47228 () Bool)

(assert (=> b!72473 (= e!47228 e!47242)))

(declare-fun res!59809 () Bool)

(assert (=> b!72473 (=> res!59809 e!47242)))

(assert (=> b!72473 (= res!59809 (not (= lt!116924 (bitAt!0 (buf!1763 (_1!3247 lt!116922)) lt!116929))))))

(assert (=> b!72473 (= lt!116924 (bitAt!0 (buf!1763 (_1!3247 lt!116925)) lt!116929))))

(declare-fun b!72474 () Bool)

(assert (=> b!72474 (= e!47231 e!47230)))

(declare-fun res!59806 () Bool)

(assert (=> b!72474 (=> res!59806 e!47230)))

(assert (=> b!72474 (= res!59806 (not (= lt!116934 lt!116926)))))

(assert (=> b!72474 (= lt!116926 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun byteArrayBitContentToList!0 (BitStream!2344 array!2959 (_ BitVec 64) (_ BitVec 64)) List!747)

(assert (=> b!72474 (= lt!116934 (head!566 (byteArrayBitContentToList!0 (_2!3246 lt!116933) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!72475 () Bool)

(declare-fun res!59807 () Bool)

(assert (=> b!72475 (=> res!59807 e!47234)))

(assert (=> b!72475 (= res!59807 (not (invariant!0 (currentBit!3484 (_2!3246 lt!116923)) (currentByte!3489 (_2!3246 lt!116923)) (size!1382 (buf!1763 (_2!3246 lt!116923))))))))

(declare-fun b!72476 () Bool)

(assert (=> b!72476 (= e!47238 (= (head!566 (byteArrayBitContentToList!0 (_2!3246 lt!116923) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!566 (bitStreamReadBitsIntoList!0 (_2!3246 lt!116923) (_1!3247 lt!116921) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72477 () Bool)

(assert (=> b!72477 (= e!47232 e!47228)))

(declare-fun res!59808 () Bool)

(assert (=> b!72477 (=> res!59808 e!47228)))

(declare-fun lt!116935 () List!747)

(assert (=> b!72477 (= res!59808 (not (= lt!116935 lt!116920)))))

(assert (=> b!72477 (= lt!116920 lt!116935)))

(declare-fun tail!351 (List!747) List!747)

(assert (=> b!72477 (= lt!116935 (tail!351 lt!116918))))

(declare-fun lt!116917 () Unit!4817)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2344 BitStream!2344 BitStream!2344 BitStream!2344 (_ BitVec 64) List!747) Unit!4817)

(assert (=> b!72477 (= lt!116917 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3246 lt!116933) (_2!3246 lt!116933) (_1!3247 lt!116925) (_1!3247 lt!116922) (bvsub to!314 i!635) lt!116918))))

(declare-fun b!72478 () Bool)

(assert (=> b!72478 (= e!47241 e!47234)))

(declare-fun res!59792 () Bool)

(assert (=> b!72478 (=> res!59792 e!47234)))

(assert (=> b!72478 (= res!59792 (not (= (size!1382 (buf!1763 (_2!3246 lt!116923))) (size!1382 (buf!1763 (_2!3246 lt!116933))))))))

(assert (=> b!72478 (= lt!116937 (bvsub (bvsub (bvadd lt!116936 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72478 (= lt!116936 (bitIndex!0 (size!1382 (buf!1763 (_2!3246 lt!116923))) (currentByte!3489 (_2!3246 lt!116923)) (currentBit!3484 (_2!3246 lt!116923))))))

(assert (=> b!72478 (= (size!1382 (buf!1763 (_2!3246 lt!116933))) (size!1382 (buf!1763 thiss!1379)))))

(assert (= (and start!14076 res!59799) b!72470))

(assert (= (and b!72470 res!59802) b!72465))

(assert (= (and b!72465 (not res!59795)) b!72472))

(assert (= (and b!72472 (not res!59811)) b!72462))

(assert (= (and b!72462 res!59801) b!72476))

(assert (= (and b!72462 (not res!59793)) b!72468))

(assert (= (and b!72468 (not res!59803)) b!72459))

(assert (= (and b!72459 (not res!59794)) b!72461))

(assert (= (and b!72461 (not res!59798)) b!72478))

(assert (= (and b!72478 (not res!59792)) b!72475))

(assert (= (and b!72475 (not res!59807)) b!72457))

(assert (= (and b!72457 (not res!59810)) b!72466))

(assert (= (and b!72466 (not res!59804)) b!72471))

(assert (= (and b!72471 (not res!59797)) b!72477))

(assert (= (and b!72477 (not res!59808)) b!72473))

(assert (= (and b!72473 (not res!59809)) b!72469))

(assert (= (and b!72469 (not res!59796)) b!72474))

(assert (= (and b!72474 (not res!59806)) b!72460))

(assert (= (and b!72460 (not res!59805)) b!72463))

(assert (= (and b!72463 (not res!59800)) b!72464))

(assert (= (and b!72464 (not res!59791)) b!72458))

(assert (= start!14076 b!72467))

(declare-fun m!116263 () Bool)

(assert (=> b!72477 m!116263))

(declare-fun m!116265 () Bool)

(assert (=> b!72477 m!116265))

(declare-fun m!116267 () Bool)

(assert (=> b!72478 m!116267))

(declare-fun m!116269 () Bool)

(assert (=> b!72465 m!116269))

(declare-fun m!116271 () Bool)

(assert (=> b!72465 m!116271))

(declare-fun m!116273 () Bool)

(assert (=> b!72465 m!116273))

(declare-fun m!116275 () Bool)

(assert (=> b!72470 m!116275))

(declare-fun m!116277 () Bool)

(assert (=> b!72460 m!116277))

(declare-fun m!116279 () Bool)

(assert (=> b!72459 m!116279))

(declare-fun m!116281 () Bool)

(assert (=> b!72469 m!116281))

(declare-fun m!116283 () Bool)

(assert (=> start!14076 m!116283))

(declare-fun m!116285 () Bool)

(assert (=> start!14076 m!116285))

(declare-fun m!116287 () Bool)

(assert (=> b!72467 m!116287))

(declare-fun m!116289 () Bool)

(assert (=> b!72471 m!116289))

(declare-fun m!116291 () Bool)

(assert (=> b!72468 m!116291))

(declare-fun m!116293 () Bool)

(assert (=> b!72476 m!116293))

(assert (=> b!72476 m!116293))

(declare-fun m!116295 () Bool)

(assert (=> b!72476 m!116295))

(declare-fun m!116297 () Bool)

(assert (=> b!72476 m!116297))

(assert (=> b!72476 m!116297))

(declare-fun m!116299 () Bool)

(assert (=> b!72476 m!116299))

(declare-fun m!116301 () Bool)

(assert (=> b!72457 m!116301))

(declare-fun m!116303 () Bool)

(assert (=> b!72466 m!116303))

(declare-fun m!116305 () Bool)

(assert (=> b!72466 m!116305))

(declare-fun m!116307 () Bool)

(assert (=> b!72466 m!116307))

(declare-fun m!116309 () Bool)

(assert (=> b!72466 m!116309))

(declare-fun m!116311 () Bool)

(assert (=> b!72466 m!116311))

(declare-fun m!116313 () Bool)

(assert (=> b!72466 m!116313))

(declare-fun m!116315 () Bool)

(assert (=> b!72466 m!116315))

(declare-fun m!116317 () Bool)

(assert (=> b!72466 m!116317))

(declare-fun m!116319 () Bool)

(assert (=> b!72462 m!116319))

(declare-fun m!116321 () Bool)

(assert (=> b!72462 m!116321))

(declare-fun m!116323 () Bool)

(assert (=> b!72462 m!116323))

(declare-fun m!116325 () Bool)

(assert (=> b!72462 m!116325))

(declare-fun m!116327 () Bool)

(assert (=> b!72462 m!116327))

(declare-fun m!116329 () Bool)

(assert (=> b!72462 m!116329))

(declare-fun m!116331 () Bool)

(assert (=> b!72462 m!116331))

(declare-fun m!116333 () Bool)

(assert (=> b!72474 m!116333))

(declare-fun m!116335 () Bool)

(assert (=> b!72474 m!116335))

(assert (=> b!72474 m!116335))

(declare-fun m!116337 () Bool)

(assert (=> b!72474 m!116337))

(declare-fun m!116339 () Bool)

(assert (=> b!72463 m!116339))

(declare-fun m!116341 () Bool)

(assert (=> b!72463 m!116341))

(declare-fun m!116343 () Bool)

(assert (=> b!72464 m!116343))

(declare-fun m!116345 () Bool)

(assert (=> b!72473 m!116345))

(declare-fun m!116347 () Bool)

(assert (=> b!72473 m!116347))

(declare-fun m!116349 () Bool)

(assert (=> b!72472 m!116349))

(declare-fun m!116351 () Bool)

(assert (=> b!72472 m!116351))

(declare-fun m!116353 () Bool)

(assert (=> b!72472 m!116353))

(declare-fun m!116355 () Bool)

(assert (=> b!72472 m!116355))

(assert (=> b!72472 m!116351))

(declare-fun m!116357 () Bool)

(assert (=> b!72472 m!116357))

(declare-fun m!116359 () Bool)

(assert (=> b!72475 m!116359))

(push 1)

(assert (not b!72475))

(assert (not b!72476))

(assert (not b!72471))

(assert (not b!72467))

(assert (not b!72473))

(assert (not b!72463))

(assert (not start!14076))

(assert (not b!72469))

(assert (not b!72470))

(assert (not b!72472))

(assert (not b!72468))

(assert (not b!72478))

(assert (not b!72462))

(assert (not b!72459))

(assert (not b!72465))

(assert (not b!72477))

(assert (not b!72474))

(assert (not b!72466))

(assert (not b!72460))

(assert (not b!72457))

(assert (not b!72464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

