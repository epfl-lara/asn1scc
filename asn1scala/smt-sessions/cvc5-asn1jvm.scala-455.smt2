; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12228 () Bool)

(assert start!12228)

(declare-fun b!62326 () Bool)

(declare-fun res!51862 () Bool)

(declare-fun e!41419 () Bool)

(assert (=> b!62326 (=> res!51862 e!41419)))

(declare-datatypes ((array!2788 0))(
  ( (array!2789 (arr!1838 (Array (_ BitVec 32) (_ BitVec 8))) (size!1274 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2218 0))(
  ( (BitStream!2219 (buf!1655 array!2788) (currentByte!3291 (_ BitVec 32)) (currentBit!3286 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4243 0))(
  ( (Unit!4244) )
))
(declare-datatypes ((tuple2!5630 0))(
  ( (tuple2!5631 (_1!2926 Unit!4243) (_2!2926 BitStream!2218)) )
))
(declare-fun lt!97888 () tuple2!5630)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!62326 (= res!51862 (not (invariant!0 (currentBit!3286 (_2!2926 lt!97888)) (currentByte!3291 (_2!2926 lt!97888)) (size!1274 (buf!1655 (_2!2926 lt!97888))))))))

(declare-fun b!62327 () Bool)

(declare-fun res!51871 () Bool)

(declare-fun e!41413 () Bool)

(assert (=> b!62327 (=> (not res!51871) (not e!41413))))

(declare-fun thiss!1379 () BitStream!2218)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62327 (= res!51871 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 thiss!1379))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!62328 () Bool)

(declare-fun e!41421 () Bool)

(declare-fun e!41417 () Bool)

(assert (=> b!62328 (= e!41421 e!41417)))

(declare-fun res!51863 () Bool)

(assert (=> b!62328 (=> res!51863 e!41417)))

(declare-fun lt!97890 () tuple2!5630)

(declare-fun isPrefixOf!0 (BitStream!2218 BitStream!2218) Bool)

(assert (=> b!62328 (= res!51863 (not (isPrefixOf!0 thiss!1379 (_2!2926 lt!97890))))))

(declare-fun lt!97902 () (_ BitVec 64))

(assert (=> b!62328 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!97902)))

(assert (=> b!62328 (= lt!97902 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97898 () Unit!4243)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2218 BitStream!2218 (_ BitVec 64) (_ BitVec 64)) Unit!4243)

(assert (=> b!62328 (= lt!97898 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2926 lt!97890) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2788)

(declare-fun appendBitFromByte!0 (BitStream!2218 (_ BitVec 8) (_ BitVec 32)) tuple2!5630)

(assert (=> b!62328 (= lt!97890 (appendBitFromByte!0 thiss!1379 (select (arr!1838 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!41415 () Bool)

(declare-fun lt!97891 () (_ BitVec 64))

(declare-fun b!62329 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!62329 (= e!41415 (= lt!97891 (bvsub (bvsub (bvadd (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62330 () Bool)

(declare-fun e!41412 () Bool)

(declare-fun e!41418 () Bool)

(assert (=> b!62330 (= e!41412 e!41418)))

(declare-fun res!51859 () Bool)

(assert (=> b!62330 (=> res!51859 e!41418)))

(assert (=> b!62330 (= res!51859 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5632 0))(
  ( (tuple2!5633 (_1!2927 BitStream!2218) (_2!2927 BitStream!2218)) )
))
(declare-fun lt!97889 () tuple2!5632)

(declare-datatypes ((List!684 0))(
  ( (Nil!681) (Cons!680 (h!799 Bool) (t!1434 List!684)) )
))
(declare-fun lt!97901 () List!684)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2218 BitStream!2218 (_ BitVec 64)) List!684)

(assert (=> b!62330 (= lt!97901 (bitStreamReadBitsIntoList!0 (_2!2926 lt!97888) (_1!2927 lt!97889) lt!97902))))

(declare-fun lt!97894 () tuple2!5632)

(declare-fun lt!97896 () List!684)

(assert (=> b!62330 (= lt!97896 (bitStreamReadBitsIntoList!0 (_2!2926 lt!97888) (_1!2927 lt!97894) (bvsub to!314 i!635)))))

(assert (=> b!62330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!97902)))

(declare-fun lt!97897 () Unit!4243)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2218 array!2788 (_ BitVec 64)) Unit!4243)

(assert (=> b!62330 (= lt!97897 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2926 lt!97890) (buf!1655 (_2!2926 lt!97888)) lt!97902))))

(declare-fun reader!0 (BitStream!2218 BitStream!2218) tuple2!5632)

(assert (=> b!62330 (= lt!97889 (reader!0 (_2!2926 lt!97890) (_2!2926 lt!97888)))))

(assert (=> b!62330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!97893 () Unit!4243)

(assert (=> b!62330 (= lt!97893 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1655 (_2!2926 lt!97888)) (bvsub to!314 i!635)))))

(assert (=> b!62330 (= lt!97894 (reader!0 thiss!1379 (_2!2926 lt!97888)))))

(declare-fun e!41414 () Bool)

(declare-fun b!62331 () Bool)

(declare-fun lt!97900 () tuple2!5632)

(declare-fun head!503 (List!684) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2218 array!2788 (_ BitVec 64) (_ BitVec 64)) List!684)

(assert (=> b!62331 (= e!41414 (= (head!503 (byteArrayBitContentToList!0 (_2!2926 lt!97890) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!503 (bitStreamReadBitsIntoList!0 (_2!2926 lt!97890) (_1!2927 lt!97900) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!62332 () Bool)

(declare-fun res!51860 () Bool)

(assert (=> b!62332 (=> res!51860 e!41418)))

(declare-fun length!312 (List!684) Int)

(assert (=> b!62332 (= res!51860 (<= (length!312 lt!97896) 0))))

(declare-fun b!62333 () Bool)

(declare-fun e!41423 () Bool)

(assert (=> b!62333 (= e!41417 e!41423)))

(declare-fun res!51856 () Bool)

(assert (=> b!62333 (=> res!51856 e!41423)))

(assert (=> b!62333 (= res!51856 (not (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!97888))))))

(assert (=> b!62333 (isPrefixOf!0 thiss!1379 (_2!2926 lt!97888))))

(declare-fun lt!97899 () Unit!4243)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2218 BitStream!2218 BitStream!2218) Unit!4243)

(assert (=> b!62333 (= lt!97899 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2926 lt!97890) (_2!2926 lt!97888)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2218 array!2788 (_ BitVec 64) (_ BitVec 64)) tuple2!5630)

(assert (=> b!62333 (= lt!97888 (appendBitsMSBFirstLoop!0 (_2!2926 lt!97890) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!62333 e!41414))

(declare-fun res!51867 () Bool)

(assert (=> b!62333 (=> (not res!51867) (not e!41414))))

(assert (=> b!62333 (= res!51867 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97895 () Unit!4243)

(assert (=> b!62333 (= lt!97895 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1655 (_2!2926 lt!97890)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62333 (= lt!97900 (reader!0 thiss!1379 (_2!2926 lt!97890)))))

(declare-fun b!62334 () Bool)

(declare-fun res!51864 () Bool)

(assert (=> b!62334 (=> res!51864 e!41418)))

(assert (=> b!62334 (= res!51864 (not (isPrefixOf!0 (_1!2927 lt!97894) (_2!2926 lt!97888))))))

(declare-fun b!62335 () Bool)

(assert (=> b!62335 (= e!41413 (not e!41421))))

(declare-fun res!51868 () Bool)

(assert (=> b!62335 (=> res!51868 e!41421)))

(assert (=> b!62335 (= res!51868 (bvsge i!635 to!314))))

(assert (=> b!62335 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!97903 () Unit!4243)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2218) Unit!4243)

(assert (=> b!62335 (= lt!97903 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!97892 () (_ BitVec 64))

(assert (=> b!62335 (= lt!97892 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(declare-fun b!62336 () Bool)

(declare-fun res!51872 () Bool)

(assert (=> b!62336 (=> res!51872 e!41418)))

(assert (=> b!62336 (= res!51872 (not (isPrefixOf!0 (_1!2927 lt!97889) (_2!2926 lt!97888))))))

(declare-fun b!62337 () Bool)

(declare-fun res!51865 () Bool)

(assert (=> b!62337 (=> res!51865 e!41418)))

(assert (=> b!62337 (= res!51865 (not (isPrefixOf!0 (_1!2927 lt!97894) (_1!2927 lt!97889))))))

(declare-fun b!62338 () Bool)

(declare-fun e!41420 () Bool)

(declare-fun array_inv!1168 (array!2788) Bool)

(assert (=> b!62338 (= e!41420 (array_inv!1168 (buf!1655 thiss!1379)))))

(declare-fun b!62339 () Bool)

(declare-fun res!51869 () Bool)

(assert (=> b!62339 (=> res!51869 e!41412)))

(assert (=> b!62339 (= res!51869 (not (invariant!0 (currentBit!3286 (_2!2926 lt!97890)) (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97888))))))))

(declare-fun b!62340 () Bool)

(assert (=> b!62340 (= e!41423 e!41419)))

(declare-fun res!51866 () Bool)

(assert (=> b!62340 (=> res!51866 e!41419)))

(assert (=> b!62340 (= res!51866 (not (= lt!97891 (bvsub (bvadd lt!97892 to!314) i!635))))))

(assert (=> b!62340 (= lt!97891 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888))))))

(declare-fun b!62341 () Bool)

(declare-fun res!51861 () Bool)

(assert (=> b!62341 (=> res!51861 e!41419)))

(assert (=> b!62341 (= res!51861 (not (= (size!1274 (buf!1655 thiss!1379)) (size!1274 (buf!1655 (_2!2926 lt!97888))))))))

(declare-fun b!62342 () Bool)

(declare-fun res!51857 () Bool)

(assert (=> b!62342 (=> res!51857 e!41412)))

(assert (=> b!62342 (= res!51857 (not (invariant!0 (currentBit!3286 (_2!2926 lt!97890)) (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97890))))))))

(declare-fun b!62343 () Bool)

(assert (=> b!62343 (= e!41419 e!41412)))

(declare-fun res!51858 () Bool)

(assert (=> b!62343 (=> res!51858 e!41412)))

(assert (=> b!62343 (= res!51858 (not (= (size!1274 (buf!1655 (_2!2926 lt!97890))) (size!1274 (buf!1655 (_2!2926 lt!97888))))))))

(assert (=> b!62343 e!41415))

(declare-fun res!51873 () Bool)

(assert (=> b!62343 (=> (not res!51873) (not e!41415))))

(assert (=> b!62343 (= res!51873 (= (size!1274 (buf!1655 (_2!2926 lt!97888))) (size!1274 (buf!1655 thiss!1379))))))

(declare-fun res!51870 () Bool)

(assert (=> start!12228 (=> (not res!51870) (not e!41413))))

(assert (=> start!12228 (= res!51870 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1274 srcBuffer!2))))))))

(assert (=> start!12228 e!41413))

(assert (=> start!12228 true))

(assert (=> start!12228 (array_inv!1168 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2218) Bool)

(assert (=> start!12228 (and (inv!12 thiss!1379) e!41420)))

(declare-fun b!62344 () Bool)

(assert (=> b!62344 (= e!41418 (= (buf!1655 (_1!2927 lt!97894)) (buf!1655 (_1!2927 lt!97889))))))

(assert (= (and start!12228 res!51870) b!62327))

(assert (= (and b!62327 res!51871) b!62335))

(assert (= (and b!62335 (not res!51868)) b!62328))

(assert (= (and b!62328 (not res!51863)) b!62333))

(assert (= (and b!62333 res!51867) b!62331))

(assert (= (and b!62333 (not res!51856)) b!62340))

(assert (= (and b!62340 (not res!51866)) b!62326))

(assert (= (and b!62326 (not res!51862)) b!62341))

(assert (= (and b!62341 (not res!51861)) b!62343))

(assert (= (and b!62343 res!51873) b!62329))

(assert (= (and b!62343 (not res!51858)) b!62342))

(assert (= (and b!62342 (not res!51857)) b!62339))

(assert (= (and b!62339 (not res!51869)) b!62330))

(assert (= (and b!62330 (not res!51859)) b!62332))

(assert (= (and b!62332 (not res!51860)) b!62334))

(assert (= (and b!62334 (not res!51864)) b!62336))

(assert (= (and b!62336 (not res!51872)) b!62337))

(assert (= (and b!62337 (not res!51865)) b!62344))

(assert (= start!12228 b!62338))

(declare-fun m!98575 () Bool)

(assert (=> b!62336 m!98575))

(declare-fun m!98577 () Bool)

(assert (=> b!62327 m!98577))

(declare-fun m!98579 () Bool)

(assert (=> b!62326 m!98579))

(declare-fun m!98581 () Bool)

(assert (=> b!62342 m!98581))

(declare-fun m!98583 () Bool)

(assert (=> b!62335 m!98583))

(declare-fun m!98585 () Bool)

(assert (=> b!62335 m!98585))

(declare-fun m!98587 () Bool)

(assert (=> b!62335 m!98587))

(declare-fun m!98589 () Bool)

(assert (=> b!62340 m!98589))

(declare-fun m!98591 () Bool)

(assert (=> start!12228 m!98591))

(declare-fun m!98593 () Bool)

(assert (=> start!12228 m!98593))

(declare-fun m!98595 () Bool)

(assert (=> b!62337 m!98595))

(declare-fun m!98597 () Bool)

(assert (=> b!62330 m!98597))

(declare-fun m!98599 () Bool)

(assert (=> b!62330 m!98599))

(declare-fun m!98601 () Bool)

(assert (=> b!62330 m!98601))

(declare-fun m!98603 () Bool)

(assert (=> b!62330 m!98603))

(declare-fun m!98605 () Bool)

(assert (=> b!62330 m!98605))

(declare-fun m!98607 () Bool)

(assert (=> b!62330 m!98607))

(declare-fun m!98609 () Bool)

(assert (=> b!62330 m!98609))

(declare-fun m!98611 () Bool)

(assert (=> b!62330 m!98611))

(declare-fun m!98613 () Bool)

(assert (=> b!62332 m!98613))

(declare-fun m!98615 () Bool)

(assert (=> b!62333 m!98615))

(declare-fun m!98617 () Bool)

(assert (=> b!62333 m!98617))

(declare-fun m!98619 () Bool)

(assert (=> b!62333 m!98619))

(declare-fun m!98621 () Bool)

(assert (=> b!62333 m!98621))

(declare-fun m!98623 () Bool)

(assert (=> b!62333 m!98623))

(declare-fun m!98625 () Bool)

(assert (=> b!62333 m!98625))

(declare-fun m!98627 () Bool)

(assert (=> b!62333 m!98627))

(declare-fun m!98629 () Bool)

(assert (=> b!62328 m!98629))

(declare-fun m!98631 () Bool)

(assert (=> b!62328 m!98631))

(declare-fun m!98633 () Bool)

(assert (=> b!62328 m!98633))

(declare-fun m!98635 () Bool)

(assert (=> b!62328 m!98635))

(assert (=> b!62328 m!98633))

(declare-fun m!98637 () Bool)

(assert (=> b!62328 m!98637))

(declare-fun m!98639 () Bool)

(assert (=> b!62334 m!98639))

(declare-fun m!98641 () Bool)

(assert (=> b!62339 m!98641))

(declare-fun m!98643 () Bool)

(assert (=> b!62329 m!98643))

(declare-fun m!98645 () Bool)

(assert (=> b!62338 m!98645))

(declare-fun m!98647 () Bool)

(assert (=> b!62331 m!98647))

(assert (=> b!62331 m!98647))

(declare-fun m!98649 () Bool)

(assert (=> b!62331 m!98649))

(declare-fun m!98651 () Bool)

(assert (=> b!62331 m!98651))

(assert (=> b!62331 m!98651))

(declare-fun m!98653 () Bool)

(assert (=> b!62331 m!98653))

(push 1)

(assert (not b!62332))

(assert (not b!62334))

(assert (not b!62335))

(assert (not b!62328))

(assert (not b!62340))

(assert (not b!62326))

(assert (not b!62339))

(assert (not b!62333))

(assert (not b!62342))

(assert (not b!62336))

(assert (not b!62331))

(assert (not start!12228))

(assert (not b!62338))

(assert (not b!62327))

(assert (not b!62329))

(assert (not b!62337))

(assert (not b!62330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19292 () Bool)

(declare-fun size!1278 (List!684) Int)

(assert (=> d!19292 (= (length!312 lt!97896) (size!1278 lt!97896))))

(declare-fun bs!4794 () Bool)

(assert (= bs!4794 d!19292))

(declare-fun m!98823 () Bool)

(assert (=> bs!4794 m!98823))

(assert (=> b!62332 d!19292))

(declare-fun d!19294 () Bool)

(declare-fun res!52003 () Bool)

(declare-fun e!41510 () Bool)

(assert (=> d!19294 (=> (not res!52003) (not e!41510))))

(assert (=> d!19294 (= res!52003 (= (size!1274 (buf!1655 (_1!2927 lt!97894))) (size!1274 (buf!1655 (_2!2926 lt!97888)))))))

(assert (=> d!19294 (= (isPrefixOf!0 (_1!2927 lt!97894) (_2!2926 lt!97888)) e!41510)))

(declare-fun b!62480 () Bool)

(declare-fun res!52005 () Bool)

(assert (=> b!62480 (=> (not res!52005) (not e!41510))))

(assert (=> b!62480 (= res!52005 (bvsle (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97894))) (currentByte!3291 (_1!2927 lt!97894)) (currentBit!3286 (_1!2927 lt!97894))) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888)))))))

