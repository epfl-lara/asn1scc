; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14080 () Bool)

(assert start!14080)

(declare-fun b!72589 () Bool)

(declare-fun e!47343 () Bool)

(declare-fun e!47341 () Bool)

(assert (=> b!72589 (= e!47343 e!47341)))

(declare-fun res!59920 () Bool)

(assert (=> b!72589 (=> res!59920 e!47341)))

(declare-fun lt!117079 () (_ BitVec 64))

(declare-fun lt!117084 () Bool)

(declare-datatypes ((array!2963 0))(
  ( (array!2964 (arr!1975 (Array (_ BitVec 32) (_ BitVec 8))) (size!1384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2348 0))(
  ( (BitStream!2349 (buf!1765 array!2963) (currentByte!3491 (_ BitVec 32)) (currentBit!3486 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6276 0))(
  ( (tuple2!6277 (_1!3252 BitStream!2348) (_2!3252 BitStream!2348)) )
))
(declare-fun lt!117077 () tuple2!6276)

(declare-fun bitAt!0 (array!2963 (_ BitVec 64)) Bool)

(assert (=> b!72589 (= res!59920 (not (= lt!117084 (bitAt!0 (buf!1765 (_1!3252 lt!117077)) lt!117079))))))

(declare-fun lt!117097 () tuple2!6276)

(assert (=> b!72589 (= lt!117084 (bitAt!0 (buf!1765 (_1!3252 lt!117097)) lt!117079))))

(declare-fun b!72590 () Bool)

(declare-fun e!47334 () Bool)

(declare-fun e!47335 () Bool)

(assert (=> b!72590 (= e!47334 e!47335)))

(declare-fun res!59924 () Bool)

(assert (=> b!72590 (=> res!59924 e!47335)))

(declare-datatypes ((Unit!4821 0))(
  ( (Unit!4822) )
))
(declare-datatypes ((tuple2!6278 0))(
  ( (tuple2!6279 (_1!3253 Unit!4821) (_2!3253 BitStream!2348)) )
))
(declare-fun lt!117085 () tuple2!6278)

(declare-fun lt!117072 () tuple2!6278)

(assert (=> b!72590 (= res!59924 (not (= (size!1384 (buf!1765 (_2!3253 lt!117085))) (size!1384 (buf!1765 (_2!3253 lt!117072))))))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!117094 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!117095 () (_ BitVec 64))

(assert (=> b!72590 (= lt!117094 (bvsub (bvsub (bvadd lt!117095 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72590 (= lt!117095 (bitIndex!0 (size!1384 (buf!1765 (_2!3253 lt!117085))) (currentByte!3491 (_2!3253 lt!117085)) (currentBit!3486 (_2!3253 lt!117085))))))

(declare-fun thiss!1379 () BitStream!2348)

(assert (=> b!72590 (= (size!1384 (buf!1765 (_2!3253 lt!117072))) (size!1384 (buf!1765 thiss!1379)))))

(declare-fun b!72591 () Bool)

(declare-fun e!47339 () Bool)

(declare-fun e!47338 () Bool)

(assert (=> b!72591 (= e!47339 e!47338)))

(declare-fun res!59919 () Bool)

(assert (=> b!72591 (=> res!59919 e!47338)))

(declare-fun lt!117087 () Bool)

(declare-fun lt!117074 () Bool)

(assert (=> b!72591 (= res!59919 (not (= lt!117087 lt!117074)))))

(declare-fun lt!117073 () Bool)

(assert (=> b!72591 (= lt!117073 lt!117087)))

(assert (=> b!72591 (= lt!117087 (bitAt!0 (buf!1765 (_2!3253 lt!117072)) lt!117079))))

(declare-fun lt!117076 () Unit!4821)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2963 array!2963 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4821)

(assert (=> b!72591 (= lt!117076 (arrayBitRangesEqImpliesEq!0 (buf!1765 (_2!3253 lt!117085)) (buf!1765 (_2!3253 lt!117072)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!117079 lt!117095))))

(declare-fun b!72592 () Bool)

(declare-fun res!59921 () Bool)

(assert (=> b!72592 (=> res!59921 e!47335)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72592 (= res!59921 (not (invariant!0 (currentBit!3486 (_2!3253 lt!117085)) (currentByte!3491 (_2!3253 lt!117085)) (size!1384 (buf!1765 (_2!3253 lt!117072))))))))

(declare-fun b!72593 () Bool)

(declare-fun e!47331 () Bool)

(assert (=> b!72593 (= e!47331 e!47334)))

(declare-fun res!59935 () Bool)

(assert (=> b!72593 (=> res!59935 e!47334)))

(assert (=> b!72593 (= res!59935 (not (= lt!117094 (bvsub (bvadd lt!117079 to!314) i!635))))))

(assert (=> b!72593 (= lt!117094 (bitIndex!0 (size!1384 (buf!1765 (_2!3253 lt!117072))) (currentByte!3491 (_2!3253 lt!117072)) (currentBit!3486 (_2!3253 lt!117072))))))

(declare-fun b!72594 () Bool)

(declare-fun e!47333 () Bool)

(assert (=> b!72594 (= e!47335 e!47333)))

(declare-fun res!59925 () Bool)

(assert (=> b!72594 (=> res!59925 e!47333)))

(assert (=> b!72594 (= res!59925 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!749 0))(
  ( (Nil!746) (Cons!745 (h!864 Bool) (t!1499 List!749)) )
))
(declare-fun lt!117080 () List!749)

(declare-fun lt!117091 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2348 BitStream!2348 (_ BitVec 64)) List!749)

(assert (=> b!72594 (= lt!117080 (bitStreamReadBitsIntoList!0 (_2!3253 lt!117072) (_1!3252 lt!117077) lt!117091))))

(declare-fun lt!117083 () List!749)

(assert (=> b!72594 (= lt!117083 (bitStreamReadBitsIntoList!0 (_2!3253 lt!117072) (_1!3252 lt!117097) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72594 (validate_offset_bits!1 ((_ sign_extend 32) (size!1384 (buf!1765 (_2!3253 lt!117072)))) ((_ sign_extend 32) (currentByte!3491 (_2!3253 lt!117085))) ((_ sign_extend 32) (currentBit!3486 (_2!3253 lt!117085))) lt!117091)))

(declare-fun lt!117086 () Unit!4821)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2348 array!2963 (_ BitVec 64)) Unit!4821)

(assert (=> b!72594 (= lt!117086 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3253 lt!117085) (buf!1765 (_2!3253 lt!117072)) lt!117091))))

(declare-fun reader!0 (BitStream!2348 BitStream!2348) tuple2!6276)

(assert (=> b!72594 (= lt!117077 (reader!0 (_2!3253 lt!117085) (_2!3253 lt!117072)))))

(assert (=> b!72594 (validate_offset_bits!1 ((_ sign_extend 32) (size!1384 (buf!1765 (_2!3253 lt!117072)))) ((_ sign_extend 32) (currentByte!3491 thiss!1379)) ((_ sign_extend 32) (currentBit!3486 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!117089 () Unit!4821)

(assert (=> b!72594 (= lt!117089 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1765 (_2!3253 lt!117072)) (bvsub to!314 i!635)))))

(assert (=> b!72594 (= lt!117097 (reader!0 thiss!1379 (_2!3253 lt!117072)))))

(declare-fun b!72595 () Bool)

(declare-fun res!59936 () Bool)

(assert (=> b!72595 (=> res!59936 e!47338)))

(declare-datatypes ((tuple2!6280 0))(
  ( (tuple2!6281 (_1!3254 BitStream!2348) (_2!3254 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2348) tuple2!6280)

(assert (=> b!72595 (= res!59936 (not (= (_2!3254 (readBitPure!0 (_1!3252 lt!117097))) lt!117074)))))

(declare-fun b!72596 () Bool)

(declare-fun e!47336 () Bool)

(declare-fun e!47329 () Bool)

(assert (=> b!72596 (= e!47336 e!47329)))

(declare-fun res!59932 () Bool)

(assert (=> b!72596 (=> res!59932 e!47329)))

(declare-fun lt!117081 () Bool)

(assert (=> b!72596 (= res!59932 (not (= lt!117081 lt!117074)))))

(declare-fun srcBuffer!2 () array!2963)

(assert (=> b!72596 (= lt!117074 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun head!568 (List!749) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2348 array!2963 (_ BitVec 64) (_ BitVec 64)) List!749)

(assert (=> b!72596 (= lt!117081 (head!568 (byteArrayBitContentToList!0 (_2!3253 lt!117072) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!72597 () Bool)

(declare-fun res!59923 () Bool)

(assert (=> b!72597 (=> res!59923 e!47334)))

(assert (=> b!72597 (= res!59923 (not (invariant!0 (currentBit!3486 (_2!3253 lt!117072)) (currentByte!3491 (_2!3253 lt!117072)) (size!1384 (buf!1765 (_2!3253 lt!117072))))))))

(declare-fun b!72599 () Bool)

(assert (=> b!72599 (= e!47333 e!47343)))

(declare-fun res!59927 () Bool)

(assert (=> b!72599 (=> res!59927 e!47343)))

(declare-fun lt!117082 () List!749)

(assert (=> b!72599 (= res!59927 (not (= lt!117082 lt!117080)))))

(assert (=> b!72599 (= lt!117080 lt!117082)))

(declare-fun tail!353 (List!749) List!749)

(assert (=> b!72599 (= lt!117082 (tail!353 lt!117083))))

(declare-fun lt!117092 () Unit!4821)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2348 BitStream!2348 BitStream!2348 BitStream!2348 (_ BitVec 64) List!749) Unit!4821)

(assert (=> b!72599 (= lt!117092 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3253 lt!117072) (_2!3253 lt!117072) (_1!3252 lt!117097) (_1!3252 lt!117077) (bvsub to!314 i!635) lt!117083))))

(declare-fun b!72600 () Bool)

(declare-fun lt!117093 () Bool)

(assert (=> b!72600 (= e!47338 (or (not (= lt!117093 lt!117081)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!72601 () Bool)

(declare-fun e!47342 () Bool)

(declare-fun e!47344 () Bool)

(assert (=> b!72601 (= e!47342 (not e!47344))))

(declare-fun res!59931 () Bool)

(assert (=> b!72601 (=> res!59931 e!47344)))

(assert (=> b!72601 (= res!59931 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2348 BitStream!2348) Bool)

(assert (=> b!72601 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!117096 () Unit!4821)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2348) Unit!4821)

(assert (=> b!72601 (= lt!117096 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!72601 (= lt!117079 (bitIndex!0 (size!1384 (buf!1765 thiss!1379)) (currentByte!3491 thiss!1379) (currentBit!3486 thiss!1379)))))

(declare-fun b!72602 () Bool)

(declare-fun res!59917 () Bool)

(assert (=> b!72602 (=> res!59917 e!47335)))

(assert (=> b!72602 (= res!59917 (not (invariant!0 (currentBit!3486 (_2!3253 lt!117085)) (currentByte!3491 (_2!3253 lt!117085)) (size!1384 (buf!1765 (_2!3253 lt!117085))))))))

(declare-fun b!72603 () Bool)

(declare-fun res!59930 () Bool)

(assert (=> b!72603 (=> res!59930 e!47333)))

(declare-fun length!377 (List!749) Int)

(assert (=> b!72603 (= res!59930 (<= (length!377 lt!117083) 0))))

(declare-fun b!72604 () Bool)

(declare-fun e!47340 () Bool)

(assert (=> b!72604 (= e!47344 e!47340)))

(declare-fun res!59933 () Bool)

(assert (=> b!72604 (=> res!59933 e!47340)))

(assert (=> b!72604 (= res!59933 (not (isPrefixOf!0 thiss!1379 (_2!3253 lt!117085))))))

(assert (=> b!72604 (validate_offset_bits!1 ((_ sign_extend 32) (size!1384 (buf!1765 (_2!3253 lt!117085)))) ((_ sign_extend 32) (currentByte!3491 (_2!3253 lt!117085))) ((_ sign_extend 32) (currentBit!3486 (_2!3253 lt!117085))) lt!117091)))

(assert (=> b!72604 (= lt!117091 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117075 () Unit!4821)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2348 BitStream!2348 (_ BitVec 64) (_ BitVec 64)) Unit!4821)

(assert (=> b!72604 (= lt!117075 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3253 lt!117085) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2348 (_ BitVec 8) (_ BitVec 32)) tuple2!6278)

(assert (=> b!72604 (= lt!117085 (appendBitFromByte!0 thiss!1379 (select (arr!1975 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72605 () Bool)

(assert (=> b!72605 (= e!47340 e!47331)))

(declare-fun res!59937 () Bool)

(assert (=> b!72605 (=> res!59937 e!47331)))

(assert (=> b!72605 (= res!59937 (not (isPrefixOf!0 (_2!3253 lt!117085) (_2!3253 lt!117072))))))

(assert (=> b!72605 (isPrefixOf!0 thiss!1379 (_2!3253 lt!117072))))

(declare-fun lt!117088 () Unit!4821)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2348 BitStream!2348 BitStream!2348) Unit!4821)

(assert (=> b!72605 (= lt!117088 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3253 lt!117085) (_2!3253 lt!117072)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2348 array!2963 (_ BitVec 64) (_ BitVec 64)) tuple2!6278)

(assert (=> b!72605 (= lt!117072 (appendBitsMSBFirstLoop!0 (_2!3253 lt!117085) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!47332 () Bool)

(assert (=> b!72605 e!47332))

(declare-fun res!59928 () Bool)

(assert (=> b!72605 (=> (not res!59928) (not e!47332))))

(assert (=> b!72605 (= res!59928 (validate_offset_bits!1 ((_ sign_extend 32) (size!1384 (buf!1765 (_2!3253 lt!117085)))) ((_ sign_extend 32) (currentByte!3491 thiss!1379)) ((_ sign_extend 32) (currentBit!3486 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117090 () Unit!4821)

(assert (=> b!72605 (= lt!117090 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1765 (_2!3253 lt!117085)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117078 () tuple2!6276)

(assert (=> b!72605 (= lt!117078 (reader!0 thiss!1379 (_2!3253 lt!117085)))))

(declare-fun b!72606 () Bool)

(assert (=> b!72606 (= e!47329 e!47339)))

(declare-fun res!59922 () Bool)

(assert (=> b!72606 (=> res!59922 e!47339)))

(assert (=> b!72606 (= res!59922 (not (= lt!117073 lt!117074)))))

(assert (=> b!72606 (= lt!117073 (bitAt!0 (buf!1765 (_2!3253 lt!117085)) lt!117079))))

(declare-fun b!72607 () Bool)

(declare-fun e!47345 () Bool)

(declare-fun array_inv!1233 (array!2963) Bool)

(assert (=> b!72607 (= e!47345 (array_inv!1233 (buf!1765 thiss!1379)))))

(declare-fun b!72608 () Bool)

(declare-fun res!59929 () Bool)

(assert (=> b!72608 (=> (not res!59929) (not e!47342))))

(assert (=> b!72608 (= res!59929 (validate_offset_bits!1 ((_ sign_extend 32) (size!1384 (buf!1765 thiss!1379))) ((_ sign_extend 32) (currentByte!3491 thiss!1379)) ((_ sign_extend 32) (currentBit!3486 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72609 () Bool)

(declare-fun res!59934 () Bool)

(assert (=> b!72609 (=> res!59934 e!47334)))

(assert (=> b!72609 (= res!59934 (not (= (size!1384 (buf!1765 thiss!1379)) (size!1384 (buf!1765 (_2!3253 lt!117072))))))))

(declare-fun b!72610 () Bool)

(assert (=> b!72610 (= e!47341 e!47336)))

(declare-fun res!59926 () Bool)

(assert (=> b!72610 (=> res!59926 e!47336)))

(assert (=> b!72610 (= res!59926 (not (= lt!117093 lt!117084)))))

(assert (=> b!72610 (= lt!117093 (head!568 lt!117083))))

(declare-fun res!59918 () Bool)

(assert (=> start!14080 (=> (not res!59918) (not e!47342))))

(assert (=> start!14080 (= res!59918 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1384 srcBuffer!2))))))))

(assert (=> start!14080 e!47342))

(assert (=> start!14080 true))

(assert (=> start!14080 (array_inv!1233 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2348) Bool)

(assert (=> start!14080 (and (inv!12 thiss!1379) e!47345)))

(declare-fun b!72598 () Bool)

(assert (=> b!72598 (= e!47332 (= (head!568 (byteArrayBitContentToList!0 (_2!3253 lt!117085) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!568 (bitStreamReadBitsIntoList!0 (_2!3253 lt!117085) (_1!3252 lt!117078) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!14080 res!59918) b!72608))

(assert (= (and b!72608 res!59929) b!72601))

(assert (= (and b!72601 (not res!59931)) b!72604))

(assert (= (and b!72604 (not res!59933)) b!72605))

(assert (= (and b!72605 res!59928) b!72598))

(assert (= (and b!72605 (not res!59937)) b!72593))

(assert (= (and b!72593 (not res!59935)) b!72597))

(assert (= (and b!72597 (not res!59923)) b!72609))

(assert (= (and b!72609 (not res!59934)) b!72590))

(assert (= (and b!72590 (not res!59924)) b!72602))

(assert (= (and b!72602 (not res!59917)) b!72592))

(assert (= (and b!72592 (not res!59921)) b!72594))

(assert (= (and b!72594 (not res!59925)) b!72603))

(assert (= (and b!72603 (not res!59930)) b!72599))

(assert (= (and b!72599 (not res!59927)) b!72589))

(assert (= (and b!72589 (not res!59920)) b!72610))

(assert (= (and b!72610 (not res!59926)) b!72596))

(assert (= (and b!72596 (not res!59932)) b!72606))

(assert (= (and b!72606 (not res!59922)) b!72591))

(assert (= (and b!72591 (not res!59919)) b!72595))

(assert (= (and b!72595 (not res!59936)) b!72600))

(assert (= start!14080 b!72607))

(declare-fun m!116459 () Bool)

(assert (=> b!72610 m!116459))

(declare-fun m!116461 () Bool)

(assert (=> b!72606 m!116461))

(declare-fun m!116463 () Bool)

(assert (=> b!72590 m!116463))

(declare-fun m!116465 () Bool)

(assert (=> b!72603 m!116465))

(declare-fun m!116467 () Bool)

(assert (=> b!72608 m!116467))

(declare-fun m!116469 () Bool)

(assert (=> b!72591 m!116469))

(declare-fun m!116471 () Bool)

(assert (=> b!72591 m!116471))

(declare-fun m!116473 () Bool)

(assert (=> b!72601 m!116473))

(declare-fun m!116475 () Bool)

(assert (=> b!72601 m!116475))

(declare-fun m!116477 () Bool)

(assert (=> b!72601 m!116477))

(declare-fun m!116479 () Bool)

(assert (=> b!72593 m!116479))

(declare-fun m!116481 () Bool)

(assert (=> b!72598 m!116481))

(assert (=> b!72598 m!116481))

(declare-fun m!116483 () Bool)

(assert (=> b!72598 m!116483))

(declare-fun m!116485 () Bool)

(assert (=> b!72598 m!116485))

(assert (=> b!72598 m!116485))

(declare-fun m!116487 () Bool)

(assert (=> b!72598 m!116487))

(declare-fun m!116489 () Bool)

(assert (=> b!72605 m!116489))

(declare-fun m!116491 () Bool)

(assert (=> b!72605 m!116491))

(declare-fun m!116493 () Bool)

(assert (=> b!72605 m!116493))

(declare-fun m!116495 () Bool)

(assert (=> b!72605 m!116495))

(declare-fun m!116497 () Bool)

(assert (=> b!72605 m!116497))

(declare-fun m!116499 () Bool)

(assert (=> b!72605 m!116499))

(declare-fun m!116501 () Bool)

(assert (=> b!72605 m!116501))

(declare-fun m!116503 () Bool)

(assert (=> b!72589 m!116503))

(declare-fun m!116505 () Bool)

(assert (=> b!72589 m!116505))

(declare-fun m!116507 () Bool)

(assert (=> b!72596 m!116507))

(declare-fun m!116509 () Bool)

(assert (=> b!72596 m!116509))

(assert (=> b!72596 m!116509))

(declare-fun m!116511 () Bool)

(assert (=> b!72596 m!116511))

(declare-fun m!116513 () Bool)

(assert (=> b!72602 m!116513))

(declare-fun m!116515 () Bool)

(assert (=> b!72594 m!116515))

(declare-fun m!116517 () Bool)

(assert (=> b!72594 m!116517))

(declare-fun m!116519 () Bool)

(assert (=> b!72594 m!116519))

(declare-fun m!116521 () Bool)

(assert (=> b!72594 m!116521))

(declare-fun m!116523 () Bool)

(assert (=> b!72594 m!116523))

(declare-fun m!116525 () Bool)

(assert (=> b!72594 m!116525))

(declare-fun m!116527 () Bool)

(assert (=> b!72594 m!116527))

(declare-fun m!116529 () Bool)

(assert (=> b!72594 m!116529))

(declare-fun m!116531 () Bool)

(assert (=> b!72604 m!116531))

(declare-fun m!116533 () Bool)

(assert (=> b!72604 m!116533))

(assert (=> b!72604 m!116533))

(declare-fun m!116535 () Bool)

(assert (=> b!72604 m!116535))

(declare-fun m!116537 () Bool)

(assert (=> b!72604 m!116537))

(declare-fun m!116539 () Bool)

(assert (=> b!72604 m!116539))

(declare-fun m!116541 () Bool)

(assert (=> start!14080 m!116541))

(declare-fun m!116543 () Bool)

(assert (=> start!14080 m!116543))

(declare-fun m!116545 () Bool)

(assert (=> b!72595 m!116545))

(declare-fun m!116547 () Bool)

(assert (=> b!72607 m!116547))

(declare-fun m!116549 () Bool)

(assert (=> b!72599 m!116549))

(declare-fun m!116551 () Bool)

(assert (=> b!72599 m!116551))

(declare-fun m!116553 () Bool)

(assert (=> b!72592 m!116553))

(declare-fun m!116555 () Bool)

(assert (=> b!72597 m!116555))

(push 1)

(assert (not b!72594))

(assert (not b!72593))

(assert (not b!72603))

(assert (not b!72608))

(assert (not b!72591))

(assert (not b!72596))

(assert (not b!72595))

(assert (not b!72602))

(assert (not b!72590))

(assert (not b!72605))

(assert (not b!72601))

(assert (not b!72607))

(assert (not b!72598))

(assert (not b!72589))

(assert (not b!72610))

(assert (not b!72604))

(assert (not b!72599))

(assert (not b!72606))

(assert (not b!72592))

(assert (not start!14080))

(assert (not b!72597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