(declare-fun b!62481 () Bool)

(declare-fun e!41509 () Bool)

(assert (=> b!62481 (= e!41510 e!41509)))

(declare-fun res!52004 () Bool)

(assert (=> b!62481 (=> res!52004 e!41509)))

(assert (=> b!62481 (= res!52004 (= (size!1274 (buf!1655 (_1!2927 lt!97894))) #b00000000000000000000000000000000))))

(declare-fun b!62482 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2788 array!2788 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62482 (= e!41509 (arrayBitRangesEq!0 (buf!1655 (_1!2927 lt!97894)) (buf!1655 (_2!2926 lt!97888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97894))) (currentByte!3291 (_1!2927 lt!97894)) (currentBit!3286 (_1!2927 lt!97894)))))))

(assert (= (and d!19294 res!52003) b!62480))

(assert (= (and b!62480 res!52005) b!62481))

(assert (= (and b!62481 (not res!52004)) b!62482))

(declare-fun m!98825 () Bool)

(assert (=> b!62480 m!98825))

(assert (=> b!62480 m!98589))

(assert (=> b!62482 m!98825))

(assert (=> b!62482 m!98825))

(declare-fun m!98827 () Bool)

(assert (=> b!62482 m!98827))

(assert (=> b!62334 d!19294))

(declare-fun d!19296 () Bool)

(assert (=> d!19296 (isPrefixOf!0 thiss!1379 (_2!2926 lt!97888))))

(declare-fun lt!98023 () Unit!4243)

(declare-fun choose!30 (BitStream!2218 BitStream!2218 BitStream!2218) Unit!4243)

(assert (=> d!19296 (= lt!98023 (choose!30 thiss!1379 (_2!2926 lt!97890) (_2!2926 lt!97888)))))

(assert (=> d!19296 (isPrefixOf!0 thiss!1379 (_2!2926 lt!97890))))

(assert (=> d!19296 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2926 lt!97890) (_2!2926 lt!97888)) lt!98023)))

(declare-fun bs!4795 () Bool)

(assert (= bs!4795 d!19296))

(assert (=> bs!4795 m!98625))

(declare-fun m!98829 () Bool)

(assert (=> bs!4795 m!98829))

(assert (=> bs!4795 m!98629))

(assert (=> b!62333 d!19296))

(declare-fun b!62493 () Bool)

(declare-fun e!41516 () Unit!4243)

(declare-fun lt!98079 () Unit!4243)

(assert (=> b!62493 (= e!41516 lt!98079)))

(declare-fun lt!98065 () (_ BitVec 64))

(assert (=> b!62493 (= lt!98065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98081 () (_ BitVec 64))

(assert (=> b!62493 (= lt!98081 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2788 array!2788 (_ BitVec 64) (_ BitVec 64)) Unit!4243)

(assert (=> b!62493 (= lt!98079 (arrayBitRangesEqSymmetric!0 (buf!1655 thiss!1379) (buf!1655 (_2!2926 lt!97890)) lt!98065 lt!98081))))

(assert (=> b!62493 (arrayBitRangesEq!0 (buf!1655 (_2!2926 lt!97890)) (buf!1655 thiss!1379) lt!98065 lt!98081)))

(declare-fun d!19298 () Bool)

(declare-fun e!41515 () Bool)

(assert (=> d!19298 e!41515))

(declare-fun res!52014 () Bool)

(assert (=> d!19298 (=> (not res!52014) (not e!41515))))

(declare-fun lt!98074 () tuple2!5632)

(assert (=> d!19298 (= res!52014 (isPrefixOf!0 (_1!2927 lt!98074) (_2!2927 lt!98074)))))

(declare-fun lt!98068 () BitStream!2218)

(assert (=> d!19298 (= lt!98074 (tuple2!5633 lt!98068 (_2!2926 lt!97890)))))

(declare-fun lt!98073 () Unit!4243)

(declare-fun lt!98071 () Unit!4243)

(assert (=> d!19298 (= lt!98073 lt!98071)))

(assert (=> d!19298 (isPrefixOf!0 lt!98068 (_2!2926 lt!97890))))

(assert (=> d!19298 (= lt!98071 (lemmaIsPrefixTransitive!0 lt!98068 (_2!2926 lt!97890) (_2!2926 lt!97890)))))

(declare-fun lt!98080 () Unit!4243)

(declare-fun lt!98064 () Unit!4243)

(assert (=> d!19298 (= lt!98080 lt!98064)))

(assert (=> d!19298 (isPrefixOf!0 lt!98068 (_2!2926 lt!97890))))

(assert (=> d!19298 (= lt!98064 (lemmaIsPrefixTransitive!0 lt!98068 thiss!1379 (_2!2926 lt!97890)))))

(declare-fun lt!98066 () Unit!4243)

(assert (=> d!19298 (= lt!98066 e!41516)))

(declare-fun c!4419 () Bool)

(assert (=> d!19298 (= c!4419 (not (= (size!1274 (buf!1655 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!98069 () Unit!4243)

(declare-fun lt!98072 () Unit!4243)

(assert (=> d!19298 (= lt!98069 lt!98072)))

(assert (=> d!19298 (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!97890))))

(assert (=> d!19298 (= lt!98072 (lemmaIsPrefixRefl!0 (_2!2926 lt!97890)))))

(declare-fun lt!98075 () Unit!4243)

(declare-fun lt!98076 () Unit!4243)

(assert (=> d!19298 (= lt!98075 lt!98076)))

(assert (=> d!19298 (= lt!98076 (lemmaIsPrefixRefl!0 (_2!2926 lt!97890)))))

(declare-fun lt!98078 () Unit!4243)

(declare-fun lt!98083 () Unit!4243)

(assert (=> d!19298 (= lt!98078 lt!98083)))

(assert (=> d!19298 (isPrefixOf!0 lt!98068 lt!98068)))

(assert (=> d!19298 (= lt!98083 (lemmaIsPrefixRefl!0 lt!98068))))

(declare-fun lt!98077 () Unit!4243)

(declare-fun lt!98070 () Unit!4243)

(assert (=> d!19298 (= lt!98077 lt!98070)))

(assert (=> d!19298 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19298 (= lt!98070 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19298 (= lt!98068 (BitStream!2219 (buf!1655 (_2!2926 lt!97890)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(assert (=> d!19298 (isPrefixOf!0 thiss!1379 (_2!2926 lt!97890))))

(assert (=> d!19298 (= (reader!0 thiss!1379 (_2!2926 lt!97890)) lt!98074)))

(declare-fun b!62494 () Bool)

(declare-fun res!52012 () Bool)

(assert (=> b!62494 (=> (not res!52012) (not e!41515))))

(assert (=> b!62494 (= res!52012 (isPrefixOf!0 (_2!2927 lt!98074) (_2!2926 lt!97890)))))

(declare-fun b!62495 () Bool)

(declare-fun lt!98067 () (_ BitVec 64))

(declare-fun lt!98082 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2218 (_ BitVec 64)) BitStream!2218)

(assert (=> b!62495 (= e!41515 (= (_1!2927 lt!98074) (withMovedBitIndex!0 (_2!2927 lt!98074) (bvsub lt!98082 lt!98067))))))

(assert (=> b!62495 (or (= (bvand lt!98082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98082 lt!98067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62495 (= lt!98067 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))))))

(assert (=> b!62495 (= lt!98082 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(declare-fun b!62496 () Bool)

(declare-fun Unit!4259 () Unit!4243)

(assert (=> b!62496 (= e!41516 Unit!4259)))

(declare-fun b!62497 () Bool)

(declare-fun res!52013 () Bool)

(assert (=> b!62497 (=> (not res!52013) (not e!41515))))

(assert (=> b!62497 (= res!52013 (isPrefixOf!0 (_1!2927 lt!98074) thiss!1379))))

(assert (= (and d!19298 c!4419) b!62493))

(assert (= (and d!19298 (not c!4419)) b!62496))

(assert (= (and d!19298 res!52014) b!62497))

(assert (= (and b!62497 res!52013) b!62494))

(assert (= (and b!62494 res!52012) b!62495))

(declare-fun m!98831 () Bool)

(assert (=> b!62495 m!98831))

(assert (=> b!62495 m!98643))

(assert (=> b!62495 m!98587))

(declare-fun m!98833 () Bool)

(assert (=> b!62497 m!98833))

(assert (=> b!62493 m!98587))

(declare-fun m!98835 () Bool)

(assert (=> b!62493 m!98835))

(declare-fun m!98837 () Bool)

(assert (=> b!62493 m!98837))

(declare-fun m!98839 () Bool)

(assert (=> d!19298 m!98839))

(declare-fun m!98841 () Bool)

(assert (=> d!19298 m!98841))

(declare-fun m!98843 () Bool)

(assert (=> d!19298 m!98843))

(assert (=> d!19298 m!98585))

(declare-fun m!98845 () Bool)

(assert (=> d!19298 m!98845))

(declare-fun m!98847 () Bool)

(assert (=> d!19298 m!98847))

(assert (=> d!19298 m!98629))

(declare-fun m!98849 () Bool)

(assert (=> d!19298 m!98849))

(declare-fun m!98851 () Bool)

(assert (=> d!19298 m!98851))

(declare-fun m!98853 () Bool)

(assert (=> d!19298 m!98853))

(assert (=> d!19298 m!98583))

(declare-fun m!98855 () Bool)

(assert (=> b!62494 m!98855))

(assert (=> b!62333 d!19298))

(declare-fun d!19300 () Bool)

(declare-fun res!52015 () Bool)

(declare-fun e!41518 () Bool)

(assert (=> d!19300 (=> (not res!52015) (not e!41518))))

(assert (=> d!19300 (= res!52015 (= (size!1274 (buf!1655 (_2!2926 lt!97890))) (size!1274 (buf!1655 (_2!2926 lt!97888)))))))

(assert (=> d!19300 (= (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!97888)) e!41518)))

(declare-fun b!62498 () Bool)

(declare-fun res!52017 () Bool)

(assert (=> b!62498 (=> (not res!52017) (not e!41518))))

(assert (=> b!62498 (= res!52017 (bvsle (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888)))))))

(declare-fun b!62499 () Bool)

(declare-fun e!41517 () Bool)

(assert (=> b!62499 (= e!41518 e!41517)))

(declare-fun res!52016 () Bool)

(assert (=> b!62499 (=> res!52016 e!41517)))

(assert (=> b!62499 (= res!52016 (= (size!1274 (buf!1655 (_2!2926 lt!97890))) #b00000000000000000000000000000000))))

(declare-fun b!62500 () Bool)

(assert (=> b!62500 (= e!41517 (arrayBitRangesEq!0 (buf!1655 (_2!2926 lt!97890)) (buf!1655 (_2!2926 lt!97888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890)))))))

(assert (= (and d!19300 res!52015) b!62498))

(assert (= (and b!62498 res!52017) b!62499))

(assert (= (and b!62499 (not res!52016)) b!62500))

(assert (=> b!62498 m!98643))

(assert (=> b!62498 m!98589))

(assert (=> b!62500 m!98643))

(assert (=> b!62500 m!98643))

(declare-fun m!98857 () Bool)

(assert (=> b!62500 m!98857))

(assert (=> b!62333 d!19300))

(declare-fun d!19302 () Bool)

(declare-fun res!52018 () Bool)

(declare-fun e!41520 () Bool)

(assert (=> d!19302 (=> (not res!52018) (not e!41520))))

(assert (=> d!19302 (= res!52018 (= (size!1274 (buf!1655 thiss!1379)) (size!1274 (buf!1655 (_2!2926 lt!97888)))))))

(assert (=> d!19302 (= (isPrefixOf!0 thiss!1379 (_2!2926 lt!97888)) e!41520)))

(declare-fun b!62501 () Bool)

(declare-fun res!52020 () Bool)

(assert (=> b!62501 (=> (not res!52020) (not e!41520))))

(assert (=> b!62501 (= res!52020 (bvsle (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888)))))))

(declare-fun b!62502 () Bool)

(declare-fun e!41519 () Bool)

(assert (=> b!62502 (= e!41520 e!41519)))

(declare-fun res!52019 () Bool)

(assert (=> b!62502 (=> res!52019 e!41519)))

(assert (=> b!62502 (= res!52019 (= (size!1274 (buf!1655 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62503 () Bool)

(assert (=> b!62503 (= e!41519 (arrayBitRangesEq!0 (buf!1655 thiss!1379) (buf!1655 (_2!2926 lt!97888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379))))))

(assert (= (and d!19302 res!52018) b!62501))

(assert (= (and b!62501 res!52020) b!62502))

(assert (= (and b!62502 (not res!52019)) b!62503))

(assert (=> b!62501 m!98587))

(assert (=> b!62501 m!98589))

(assert (=> b!62503 m!98587))

(assert (=> b!62503 m!98587))

(declare-fun m!98859 () Bool)

(assert (=> b!62503 m!98859))

(assert (=> b!62333 d!19302))

(declare-fun d!19304 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4796 () Bool)

(assert (= bs!4796 d!19304))

(declare-fun m!98861 () Bool)

(assert (=> bs!4796 m!98861))

(assert (=> b!62333 d!19304))

(declare-fun b!62700 () Bool)

(declare-fun res!52149 () Bool)

(declare-fun e!41621 () Bool)

(assert (=> b!62700 (=> (not res!52149) (not e!41621))))

(declare-fun lt!98561 () tuple2!5630)

(assert (=> b!62700 (= res!52149 (= (size!1274 (buf!1655 (_2!2926 lt!97890))) (size!1274 (buf!1655 (_2!2926 lt!98561)))))))

(declare-fun lt!98558 () tuple2!5630)

(declare-fun bm!793 () Bool)

(declare-fun lt!98571 () tuple2!5630)

(declare-fun call!796 () tuple2!5632)

(declare-fun c!4454 () Bool)

(assert (=> bm!793 (= call!796 (reader!0 (ite c!4454 (_2!2926 lt!98558) (_2!2926 lt!97890)) (ite c!4454 (_2!2926 lt!98571) (_2!2926 lt!97890))))))

(declare-fun d!19306 () Bool)

(assert (=> d!19306 e!41621))

(declare-fun res!52153 () Bool)

(assert (=> d!19306 (=> (not res!52153) (not e!41621))))

(declare-fun lt!98559 () (_ BitVec 64))

(assert (=> d!19306 (= res!52153 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98561))) (currentByte!3291 (_2!2926 lt!98561)) (currentBit!3286 (_2!2926 lt!98561))) (bvsub lt!98559 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19306 (or (= (bvand lt!98559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98559 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!98569 () (_ BitVec 64))

(assert (=> d!19306 (= lt!98559 (bvadd lt!98569 to!314))))

(assert (=> d!19306 (or (not (= (bvand lt!98569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!98569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!98569 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19306 (= lt!98569 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))))))

(declare-fun e!41619 () tuple2!5630)

(assert (=> d!19306 (= lt!98561 e!41619)))

(assert (=> d!19306 (= c!4454 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!98566 () Unit!4243)

(declare-fun lt!98555 () Unit!4243)

(assert (=> d!19306 (= lt!98566 lt!98555)))

(assert (=> d!19306 (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!97890))))

(assert (=> d!19306 (= lt!98555 (lemmaIsPrefixRefl!0 (_2!2926 lt!97890)))))

(declare-fun lt!98588 () (_ BitVec 64))

(assert (=> d!19306 (= lt!98588 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))))))

(assert (=> d!19306 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19306 (= (appendBitsMSBFirstLoop!0 (_2!2926 lt!97890) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!98561)))

(declare-fun b!62701 () Bool)

(declare-fun Unit!4260 () Unit!4243)

(assert (=> b!62701 (= e!41619 (tuple2!5631 Unit!4260 (_2!2926 lt!98571)))))

(assert (=> b!62701 (= lt!98558 (appendBitFromByte!0 (_2!2926 lt!97890) (select (arr!1838 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!98580 () (_ BitVec 64))

(assert (=> b!62701 (= lt!98580 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98587 () (_ BitVec 64))

(assert (=> b!62701 (= lt!98587 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98589 () Unit!4243)

(assert (=> b!62701 (= lt!98589 (validateOffsetBitsIneqLemma!0 (_2!2926 lt!97890) (_2!2926 lt!98558) lt!98580 lt!98587))))

(assert (=> b!62701 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!98558)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!98558))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!98558))) (bvsub lt!98580 lt!98587))))

(declare-fun lt!98562 () Unit!4243)

(assert (=> b!62701 (= lt!98562 lt!98589)))

(declare-fun lt!98579 () tuple2!5632)

(assert (=> b!62701 (= lt!98579 (reader!0 (_2!2926 lt!97890) (_2!2926 lt!98558)))))

(declare-fun lt!98565 () (_ BitVec 64))

(assert (=> b!62701 (= lt!98565 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98554 () Unit!4243)

(assert (=> b!62701 (= lt!98554 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2926 lt!97890) (buf!1655 (_2!2926 lt!98558)) lt!98565))))

(assert (=> b!62701 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!98558)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!98565)))

(declare-fun lt!98596 () Unit!4243)

(assert (=> b!62701 (= lt!98596 lt!98554)))

(assert (=> b!62701 (= (head!503 (byteArrayBitContentToList!0 (_2!2926 lt!98558) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!503 (bitStreamReadBitsIntoList!0 (_2!2926 lt!98558) (_1!2927 lt!98579) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98593 () Unit!4243)

(declare-fun Unit!4261 () Unit!4243)

(assert (=> b!62701 (= lt!98593 Unit!4261)))

(assert (=> b!62701 (= lt!98571 (appendBitsMSBFirstLoop!0 (_2!2926 lt!98558) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!98573 () Unit!4243)

(assert (=> b!62701 (= lt!98573 (lemmaIsPrefixTransitive!0 (_2!2926 lt!97890) (_2!2926 lt!98558) (_2!2926 lt!98571)))))

(assert (=> b!62701 (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!98571))))

(declare-fun lt!98576 () Unit!4243)

(assert (=> b!62701 (= lt!98576 lt!98573)))

(assert (=> b!62701 (= (size!1274 (buf!1655 (_2!2926 lt!98571))) (size!1274 (buf!1655 (_2!2926 lt!97890))))))

(declare-fun lt!98591 () Unit!4243)

(declare-fun Unit!4262 () Unit!4243)

(assert (=> b!62701 (= lt!98591 Unit!4262)))

(assert (=> b!62701 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98571))) (currentByte!3291 (_2!2926 lt!98571)) (currentBit!3286 (_2!2926 lt!98571))) (bvsub (bvadd (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98584 () Unit!4243)

(declare-fun Unit!4263 () Unit!4243)

(assert (=> b!62701 (= lt!98584 Unit!4263)))

(assert (=> b!62701 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98571))) (currentByte!3291 (_2!2926 lt!98571)) (currentBit!3286 (_2!2926 lt!98571))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98558))) (currentByte!3291 (_2!2926 lt!98558)) (currentBit!3286 (_2!2926 lt!98558))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!98568 () Unit!4243)

(declare-fun Unit!4264 () Unit!4243)

(assert (=> b!62701 (= lt!98568 Unit!4264)))

(declare-fun lt!98560 () tuple2!5632)

(assert (=> b!62701 (= lt!98560 (reader!0 (_2!2926 lt!97890) (_2!2926 lt!98571)))))

(declare-fun lt!98563 () (_ BitVec 64))

(assert (=> b!62701 (= lt!98563 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98581 () Unit!4243)

(assert (=> b!62701 (= lt!98581 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2926 lt!97890) (buf!1655 (_2!2926 lt!98571)) lt!98563))))

(assert (=> b!62701 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!98571)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!98563)))

(declare-fun lt!98557 () Unit!4243)

(assert (=> b!62701 (= lt!98557 lt!98581)))

(declare-fun lt!98585 () tuple2!5632)

(assert (=> b!62701 (= lt!98585 call!796)))

(declare-fun lt!98575 () (_ BitVec 64))

(assert (=> b!62701 (= lt!98575 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!98578 () Unit!4243)

(assert (=> b!62701 (= lt!98578 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2926 lt!98558) (buf!1655 (_2!2926 lt!98571)) lt!98575))))

(assert (=> b!62701 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!98571)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!98558))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!98558))) lt!98575)))

(declare-fun lt!98586 () Unit!4243)

(assert (=> b!62701 (= lt!98586 lt!98578)))

(declare-fun lt!98590 () List!684)

(assert (=> b!62701 (= lt!98590 (byteArrayBitContentToList!0 (_2!2926 lt!98571) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!98556 () List!684)

(assert (=> b!62701 (= lt!98556 (byteArrayBitContentToList!0 (_2!2926 lt!98571) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98583 () List!684)

(assert (=> b!62701 (= lt!98583 (bitStreamReadBitsIntoList!0 (_2!2926 lt!98571) (_1!2927 lt!98560) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!98597 () List!684)

(assert (=> b!62701 (= lt!98597 (bitStreamReadBitsIntoList!0 (_2!2926 lt!98571) (_1!2927 lt!98585) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98594 () (_ BitVec 64))

(assert (=> b!62701 (= lt!98594 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98595 () Unit!4243)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2218 BitStream!2218 BitStream!2218 BitStream!2218 (_ BitVec 64) List!684) Unit!4243)

(assert (=> b!62701 (= lt!98595 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2926 lt!98571) (_2!2926 lt!98571) (_1!2927 lt!98560) (_1!2927 lt!98585) lt!98594 lt!98583))))

(declare-fun tail!292 (List!684) List!684)

(assert (=> b!62701 (= (bitStreamReadBitsIntoList!0 (_2!2926 lt!98571) (_1!2927 lt!98585) (bvsub lt!98594 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!292 lt!98583))))

(declare-fun lt!98567 () Unit!4243)

(assert (=> b!62701 (= lt!98567 lt!98595)))

(declare-fun lt!98582 () Unit!4243)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2788 array!2788 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4243)

(assert (=> b!62701 (= lt!98582 (arrayBitRangesEqImpliesEq!0 (buf!1655 (_2!2926 lt!98558)) (buf!1655 (_2!2926 lt!98571)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!98588 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98558))) (currentByte!3291 (_2!2926 lt!98558)) (currentBit!3286 (_2!2926 lt!98558)))))))

(declare-fun bitAt!0 (array!2788 (_ BitVec 64)) Bool)

(assert (=> b!62701 (= (bitAt!0 (buf!1655 (_2!2926 lt!98558)) lt!98588) (bitAt!0 (buf!1655 (_2!2926 lt!98571)) lt!98588))))

(declare-fun lt!98577 () Unit!4243)

(assert (=> b!62701 (= lt!98577 lt!98582)))

(declare-fun b!62702 () Bool)

(declare-fun Unit!4265 () Unit!4243)

(assert (=> b!62702 (= e!41619 (tuple2!5631 Unit!4265 (_2!2926 lt!97890)))))

(assert (=> b!62702 (= (size!1274 (buf!1655 (_2!2926 lt!97890))) (size!1274 (buf!1655 (_2!2926 lt!97890))))))

(declare-fun lt!98574 () Unit!4243)

(declare-fun Unit!4266 () Unit!4243)

(assert (=> b!62702 (= lt!98574 Unit!4266)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2218 array!2788 array!2788 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5650 0))(
  ( (tuple2!5651 (_1!2936 array!2788) (_2!2936 BitStream!2218)) )
))
(declare-fun readBits!0 (BitStream!2218 (_ BitVec 64)) tuple2!5650)

(assert (=> b!62702 (checkByteArrayBitContent!0 (_2!2926 lt!97890) srcBuffer!2 (_1!2936 (readBits!0 (_1!2927 call!796) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!62703 () Bool)

(declare-fun e!41620 () Bool)

(declare-fun lt!98570 () (_ BitVec 64))

(assert (=> b!62703 (= e!41620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!98570))))

(declare-fun lt!98564 () tuple2!5632)

(declare-fun b!62704 () Bool)

(assert (=> b!62704 (= e!41621 (= (bitStreamReadBitsIntoList!0 (_2!2926 lt!98561) (_1!2927 lt!98564) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2926 lt!98561) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!62704 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62704 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!98572 () Unit!4243)

(declare-fun lt!98592 () Unit!4243)

(assert (=> b!62704 (= lt!98572 lt!98592)))

(assert (=> b!62704 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!98561)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!98570)))

(assert (=> b!62704 (= lt!98592 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2926 lt!97890) (buf!1655 (_2!2926 lt!98561)) lt!98570))))

(assert (=> b!62704 e!41620))

(declare-fun res!52148 () Bool)

(assert (=> b!62704 (=> (not res!52148) (not e!41620))))

(assert (=> b!62704 (= res!52148 (and (= (size!1274 (buf!1655 (_2!2926 lt!97890))) (size!1274 (buf!1655 (_2!2926 lt!98561)))) (bvsge lt!98570 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62704 (= lt!98570 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!62704 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62704 (= lt!98564 (reader!0 (_2!2926 lt!97890) (_2!2926 lt!98561)))))

(declare-fun b!62705 () Bool)

(declare-fun res!52151 () Bool)

(assert (=> b!62705 (=> (not res!52151) (not e!41621))))

(assert (=> b!62705 (= res!52151 (= (size!1274 (buf!1655 (_2!2926 lt!98561))) (size!1274 (buf!1655 (_2!2926 lt!97890)))))))

(declare-fun b!62706 () Bool)

(declare-fun res!52150 () Bool)

(assert (=> b!62706 (=> (not res!52150) (not e!41621))))

(assert (=> b!62706 (= res!52150 (invariant!0 (currentBit!3286 (_2!2926 lt!98561)) (currentByte!3291 (_2!2926 lt!98561)) (size!1274 (buf!1655 (_2!2926 lt!98561)))))))

(declare-fun b!62707 () Bool)

(declare-fun res!52152 () Bool)

(assert (=> b!62707 (=> (not res!52152) (not e!41621))))

(assert (=> b!62707 (= res!52152 (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!98561)))))

(assert (= (and d!19306 c!4454) b!62701))

(assert (= (and d!19306 (not c!4454)) b!62702))

(assert (= (or b!62701 b!62702) bm!793))

(assert (= (and d!19306 res!52153) b!62706))

(assert (= (and b!62706 res!52150) b!62700))

(assert (= (and b!62700 res!52149) b!62707))

(assert (= (and b!62707 res!52152) b!62705))

(assert (= (and b!62705 res!52151) b!62704))

(assert (= (and b!62704 res!52148) b!62703))

(declare-fun m!99161 () Bool)

(assert (=> bm!793 m!99161))

(declare-fun m!99163 () Bool)

(assert (=> b!62703 m!99163))

(declare-fun m!99165 () Bool)

(assert (=> b!62704 m!99165))

(declare-fun m!99167 () Bool)

(assert (=> b!62704 m!99167))

(declare-fun m!99169 () Bool)

(assert (=> b!62704 m!99169))

(declare-fun m!99171 () Bool)

(assert (=> b!62704 m!99171))

(declare-fun m!99173 () Bool)

(assert (=> b!62704 m!99173))

(declare-fun m!99175 () Bool)

(assert (=> b!62707 m!99175))

(declare-fun m!99177 () Bool)

(assert (=> b!62702 m!99177))

(declare-fun m!99179 () Bool)

(assert (=> b!62702 m!99179))

(declare-fun m!99181 () Bool)

(assert (=> b!62706 m!99181))

(declare-fun m!99183 () Bool)

(assert (=> b!62701 m!99183))

(declare-fun m!99185 () Bool)

(assert (=> b!62701 m!99185))

(declare-fun m!99187 () Bool)

(assert (=> b!62701 m!99187))

(declare-fun m!99189 () Bool)

(assert (=> b!62701 m!99189))

(declare-fun m!99191 () Bool)

(assert (=> b!62701 m!99191))

(declare-fun m!99193 () Bool)

(assert (=> b!62701 m!99193))

(declare-fun m!99195 () Bool)

(assert (=> b!62701 m!99195))

(declare-fun m!99197 () Bool)

(assert (=> b!62701 m!99197))

(declare-fun m!99199 () Bool)

(assert (=> b!62701 m!99199))

(assert (=> b!62701 m!98643))

(declare-fun m!99201 () Bool)

(assert (=> b!62701 m!99201))

(declare-fun m!99203 () Bool)

(assert (=> b!62701 m!99203))

(declare-fun m!99205 () Bool)

(assert (=> b!62701 m!99205))

(declare-fun m!99207 () Bool)

(assert (=> b!62701 m!99207))

(declare-fun m!99209 () Bool)

(assert (=> b!62701 m!99209))

(declare-fun m!99211 () Bool)

(assert (=> b!62701 m!99211))

(declare-fun m!99213 () Bool)

(assert (=> b!62701 m!99213))

(declare-fun m!99215 () Bool)

(assert (=> b!62701 m!99215))

(declare-fun m!99217 () Bool)

(assert (=> b!62701 m!99217))

(declare-fun m!99219 () Bool)

(assert (=> b!62701 m!99219))

(declare-fun m!99221 () Bool)

(assert (=> b!62701 m!99221))

(declare-fun m!99223 () Bool)

(assert (=> b!62701 m!99223))

(declare-fun m!99225 () Bool)

(assert (=> b!62701 m!99225))

(declare-fun m!99227 () Bool)

(assert (=> b!62701 m!99227))

(declare-fun m!99229 () Bool)

(assert (=> b!62701 m!99229))

(assert (=> b!62701 m!99191))

(declare-fun m!99231 () Bool)

(assert (=> b!62701 m!99231))

(assert (=> b!62701 m!99225))

(declare-fun m!99233 () Bool)

(assert (=> b!62701 m!99233))

(declare-fun m!99235 () Bool)

(assert (=> b!62701 m!99235))

(declare-fun m!99237 () Bool)

(assert (=> b!62701 m!99237))

(declare-fun m!99239 () Bool)

(assert (=> b!62701 m!99239))

(declare-fun m!99241 () Bool)

(assert (=> b!62701 m!99241))

(assert (=> b!62701 m!99237))

(assert (=> b!62701 m!99189))

(declare-fun m!99243 () Bool)

(assert (=> b!62701 m!99243))

(declare-fun m!99245 () Bool)

(assert (=> d!19306 m!99245))

(assert (=> d!19306 m!98643))

(assert (=> d!19306 m!98839))

(assert (=> d!19306 m!98853))

(assert (=> b!62333 d!19306))

(declare-fun d!19416 () Bool)

(assert (=> d!19416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98624 () Unit!4243)

(declare-fun choose!9 (BitStream!2218 array!2788 (_ BitVec 64) BitStream!2218) Unit!4243)

(assert (=> d!19416 (= lt!98624 (choose!9 thiss!1379 (buf!1655 (_2!2926 lt!97890)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2219 (buf!1655 (_2!2926 lt!97890)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379))))))

(assert (=> d!19416 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1655 (_2!2926 lt!97890)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98624)))

(declare-fun bs!4813 () Bool)

(assert (= bs!4813 d!19416))

(assert (=> bs!4813 m!98619))

(declare-fun m!99247 () Bool)

(assert (=> bs!4813 m!99247))

(assert (=> b!62333 d!19416))

(declare-fun d!19418 () Bool)

(assert (=> d!19418 (= (array_inv!1168 srcBuffer!2) (bvsge (size!1274 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12228 d!19418))

(declare-fun d!19420 () Bool)

(assert (=> d!19420 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3286 thiss!1379) (currentByte!3291 thiss!1379) (size!1274 (buf!1655 thiss!1379))))))

(declare-fun bs!4814 () Bool)

(assert (= bs!4814 d!19420))

(declare-fun m!99249 () Bool)

(assert (=> bs!4814 m!99249))

(assert (=> start!12228 d!19420))

(declare-fun b!62725 () Bool)

(declare-fun e!41631 () Unit!4243)

(declare-fun lt!98640 () Unit!4243)

(assert (=> b!62725 (= e!41631 lt!98640)))

(declare-fun lt!98626 () (_ BitVec 64))

(assert (=> b!62725 (= lt!98626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98642 () (_ BitVec 64))

(assert (=> b!62725 (= lt!98642 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))))))

(assert (=> b!62725 (= lt!98640 (arrayBitRangesEqSymmetric!0 (buf!1655 (_2!2926 lt!97890)) (buf!1655 (_2!2926 lt!97888)) lt!98626 lt!98642))))

(assert (=> b!62725 (arrayBitRangesEq!0 (buf!1655 (_2!2926 lt!97888)) (buf!1655 (_2!2926 lt!97890)) lt!98626 lt!98642)))

(declare-fun d!19422 () Bool)

(declare-fun e!41630 () Bool)

(assert (=> d!19422 e!41630))

(declare-fun res!52172 () Bool)

(assert (=> d!19422 (=> (not res!52172) (not e!41630))))

(declare-fun lt!98635 () tuple2!5632)

(assert (=> d!19422 (= res!52172 (isPrefixOf!0 (_1!2927 lt!98635) (_2!2927 lt!98635)))))

(declare-fun lt!98629 () BitStream!2218)

(assert (=> d!19422 (= lt!98635 (tuple2!5633 lt!98629 (_2!2926 lt!97888)))))

(declare-fun lt!98634 () Unit!4243)

(declare-fun lt!98632 () Unit!4243)

(assert (=> d!19422 (= lt!98634 lt!98632)))

(assert (=> d!19422 (isPrefixOf!0 lt!98629 (_2!2926 lt!97888))))

(assert (=> d!19422 (= lt!98632 (lemmaIsPrefixTransitive!0 lt!98629 (_2!2926 lt!97888) (_2!2926 lt!97888)))))

(declare-fun lt!98641 () Unit!4243)

(declare-fun lt!98625 () Unit!4243)

(assert (=> d!19422 (= lt!98641 lt!98625)))

(assert (=> d!19422 (isPrefixOf!0 lt!98629 (_2!2926 lt!97888))))

(assert (=> d!19422 (= lt!98625 (lemmaIsPrefixTransitive!0 lt!98629 (_2!2926 lt!97890) (_2!2926 lt!97888)))))

(declare-fun lt!98627 () Unit!4243)

(assert (=> d!19422 (= lt!98627 e!41631)))

(declare-fun c!4455 () Bool)

(assert (=> d!19422 (= c!4455 (not (= (size!1274 (buf!1655 (_2!2926 lt!97890))) #b00000000000000000000000000000000)))))

(declare-fun lt!98630 () Unit!4243)

(declare-fun lt!98633 () Unit!4243)

(assert (=> d!19422 (= lt!98630 lt!98633)))

(assert (=> d!19422 (isPrefixOf!0 (_2!2926 lt!97888) (_2!2926 lt!97888))))

(assert (=> d!19422 (= lt!98633 (lemmaIsPrefixRefl!0 (_2!2926 lt!97888)))))

(declare-fun lt!98636 () Unit!4243)

(declare-fun lt!98637 () Unit!4243)

(assert (=> d!19422 (= lt!98636 lt!98637)))

(assert (=> d!19422 (= lt!98637 (lemmaIsPrefixRefl!0 (_2!2926 lt!97888)))))

(declare-fun lt!98639 () Unit!4243)

(declare-fun lt!98644 () Unit!4243)

(assert (=> d!19422 (= lt!98639 lt!98644)))

(assert (=> d!19422 (isPrefixOf!0 lt!98629 lt!98629)))

(assert (=> d!19422 (= lt!98644 (lemmaIsPrefixRefl!0 lt!98629))))

(declare-fun lt!98638 () Unit!4243)

(declare-fun lt!98631 () Unit!4243)

(assert (=> d!19422 (= lt!98638 lt!98631)))

(assert (=> d!19422 (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!97890))))

(assert (=> d!19422 (= lt!98631 (lemmaIsPrefixRefl!0 (_2!2926 lt!97890)))))

(assert (=> d!19422 (= lt!98629 (BitStream!2219 (buf!1655 (_2!2926 lt!97888)) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))))))

(assert (=> d!19422 (isPrefixOf!0 (_2!2926 lt!97890) (_2!2926 lt!97888))))

(assert (=> d!19422 (= (reader!0 (_2!2926 lt!97890) (_2!2926 lt!97888)) lt!98635)))

(declare-fun b!62726 () Bool)

(declare-fun res!52170 () Bool)

(assert (=> b!62726 (=> (not res!52170) (not e!41630))))

(assert (=> b!62726 (= res!52170 (isPrefixOf!0 (_2!2927 lt!98635) (_2!2926 lt!97888)))))

(declare-fun b!62727 () Bool)

(declare-fun lt!98628 () (_ BitVec 64))

(declare-fun lt!98643 () (_ BitVec 64))

(assert (=> b!62727 (= e!41630 (= (_1!2927 lt!98635) (withMovedBitIndex!0 (_2!2927 lt!98635) (bvsub lt!98643 lt!98628))))))

(assert (=> b!62727 (or (= (bvand lt!98643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98643 lt!98628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62727 (= lt!98628 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888))))))

(assert (=> b!62727 (= lt!98643 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))))))

(declare-fun b!62728 () Bool)

(declare-fun Unit!4267 () Unit!4243)

(assert (=> b!62728 (= e!41631 Unit!4267)))

(declare-fun b!62729 () Bool)

(declare-fun res!52171 () Bool)

(assert (=> b!62729 (=> (not res!52171) (not e!41630))))

(assert (=> b!62729 (= res!52171 (isPrefixOf!0 (_1!2927 lt!98635) (_2!2926 lt!97890)))))

(assert (= (and d!19422 c!4455) b!62725))

(assert (= (and d!19422 (not c!4455)) b!62728))

(assert (= (and d!19422 res!52172) b!62729))

(assert (= (and b!62729 res!52171) b!62726))

(assert (= (and b!62726 res!52170) b!62727))

(declare-fun m!99251 () Bool)

(assert (=> b!62727 m!99251))

(assert (=> b!62727 m!98589))

(assert (=> b!62727 m!98643))

(declare-fun m!99253 () Bool)

(assert (=> b!62729 m!99253))

(assert (=> b!62725 m!98643))

(declare-fun m!99255 () Bool)

(assert (=> b!62725 m!99255))

(declare-fun m!99257 () Bool)

(assert (=> b!62725 m!99257))

(declare-fun m!99259 () Bool)

(assert (=> d!19422 m!99259))

(declare-fun m!99261 () Bool)

(assert (=> d!19422 m!99261))

(declare-fun m!99263 () Bool)

(assert (=> d!19422 m!99263))

(assert (=> d!19422 m!98853))

(declare-fun m!99265 () Bool)

(assert (=> d!19422 m!99265))

(declare-fun m!99267 () Bool)

(assert (=> d!19422 m!99267))

(assert (=> d!19422 m!98615))

(declare-fun m!99269 () Bool)

(assert (=> d!19422 m!99269))

(declare-fun m!99271 () Bool)

(assert (=> d!19422 m!99271))

(declare-fun m!99273 () Bool)

(assert (=> d!19422 m!99273))

(assert (=> d!19422 m!98839))

(declare-fun m!99275 () Bool)

(assert (=> b!62726 m!99275))

(assert (=> b!62330 d!19422))

(declare-fun d!19424 () Bool)

(assert (=> d!19424 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!98645 () Unit!4243)

(assert (=> d!19424 (= lt!98645 (choose!9 thiss!1379 (buf!1655 (_2!2926 lt!97888)) (bvsub to!314 i!635) (BitStream!2219 (buf!1655 (_2!2926 lt!97888)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379))))))

(assert (=> d!19424 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1655 (_2!2926 lt!97888)) (bvsub to!314 i!635)) lt!98645)))

(declare-fun bs!4815 () Bool)

(assert (= bs!4815 d!19424))

(assert (=> bs!4815 m!98609))

(declare-fun m!99277 () Bool)

(assert (=> bs!4815 m!99277))

(assert (=> b!62330 d!19424))

(declare-datatypes ((tuple2!5652 0))(
  ( (tuple2!5653 (_1!2937 List!684) (_2!2937 BitStream!2218)) )
))
(declare-fun e!41654 () tuple2!5652)

(declare-fun b!62775 () Bool)

(declare-fun lt!98724 () (_ BitVec 64))

(declare-datatypes ((tuple2!5654 0))(
  ( (tuple2!5655 (_1!2938 Bool) (_2!2938 BitStream!2218)) )
))
(declare-fun lt!98726 () tuple2!5654)

(assert (=> b!62775 (= e!41654 (tuple2!5653 (Cons!680 (_1!2938 lt!98726) (bitStreamReadBitsIntoList!0 (_2!2926 lt!97888) (_2!2938 lt!98726) (bvsub lt!97902 lt!98724))) (_2!2938 lt!98726)))))

(declare-fun readBit!0 (BitStream!2218) tuple2!5654)

(assert (=> b!62775 (= lt!98726 (readBit!0 (_1!2927 lt!97889)))))

(assert (=> b!62775 (= lt!98724 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19426 () Bool)

(declare-fun e!41655 () Bool)

(assert (=> d!19426 e!41655))

(declare-fun c!4466 () Bool)

(assert (=> d!19426 (= c!4466 (= lt!97902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98725 () List!684)

(assert (=> d!19426 (= lt!98725 (_1!2937 e!41654))))

(declare-fun c!4467 () Bool)

(assert (=> d!19426 (= c!4467 (= lt!97902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19426 (bvsge lt!97902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19426 (= (bitStreamReadBitsIntoList!0 (_2!2926 lt!97888) (_1!2927 lt!97889) lt!97902) lt!98725)))

(declare-fun b!62776 () Bool)

(declare-fun isEmpty!190 (List!684) Bool)

(assert (=> b!62776 (= e!41655 (isEmpty!190 lt!98725))))

(declare-fun b!62774 () Bool)

(assert (=> b!62774 (= e!41654 (tuple2!5653 Nil!681 (_1!2927 lt!97889)))))

(declare-fun b!62777 () Bool)

(assert (=> b!62777 (= e!41655 (> (length!312 lt!98725) 0))))

(assert (= (and d!19426 c!4467) b!62774))

(assert (= (and d!19426 (not c!4467)) b!62775))

(assert (= (and d!19426 c!4466) b!62776))

(assert (= (and d!19426 (not c!4466)) b!62777))

(declare-fun m!99383 () Bool)

(assert (=> b!62775 m!99383))

(declare-fun m!99385 () Bool)

(assert (=> b!62775 m!99385))

(declare-fun m!99387 () Bool)

(assert (=> b!62776 m!99387))

(declare-fun m!99389 () Bool)

(assert (=> b!62777 m!99389))

(assert (=> b!62330 d!19426))

(declare-fun d!19458 () Bool)

(assert (=> d!19458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!97902)))

(declare-fun lt!98727 () Unit!4243)

(assert (=> d!19458 (= lt!98727 (choose!9 (_2!2926 lt!97890) (buf!1655 (_2!2926 lt!97888)) lt!97902 (BitStream!2219 (buf!1655 (_2!2926 lt!97888)) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890)))))))

(assert (=> d!19458 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2926 lt!97890) (buf!1655 (_2!2926 lt!97888)) lt!97902) lt!98727)))

(declare-fun bs!4821 () Bool)

(assert (= bs!4821 d!19458))

(assert (=> bs!4821 m!98611))

(declare-fun m!99391 () Bool)

(assert (=> bs!4821 m!99391))

(assert (=> b!62330 d!19458))

(declare-fun d!19460 () Bool)

(assert (=> d!19460 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4822 () Bool)

(assert (= bs!4822 d!19460))

(declare-fun m!99393 () Bool)

(assert (=> bs!4822 m!99393))

(assert (=> b!62330 d!19460))

(declare-fun e!41656 () tuple2!5652)

(declare-fun lt!98730 () tuple2!5654)

(declare-fun lt!98728 () (_ BitVec 64))

(declare-fun b!62779 () Bool)

(assert (=> b!62779 (= e!41656 (tuple2!5653 (Cons!680 (_1!2938 lt!98730) (bitStreamReadBitsIntoList!0 (_2!2926 lt!97888) (_2!2938 lt!98730) (bvsub (bvsub to!314 i!635) lt!98728))) (_2!2938 lt!98730)))))

(assert (=> b!62779 (= lt!98730 (readBit!0 (_1!2927 lt!97894)))))

(assert (=> b!62779 (= lt!98728 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19462 () Bool)

(declare-fun e!41657 () Bool)

(assert (=> d!19462 e!41657))

(declare-fun c!4468 () Bool)

(assert (=> d!19462 (= c!4468 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98729 () List!684)

(assert (=> d!19462 (= lt!98729 (_1!2937 e!41656))))

(declare-fun c!4469 () Bool)

(assert (=> d!19462 (= c!4469 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19462 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19462 (= (bitStreamReadBitsIntoList!0 (_2!2926 lt!97888) (_1!2927 lt!97894) (bvsub to!314 i!635)) lt!98729)))

(declare-fun b!62780 () Bool)

(assert (=> b!62780 (= e!41657 (isEmpty!190 lt!98729))))

(declare-fun b!62778 () Bool)

(assert (=> b!62778 (= e!41656 (tuple2!5653 Nil!681 (_1!2927 lt!97894)))))

(declare-fun b!62781 () Bool)

(assert (=> b!62781 (= e!41657 (> (length!312 lt!98729) 0))))

(assert (= (and d!19462 c!4469) b!62778))

(assert (= (and d!19462 (not c!4469)) b!62779))

(assert (= (and d!19462 c!4468) b!62780))

(assert (= (and d!19462 (not c!4468)) b!62781))

(declare-fun m!99395 () Bool)

(assert (=> b!62779 m!99395))

(declare-fun m!99397 () Bool)

(assert (=> b!62779 m!99397))

(declare-fun m!99399 () Bool)

(assert (=> b!62780 m!99399))

(declare-fun m!99401 () Bool)

(assert (=> b!62781 m!99401))

(assert (=> b!62330 d!19462))

(declare-fun b!62782 () Bool)

(declare-fun e!41659 () Unit!4243)

(declare-fun lt!98746 () Unit!4243)

(assert (=> b!62782 (= e!41659 lt!98746)))

(declare-fun lt!98732 () (_ BitVec 64))

(assert (=> b!62782 (= lt!98732 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98748 () (_ BitVec 64))

(assert (=> b!62782 (= lt!98748 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(assert (=> b!62782 (= lt!98746 (arrayBitRangesEqSymmetric!0 (buf!1655 thiss!1379) (buf!1655 (_2!2926 lt!97888)) lt!98732 lt!98748))))

(assert (=> b!62782 (arrayBitRangesEq!0 (buf!1655 (_2!2926 lt!97888)) (buf!1655 thiss!1379) lt!98732 lt!98748)))

(declare-fun d!19464 () Bool)

(declare-fun e!41658 () Bool)

(assert (=> d!19464 e!41658))

(declare-fun res!52199 () Bool)

(assert (=> d!19464 (=> (not res!52199) (not e!41658))))

(declare-fun lt!98741 () tuple2!5632)

(assert (=> d!19464 (= res!52199 (isPrefixOf!0 (_1!2927 lt!98741) (_2!2927 lt!98741)))))

(declare-fun lt!98735 () BitStream!2218)

(assert (=> d!19464 (= lt!98741 (tuple2!5633 lt!98735 (_2!2926 lt!97888)))))

(declare-fun lt!98740 () Unit!4243)

(declare-fun lt!98738 () Unit!4243)

(assert (=> d!19464 (= lt!98740 lt!98738)))

(assert (=> d!19464 (isPrefixOf!0 lt!98735 (_2!2926 lt!97888))))

(assert (=> d!19464 (= lt!98738 (lemmaIsPrefixTransitive!0 lt!98735 (_2!2926 lt!97888) (_2!2926 lt!97888)))))

(declare-fun lt!98747 () Unit!4243)

(declare-fun lt!98731 () Unit!4243)

(assert (=> d!19464 (= lt!98747 lt!98731)))

(assert (=> d!19464 (isPrefixOf!0 lt!98735 (_2!2926 lt!97888))))

(assert (=> d!19464 (= lt!98731 (lemmaIsPrefixTransitive!0 lt!98735 thiss!1379 (_2!2926 lt!97888)))))

(declare-fun lt!98733 () Unit!4243)

(assert (=> d!19464 (= lt!98733 e!41659)))

(declare-fun c!4470 () Bool)

(assert (=> d!19464 (= c!4470 (not (= (size!1274 (buf!1655 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!98736 () Unit!4243)

(declare-fun lt!98739 () Unit!4243)

(assert (=> d!19464 (= lt!98736 lt!98739)))

(assert (=> d!19464 (isPrefixOf!0 (_2!2926 lt!97888) (_2!2926 lt!97888))))

(assert (=> d!19464 (= lt!98739 (lemmaIsPrefixRefl!0 (_2!2926 lt!97888)))))

(declare-fun lt!98742 () Unit!4243)

(declare-fun lt!98743 () Unit!4243)

(assert (=> d!19464 (= lt!98742 lt!98743)))

(assert (=> d!19464 (= lt!98743 (lemmaIsPrefixRefl!0 (_2!2926 lt!97888)))))

(declare-fun lt!98745 () Unit!4243)

(declare-fun lt!98750 () Unit!4243)

(assert (=> d!19464 (= lt!98745 lt!98750)))

(assert (=> d!19464 (isPrefixOf!0 lt!98735 lt!98735)))

(assert (=> d!19464 (= lt!98750 (lemmaIsPrefixRefl!0 lt!98735))))

(declare-fun lt!98744 () Unit!4243)

(declare-fun lt!98737 () Unit!4243)

(assert (=> d!19464 (= lt!98744 lt!98737)))

(assert (=> d!19464 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19464 (= lt!98737 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19464 (= lt!98735 (BitStream!2219 (buf!1655 (_2!2926 lt!97888)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(assert (=> d!19464 (isPrefixOf!0 thiss!1379 (_2!2926 lt!97888))))

(assert (=> d!19464 (= (reader!0 thiss!1379 (_2!2926 lt!97888)) lt!98741)))

(declare-fun b!62783 () Bool)

(declare-fun res!52197 () Bool)

(assert (=> b!62783 (=> (not res!52197) (not e!41658))))

(assert (=> b!62783 (= res!52197 (isPrefixOf!0 (_2!2927 lt!98741) (_2!2926 lt!97888)))))

(declare-fun lt!98749 () (_ BitVec 64))

(declare-fun b!62784 () Bool)

(declare-fun lt!98734 () (_ BitVec 64))

(assert (=> b!62784 (= e!41658 (= (_1!2927 lt!98741) (withMovedBitIndex!0 (_2!2927 lt!98741) (bvsub lt!98749 lt!98734))))))

(assert (=> b!62784 (or (= (bvand lt!98749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98734 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98749 lt!98734) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62784 (= lt!98734 (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888))))))

(assert (=> b!62784 (= lt!98749 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(declare-fun b!62785 () Bool)

(declare-fun Unit!4268 () Unit!4243)

(assert (=> b!62785 (= e!41659 Unit!4268)))

(declare-fun b!62786 () Bool)

(declare-fun res!52198 () Bool)

(assert (=> b!62786 (=> (not res!52198) (not e!41658))))

(assert (=> b!62786 (= res!52198 (isPrefixOf!0 (_1!2927 lt!98741) thiss!1379))))

(assert (= (and d!19464 c!4470) b!62782))

(assert (= (and d!19464 (not c!4470)) b!62785))

(assert (= (and d!19464 res!52199) b!62786))

(assert (= (and b!62786 res!52198) b!62783))

(assert (= (and b!62783 res!52197) b!62784))

(declare-fun m!99403 () Bool)

(assert (=> b!62784 m!99403))

(assert (=> b!62784 m!98589))

(assert (=> b!62784 m!98587))

(declare-fun m!99405 () Bool)

(assert (=> b!62786 m!99405))

(assert (=> b!62782 m!98587))

(declare-fun m!99407 () Bool)

(assert (=> b!62782 m!99407))

(declare-fun m!99409 () Bool)

(assert (=> b!62782 m!99409))

(assert (=> d!19464 m!99259))

(declare-fun m!99411 () Bool)

(assert (=> d!19464 m!99411))

(declare-fun m!99413 () Bool)

(assert (=> d!19464 m!99413))

(assert (=> d!19464 m!98585))

(declare-fun m!99415 () Bool)

(assert (=> d!19464 m!99415))

(declare-fun m!99417 () Bool)

(assert (=> d!19464 m!99417))

(assert (=> d!19464 m!98625))

(declare-fun m!99419 () Bool)

(assert (=> d!19464 m!99419))

(declare-fun m!99421 () Bool)

(assert (=> d!19464 m!99421))

(assert (=> d!19464 m!99273))

(assert (=> d!19464 m!98583))

(declare-fun m!99423 () Bool)

(assert (=> b!62783 m!99423))

(assert (=> b!62330 d!19464))

(declare-fun d!19466 () Bool)

(assert (=> d!19466 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!97902) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890)))) lt!97902))))

(declare-fun bs!4823 () Bool)

(assert (= bs!4823 d!19466))

(declare-fun m!99425 () Bool)

(assert (=> bs!4823 m!99425))

(assert (=> b!62330 d!19466))

(declare-fun d!19468 () Bool)

(declare-fun e!41662 () Bool)

(assert (=> d!19468 e!41662))

(declare-fun res!52205 () Bool)

(assert (=> d!19468 (=> (not res!52205) (not e!41662))))

(declare-fun lt!98768 () (_ BitVec 64))

(declare-fun lt!98763 () (_ BitVec 64))

(declare-fun lt!98765 () (_ BitVec 64))

(assert (=> d!19468 (= res!52205 (= lt!98765 (bvsub lt!98768 lt!98763)))))

(assert (=> d!19468 (or (= (bvand lt!98768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98763 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98768 lt!98763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19468 (= lt!98763 (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97888))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97888)))))))

(declare-fun lt!98766 () (_ BitVec 64))

(declare-fun lt!98767 () (_ BitVec 64))

(assert (=> d!19468 (= lt!98768 (bvmul lt!98766 lt!98767))))

(assert (=> d!19468 (or (= lt!98766 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98767 (bvsdiv (bvmul lt!98766 lt!98767) lt!98766)))))

(assert (=> d!19468 (= lt!98767 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19468 (= lt!98766 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))))))

(assert (=> d!19468 (= lt!98765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97888))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97888)))))))

(assert (=> d!19468 (invariant!0 (currentBit!3286 (_2!2926 lt!97888)) (currentByte!3291 (_2!2926 lt!97888)) (size!1274 (buf!1655 (_2!2926 lt!97888))))))

(assert (=> d!19468 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888))) lt!98765)))

(declare-fun b!62791 () Bool)

(declare-fun res!52204 () Bool)

(assert (=> b!62791 (=> (not res!52204) (not e!41662))))

(assert (=> b!62791 (= res!52204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98765))))

(declare-fun b!62792 () Bool)

(declare-fun lt!98764 () (_ BitVec 64))

(assert (=> b!62792 (= e!41662 (bvsle lt!98765 (bvmul lt!98764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62792 (or (= lt!98764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98764)))))

(assert (=> b!62792 (= lt!98764 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97888)))))))

(assert (= (and d!19468 res!52205) b!62791))

(assert (= (and b!62791 res!52204) b!62792))

(declare-fun m!99427 () Bool)

(assert (=> d!19468 m!99427))

(assert (=> d!19468 m!98579))

(assert (=> b!62340 d!19468))

(declare-fun d!19470 () Bool)

(declare-fun e!41663 () Bool)

(assert (=> d!19470 e!41663))

(declare-fun res!52207 () Bool)

(assert (=> d!19470 (=> (not res!52207) (not e!41663))))

(declare-fun lt!98774 () (_ BitVec 64))

(declare-fun lt!98769 () (_ BitVec 64))

(declare-fun lt!98771 () (_ BitVec 64))

(assert (=> d!19470 (= res!52207 (= lt!98771 (bvsub lt!98774 lt!98769)))))

(assert (=> d!19470 (or (= (bvand lt!98774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98769 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98774 lt!98769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19470 (= lt!98769 (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890)))))))

(declare-fun lt!98772 () (_ BitVec 64))

(declare-fun lt!98773 () (_ BitVec 64))

(assert (=> d!19470 (= lt!98774 (bvmul lt!98772 lt!98773))))

(assert (=> d!19470 (or (= lt!98772 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98773 (bvsdiv (bvmul lt!98772 lt!98773) lt!98772)))))

(assert (=> d!19470 (= lt!98773 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19470 (= lt!98772 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))))))

(assert (=> d!19470 (= lt!98771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890)))))))

(assert (=> d!19470 (invariant!0 (currentBit!3286 (_2!2926 lt!97890)) (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97890))))))

(assert (=> d!19470 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890))) lt!98771)))

(declare-fun b!62793 () Bool)

(declare-fun res!52206 () Bool)

(assert (=> b!62793 (=> (not res!52206) (not e!41663))))

(assert (=> b!62793 (= res!52206 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98771))))

(declare-fun b!62794 () Bool)

(declare-fun lt!98770 () (_ BitVec 64))

(assert (=> b!62794 (= e!41663 (bvsle lt!98771 (bvmul lt!98770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62794 (or (= lt!98770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98770)))))

(assert (=> b!62794 (= lt!98770 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))))))

(assert (= (and d!19470 res!52207) b!62793))

(assert (= (and b!62793 res!52206) b!62794))

(declare-fun m!99429 () Bool)

(assert (=> d!19470 m!99429))

(assert (=> d!19470 m!98581))

(assert (=> b!62329 d!19470))

(declare-fun d!19472 () Bool)

(assert (=> d!19472 (= (invariant!0 (currentBit!3286 (_2!2926 lt!97890)) (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97890)))) (and (bvsge (currentBit!3286 (_2!2926 lt!97890)) #b00000000000000000000000000000000) (bvslt (currentBit!3286 (_2!2926 lt!97890)) #b00000000000000000000000000001000) (bvsge (currentByte!3291 (_2!2926 lt!97890)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97890)))) (and (= (currentBit!3286 (_2!2926 lt!97890)) #b00000000000000000000000000000000) (= (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97890))))))))))

(assert (=> b!62342 d!19472))

(declare-fun d!19474 () Bool)

(assert (=> d!19474 (= (head!503 (byteArrayBitContentToList!0 (_2!2926 lt!97890) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!799 (byteArrayBitContentToList!0 (_2!2926 lt!97890) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62331 d!19474))

(declare-fun d!19476 () Bool)

(declare-fun c!4473 () Bool)

(assert (=> d!19476 (= c!4473 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41666 () List!684)

(assert (=> d!19476 (= (byteArrayBitContentToList!0 (_2!2926 lt!97890) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41666)))

(declare-fun b!62799 () Bool)

(assert (=> b!62799 (= e!41666 Nil!681)))

(declare-fun b!62800 () Bool)

(assert (=> b!62800 (= e!41666 (Cons!680 (not (= (bvand ((_ sign_extend 24) (select (arr!1838 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2926 lt!97890) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19476 c!4473) b!62799))

(assert (= (and d!19476 (not c!4473)) b!62800))

(assert (=> b!62800 m!98633))

(declare-fun m!99431 () Bool)

(assert (=> b!62800 m!99431))

(declare-fun m!99433 () Bool)

(assert (=> b!62800 m!99433))

(assert (=> b!62331 d!19476))

(declare-fun d!19478 () Bool)

(assert (=> d!19478 (= (head!503 (bitStreamReadBitsIntoList!0 (_2!2926 lt!97890) (_1!2927 lt!97900) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!799 (bitStreamReadBitsIntoList!0 (_2!2926 lt!97890) (_1!2927 lt!97900) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62331 d!19478))

(declare-fun lt!98775 () (_ BitVec 64))

(declare-fun lt!98777 () tuple2!5654)

(declare-fun b!62802 () Bool)

(declare-fun e!41667 () tuple2!5652)

(assert (=> b!62802 (= e!41667 (tuple2!5653 (Cons!680 (_1!2938 lt!98777) (bitStreamReadBitsIntoList!0 (_2!2926 lt!97890) (_2!2938 lt!98777) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!98775))) (_2!2938 lt!98777)))))

(assert (=> b!62802 (= lt!98777 (readBit!0 (_1!2927 lt!97900)))))

(assert (=> b!62802 (= lt!98775 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19480 () Bool)

(declare-fun e!41668 () Bool)

(assert (=> d!19480 e!41668))

(declare-fun c!4474 () Bool)

(assert (=> d!19480 (= c!4474 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98776 () List!684)

(assert (=> d!19480 (= lt!98776 (_1!2937 e!41667))))

(declare-fun c!4475 () Bool)

(assert (=> d!19480 (= c!4475 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19480 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19480 (= (bitStreamReadBitsIntoList!0 (_2!2926 lt!97890) (_1!2927 lt!97900) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98776)))

(declare-fun b!62803 () Bool)

(assert (=> b!62803 (= e!41668 (isEmpty!190 lt!98776))))

(declare-fun b!62801 () Bool)

(assert (=> b!62801 (= e!41667 (tuple2!5653 Nil!681 (_1!2927 lt!97900)))))

(declare-fun b!62804 () Bool)

(assert (=> b!62804 (= e!41668 (> (length!312 lt!98776) 0))))

(assert (= (and d!19480 c!4475) b!62801))

(assert (= (and d!19480 (not c!4475)) b!62802))

(assert (= (and d!19480 c!4474) b!62803))

(assert (= (and d!19480 (not c!4474)) b!62804))

(declare-fun m!99435 () Bool)

(assert (=> b!62802 m!99435))

(declare-fun m!99437 () Bool)

(assert (=> b!62802 m!99437))

(declare-fun m!99439 () Bool)

(assert (=> b!62803 m!99439))

(declare-fun m!99441 () Bool)

(assert (=> b!62804 m!99441))

(assert (=> b!62331 d!19480))

(declare-fun d!19482 () Bool)

(assert (=> d!19482 (= (array_inv!1168 (buf!1655 thiss!1379)) (bvsge (size!1274 (buf!1655 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!62338 d!19482))

(declare-fun d!19484 () Bool)

(assert (=> d!19484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 thiss!1379))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 thiss!1379))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4824 () Bool)

(assert (= bs!4824 d!19484))

(declare-fun m!99443 () Bool)

(assert (=> bs!4824 m!99443))

(assert (=> b!62327 d!19484))

(declare-fun d!19486 () Bool)

(declare-fun res!52208 () Bool)

(declare-fun e!41670 () Bool)

(assert (=> d!19486 (=> (not res!52208) (not e!41670))))

(assert (=> d!19486 (= res!52208 (= (size!1274 (buf!1655 (_1!2927 lt!97894))) (size!1274 (buf!1655 (_1!2927 lt!97889)))))))

(assert (=> d!19486 (= (isPrefixOf!0 (_1!2927 lt!97894) (_1!2927 lt!97889)) e!41670)))

(declare-fun b!62805 () Bool)

(declare-fun res!52210 () Bool)

(assert (=> b!62805 (=> (not res!52210) (not e!41670))))

(assert (=> b!62805 (= res!52210 (bvsle (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97894))) (currentByte!3291 (_1!2927 lt!97894)) (currentBit!3286 (_1!2927 lt!97894))) (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97889))) (currentByte!3291 (_1!2927 lt!97889)) (currentBit!3286 (_1!2927 lt!97889)))))))

(declare-fun b!62806 () Bool)

(declare-fun e!41669 () Bool)

(assert (=> b!62806 (= e!41670 e!41669)))

(declare-fun res!52209 () Bool)

(assert (=> b!62806 (=> res!52209 e!41669)))

(assert (=> b!62806 (= res!52209 (= (size!1274 (buf!1655 (_1!2927 lt!97894))) #b00000000000000000000000000000000))))

(declare-fun b!62807 () Bool)

(assert (=> b!62807 (= e!41669 (arrayBitRangesEq!0 (buf!1655 (_1!2927 lt!97894)) (buf!1655 (_1!2927 lt!97889)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97894))) (currentByte!3291 (_1!2927 lt!97894)) (currentBit!3286 (_1!2927 lt!97894)))))))

(assert (= (and d!19486 res!52208) b!62805))

(assert (= (and b!62805 res!52210) b!62806))

(assert (= (and b!62806 (not res!52209)) b!62807))

(assert (=> b!62805 m!98825))

(declare-fun m!99445 () Bool)

(assert (=> b!62805 m!99445))

(assert (=> b!62807 m!98825))

(assert (=> b!62807 m!98825))

(declare-fun m!99447 () Bool)

(assert (=> b!62807 m!99447))

(assert (=> b!62337 d!19486))

(declare-fun d!19488 () Bool)

(assert (=> d!19488 (= (invariant!0 (currentBit!3286 (_2!2926 lt!97890)) (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97888)))) (and (bvsge (currentBit!3286 (_2!2926 lt!97890)) #b00000000000000000000000000000000) (bvslt (currentBit!3286 (_2!2926 lt!97890)) #b00000000000000000000000000001000) (bvsge (currentByte!3291 (_2!2926 lt!97890)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97888)))) (and (= (currentBit!3286 (_2!2926 lt!97890)) #b00000000000000000000000000000000) (= (currentByte!3291 (_2!2926 lt!97890)) (size!1274 (buf!1655 (_2!2926 lt!97888))))))))))

(assert (=> b!62339 d!19488))

(declare-fun d!19490 () Bool)

(declare-fun res!52211 () Bool)

(declare-fun e!41672 () Bool)

(assert (=> d!19490 (=> (not res!52211) (not e!41672))))

(assert (=> d!19490 (= res!52211 (= (size!1274 (buf!1655 thiss!1379)) (size!1274 (buf!1655 (_2!2926 lt!97890)))))))

(assert (=> d!19490 (= (isPrefixOf!0 thiss!1379 (_2!2926 lt!97890)) e!41672)))

(declare-fun b!62808 () Bool)

(declare-fun res!52213 () Bool)

(assert (=> b!62808 (=> (not res!52213) (not e!41672))))

(assert (=> b!62808 (= res!52213 (bvsle (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97890))) (currentByte!3291 (_2!2926 lt!97890)) (currentBit!3286 (_2!2926 lt!97890)))))))

(declare-fun b!62809 () Bool)

(declare-fun e!41671 () Bool)

(assert (=> b!62809 (= e!41672 e!41671)))

(declare-fun res!52212 () Bool)

(assert (=> b!62809 (=> res!52212 e!41671)))

(assert (=> b!62809 (= res!52212 (= (size!1274 (buf!1655 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62810 () Bool)

(assert (=> b!62810 (= e!41671 (arrayBitRangesEq!0 (buf!1655 thiss!1379) (buf!1655 (_2!2926 lt!97890)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379))))))

(assert (= (and d!19490 res!52211) b!62808))

(assert (= (and b!62808 res!52213) b!62809))

(assert (= (and b!62809 (not res!52212)) b!62810))

(assert (=> b!62808 m!98587))

(assert (=> b!62808 m!98643))

(assert (=> b!62810 m!98587))

(assert (=> b!62810 m!98587))

(declare-fun m!99449 () Bool)

(assert (=> b!62810 m!99449))

(assert (=> b!62328 d!19490))

(declare-fun d!19492 () Bool)

(assert (=> d!19492 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) lt!97902) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890)))) lt!97902))))

(declare-fun bs!4825 () Bool)

(assert (= bs!4825 d!19492))

(assert (=> bs!4825 m!99429))

(assert (=> b!62328 d!19492))

(declare-fun d!19494 () Bool)

(declare-fun e!41675 () Bool)

(assert (=> d!19494 e!41675))

(declare-fun res!52216 () Bool)

(assert (=> d!19494 (=> (not res!52216) (not e!41675))))

(assert (=> d!19494 (= res!52216 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!98780 () Unit!4243)

(declare-fun choose!27 (BitStream!2218 BitStream!2218 (_ BitVec 64) (_ BitVec 64)) Unit!4243)

(assert (=> d!19494 (= lt!98780 (choose!27 thiss!1379 (_2!2926 lt!97890) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19494 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19494 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2926 lt!97890) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98780)))

(declare-fun b!62813 () Bool)

(assert (=> b!62813 (= e!41675 (validate_offset_bits!1 ((_ sign_extend 32) (size!1274 (buf!1655 (_2!2926 lt!97890)))) ((_ sign_extend 32) (currentByte!3291 (_2!2926 lt!97890))) ((_ sign_extend 32) (currentBit!3286 (_2!2926 lt!97890))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19494 res!52216) b!62813))

(declare-fun m!99451 () Bool)

(assert (=> d!19494 m!99451))

(declare-fun m!99453 () Bool)

(assert (=> b!62813 m!99453))

(assert (=> b!62328 d!19494))

(declare-fun b!62831 () Bool)

(declare-fun res!52240 () Bool)

(declare-fun e!41687 () Bool)

(assert (=> b!62831 (=> (not res!52240) (not e!41687))))

(declare-fun lt!98807 () tuple2!5630)

(assert (=> b!62831 (= res!52240 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98807))) (currentByte!3291 (_2!2926 lt!98807)) (currentBit!3286 (_2!2926 lt!98807))) (bvadd (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62832 () Bool)

(declare-fun e!41685 () Bool)

(declare-datatypes ((tuple2!5660 0))(
  ( (tuple2!5661 (_1!2941 BitStream!2218) (_2!2941 Bool)) )
))
(declare-fun lt!98805 () tuple2!5660)

(assert (=> b!62832 (= e!41685 (= (bitIndex!0 (size!1274 (buf!1655 (_1!2941 lt!98805))) (currentByte!3291 (_1!2941 lt!98805)) (currentBit!3286 (_1!2941 lt!98805))) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98807))) (currentByte!3291 (_2!2926 lt!98807)) (currentBit!3286 (_2!2926 lt!98807)))))))

(declare-fun b!62833 () Bool)

(declare-fun e!41686 () Bool)

(declare-fun e!41684 () Bool)

(assert (=> b!62833 (= e!41686 e!41684)))

(declare-fun res!52234 () Bool)

(assert (=> b!62833 (=> (not res!52234) (not e!41684))))

(declare-fun lt!98806 () tuple2!5630)

(declare-fun lt!98811 () (_ BitVec 8))

(declare-fun lt!98808 () tuple2!5660)

(assert (=> b!62833 (= res!52234 (and (= (_2!2941 lt!98808) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1838 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!98811)) #b00000000000000000000000000000000))) (= (_1!2941 lt!98808) (_2!2926 lt!98806))))))

(declare-fun lt!98816 () tuple2!5650)

(declare-fun lt!98812 () BitStream!2218)

(assert (=> b!62833 (= lt!98816 (readBits!0 lt!98812 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2218) tuple2!5660)

(assert (=> b!62833 (= lt!98808 (readBitPure!0 lt!98812))))

(declare-fun readerFrom!0 (BitStream!2218 (_ BitVec 32) (_ BitVec 32)) BitStream!2218)

(assert (=> b!62833 (= lt!98812 (readerFrom!0 (_2!2926 lt!98806) (currentBit!3286 thiss!1379) (currentByte!3291 thiss!1379)))))

(declare-fun b!62834 () Bool)

(declare-fun res!52233 () Bool)

(assert (=> b!62834 (=> (not res!52233) (not e!41686))))

(assert (=> b!62834 (= res!52233 (isPrefixOf!0 thiss!1379 (_2!2926 lt!98806)))))

(declare-fun d!19496 () Bool)

(assert (=> d!19496 e!41686))

(declare-fun res!52236 () Bool)

(assert (=> d!19496 (=> (not res!52236) (not e!41686))))

(assert (=> d!19496 (= res!52236 (= (size!1274 (buf!1655 (_2!2926 lt!98806))) (size!1274 (buf!1655 thiss!1379))))))

(declare-fun lt!98814 () array!2788)

(assert (=> d!19496 (= lt!98811 (select (arr!1838 lt!98814) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19496 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1274 lt!98814)))))

(assert (=> d!19496 (= lt!98814 (array!2789 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!98815 () tuple2!5630)

(assert (=> d!19496 (= lt!98806 (tuple2!5631 (_1!2926 lt!98815) (_2!2926 lt!98815)))))

(assert (=> d!19496 (= lt!98815 lt!98807)))

(assert (=> d!19496 e!41687))

(declare-fun res!52238 () Bool)

(assert (=> d!19496 (=> (not res!52238) (not e!41687))))

(assert (=> d!19496 (= res!52238 (= (size!1274 (buf!1655 thiss!1379)) (size!1274 (buf!1655 (_2!2926 lt!98807)))))))

(declare-fun lt!98813 () Bool)

(declare-fun appendBit!0 (BitStream!2218 Bool) tuple2!5630)

(assert (=> d!19496 (= lt!98807 (appendBit!0 thiss!1379 lt!98813))))

(assert (=> d!19496 (= lt!98813 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1838 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19496 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19496 (= (appendBitFromByte!0 thiss!1379 (select (arr!1838 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!98806)))

(declare-fun b!62835 () Bool)

(assert (=> b!62835 (= e!41684 (= (bitIndex!0 (size!1274 (buf!1655 (_1!2941 lt!98808))) (currentByte!3291 (_1!2941 lt!98808)) (currentBit!3286 (_1!2941 lt!98808))) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98806))) (currentByte!3291 (_2!2926 lt!98806)) (currentBit!3286 (_2!2926 lt!98806)))))))

(declare-fun b!62836 () Bool)

(declare-fun res!52239 () Bool)

(assert (=> b!62836 (=> (not res!52239) (not e!41687))))

(assert (=> b!62836 (= res!52239 (isPrefixOf!0 thiss!1379 (_2!2926 lt!98807)))))

(declare-fun b!62837 () Bool)

(declare-fun res!52237 () Bool)

(assert (=> b!62837 (=> (not res!52237) (not e!41686))))

(declare-fun lt!98810 () (_ BitVec 64))

(declare-fun lt!98809 () (_ BitVec 64))

(assert (=> b!62837 (= res!52237 (= (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!98806))) (currentByte!3291 (_2!2926 lt!98806)) (currentBit!3286 (_2!2926 lt!98806))) (bvadd lt!98809 lt!98810)))))

(assert (=> b!62837 (or (not (= (bvand lt!98809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98810 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!98809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!98809 lt!98810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62837 (= lt!98810 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!62837 (= lt!98809 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)))))

(declare-fun b!62838 () Bool)

(assert (=> b!62838 (= e!41687 e!41685)))

(declare-fun res!52235 () Bool)

(assert (=> b!62838 (=> (not res!52235) (not e!41685))))

(assert (=> b!62838 (= res!52235 (and (= (_2!2941 lt!98805) lt!98813) (= (_1!2941 lt!98805) (_2!2926 lt!98807))))))

(assert (=> b!62838 (= lt!98805 (readBitPure!0 (readerFrom!0 (_2!2926 lt!98807) (currentBit!3286 thiss!1379) (currentByte!3291 thiss!1379))))))

(assert (= (and d!19496 res!52238) b!62831))

(assert (= (and b!62831 res!52240) b!62836))

(assert (= (and b!62836 res!52239) b!62838))

(assert (= (and b!62838 res!52235) b!62832))

(assert (= (and d!19496 res!52236) b!62837))

(assert (= (and b!62837 res!52237) b!62834))

(assert (= (and b!62834 res!52233) b!62833))

(assert (= (and b!62833 res!52234) b!62835))

(declare-fun m!99455 () Bool)

(assert (=> b!62835 m!99455))

(declare-fun m!99457 () Bool)

(assert (=> b!62835 m!99457))

(declare-fun m!99459 () Bool)

(assert (=> d!19496 m!99459))

(declare-fun m!99461 () Bool)

(assert (=> d!19496 m!99461))

(assert (=> d!19496 m!99431))

(assert (=> b!62837 m!99457))

(assert (=> b!62837 m!98587))

(declare-fun m!99463 () Bool)

(assert (=> b!62831 m!99463))

(assert (=> b!62831 m!98587))

(declare-fun m!99465 () Bool)

(assert (=> b!62836 m!99465))

(declare-fun m!99467 () Bool)

(assert (=> b!62833 m!99467))

(declare-fun m!99469 () Bool)

(assert (=> b!62833 m!99469))

(declare-fun m!99471 () Bool)

(assert (=> b!62833 m!99471))

(declare-fun m!99473 () Bool)

(assert (=> b!62832 m!99473))

(assert (=> b!62832 m!99463))

(declare-fun m!99475 () Bool)

(assert (=> b!62838 m!99475))

(assert (=> b!62838 m!99475))

(declare-fun m!99477 () Bool)

(assert (=> b!62838 m!99477))

(declare-fun m!99479 () Bool)

(assert (=> b!62834 m!99479))

(assert (=> b!62328 d!19496))

(declare-fun d!19498 () Bool)

(declare-fun res!52241 () Bool)

(declare-fun e!41689 () Bool)

(assert (=> d!19498 (=> (not res!52241) (not e!41689))))

(assert (=> d!19498 (= res!52241 (= (size!1274 (buf!1655 thiss!1379)) (size!1274 (buf!1655 thiss!1379))))))

(assert (=> d!19498 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41689)))

(declare-fun b!62839 () Bool)

(declare-fun res!52243 () Bool)

(assert (=> b!62839 (=> (not res!52243) (not e!41689))))

(assert (=> b!62839 (= res!52243 (bvsle (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)) (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379))))))

(declare-fun b!62840 () Bool)

(declare-fun e!41688 () Bool)

(assert (=> b!62840 (= e!41689 e!41688)))

(declare-fun res!52242 () Bool)

(assert (=> b!62840 (=> res!52242 e!41688)))

(assert (=> b!62840 (= res!52242 (= (size!1274 (buf!1655 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62841 () Bool)

(assert (=> b!62841 (= e!41688 (arrayBitRangesEq!0 (buf!1655 thiss!1379) (buf!1655 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379))))))

(assert (= (and d!19498 res!52241) b!62839))

(assert (= (and b!62839 res!52243) b!62840))

(assert (= (and b!62840 (not res!52242)) b!62841))

(assert (=> b!62839 m!98587))

(assert (=> b!62839 m!98587))

(assert (=> b!62841 m!98587))

(assert (=> b!62841 m!98587))

(declare-fun m!99481 () Bool)

(assert (=> b!62841 m!99481))

(assert (=> b!62335 d!19498))

(declare-fun d!19500 () Bool)

(assert (=> d!19500 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!98819 () Unit!4243)

(declare-fun choose!11 (BitStream!2218) Unit!4243)

(assert (=> d!19500 (= lt!98819 (choose!11 thiss!1379))))

(assert (=> d!19500 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!98819)))

(declare-fun bs!4827 () Bool)

(assert (= bs!4827 d!19500))

(assert (=> bs!4827 m!98583))

(declare-fun m!99483 () Bool)

(assert (=> bs!4827 m!99483))

(assert (=> b!62335 d!19500))

(declare-fun d!19502 () Bool)

(declare-fun e!41690 () Bool)

(assert (=> d!19502 e!41690))

(declare-fun res!52245 () Bool)

(assert (=> d!19502 (=> (not res!52245) (not e!41690))))

(declare-fun lt!98822 () (_ BitVec 64))

(declare-fun lt!98825 () (_ BitVec 64))

(declare-fun lt!98820 () (_ BitVec 64))

(assert (=> d!19502 (= res!52245 (= lt!98822 (bvsub lt!98825 lt!98820)))))

(assert (=> d!19502 (or (= (bvand lt!98825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98825 lt!98820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19502 (= lt!98820 (remainingBits!0 ((_ sign_extend 32) (size!1274 (buf!1655 thiss!1379))) ((_ sign_extend 32) (currentByte!3291 thiss!1379)) ((_ sign_extend 32) (currentBit!3286 thiss!1379))))))

(declare-fun lt!98823 () (_ BitVec 64))

(declare-fun lt!98824 () (_ BitVec 64))

(assert (=> d!19502 (= lt!98825 (bvmul lt!98823 lt!98824))))

(assert (=> d!19502 (or (= lt!98823 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98824 (bvsdiv (bvmul lt!98823 lt!98824) lt!98823)))))

(assert (=> d!19502 (= lt!98824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19502 (= lt!98823 ((_ sign_extend 32) (size!1274 (buf!1655 thiss!1379))))))

(assert (=> d!19502 (= lt!98822 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3291 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3286 thiss!1379))))))

(assert (=> d!19502 (invariant!0 (currentBit!3286 thiss!1379) (currentByte!3291 thiss!1379) (size!1274 (buf!1655 thiss!1379)))))

(assert (=> d!19502 (= (bitIndex!0 (size!1274 (buf!1655 thiss!1379)) (currentByte!3291 thiss!1379) (currentBit!3286 thiss!1379)) lt!98822)))

(declare-fun b!62842 () Bool)

(declare-fun res!52244 () Bool)

(assert (=> b!62842 (=> (not res!52244) (not e!41690))))

(assert (=> b!62842 (= res!52244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98822))))

(declare-fun b!62843 () Bool)

(declare-fun lt!98821 () (_ BitVec 64))

(assert (=> b!62843 (= e!41690 (bvsle lt!98822 (bvmul lt!98821 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62843 (or (= lt!98821 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98821 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98821)))))

(assert (=> b!62843 (= lt!98821 ((_ sign_extend 32) (size!1274 (buf!1655 thiss!1379))))))

(assert (= (and d!19502 res!52245) b!62842))

(assert (= (and b!62842 res!52244) b!62843))

(assert (=> d!19502 m!99443))

(assert (=> d!19502 m!99249))

(assert (=> b!62335 d!19502))

(declare-fun d!19504 () Bool)

(assert (=> d!19504 (= (invariant!0 (currentBit!3286 (_2!2926 lt!97888)) (currentByte!3291 (_2!2926 lt!97888)) (size!1274 (buf!1655 (_2!2926 lt!97888)))) (and (bvsge (currentBit!3286 (_2!2926 lt!97888)) #b00000000000000000000000000000000) (bvslt (currentBit!3286 (_2!2926 lt!97888)) #b00000000000000000000000000001000) (bvsge (currentByte!3291 (_2!2926 lt!97888)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3291 (_2!2926 lt!97888)) (size!1274 (buf!1655 (_2!2926 lt!97888)))) (and (= (currentBit!3286 (_2!2926 lt!97888)) #b00000000000000000000000000000000) (= (currentByte!3291 (_2!2926 lt!97888)) (size!1274 (buf!1655 (_2!2926 lt!97888))))))))))

(assert (=> b!62326 d!19504))

(declare-fun d!19506 () Bool)

(declare-fun res!52246 () Bool)

(declare-fun e!41692 () Bool)

(assert (=> d!19506 (=> (not res!52246) (not e!41692))))

(assert (=> d!19506 (= res!52246 (= (size!1274 (buf!1655 (_1!2927 lt!97889))) (size!1274 (buf!1655 (_2!2926 lt!97888)))))))

(assert (=> d!19506 (= (isPrefixOf!0 (_1!2927 lt!97889) (_2!2926 lt!97888)) e!41692)))

(declare-fun b!62844 () Bool)

(declare-fun res!52248 () Bool)

(assert (=> b!62844 (=> (not res!52248) (not e!41692))))

(assert (=> b!62844 (= res!52248 (bvsle (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97889))) (currentByte!3291 (_1!2927 lt!97889)) (currentBit!3286 (_1!2927 lt!97889))) (bitIndex!0 (size!1274 (buf!1655 (_2!2926 lt!97888))) (currentByte!3291 (_2!2926 lt!97888)) (currentBit!3286 (_2!2926 lt!97888)))))))

(declare-fun b!62845 () Bool)

(declare-fun e!41691 () Bool)

(assert (=> b!62845 (= e!41692 e!41691)))

(declare-fun res!52247 () Bool)

(assert (=> b!62845 (=> res!52247 e!41691)))

(assert (=> b!62845 (= res!52247 (= (size!1274 (buf!1655 (_1!2927 lt!97889))) #b00000000000000000000000000000000))))

(declare-fun b!62846 () Bool)

(assert (=> b!62846 (= e!41691 (arrayBitRangesEq!0 (buf!1655 (_1!2927 lt!97889)) (buf!1655 (_2!2926 lt!97888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1274 (buf!1655 (_1!2927 lt!97889))) (currentByte!3291 (_1!2927 lt!97889)) (currentBit!3286 (_1!2927 lt!97889)))))))

(assert (= (and d!19506 res!52246) b!62844))

(assert (= (and b!62844 res!52248) b!62845))

(assert (= (and b!62845 (not res!52247)) b!62846))

(assert (=> b!62844 m!99445))

(assert (=> b!62844 m!98589))

(assert (=> b!62846 m!99445))

(assert (=> b!62846 m!99445))

(declare-fun m!99485 () Bool)

(assert (=> b!62846 m!99485))

(assert (=> b!62336 d!19506))

(push 1)

(assert (not b!62493))

(assert (not b!62831))

(assert (not b!62775))

(assert (not d!19492))

(assert (not b!62482))

(assert (not b!62783))

(assert (not b!62703))

(assert (not d!19484))

(assert (not b!62729))

(assert (not d!19464))

(assert (not b!62833))

(assert (not b!62501))

(assert (not b!62777))

(assert (not d!19292))

(assert (not d!19298))

(assert (not d!19458))

(assert (not b!62782))

(assert (not b!62503))

(assert (not b!62844))

(assert (not d!19422))

(assert (not d!19296))

(assert (not d!19460))

(assert (not d!19466))

(assert (not b!62779))

(assert (not b!62784))

(assert (not b!62846))

(assert (not b!62805))

(assert (not b!62480))

(assert (not b!62776))

(assert (not b!62838))

(assert (not b!62839))

(assert (not b!62780))

(assert (not d!19496))

(assert (not d!19494))

(assert (not b!62498))

(assert (not b!62781))

(assert (not b!62495))

(assert (not b!62810))

(assert (not d!19500))

(assert (not b!62832))

(assert (not d!19468))

(assert (not d!19470))

(assert (not b!62727))

(assert (not b!62808))

(assert (not d!19420))

(assert (not b!62707))

(assert (not d!19416))

(assert (not d!19306))

(assert (not b!62813))

(assert (not b!62803))

(assert (not b!62800))

(assert (not b!62804))

(assert (not b!62841))

(assert (not b!62834))

(assert (not b!62497))

(assert (not b!62494))

(assert (not b!62807))

(assert (not d!19502))

(assert (not b!62725))

(assert (not b!62500))

(assert (not b!62837))

(assert (not bm!793))

(assert (not b!62836))

(assert (not b!62786))

(assert (not d!19304))

(assert (not b!62701))

(assert (not b!62802))

(assert (not b!62702))

(assert (not b!62835))

(assert (not b!62704))

(assert (not b!62726))

(assert (not b!62706))

(assert (not d!19424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

