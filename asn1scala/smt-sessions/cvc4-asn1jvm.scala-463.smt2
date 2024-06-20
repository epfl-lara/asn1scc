; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13012 () Bool)

(assert start!13012)

(declare-fun b!66853 () Bool)

(declare-fun e!43872 () Bool)

(declare-fun e!43873 () Bool)

(assert (=> b!66853 (= e!43872 e!43873)))

(declare-fun res!55411 () Bool)

(assert (=> b!66853 (=> res!55411 e!43873)))

(declare-datatypes ((array!2861 0))(
  ( (array!2862 (arr!1888 (Array (_ BitVec 32) (_ BitVec 8))) (size!1321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2270 0))(
  ( (BitStream!2271 (buf!1702 array!2861) (currentByte!3380 (_ BitVec 32)) (currentBit!3375 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4503 0))(
  ( (Unit!4504) )
))
(declare-datatypes ((tuple2!5900 0))(
  ( (tuple2!5901 (_1!3061 Unit!4503) (_2!3061 BitStream!2270)) )
))
(declare-fun lt!106267 () tuple2!5900)

(declare-fun lt!106277 () tuple2!5900)

(declare-fun isPrefixOf!0 (BitStream!2270 BitStream!2270) Bool)

(assert (=> b!66853 (= res!55411 (not (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106277))))))

(declare-fun thiss!1379 () BitStream!2270)

(assert (=> b!66853 (isPrefixOf!0 thiss!1379 (_2!3061 lt!106277))))

(declare-fun lt!106283 () Unit!4503)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2270 BitStream!2270 BitStream!2270) Unit!4503)

(assert (=> b!66853 (= lt!106283 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3061 lt!106267) (_2!3061 lt!106277)))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!2861)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2270 array!2861 (_ BitVec 64) (_ BitVec 64)) tuple2!5900)

(assert (=> b!66853 (= lt!106277 (appendBitsMSBFirstLoop!0 (_2!3061 lt!106267) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43871 () Bool)

(assert (=> b!66853 e!43871))

(declare-fun res!55402 () Bool)

(assert (=> b!66853 (=> (not res!55402) (not e!43871))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66853 (= res!55402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106280 () Unit!4503)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2270 array!2861 (_ BitVec 64)) Unit!4503)

(assert (=> b!66853 (= lt!106280 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1702 (_2!3061 lt!106267)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5902 0))(
  ( (tuple2!5903 (_1!3062 BitStream!2270) (_2!3062 BitStream!2270)) )
))
(declare-fun lt!106284 () tuple2!5902)

(declare-fun reader!0 (BitStream!2270 BitStream!2270) tuple2!5902)

(assert (=> b!66853 (= lt!106284 (reader!0 thiss!1379 (_2!3061 lt!106267)))))

(declare-fun b!66854 () Bool)

(declare-fun e!43867 () Bool)

(declare-fun e!43874 () Bool)

(assert (=> b!66854 (= e!43867 e!43874)))

(declare-fun res!55398 () Bool)

(assert (=> b!66854 (=> res!55398 e!43874)))

(assert (=> b!66854 (= res!55398 (not (= (size!1321 (buf!1702 (_2!3061 lt!106267))) (size!1321 (buf!1702 (_2!3061 lt!106277))))))))

(declare-fun lt!106287 () (_ BitVec 64))

(declare-fun lt!106274 () (_ BitVec 64))

(assert (=> b!66854 (= lt!106287 (bvsub lt!106274 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106279 () (_ BitVec 64))

(assert (=> b!66854 (= lt!106274 (bvsub lt!106279 i!635))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66854 (= lt!106279 (bvadd (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))) to!314))))

(assert (=> b!66854 (= (size!1321 (buf!1702 (_2!3061 lt!106277))) (size!1321 (buf!1702 thiss!1379)))))

(declare-fun b!66855 () Bool)

(declare-fun e!43868 () Bool)

(declare-fun lt!106276 () (_ BitVec 64))

(assert (=> b!66855 (= e!43868 (or (= lt!106276 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!106276 (bvand lt!106274 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!66855 (= lt!106276 (bvand lt!106279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66856 () Bool)

(declare-fun res!55401 () Bool)

(assert (=> b!66856 (=> res!55401 e!43867)))

(assert (=> b!66856 (= res!55401 (not (= (size!1321 (buf!1702 thiss!1379)) (size!1321 (buf!1702 (_2!3061 lt!106277))))))))

(declare-fun b!66857 () Bool)

(assert (=> b!66857 (= e!43873 e!43867)))

(declare-fun res!55395 () Bool)

(assert (=> b!66857 (=> res!55395 e!43867)))

(declare-fun lt!106281 () (_ BitVec 64))

(assert (=> b!66857 (= res!55395 (not (= lt!106287 (bvsub (bvadd lt!106281 to!314) i!635))))))

(assert (=> b!66857 (= lt!106287 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106277))) (currentByte!3380 (_2!3061 lt!106277)) (currentBit!3375 (_2!3061 lt!106277))))))

(declare-fun b!66858 () Bool)

(declare-fun e!43865 () Bool)

(declare-fun e!43875 () Bool)

(assert (=> b!66858 (= e!43865 e!43875)))

(declare-fun res!55409 () Bool)

(assert (=> b!66858 (=> res!55409 e!43875)))

(declare-fun lt!106288 () tuple2!5902)

(declare-fun lt!106275 () Bool)

(declare-fun bitAt!0 (array!2861 (_ BitVec 64)) Bool)

(assert (=> b!66858 (= res!55409 (not (= lt!106275 (bitAt!0 (buf!1702 (_1!3062 lt!106288)) lt!106281))))))

(declare-fun lt!106286 () tuple2!5902)

(assert (=> b!66858 (= lt!106275 (bitAt!0 (buf!1702 (_1!3062 lt!106286)) lt!106281))))

(declare-fun b!66859 () Bool)

(declare-fun e!43870 () Bool)

(declare-fun e!43864 () Bool)

(assert (=> b!66859 (= e!43870 (not e!43864))))

(declare-fun res!55397 () Bool)

(assert (=> b!66859 (=> res!55397 e!43864)))

(assert (=> b!66859 (= res!55397 (bvsge i!635 to!314))))

(assert (=> b!66859 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!106278 () Unit!4503)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2270) Unit!4503)

(assert (=> b!66859 (= lt!106278 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66859 (= lt!106281 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(declare-fun b!66860 () Bool)

(assert (=> b!66860 (= e!43875 e!43868)))

(declare-fun res!55396 () Bool)

(assert (=> b!66860 (=> res!55396 e!43868)))

(declare-fun lt!106273 () Bool)

(declare-datatypes ((List!710 0))(
  ( (Nil!707) (Cons!706 (h!825 Bool) (t!1460 List!710)) )
))
(declare-fun head!529 (List!710) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2270 array!2861 (_ BitVec 64) (_ BitVec 64)) List!710)

(assert (=> b!66860 (= res!55396 (not (= (head!529 (byteArrayBitContentToList!0 (_2!3061 lt!106277) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!106273)))))

(assert (=> b!66860 (= lt!106273 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!66861 () Bool)

(declare-fun e!43876 () Bool)

(assert (=> b!66861 (= e!43876 e!43865)))

(declare-fun res!55404 () Bool)

(assert (=> b!66861 (=> res!55404 e!43865)))

(declare-fun lt!106282 () List!710)

(declare-fun lt!106268 () List!710)

(assert (=> b!66861 (= res!55404 (not (= lt!106282 lt!106268)))))

(assert (=> b!66861 (= lt!106268 lt!106282)))

(declare-fun lt!106266 () List!710)

(declare-fun tail!314 (List!710) List!710)

(assert (=> b!66861 (= lt!106282 (tail!314 lt!106266))))

(declare-fun lt!106269 () Unit!4503)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2270 BitStream!2270 BitStream!2270 BitStream!2270 (_ BitVec 64) List!710) Unit!4503)

(assert (=> b!66861 (= lt!106269 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3061 lt!106277) (_2!3061 lt!106277) (_1!3062 lt!106286) (_1!3062 lt!106288) (bvsub to!314 i!635) lt!106266))))

(declare-fun b!66862 () Bool)

(declare-fun res!55410 () Bool)

(assert (=> b!66862 (=> res!55410 e!43868)))

(assert (=> b!66862 (= res!55410 (not (= (bitAt!0 (buf!1702 (_2!3061 lt!106267)) lt!106281) lt!106273)))))

(declare-fun b!66863 () Bool)

(declare-fun res!55406 () Bool)

(assert (=> b!66863 (=> res!55406 e!43876)))

(declare-fun length!338 (List!710) Int)

(assert (=> b!66863 (= res!55406 (<= (length!338 lt!106266) 0))))

(declare-fun b!66864 () Bool)

(assert (=> b!66864 (= e!43864 e!43872)))

(declare-fun res!55408 () Bool)

(assert (=> b!66864 (=> res!55408 e!43872)))

(assert (=> b!66864 (= res!55408 (not (isPrefixOf!0 thiss!1379 (_2!3061 lt!106267))))))

(declare-fun lt!106271 () (_ BitVec 64))

(assert (=> b!66864 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106271)))

(assert (=> b!66864 (= lt!106271 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106272 () Unit!4503)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2270 BitStream!2270 (_ BitVec 64) (_ BitVec 64)) Unit!4503)

(assert (=> b!66864 (= lt!106272 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3061 lt!106267) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2270 (_ BitVec 8) (_ BitVec 32)) tuple2!5900)

(assert (=> b!66864 (= lt!106267 (appendBitFromByte!0 thiss!1379 (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!66865 () Bool)

(declare-fun res!55403 () Bool)

(assert (=> b!66865 (=> res!55403 e!43874)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66865 (= res!55403 (not (invariant!0 (currentBit!3375 (_2!3061 lt!106267)) (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106267))))))))

(declare-fun b!66852 () Bool)

(declare-fun res!55400 () Bool)

(assert (=> b!66852 (=> (not res!55400) (not e!43870))))

(assert (=> b!66852 (= res!55400 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 thiss!1379))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!55413 () Bool)

(assert (=> start!13012 (=> (not res!55413) (not e!43870))))

(assert (=> start!13012 (= res!55413 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1321 srcBuffer!2))))))))

(assert (=> start!13012 e!43870))

(assert (=> start!13012 true))

(declare-fun array_inv!1194 (array!2861) Bool)

(assert (=> start!13012 (array_inv!1194 srcBuffer!2)))

(declare-fun e!43877 () Bool)

(declare-fun inv!12 (BitStream!2270) Bool)

(assert (=> start!13012 (and (inv!12 thiss!1379) e!43877)))

(declare-fun b!66866 () Bool)

(declare-fun res!55405 () Bool)

(assert (=> b!66866 (=> res!55405 e!43867)))

(assert (=> b!66866 (= res!55405 (not (invariant!0 (currentBit!3375 (_2!3061 lt!106277)) (currentByte!3380 (_2!3061 lt!106277)) (size!1321 (buf!1702 (_2!3061 lt!106277))))))))

(declare-fun b!66867 () Bool)

(declare-fun res!55412 () Bool)

(assert (=> b!66867 (=> res!55412 e!43874)))

(assert (=> b!66867 (= res!55412 (not (invariant!0 (currentBit!3375 (_2!3061 lt!106267)) (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106277))))))))

(declare-fun b!66868 () Bool)

(assert (=> b!66868 (= e!43874 e!43876)))

(declare-fun res!55407 () Bool)

(assert (=> b!66868 (=> res!55407 e!43876)))

(assert (=> b!66868 (= res!55407 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2270 BitStream!2270 (_ BitVec 64)) List!710)

(assert (=> b!66868 (= lt!106268 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_1!3062 lt!106288) lt!106271))))

(assert (=> b!66868 (= lt!106266 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_1!3062 lt!106286) (bvsub to!314 i!635)))))

(assert (=> b!66868 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106271)))

(declare-fun lt!106270 () Unit!4503)

(assert (=> b!66868 (= lt!106270 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3061 lt!106267) (buf!1702 (_2!3061 lt!106277)) lt!106271))))

(assert (=> b!66868 (= lt!106288 (reader!0 (_2!3061 lt!106267) (_2!3061 lt!106277)))))

(assert (=> b!66868 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!106285 () Unit!4503)

(assert (=> b!66868 (= lt!106285 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1702 (_2!3061 lt!106277)) (bvsub to!314 i!635)))))

(assert (=> b!66868 (= lt!106286 (reader!0 thiss!1379 (_2!3061 lt!106277)))))

(declare-fun b!66869 () Bool)

(assert (=> b!66869 (= e!43871 (= (head!529 (byteArrayBitContentToList!0 (_2!3061 lt!106267) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!529 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106267) (_1!3062 lt!106284) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!66870 () Bool)

(assert (=> b!66870 (= e!43877 (array_inv!1194 (buf!1702 thiss!1379)))))

(declare-fun b!66871 () Bool)

(declare-fun res!55399 () Bool)

(assert (=> b!66871 (=> res!55399 e!43875)))

(assert (=> b!66871 (= res!55399 (not (= (head!529 lt!106266) lt!106275)))))

(assert (= (and start!13012 res!55413) b!66852))

(assert (= (and b!66852 res!55400) b!66859))

(assert (= (and b!66859 (not res!55397)) b!66864))

(assert (= (and b!66864 (not res!55408)) b!66853))

(assert (= (and b!66853 res!55402) b!66869))

(assert (= (and b!66853 (not res!55411)) b!66857))

(assert (= (and b!66857 (not res!55395)) b!66866))

(assert (= (and b!66866 (not res!55405)) b!66856))

(assert (= (and b!66856 (not res!55401)) b!66854))

(assert (= (and b!66854 (not res!55398)) b!66865))

(assert (= (and b!66865 (not res!55403)) b!66867))

(assert (= (and b!66867 (not res!55412)) b!66868))

(assert (= (and b!66868 (not res!55407)) b!66863))

(assert (= (and b!66863 (not res!55406)) b!66861))

(assert (= (and b!66861 (not res!55404)) b!66858))

(assert (= (and b!66858 (not res!55409)) b!66871))

(assert (= (and b!66871 (not res!55399)) b!66860))

(assert (= (and b!66860 (not res!55396)) b!66862))

(assert (= (and b!66862 (not res!55410)) b!66855))

(assert (= start!13012 b!66870))

(declare-fun m!106331 () Bool)

(assert (=> b!66859 m!106331))

(declare-fun m!106333 () Bool)

(assert (=> b!66859 m!106333))

(declare-fun m!106335 () Bool)

(assert (=> b!66859 m!106335))

(declare-fun m!106337 () Bool)

(assert (=> b!66860 m!106337))

(assert (=> b!66860 m!106337))

(declare-fun m!106339 () Bool)

(assert (=> b!66860 m!106339))

(declare-fun m!106341 () Bool)

(assert (=> b!66860 m!106341))

(declare-fun m!106343 () Bool)

(assert (=> b!66853 m!106343))

(declare-fun m!106345 () Bool)

(assert (=> b!66853 m!106345))

(declare-fun m!106347 () Bool)

(assert (=> b!66853 m!106347))

(declare-fun m!106349 () Bool)

(assert (=> b!66853 m!106349))

(declare-fun m!106351 () Bool)

(assert (=> b!66853 m!106351))

(declare-fun m!106353 () Bool)

(assert (=> b!66853 m!106353))

(declare-fun m!106355 () Bool)

(assert (=> b!66853 m!106355))

(declare-fun m!106357 () Bool)

(assert (=> b!66865 m!106357))

(declare-fun m!106359 () Bool)

(assert (=> b!66861 m!106359))

(declare-fun m!106361 () Bool)

(assert (=> b!66861 m!106361))

(declare-fun m!106363 () Bool)

(assert (=> b!66857 m!106363))

(declare-fun m!106365 () Bool)

(assert (=> start!13012 m!106365))

(declare-fun m!106367 () Bool)

(assert (=> start!13012 m!106367))

(declare-fun m!106369 () Bool)

(assert (=> b!66858 m!106369))

(declare-fun m!106371 () Bool)

(assert (=> b!66858 m!106371))

(declare-fun m!106373 () Bool)

(assert (=> b!66867 m!106373))

(declare-fun m!106375 () Bool)

(assert (=> b!66864 m!106375))

(declare-fun m!106377 () Bool)

(assert (=> b!66864 m!106377))

(declare-fun m!106379 () Bool)

(assert (=> b!66864 m!106379))

(assert (=> b!66864 m!106375))

(declare-fun m!106381 () Bool)

(assert (=> b!66864 m!106381))

(declare-fun m!106383 () Bool)

(assert (=> b!66864 m!106383))

(declare-fun m!106385 () Bool)

(assert (=> b!66863 m!106385))

(declare-fun m!106387 () Bool)

(assert (=> b!66871 m!106387))

(declare-fun m!106389 () Bool)

(assert (=> b!66870 m!106389))

(declare-fun m!106391 () Bool)

(assert (=> b!66862 m!106391))

(declare-fun m!106393 () Bool)

(assert (=> b!66852 m!106393))

(declare-fun m!106395 () Bool)

(assert (=> b!66868 m!106395))

(declare-fun m!106397 () Bool)

(assert (=> b!66868 m!106397))

(declare-fun m!106399 () Bool)

(assert (=> b!66868 m!106399))

(declare-fun m!106401 () Bool)

(assert (=> b!66868 m!106401))

(declare-fun m!106403 () Bool)

(assert (=> b!66868 m!106403))

(declare-fun m!106405 () Bool)

(assert (=> b!66868 m!106405))

(declare-fun m!106407 () Bool)

(assert (=> b!66868 m!106407))

(declare-fun m!106409 () Bool)

(assert (=> b!66868 m!106409))

(declare-fun m!106411 () Bool)

(assert (=> b!66854 m!106411))

(declare-fun m!106413 () Bool)

(assert (=> b!66866 m!106413))

(declare-fun m!106415 () Bool)

(assert (=> b!66869 m!106415))

(assert (=> b!66869 m!106415))

(declare-fun m!106417 () Bool)

(assert (=> b!66869 m!106417))

(declare-fun m!106419 () Bool)

(assert (=> b!66869 m!106419))

(assert (=> b!66869 m!106419))

(declare-fun m!106421 () Bool)

(assert (=> b!66869 m!106421))

(push 1)

(assert (not b!66860))

(assert (not b!66868))

(assert (not b!66852))

(assert (not b!66854))

(assert (not start!13012))

(assert (not b!66867))

(assert (not b!66866))

(assert (not b!66859))

(assert (not b!66865))

(assert (not b!66861))

(assert (not b!66870))

(assert (not b!66869))

(assert (not b!66858))

(assert (not b!66863))

(assert (not b!66862))

(assert (not b!66864))

(assert (not b!66857))

(assert (not b!66853))

(assert (not b!66871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21060 () Bool)

(assert (=> d!21060 (= (invariant!0 (currentBit!3375 (_2!3061 lt!106267)) (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106277)))) (and (bvsge (currentBit!3375 (_2!3061 lt!106267)) #b00000000000000000000000000000000) (bvslt (currentBit!3375 (_2!3061 lt!106267)) #b00000000000000000000000000001000) (bvsge (currentByte!3380 (_2!3061 lt!106267)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106277)))) (and (= (currentBit!3375 (_2!3061 lt!106267)) #b00000000000000000000000000000000) (= (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106277))))))))))

(assert (=> b!66867 d!21060))

(declare-fun d!21062 () Bool)

(assert (=> d!21062 (= (array_inv!1194 srcBuffer!2) (bvsge (size!1321 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13012 d!21062))

(declare-fun d!21064 () Bool)

(assert (=> d!21064 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3375 thiss!1379) (currentByte!3380 thiss!1379) (size!1321 (buf!1702 thiss!1379))))))

(declare-fun bs!5113 () Bool)

(assert (= bs!5113 d!21064))

(declare-fun m!106451 () Bool)

(assert (=> bs!5113 m!106451))

(assert (=> start!13012 d!21064))

(declare-fun d!21066 () Bool)

(assert (=> d!21066 (= (invariant!0 (currentBit!3375 (_2!3061 lt!106267)) (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106267)))) (and (bvsge (currentBit!3375 (_2!3061 lt!106267)) #b00000000000000000000000000000000) (bvslt (currentBit!3375 (_2!3061 lt!106267)) #b00000000000000000000000000001000) (bvsge (currentByte!3380 (_2!3061 lt!106267)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106267)))) (and (= (currentBit!3375 (_2!3061 lt!106267)) #b00000000000000000000000000000000) (= (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106267))))))))))

(assert (=> b!66865 d!21066))

(declare-fun d!21068 () Bool)

(assert (=> d!21068 (= (invariant!0 (currentBit!3375 (_2!3061 lt!106277)) (currentByte!3380 (_2!3061 lt!106277)) (size!1321 (buf!1702 (_2!3061 lt!106277)))) (and (bvsge (currentBit!3375 (_2!3061 lt!106277)) #b00000000000000000000000000000000) (bvslt (currentBit!3375 (_2!3061 lt!106277)) #b00000000000000000000000000001000) (bvsge (currentByte!3380 (_2!3061 lt!106277)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3380 (_2!3061 lt!106277)) (size!1321 (buf!1702 (_2!3061 lt!106277)))) (and (= (currentBit!3375 (_2!3061 lt!106277)) #b00000000000000000000000000000000) (= (currentByte!3380 (_2!3061 lt!106277)) (size!1321 (buf!1702 (_2!3061 lt!106277))))))))))

(assert (=> b!66866 d!21068))

(declare-fun b!66952 () Bool)

(declare-fun lt!106410 () tuple2!5902)

(declare-fun lt!106407 () (_ BitVec 64))

(declare-fun e!43921 () Bool)

(declare-fun lt!106415 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2270 (_ BitVec 64)) BitStream!2270)

(assert (=> b!66952 (= e!43921 (= (_1!3062 lt!106410) (withMovedBitIndex!0 (_2!3062 lt!106410) (bvsub lt!106407 lt!106415))))))

(assert (=> b!66952 (or (= (bvand lt!106407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106407 lt!106415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66952 (= lt!106415 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))))))

(assert (=> b!66952 (= lt!106407 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(declare-fun d!21070 () Bool)

(assert (=> d!21070 e!43921))

(declare-fun res!55471 () Bool)

(assert (=> d!21070 (=> (not res!55471) (not e!43921))))

(assert (=> d!21070 (= res!55471 (isPrefixOf!0 (_1!3062 lt!106410) (_2!3062 lt!106410)))))

(declare-fun lt!106420 () BitStream!2270)

(assert (=> d!21070 (= lt!106410 (tuple2!5903 lt!106420 (_2!3061 lt!106267)))))

(declare-fun lt!106412 () Unit!4503)

(declare-fun lt!106404 () Unit!4503)

(assert (=> d!21070 (= lt!106412 lt!106404)))

(assert (=> d!21070 (isPrefixOf!0 lt!106420 (_2!3061 lt!106267))))

(assert (=> d!21070 (= lt!106404 (lemmaIsPrefixTransitive!0 lt!106420 (_2!3061 lt!106267) (_2!3061 lt!106267)))))

(declare-fun lt!106408 () Unit!4503)

(declare-fun lt!106419 () Unit!4503)

(assert (=> d!21070 (= lt!106408 lt!106419)))

(assert (=> d!21070 (isPrefixOf!0 lt!106420 (_2!3061 lt!106267))))

(assert (=> d!21070 (= lt!106419 (lemmaIsPrefixTransitive!0 lt!106420 thiss!1379 (_2!3061 lt!106267)))))

(declare-fun lt!106402 () Unit!4503)

(declare-fun e!43922 () Unit!4503)

(assert (=> d!21070 (= lt!106402 e!43922)))

(declare-fun c!4872 () Bool)

(assert (=> d!21070 (= c!4872 (not (= (size!1321 (buf!1702 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!106409 () Unit!4503)

(declare-fun lt!106417 () Unit!4503)

(assert (=> d!21070 (= lt!106409 lt!106417)))

(assert (=> d!21070 (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106267))))

(assert (=> d!21070 (= lt!106417 (lemmaIsPrefixRefl!0 (_2!3061 lt!106267)))))

(declare-fun lt!106406 () Unit!4503)

(declare-fun lt!106414 () Unit!4503)

(assert (=> d!21070 (= lt!106406 lt!106414)))

(assert (=> d!21070 (= lt!106414 (lemmaIsPrefixRefl!0 (_2!3061 lt!106267)))))

(declare-fun lt!106411 () Unit!4503)

(declare-fun lt!106413 () Unit!4503)

(assert (=> d!21070 (= lt!106411 lt!106413)))

(assert (=> d!21070 (isPrefixOf!0 lt!106420 lt!106420)))

(assert (=> d!21070 (= lt!106413 (lemmaIsPrefixRefl!0 lt!106420))))

(declare-fun lt!106405 () Unit!4503)

(declare-fun lt!106416 () Unit!4503)

(assert (=> d!21070 (= lt!106405 lt!106416)))

(assert (=> d!21070 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21070 (= lt!106416 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21070 (= lt!106420 (BitStream!2271 (buf!1702 (_2!3061 lt!106267)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(assert (=> d!21070 (isPrefixOf!0 thiss!1379 (_2!3061 lt!106267))))

(assert (=> d!21070 (= (reader!0 thiss!1379 (_2!3061 lt!106267)) lt!106410)))

(declare-fun b!66953 () Bool)

(declare-fun res!55472 () Bool)

(assert (=> b!66953 (=> (not res!55472) (not e!43921))))

(assert (=> b!66953 (= res!55472 (isPrefixOf!0 (_2!3062 lt!106410) (_2!3061 lt!106267)))))

(declare-fun b!66954 () Bool)

(declare-fun Unit!4522 () Unit!4503)

(assert (=> b!66954 (= e!43922 Unit!4522)))

(declare-fun b!66955 () Bool)

(declare-fun res!55473 () Bool)

(assert (=> b!66955 (=> (not res!55473) (not e!43921))))

(assert (=> b!66955 (= res!55473 (isPrefixOf!0 (_1!3062 lt!106410) thiss!1379))))

(declare-fun b!66956 () Bool)

(declare-fun lt!106403 () Unit!4503)

(assert (=> b!66956 (= e!43922 lt!106403)))

(declare-fun lt!106418 () (_ BitVec 64))

(assert (=> b!66956 (= lt!106418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106401 () (_ BitVec 64))

(assert (=> b!66956 (= lt!106401 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2861 array!2861 (_ BitVec 64) (_ BitVec 64)) Unit!4503)

(assert (=> b!66956 (= lt!106403 (arrayBitRangesEqSymmetric!0 (buf!1702 thiss!1379) (buf!1702 (_2!3061 lt!106267)) lt!106418 lt!106401))))

(declare-fun arrayBitRangesEq!0 (array!2861 array!2861 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66956 (arrayBitRangesEq!0 (buf!1702 (_2!3061 lt!106267)) (buf!1702 thiss!1379) lt!106418 lt!106401)))

(assert (= (and d!21070 c!4872) b!66956))

(assert (= (and d!21070 (not c!4872)) b!66954))

(assert (= (and d!21070 res!55471) b!66955))

(assert (= (and b!66955 res!55473) b!66953))

(assert (= (and b!66953 res!55472) b!66952))

(declare-fun m!106481 () Bool)

(assert (=> d!21070 m!106481))

(declare-fun m!106485 () Bool)

(assert (=> d!21070 m!106485))

(declare-fun m!106487 () Bool)

(assert (=> d!21070 m!106487))

(declare-fun m!106489 () Bool)

(assert (=> d!21070 m!106489))

(declare-fun m!106491 () Bool)

(assert (=> d!21070 m!106491))

(declare-fun m!106493 () Bool)

(assert (=> d!21070 m!106493))

(declare-fun m!106495 () Bool)

(assert (=> d!21070 m!106495))

(assert (=> d!21070 m!106333))

(assert (=> d!21070 m!106331))

(assert (=> d!21070 m!106383))

(declare-fun m!106497 () Bool)

(assert (=> d!21070 m!106497))

(declare-fun m!106499 () Bool)

(assert (=> b!66953 m!106499))

(declare-fun m!106501 () Bool)

(assert (=> b!66952 m!106501))

(assert (=> b!66952 m!106411))

(assert (=> b!66952 m!106335))

(declare-fun m!106503 () Bool)

(assert (=> b!66955 m!106503))

(assert (=> b!66956 m!106335))

(declare-fun m!106505 () Bool)

(assert (=> b!66956 m!106505))

(declare-fun m!106507 () Bool)

(assert (=> b!66956 m!106507))

(assert (=> b!66853 d!21070))

(declare-fun d!21076 () Bool)

(declare-fun e!44000 () Bool)

(assert (=> d!21076 e!44000))

(declare-fun res!55604 () Bool)

(assert (=> d!21076 (=> (not res!55604) (not e!44000))))

(declare-fun lt!107008 () tuple2!5900)

(declare-fun lt!106997 () (_ BitVec 64))

(assert (=> d!21076 (= res!55604 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!107008))) (currentByte!3380 (_2!3061 lt!107008)) (currentBit!3375 (_2!3061 lt!107008))) (bvsub lt!106997 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21076 (or (= (bvand lt!106997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106997 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106999 () (_ BitVec 64))

(assert (=> d!21076 (= lt!106997 (bvadd lt!106999 to!314))))

(assert (=> d!21076 (or (not (= (bvand lt!106999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!106999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!106999 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21076 (= lt!106999 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))))))

(declare-fun e!43999 () tuple2!5900)

(assert (=> d!21076 (= lt!107008 e!43999)))

(declare-fun c!4891 () Bool)

(assert (=> d!21076 (= c!4891 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!107006 () Unit!4503)

(declare-fun lt!107014 () Unit!4503)

(assert (=> d!21076 (= lt!107006 lt!107014)))

(assert (=> d!21076 (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106267))))

(assert (=> d!21076 (= lt!107014 (lemmaIsPrefixRefl!0 (_2!3061 lt!106267)))))

(declare-fun lt!106980 () (_ BitVec 64))

(assert (=> d!21076 (= lt!106980 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))))))

(assert (=> d!21076 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21076 (= (appendBitsMSBFirstLoop!0 (_2!3061 lt!106267) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!107008)))

(declare-fun b!67119 () Bool)

(declare-fun res!55599 () Bool)

(assert (=> b!67119 (=> (not res!55599) (not e!44000))))

(assert (=> b!67119 (= res!55599 (= (size!1321 (buf!1702 (_2!3061 lt!106267))) (size!1321 (buf!1702 (_2!3061 lt!107008)))))))

(declare-fun lt!107017 () tuple2!5902)

(declare-fun b!67120 () Bool)

(assert (=> b!67120 (= e!44000 (= (bitStreamReadBitsIntoList!0 (_2!3061 lt!107008) (_1!3062 lt!107017) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3061 lt!107008) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!67120 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67120 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106989 () Unit!4503)

(declare-fun lt!107003 () Unit!4503)

(assert (=> b!67120 (= lt!106989 lt!107003)))

(declare-fun lt!106991 () (_ BitVec 64))

(assert (=> b!67120 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!107008)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106991)))

(assert (=> b!67120 (= lt!107003 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3061 lt!106267) (buf!1702 (_2!3061 lt!107008)) lt!106991))))

(declare-fun e!44001 () Bool)

(assert (=> b!67120 e!44001))

(declare-fun res!55603 () Bool)

(assert (=> b!67120 (=> (not res!55603) (not e!44001))))

(assert (=> b!67120 (= res!55603 (and (= (size!1321 (buf!1702 (_2!3061 lt!106267))) (size!1321 (buf!1702 (_2!3061 lt!107008)))) (bvsge lt!106991 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67120 (= lt!106991 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!67120 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67120 (= lt!107017 (reader!0 (_2!3061 lt!106267) (_2!3061 lt!107008)))))

(declare-fun b!67121 () Bool)

(declare-fun res!55601 () Bool)

(assert (=> b!67121 (=> (not res!55601) (not e!44000))))

(assert (=> b!67121 (= res!55601 (= (size!1321 (buf!1702 (_2!3061 lt!107008))) (size!1321 (buf!1702 (_2!3061 lt!106267)))))))

(declare-fun b!67122 () Bool)

(declare-fun res!55600 () Bool)

(assert (=> b!67122 (=> (not res!55600) (not e!44000))))

(assert (=> b!67122 (= res!55600 (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!107008)))))

(declare-fun b!67123 () Bool)

(declare-fun Unit!4525 () Unit!4503)

(assert (=> b!67123 (= e!43999 (tuple2!5901 Unit!4525 (_2!3061 lt!106267)))))

(assert (=> b!67123 (= (size!1321 (buf!1702 (_2!3061 lt!106267))) (size!1321 (buf!1702 (_2!3061 lt!106267))))))

(declare-fun lt!106986 () Unit!4503)

(declare-fun Unit!4526 () Unit!4503)

(assert (=> b!67123 (= lt!106986 Unit!4526)))

(declare-fun call!862 () tuple2!5902)

(declare-fun checkByteArrayBitContent!0 (BitStream!2270 array!2861 array!2861 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5916 0))(
  ( (tuple2!5917 (_1!3069 array!2861) (_2!3069 BitStream!2270)) )
))
(declare-fun readBits!0 (BitStream!2270 (_ BitVec 64)) tuple2!5916)

(assert (=> b!67123 (checkByteArrayBitContent!0 (_2!3061 lt!106267) srcBuffer!2 (_1!3069 (readBits!0 (_1!3062 call!862) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!67124 () Bool)

(declare-fun lt!106988 () tuple2!5900)

(declare-fun Unit!4527 () Unit!4503)

(assert (=> b!67124 (= e!43999 (tuple2!5901 Unit!4527 (_2!3061 lt!106988)))))

(declare-fun lt!106982 () tuple2!5900)

(assert (=> b!67124 (= lt!106982 (appendBitFromByte!0 (_2!3061 lt!106267) (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!107012 () (_ BitVec 64))

(assert (=> b!67124 (= lt!107012 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107019 () (_ BitVec 64))

(assert (=> b!67124 (= lt!107019 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107004 () Unit!4503)

(assert (=> b!67124 (= lt!107004 (validateOffsetBitsIneqLemma!0 (_2!3061 lt!106267) (_2!3061 lt!106982) lt!107012 lt!107019))))

(assert (=> b!67124 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106982)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106982))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106982))) (bvsub lt!107012 lt!107019))))

(declare-fun lt!107015 () Unit!4503)

(assert (=> b!67124 (= lt!107015 lt!107004)))

(declare-fun lt!107002 () tuple2!5902)

(assert (=> b!67124 (= lt!107002 (reader!0 (_2!3061 lt!106267) (_2!3061 lt!106982)))))

(declare-fun lt!106984 () (_ BitVec 64))

(assert (=> b!67124 (= lt!106984 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106978 () Unit!4503)

(assert (=> b!67124 (= lt!106978 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3061 lt!106267) (buf!1702 (_2!3061 lt!106982)) lt!106984))))

(assert (=> b!67124 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106982)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106984)))

(declare-fun lt!107007 () Unit!4503)

(assert (=> b!67124 (= lt!107007 lt!106978)))

(assert (=> b!67124 (= (head!529 (byteArrayBitContentToList!0 (_2!3061 lt!106982) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!529 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106982) (_1!3062 lt!107002) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106985 () Unit!4503)

(declare-fun Unit!4528 () Unit!4503)

(assert (=> b!67124 (= lt!106985 Unit!4528)))

(assert (=> b!67124 (= lt!106988 (appendBitsMSBFirstLoop!0 (_2!3061 lt!106982) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!106993 () Unit!4503)

(assert (=> b!67124 (= lt!106993 (lemmaIsPrefixTransitive!0 (_2!3061 lt!106267) (_2!3061 lt!106982) (_2!3061 lt!106988)))))

(assert (=> b!67124 (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106988))))

(declare-fun lt!106979 () Unit!4503)

(assert (=> b!67124 (= lt!106979 lt!106993)))

(assert (=> b!67124 (= (size!1321 (buf!1702 (_2!3061 lt!106988))) (size!1321 (buf!1702 (_2!3061 lt!106267))))))

(declare-fun lt!107010 () Unit!4503)

(declare-fun Unit!4529 () Unit!4503)

(assert (=> b!67124 (= lt!107010 Unit!4529)))

(assert (=> b!67124 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106988))) (currentByte!3380 (_2!3061 lt!106988)) (currentBit!3375 (_2!3061 lt!106988))) (bvsub (bvadd (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107013 () Unit!4503)

(declare-fun Unit!4530 () Unit!4503)

(assert (=> b!67124 (= lt!107013 Unit!4530)))

(assert (=> b!67124 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106988))) (currentByte!3380 (_2!3061 lt!106988)) (currentBit!3375 (_2!3061 lt!106988))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106982))) (currentByte!3380 (_2!3061 lt!106982)) (currentBit!3375 (_2!3061 lt!106982))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107011 () Unit!4503)

(declare-fun Unit!4532 () Unit!4503)

(assert (=> b!67124 (= lt!107011 Unit!4532)))

(declare-fun lt!107016 () tuple2!5902)

(assert (=> b!67124 (= lt!107016 (reader!0 (_2!3061 lt!106267) (_2!3061 lt!106988)))))

(declare-fun lt!106983 () (_ BitVec 64))

(assert (=> b!67124 (= lt!106983 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107009 () Unit!4503)

(assert (=> b!67124 (= lt!107009 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3061 lt!106267) (buf!1702 (_2!3061 lt!106988)) lt!106983))))

(assert (=> b!67124 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106988)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106983)))

(declare-fun lt!106998 () Unit!4503)

(assert (=> b!67124 (= lt!106998 lt!107009)))

(declare-fun lt!106994 () tuple2!5902)

(assert (=> b!67124 (= lt!106994 call!862)))

(declare-fun lt!106977 () (_ BitVec 64))

(assert (=> b!67124 (= lt!106977 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107020 () Unit!4503)

(assert (=> b!67124 (= lt!107020 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3061 lt!106982) (buf!1702 (_2!3061 lt!106988)) lt!106977))))

(assert (=> b!67124 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106988)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106982))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106982))) lt!106977)))

(declare-fun lt!106995 () Unit!4503)

(assert (=> b!67124 (= lt!106995 lt!107020)))

(declare-fun lt!107001 () List!710)

(assert (=> b!67124 (= lt!107001 (byteArrayBitContentToList!0 (_2!3061 lt!106988) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106996 () List!710)

(assert (=> b!67124 (= lt!106996 (byteArrayBitContentToList!0 (_2!3061 lt!106988) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106981 () List!710)

(assert (=> b!67124 (= lt!106981 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106988) (_1!3062 lt!107016) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106990 () List!710)

(assert (=> b!67124 (= lt!106990 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106988) (_1!3062 lt!106994) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!107018 () (_ BitVec 64))

(assert (=> b!67124 (= lt!107018 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106992 () Unit!4503)

(assert (=> b!67124 (= lt!106992 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3061 lt!106988) (_2!3061 lt!106988) (_1!3062 lt!107016) (_1!3062 lt!106994) lt!107018 lt!106981))))

(assert (=> b!67124 (= (bitStreamReadBitsIntoList!0 (_2!3061 lt!106988) (_1!3062 lt!106994) (bvsub lt!107018 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!314 lt!106981))))

(declare-fun lt!107000 () Unit!4503)

(assert (=> b!67124 (= lt!107000 lt!106992)))

(declare-fun lt!106987 () Unit!4503)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2861 array!2861 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4503)

(assert (=> b!67124 (= lt!106987 (arrayBitRangesEqImpliesEq!0 (buf!1702 (_2!3061 lt!106982)) (buf!1702 (_2!3061 lt!106988)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!106980 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106982))) (currentByte!3380 (_2!3061 lt!106982)) (currentBit!3375 (_2!3061 lt!106982)))))))

(assert (=> b!67124 (= (bitAt!0 (buf!1702 (_2!3061 lt!106982)) lt!106980) (bitAt!0 (buf!1702 (_2!3061 lt!106988)) lt!106980))))

(declare-fun lt!107005 () Unit!4503)

(assert (=> b!67124 (= lt!107005 lt!106987)))

(declare-fun bm!859 () Bool)

(assert (=> bm!859 (= call!862 (reader!0 (ite c!4891 (_2!3061 lt!106982) (_2!3061 lt!106267)) (ite c!4891 (_2!3061 lt!106988) (_2!3061 lt!106267))))))

(declare-fun b!67125 () Bool)

(assert (=> b!67125 (= e!44001 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106991))))

(declare-fun b!67126 () Bool)

(declare-fun res!55602 () Bool)

(assert (=> b!67126 (=> (not res!55602) (not e!44000))))

(assert (=> b!67126 (= res!55602 (invariant!0 (currentBit!3375 (_2!3061 lt!107008)) (currentByte!3380 (_2!3061 lt!107008)) (size!1321 (buf!1702 (_2!3061 lt!107008)))))))

(assert (= (and d!21076 c!4891) b!67124))

(assert (= (and d!21076 (not c!4891)) b!67123))

(assert (= (or b!67124 b!67123) bm!859))

(assert (= (and d!21076 res!55604) b!67126))

(assert (= (and b!67126 res!55602) b!67119))

(assert (= (and b!67119 res!55599) b!67122))

(assert (= (and b!67122 res!55600) b!67121))

(assert (= (and b!67121 res!55601) b!67120))

(assert (= (and b!67120 res!55603) b!67125))

(declare-fun m!106861 () Bool)

(assert (=> d!21076 m!106861))

(assert (=> d!21076 m!106411))

(assert (=> d!21076 m!106487))

(assert (=> d!21076 m!106489))

(declare-fun m!106863 () Bool)

(assert (=> b!67126 m!106863))

(declare-fun m!106865 () Bool)

(assert (=> b!67125 m!106865))

(declare-fun m!106867 () Bool)

(assert (=> b!67120 m!106867))

(declare-fun m!106869 () Bool)

(assert (=> b!67120 m!106869))

(declare-fun m!106871 () Bool)

(assert (=> b!67120 m!106871))

(declare-fun m!106873 () Bool)

(assert (=> b!67120 m!106873))

(declare-fun m!106875 () Bool)

(assert (=> b!67120 m!106875))

(declare-fun m!106877 () Bool)

(assert (=> b!67124 m!106877))

(declare-fun m!106879 () Bool)

(assert (=> b!67124 m!106879))

(declare-fun m!106881 () Bool)

(assert (=> b!67124 m!106881))

(declare-fun m!106883 () Bool)

(assert (=> b!67124 m!106883))

(declare-fun m!106885 () Bool)

(assert (=> b!67124 m!106885))

(declare-fun m!106887 () Bool)

(assert (=> b!67124 m!106887))

(declare-fun m!106889 () Bool)

(assert (=> b!67124 m!106889))

(assert (=> b!67124 m!106411))

(declare-fun m!106891 () Bool)

(assert (=> b!67124 m!106891))

(declare-fun m!106893 () Bool)

(assert (=> b!67124 m!106893))

(declare-fun m!106895 () Bool)

(assert (=> b!67124 m!106895))

(declare-fun m!106897 () Bool)

(assert (=> b!67124 m!106897))

(assert (=> b!67124 m!106895))

(declare-fun m!106899 () Bool)

(assert (=> b!67124 m!106899))

(declare-fun m!106901 () Bool)

(assert (=> b!67124 m!106901))

(declare-fun m!106903 () Bool)

(assert (=> b!67124 m!106903))

(declare-fun m!106905 () Bool)

(assert (=> b!67124 m!106905))

(declare-fun m!106907 () Bool)

(assert (=> b!67124 m!106907))

(declare-fun m!106909 () Bool)

(assert (=> b!67124 m!106909))

(declare-fun m!106911 () Bool)

(assert (=> b!67124 m!106911))

(declare-fun m!106913 () Bool)

(assert (=> b!67124 m!106913))

(declare-fun m!106915 () Bool)

(assert (=> b!67124 m!106915))

(declare-fun m!106917 () Bool)

(assert (=> b!67124 m!106917))

(declare-fun m!106919 () Bool)

(assert (=> b!67124 m!106919))

(declare-fun m!106921 () Bool)

(assert (=> b!67124 m!106921))

(declare-fun m!106923 () Bool)

(assert (=> b!67124 m!106923))

(declare-fun m!106925 () Bool)

(assert (=> b!67124 m!106925))

(declare-fun m!106927 () Bool)

(assert (=> b!67124 m!106927))

(assert (=> b!67124 m!106891))

(declare-fun m!106929 () Bool)

(assert (=> b!67124 m!106929))

(assert (=> b!67124 m!106927))

(declare-fun m!106931 () Bool)

(assert (=> b!67124 m!106931))

(declare-fun m!106933 () Bool)

(assert (=> b!67124 m!106933))

(declare-fun m!106935 () Bool)

(assert (=> b!67124 m!106935))

(assert (=> b!67124 m!106917))

(declare-fun m!106937 () Bool)

(assert (=> b!67124 m!106937))

(declare-fun m!106939 () Bool)

(assert (=> bm!859 m!106939))

(declare-fun m!106941 () Bool)

(assert (=> b!67123 m!106941))

(declare-fun m!106943 () Bool)

(assert (=> b!67123 m!106943))

(declare-fun m!106945 () Bool)

(assert (=> b!67122 m!106945))

(assert (=> b!66853 d!21076))

(declare-fun d!21166 () Bool)

(declare-fun res!55612 () Bool)

(declare-fun e!44006 () Bool)

(assert (=> d!21166 (=> (not res!55612) (not e!44006))))

(assert (=> d!21166 (= res!55612 (= (size!1321 (buf!1702 thiss!1379)) (size!1321 (buf!1702 (_2!3061 lt!106277)))))))

(assert (=> d!21166 (= (isPrefixOf!0 thiss!1379 (_2!3061 lt!106277)) e!44006)))

(declare-fun b!67133 () Bool)

(declare-fun res!55611 () Bool)

(assert (=> b!67133 (=> (not res!55611) (not e!44006))))

(assert (=> b!67133 (= res!55611 (bvsle (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)) (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106277))) (currentByte!3380 (_2!3061 lt!106277)) (currentBit!3375 (_2!3061 lt!106277)))))))

(declare-fun b!67134 () Bool)

(declare-fun e!44007 () Bool)

(assert (=> b!67134 (= e!44006 e!44007)))

(declare-fun res!55613 () Bool)

(assert (=> b!67134 (=> res!55613 e!44007)))

(assert (=> b!67134 (= res!55613 (= (size!1321 (buf!1702 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67135 () Bool)

(assert (=> b!67135 (= e!44007 (arrayBitRangesEq!0 (buf!1702 thiss!1379) (buf!1702 (_2!3061 lt!106277)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379))))))

(assert (= (and d!21166 res!55612) b!67133))

(assert (= (and b!67133 res!55611) b!67134))

(assert (= (and b!67134 (not res!55613)) b!67135))

(assert (=> b!67133 m!106335))

(assert (=> b!67133 m!106363))

(assert (=> b!67135 m!106335))

(assert (=> b!67135 m!106335))

(declare-fun m!106947 () Bool)

(assert (=> b!67135 m!106947))

(assert (=> b!66853 d!21166))

(declare-fun d!21168 () Bool)

(assert (=> d!21168 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107023 () Unit!4503)

(declare-fun choose!9 (BitStream!2270 array!2861 (_ BitVec 64) BitStream!2270) Unit!4503)

(assert (=> d!21168 (= lt!107023 (choose!9 thiss!1379 (buf!1702 (_2!3061 lt!106267)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2271 (buf!1702 (_2!3061 lt!106267)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379))))))

(assert (=> d!21168 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1702 (_2!3061 lt!106267)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107023)))

(declare-fun bs!5133 () Bool)

(assert (= bs!5133 d!21168))

(assert (=> bs!5133 m!106355))

(declare-fun m!106949 () Bool)

(assert (=> bs!5133 m!106949))

(assert (=> b!66853 d!21168))

(declare-fun d!21170 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5134 () Bool)

(assert (= bs!5134 d!21170))

(declare-fun m!106951 () Bool)

(assert (=> bs!5134 m!106951))

(assert (=> b!66853 d!21170))

(declare-fun d!21172 () Bool)

(assert (=> d!21172 (isPrefixOf!0 thiss!1379 (_2!3061 lt!106277))))

(declare-fun lt!107026 () Unit!4503)

(declare-fun choose!30 (BitStream!2270 BitStream!2270 BitStream!2270) Unit!4503)

(assert (=> d!21172 (= lt!107026 (choose!30 thiss!1379 (_2!3061 lt!106267) (_2!3061 lt!106277)))))

(assert (=> d!21172 (isPrefixOf!0 thiss!1379 (_2!3061 lt!106267))))

(assert (=> d!21172 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3061 lt!106267) (_2!3061 lt!106277)) lt!107026)))

(declare-fun bs!5135 () Bool)

(assert (= bs!5135 d!21172))

(assert (=> bs!5135 m!106343))

(declare-fun m!106953 () Bool)

(assert (=> bs!5135 m!106953))

(assert (=> bs!5135 m!106383))

(assert (=> b!66853 d!21172))

(declare-fun d!21174 () Bool)

(declare-fun res!55615 () Bool)

(declare-fun e!44008 () Bool)

(assert (=> d!21174 (=> (not res!55615) (not e!44008))))

(assert (=> d!21174 (= res!55615 (= (size!1321 (buf!1702 (_2!3061 lt!106267))) (size!1321 (buf!1702 (_2!3061 lt!106277)))))))

(assert (=> d!21174 (= (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106277)) e!44008)))

(declare-fun b!67136 () Bool)

(declare-fun res!55614 () Bool)

(assert (=> b!67136 (=> (not res!55614) (not e!44008))))

(assert (=> b!67136 (= res!55614 (bvsle (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))) (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106277))) (currentByte!3380 (_2!3061 lt!106277)) (currentBit!3375 (_2!3061 lt!106277)))))))

(declare-fun b!67137 () Bool)

(declare-fun e!44009 () Bool)

(assert (=> b!67137 (= e!44008 e!44009)))

(declare-fun res!55616 () Bool)

(assert (=> b!67137 (=> res!55616 e!44009)))

(assert (=> b!67137 (= res!55616 (= (size!1321 (buf!1702 (_2!3061 lt!106267))) #b00000000000000000000000000000000))))

(declare-fun b!67138 () Bool)

(assert (=> b!67138 (= e!44009 (arrayBitRangesEq!0 (buf!1702 (_2!3061 lt!106267)) (buf!1702 (_2!3061 lt!106277)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267)))))))

(assert (= (and d!21174 res!55615) b!67136))

(assert (= (and b!67136 res!55614) b!67137))

(assert (= (and b!67137 (not res!55616)) b!67138))

(assert (=> b!67136 m!106411))

(assert (=> b!67136 m!106363))

(assert (=> b!67138 m!106411))

(assert (=> b!67138 m!106411))

(declare-fun m!106955 () Bool)

(assert (=> b!67138 m!106955))

(assert (=> b!66853 d!21174))

(declare-fun d!21176 () Bool)

(declare-fun res!55618 () Bool)

(declare-fun e!44010 () Bool)

(assert (=> d!21176 (=> (not res!55618) (not e!44010))))

(assert (=> d!21176 (= res!55618 (= (size!1321 (buf!1702 thiss!1379)) (size!1321 (buf!1702 (_2!3061 lt!106267)))))))

(assert (=> d!21176 (= (isPrefixOf!0 thiss!1379 (_2!3061 lt!106267)) e!44010)))

(declare-fun b!67139 () Bool)

(declare-fun res!55617 () Bool)

(assert (=> b!67139 (=> (not res!55617) (not e!44010))))

(assert (=> b!67139 (= res!55617 (bvsle (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)) (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267)))))))

(declare-fun b!67140 () Bool)

(declare-fun e!44011 () Bool)

(assert (=> b!67140 (= e!44010 e!44011)))

(declare-fun res!55619 () Bool)

(assert (=> b!67140 (=> res!55619 e!44011)))

(assert (=> b!67140 (= res!55619 (= (size!1321 (buf!1702 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67141 () Bool)

(assert (=> b!67141 (= e!44011 (arrayBitRangesEq!0 (buf!1702 thiss!1379) (buf!1702 (_2!3061 lt!106267)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379))))))

(assert (= (and d!21176 res!55618) b!67139))

(assert (= (and b!67139 res!55617) b!67140))

(assert (= (and b!67140 (not res!55619)) b!67141))

(assert (=> b!67139 m!106335))

(assert (=> b!67139 m!106411))

(assert (=> b!67141 m!106335))

(assert (=> b!67141 m!106335))

(declare-fun m!106957 () Bool)

(assert (=> b!67141 m!106957))

(assert (=> b!66864 d!21176))

(declare-fun d!21178 () Bool)

(assert (=> d!21178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106271) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267)))) lt!106271))))

(declare-fun bs!5136 () Bool)

(assert (= bs!5136 d!21178))

(declare-fun m!106959 () Bool)

(assert (=> bs!5136 m!106959))

(assert (=> b!66864 d!21178))

(declare-fun d!21180 () Bool)

(declare-fun e!44016 () Bool)

(assert (=> d!21180 e!44016))

(declare-fun res!55622 () Bool)

(assert (=> d!21180 (=> (not res!55622) (not e!44016))))

(assert (=> d!21180 (= res!55622 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!107051 () Unit!4503)

(declare-fun choose!27 (BitStream!2270 BitStream!2270 (_ BitVec 64) (_ BitVec 64)) Unit!4503)

(assert (=> d!21180 (= lt!107051 (choose!27 thiss!1379 (_2!3061 lt!106267) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21180 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21180 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3061 lt!106267) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107051)))

(declare-fun b!67148 () Bool)

(assert (=> b!67148 (= e!44016 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21180 res!55622) b!67148))

(declare-fun m!106961 () Bool)

(assert (=> d!21180 m!106961))

(declare-fun m!106963 () Bool)

(assert (=> b!67148 m!106963))

(assert (=> b!66864 d!21180))

(declare-fun b!67218 () Bool)

(declare-fun e!44053 () Bool)

(declare-datatypes ((tuple2!5922 0))(
  ( (tuple2!5923 (_1!3072 BitStream!2270) (_2!3072 Bool)) )
))
(declare-fun lt!107181 () tuple2!5922)

(declare-fun lt!107188 () tuple2!5900)

(assert (=> b!67218 (= e!44053 (= (bitIndex!0 (size!1321 (buf!1702 (_1!3072 lt!107181))) (currentByte!3380 (_1!3072 lt!107181)) (currentBit!3375 (_1!3072 lt!107181))) (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!107188))) (currentByte!3380 (_2!3061 lt!107188)) (currentBit!3375 (_2!3061 lt!107188)))))))

(declare-fun b!67219 () Bool)

(declare-fun res!55662 () Bool)

(declare-fun e!44052 () Bool)

(assert (=> b!67219 (=> (not res!55662) (not e!44052))))

(declare-fun lt!107184 () (_ BitVec 64))

(declare-fun lt!107186 () (_ BitVec 64))

(assert (=> b!67219 (= res!55662 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!107188))) (currentByte!3380 (_2!3061 lt!107188)) (currentBit!3375 (_2!3061 lt!107188))) (bvadd lt!107186 lt!107184)))))

(assert (=> b!67219 (or (not (= (bvand lt!107186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107184 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!107186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!107186 lt!107184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67219 (= lt!107184 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!67219 (= lt!107186 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(declare-fun b!67220 () Bool)

(assert (=> b!67220 (= e!44052 e!44053)))

(declare-fun res!55660 () Bool)

(assert (=> b!67220 (=> (not res!55660) (not e!44053))))

(declare-fun lt!107190 () (_ BitVec 8))

(assert (=> b!67220 (= res!55660 (and (= (_2!3072 lt!107181) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!107190)) #b00000000000000000000000000000000))) (= (_1!3072 lt!107181) (_2!3061 lt!107188))))))

(declare-fun lt!107180 () tuple2!5916)

(declare-fun lt!107185 () BitStream!2270)

(assert (=> b!67220 (= lt!107180 (readBits!0 lt!107185 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2270) tuple2!5922)

(assert (=> b!67220 (= lt!107181 (readBitPure!0 lt!107185))))

(declare-fun readerFrom!0 (BitStream!2270 (_ BitVec 32) (_ BitVec 32)) BitStream!2270)

(assert (=> b!67220 (= lt!107185 (readerFrom!0 (_2!3061 lt!107188) (currentBit!3375 thiss!1379) (currentByte!3380 thiss!1379)))))

(declare-fun b!67221 () Bool)

(declare-fun res!55661 () Bool)

(declare-fun e!44051 () Bool)

(assert (=> b!67221 (=> (not res!55661) (not e!44051))))

(declare-fun lt!107182 () tuple2!5900)

(assert (=> b!67221 (= res!55661 (isPrefixOf!0 thiss!1379 (_2!3061 lt!107182)))))

(declare-fun d!21182 () Bool)

(assert (=> d!21182 e!44052))

(declare-fun res!55657 () Bool)

(assert (=> d!21182 (=> (not res!55657) (not e!44052))))

(assert (=> d!21182 (= res!55657 (= (size!1321 (buf!1702 (_2!3061 lt!107188))) (size!1321 (buf!1702 thiss!1379))))))

(declare-fun lt!107189 () array!2861)

(assert (=> d!21182 (= lt!107190 (select (arr!1888 lt!107189) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21182 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1321 lt!107189)))))

(assert (=> d!21182 (= lt!107189 (array!2862 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!107191 () tuple2!5900)

(assert (=> d!21182 (= lt!107188 (tuple2!5901 (_1!3061 lt!107191) (_2!3061 lt!107191)))))

(assert (=> d!21182 (= lt!107191 lt!107182)))

(assert (=> d!21182 e!44051))

(declare-fun res!55659 () Bool)

(assert (=> d!21182 (=> (not res!55659) (not e!44051))))

(assert (=> d!21182 (= res!55659 (= (size!1321 (buf!1702 thiss!1379)) (size!1321 (buf!1702 (_2!3061 lt!107182)))))))

(declare-fun lt!107183 () Bool)

(declare-fun appendBit!0 (BitStream!2270 Bool) tuple2!5900)

(assert (=> d!21182 (= lt!107182 (appendBit!0 thiss!1379 lt!107183))))

(assert (=> d!21182 (= lt!107183 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21182 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21182 (= (appendBitFromByte!0 thiss!1379 (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!107188)))

(declare-fun b!67222 () Bool)

(declare-fun res!55664 () Bool)

(assert (=> b!67222 (=> (not res!55664) (not e!44051))))

(assert (=> b!67222 (= res!55664 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!107182))) (currentByte!3380 (_2!3061 lt!107182)) (currentBit!3375 (_2!3061 lt!107182))) (bvadd (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!67223 () Bool)

(declare-fun res!55658 () Bool)

(assert (=> b!67223 (=> (not res!55658) (not e!44052))))

(assert (=> b!67223 (= res!55658 (isPrefixOf!0 thiss!1379 (_2!3061 lt!107188)))))

(declare-fun b!67224 () Bool)

(declare-fun e!44050 () Bool)

(declare-fun lt!107187 () tuple2!5922)

(assert (=> b!67224 (= e!44050 (= (bitIndex!0 (size!1321 (buf!1702 (_1!3072 lt!107187))) (currentByte!3380 (_1!3072 lt!107187)) (currentBit!3375 (_1!3072 lt!107187))) (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!107182))) (currentByte!3380 (_2!3061 lt!107182)) (currentBit!3375 (_2!3061 lt!107182)))))))

(declare-fun b!67225 () Bool)

(assert (=> b!67225 (= e!44051 e!44050)))

(declare-fun res!55663 () Bool)

(assert (=> b!67225 (=> (not res!55663) (not e!44050))))

(assert (=> b!67225 (= res!55663 (and (= (_2!3072 lt!107187) lt!107183) (= (_1!3072 lt!107187) (_2!3061 lt!107182))))))

(assert (=> b!67225 (= lt!107187 (readBitPure!0 (readerFrom!0 (_2!3061 lt!107182) (currentBit!3375 thiss!1379) (currentByte!3380 thiss!1379))))))

(assert (= (and d!21182 res!55659) b!67222))

(assert (= (and b!67222 res!55664) b!67221))

(assert (= (and b!67221 res!55661) b!67225))

(assert (= (and b!67225 res!55663) b!67224))

(assert (= (and d!21182 res!55657) b!67219))

(assert (= (and b!67219 res!55662) b!67223))

(assert (= (and b!67223 res!55658) b!67220))

(assert (= (and b!67220 res!55660) b!67218))

(declare-fun m!107087 () Bool)

(assert (=> d!21182 m!107087))

(declare-fun m!107089 () Bool)

(assert (=> d!21182 m!107089))

(declare-fun m!107091 () Bool)

(assert (=> d!21182 m!107091))

(declare-fun m!107093 () Bool)

(assert (=> b!67219 m!107093))

(assert (=> b!67219 m!106335))

(declare-fun m!107095 () Bool)

(assert (=> b!67221 m!107095))

(declare-fun m!107097 () Bool)

(assert (=> b!67222 m!107097))

(assert (=> b!67222 m!106335))

(declare-fun m!107099 () Bool)

(assert (=> b!67224 m!107099))

(assert (=> b!67224 m!107097))

(declare-fun m!107101 () Bool)

(assert (=> b!67220 m!107101))

(declare-fun m!107103 () Bool)

(assert (=> b!67220 m!107103))

(declare-fun m!107105 () Bool)

(assert (=> b!67220 m!107105))

(declare-fun m!107107 () Bool)

(assert (=> b!67223 m!107107))

(declare-fun m!107109 () Bool)

(assert (=> b!67225 m!107109))

(assert (=> b!67225 m!107109))

(declare-fun m!107111 () Bool)

(assert (=> b!67225 m!107111))

(declare-fun m!107113 () Bool)

(assert (=> b!67218 m!107113))

(assert (=> b!67218 m!107093))

(assert (=> b!66864 d!21182))

(declare-fun d!21238 () Bool)

(declare-fun e!44056 () Bool)

(assert (=> d!21238 e!44056))

(declare-fun res!55669 () Bool)

(assert (=> d!21238 (=> (not res!55669) (not e!44056))))

(declare-fun lt!107206 () (_ BitVec 64))

(declare-fun lt!107205 () (_ BitVec 64))

(declare-fun lt!107204 () (_ BitVec 64))

(assert (=> d!21238 (= res!55669 (= lt!107206 (bvsub lt!107205 lt!107204)))))

(assert (=> d!21238 (or (= (bvand lt!107205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107204 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107205 lt!107204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21238 (= lt!107204 (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267)))))))

(declare-fun lt!107208 () (_ BitVec 64))

(declare-fun lt!107207 () (_ BitVec 64))

(assert (=> d!21238 (= lt!107205 (bvmul lt!107208 lt!107207))))

(assert (=> d!21238 (or (= lt!107208 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107207 (bvsdiv (bvmul lt!107208 lt!107207) lt!107208)))))

(assert (=> d!21238 (= lt!107207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21238 (= lt!107208 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))))))

(assert (=> d!21238 (= lt!107206 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267)))))))

(assert (=> d!21238 (invariant!0 (currentBit!3375 (_2!3061 lt!106267)) (currentByte!3380 (_2!3061 lt!106267)) (size!1321 (buf!1702 (_2!3061 lt!106267))))))

(assert (=> d!21238 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))) lt!107206)))

(declare-fun b!67230 () Bool)

(declare-fun res!55670 () Bool)

(assert (=> b!67230 (=> (not res!55670) (not e!44056))))

(assert (=> b!67230 (= res!55670 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107206))))

(declare-fun b!67231 () Bool)

(declare-fun lt!107209 () (_ BitVec 64))

(assert (=> b!67231 (= e!44056 (bvsle lt!107206 (bvmul lt!107209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67231 (or (= lt!107209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107209)))))

(assert (=> b!67231 (= lt!107209 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106267)))))))

(assert (= (and d!21238 res!55669) b!67230))

(assert (= (and b!67230 res!55670) b!67231))

(assert (=> d!21238 m!106959))

(assert (=> d!21238 m!106357))

(assert (=> b!66854 d!21238))

(declare-fun d!21240 () Bool)

(assert (=> d!21240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 thiss!1379))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 thiss!1379))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5148 () Bool)

(assert (= bs!5148 d!21240))

(declare-fun m!107115 () Bool)

(assert (=> bs!5148 m!107115))

(assert (=> b!66852 d!21240))

(declare-fun d!21242 () Bool)

(declare-fun size!1324 (List!710) Int)

(assert (=> d!21242 (= (length!338 lt!106266) (size!1324 lt!106266))))

(declare-fun bs!5149 () Bool)

(assert (= bs!5149 d!21242))

(declare-fun m!107117 () Bool)

(assert (=> bs!5149 m!107117))

(assert (=> b!66863 d!21242))

(declare-fun d!21244 () Bool)

(assert (=> d!21244 (= (tail!314 lt!106266) (t!1460 lt!106266))))

(assert (=> b!66861 d!21244))

(declare-fun d!21246 () Bool)

(declare-fun e!44059 () Bool)

(assert (=> d!21246 e!44059))

(declare-fun res!55673 () Bool)

(assert (=> d!21246 (=> (not res!55673) (not e!44059))))

(declare-fun lt!107215 () (_ BitVec 64))

(assert (=> d!21246 (= res!55673 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!107215) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21246 (= lt!107215 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107214 () Unit!4503)

(declare-fun choose!42 (BitStream!2270 BitStream!2270 BitStream!2270 BitStream!2270 (_ BitVec 64) List!710) Unit!4503)

(assert (=> d!21246 (= lt!107214 (choose!42 (_2!3061 lt!106277) (_2!3061 lt!106277) (_1!3062 lt!106286) (_1!3062 lt!106288) (bvsub to!314 i!635) lt!106266))))

(assert (=> d!21246 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21246 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3061 lt!106277) (_2!3061 lt!106277) (_1!3062 lt!106286) (_1!3062 lt!106288) (bvsub to!314 i!635) lt!106266) lt!107214)))

(declare-fun b!67234 () Bool)

(assert (=> b!67234 (= e!44059 (= (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_1!3062 lt!106288) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!314 lt!106266)))))

(assert (= (and d!21246 res!55673) b!67234))

(declare-fun m!107119 () Bool)

(assert (=> d!21246 m!107119))

(declare-fun m!107121 () Bool)

(assert (=> b!67234 m!107121))

(assert (=> b!67234 m!106359))

(assert (=> b!66861 d!21246))

(declare-fun d!21248 () Bool)

(assert (=> d!21248 (= (bitAt!0 (buf!1702 (_2!3061 lt!106267)) lt!106281) (not (= (bvand ((_ sign_extend 24) (select (arr!1888 (buf!1702 (_2!3061 lt!106267))) ((_ extract 31 0) (bvsdiv lt!106281 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106281 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5150 () Bool)

(assert (= bs!5150 d!21248))

(declare-fun m!107123 () Bool)

(assert (=> bs!5150 m!107123))

(declare-fun m!107125 () Bool)

(assert (=> bs!5150 m!107125))

(assert (=> b!66862 d!21248))

(declare-fun d!21250 () Bool)

(assert (=> d!21250 (= (head!529 (byteArrayBitContentToList!0 (_2!3061 lt!106277) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!825 (byteArrayBitContentToList!0 (_2!3061 lt!106277) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!66860 d!21250))

(declare-fun d!21252 () Bool)

(declare-fun c!4913 () Bool)

(assert (=> d!21252 (= c!4913 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44062 () List!710)

(assert (=> d!21252 (= (byteArrayBitContentToList!0 (_2!3061 lt!106277) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44062)))

(declare-fun b!67239 () Bool)

(assert (=> b!67239 (= e!44062 Nil!707)))

(declare-fun b!67240 () Bool)

(assert (=> b!67240 (= e!44062 (Cons!706 (not (= (bvand ((_ sign_extend 24) (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3061 lt!106277) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21252 c!4913) b!67239))

(assert (= (and d!21252 (not c!4913)) b!67240))

(assert (=> b!67240 m!106375))

(assert (=> b!67240 m!107091))

(declare-fun m!107127 () Bool)

(assert (=> b!67240 m!107127))

(assert (=> b!66860 d!21252))

(declare-fun d!21254 () Bool)

(assert (=> d!21254 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5151 () Bool)

(assert (= bs!5151 d!21254))

(assert (=> bs!5151 m!106375))

(assert (=> bs!5151 m!107091))

(assert (=> b!66860 d!21254))

(declare-fun d!21256 () Bool)

(assert (=> d!21256 (= (head!529 lt!106266) (h!825 lt!106266))))

(assert (=> b!66871 d!21256))

(declare-fun d!21258 () Bool)

(assert (=> d!21258 (= (head!529 (byteArrayBitContentToList!0 (_2!3061 lt!106267) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!825 (byteArrayBitContentToList!0 (_2!3061 lt!106267) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66869 d!21258))

(declare-fun d!21260 () Bool)

(declare-fun c!4914 () Bool)

(assert (=> d!21260 (= c!4914 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44063 () List!710)

(assert (=> d!21260 (= (byteArrayBitContentToList!0 (_2!3061 lt!106267) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44063)))

(declare-fun b!67241 () Bool)

(assert (=> b!67241 (= e!44063 Nil!707)))

(declare-fun b!67242 () Bool)

(assert (=> b!67242 (= e!44063 (Cons!706 (not (= (bvand ((_ sign_extend 24) (select (arr!1888 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3061 lt!106267) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21260 c!4914) b!67241))

(assert (= (and d!21260 (not c!4914)) b!67242))

(assert (=> b!67242 m!106375))

(assert (=> b!67242 m!107091))

(declare-fun m!107129 () Bool)

(assert (=> b!67242 m!107129))

(assert (=> b!66869 d!21260))

(declare-fun d!21262 () Bool)

(assert (=> d!21262 (= (head!529 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106267) (_1!3062 lt!106284) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!825 (bitStreamReadBitsIntoList!0 (_2!3061 lt!106267) (_1!3062 lt!106284) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66869 d!21262))

(declare-fun d!21264 () Bool)

(declare-fun e!44069 () Bool)

(assert (=> d!21264 e!44069))

(declare-fun c!4920 () Bool)

(assert (=> d!21264 (= c!4920 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107222 () List!710)

(declare-datatypes ((tuple2!5924 0))(
  ( (tuple2!5925 (_1!3073 List!710) (_2!3073 BitStream!2270)) )
))
(declare-fun e!44068 () tuple2!5924)

(assert (=> d!21264 (= lt!107222 (_1!3073 e!44068))))

(declare-fun c!4919 () Bool)

(assert (=> d!21264 (= c!4919 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21264 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21264 (= (bitStreamReadBitsIntoList!0 (_2!3061 lt!106267) (_1!3062 lt!106284) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107222)))

(declare-fun b!67251 () Bool)

(assert (=> b!67251 (= e!44068 (tuple2!5925 Nil!707 (_1!3062 lt!106284)))))

(declare-fun b!67252 () Bool)

(declare-datatypes ((tuple2!5926 0))(
  ( (tuple2!5927 (_1!3074 Bool) (_2!3074 BitStream!2270)) )
))
(declare-fun lt!107223 () tuple2!5926)

(declare-fun lt!107224 () (_ BitVec 64))

(assert (=> b!67252 (= e!44068 (tuple2!5925 (Cons!706 (_1!3074 lt!107223) (bitStreamReadBitsIntoList!0 (_2!3061 lt!106267) (_2!3074 lt!107223) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!107224))) (_2!3074 lt!107223)))))

(declare-fun readBit!0 (BitStream!2270) tuple2!5926)

(assert (=> b!67252 (= lt!107223 (readBit!0 (_1!3062 lt!106284)))))

(assert (=> b!67252 (= lt!107224 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67254 () Bool)

(assert (=> b!67254 (= e!44069 (> (length!338 lt!107222) 0))))

(declare-fun b!67253 () Bool)

(declare-fun isEmpty!212 (List!710) Bool)

(assert (=> b!67253 (= e!44069 (isEmpty!212 lt!107222))))

(assert (= (and d!21264 c!4919) b!67251))

(assert (= (and d!21264 (not c!4919)) b!67252))

(assert (= (and d!21264 c!4920) b!67253))

(assert (= (and d!21264 (not c!4920)) b!67254))

(declare-fun m!107131 () Bool)

(assert (=> b!67252 m!107131))

(declare-fun m!107133 () Bool)

(assert (=> b!67252 m!107133))

(declare-fun m!107135 () Bool)

(assert (=> b!67254 m!107135))

(declare-fun m!107137 () Bool)

(assert (=> b!67253 m!107137))

(assert (=> b!66869 d!21264))

(declare-fun d!21266 () Bool)

(declare-fun res!55675 () Bool)

(declare-fun e!44070 () Bool)

(assert (=> d!21266 (=> (not res!55675) (not e!44070))))

(assert (=> d!21266 (= res!55675 (= (size!1321 (buf!1702 thiss!1379)) (size!1321 (buf!1702 thiss!1379))))))

(assert (=> d!21266 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44070)))

(declare-fun b!67255 () Bool)

(declare-fun res!55674 () Bool)

(assert (=> b!67255 (=> (not res!55674) (not e!44070))))

(assert (=> b!67255 (= res!55674 (bvsle (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)) (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379))))))

(declare-fun b!67256 () Bool)

(declare-fun e!44071 () Bool)

(assert (=> b!67256 (= e!44070 e!44071)))

(declare-fun res!55676 () Bool)

(assert (=> b!67256 (=> res!55676 e!44071)))

(assert (=> b!67256 (= res!55676 (= (size!1321 (buf!1702 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67257 () Bool)

(assert (=> b!67257 (= e!44071 (arrayBitRangesEq!0 (buf!1702 thiss!1379) (buf!1702 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379))))))

(assert (= (and d!21266 res!55675) b!67255))

(assert (= (and b!67255 res!55674) b!67256))

(assert (= (and b!67256 (not res!55676)) b!67257))

(assert (=> b!67255 m!106335))

(assert (=> b!67255 m!106335))

(assert (=> b!67257 m!106335))

(assert (=> b!67257 m!106335))

(declare-fun m!107139 () Bool)

(assert (=> b!67257 m!107139))

(assert (=> b!66859 d!21266))

(declare-fun d!21268 () Bool)

(assert (=> d!21268 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!107227 () Unit!4503)

(declare-fun choose!11 (BitStream!2270) Unit!4503)

(assert (=> d!21268 (= lt!107227 (choose!11 thiss!1379))))

(assert (=> d!21268 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!107227)))

(declare-fun bs!5153 () Bool)

(assert (= bs!5153 d!21268))

(assert (=> bs!5153 m!106331))

(declare-fun m!107141 () Bool)

(assert (=> bs!5153 m!107141))

(assert (=> b!66859 d!21268))

(declare-fun d!21270 () Bool)

(declare-fun e!44072 () Bool)

(assert (=> d!21270 e!44072))

(declare-fun res!55677 () Bool)

(assert (=> d!21270 (=> (not res!55677) (not e!44072))))

(declare-fun lt!107228 () (_ BitVec 64))

(declare-fun lt!107229 () (_ BitVec 64))

(declare-fun lt!107230 () (_ BitVec 64))

(assert (=> d!21270 (= res!55677 (= lt!107230 (bvsub lt!107229 lt!107228)))))

(assert (=> d!21270 (or (= (bvand lt!107229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107229 lt!107228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21270 (= lt!107228 (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 thiss!1379))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379))))))

(declare-fun lt!107232 () (_ BitVec 64))

(declare-fun lt!107231 () (_ BitVec 64))

(assert (=> d!21270 (= lt!107229 (bvmul lt!107232 lt!107231))))

(assert (=> d!21270 (or (= lt!107232 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107231 (bvsdiv (bvmul lt!107232 lt!107231) lt!107232)))))

(assert (=> d!21270 (= lt!107231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21270 (= lt!107232 ((_ sign_extend 32) (size!1321 (buf!1702 thiss!1379))))))

(assert (=> d!21270 (= lt!107230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3380 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3375 thiss!1379))))))

(assert (=> d!21270 (invariant!0 (currentBit!3375 thiss!1379) (currentByte!3380 thiss!1379) (size!1321 (buf!1702 thiss!1379)))))

(assert (=> d!21270 (= (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)) lt!107230)))

(declare-fun b!67258 () Bool)

(declare-fun res!55678 () Bool)

(assert (=> b!67258 (=> (not res!55678) (not e!44072))))

(assert (=> b!67258 (= res!55678 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107230))))

(declare-fun b!67259 () Bool)

(declare-fun lt!107233 () (_ BitVec 64))

(assert (=> b!67259 (= e!44072 (bvsle lt!107230 (bvmul lt!107233 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67259 (or (= lt!107233 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107233 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107233)))))

(assert (=> b!67259 (= lt!107233 ((_ sign_extend 32) (size!1321 (buf!1702 thiss!1379))))))

(assert (= (and d!21270 res!55677) b!67258))

(assert (= (and b!67258 res!55678) b!67259))

(assert (=> d!21270 m!107115))

(assert (=> d!21270 m!106451))

(assert (=> b!66859 d!21270))

(declare-fun d!21272 () Bool)

(assert (=> d!21272 (= (array_inv!1194 (buf!1702 thiss!1379)) (bvsge (size!1321 (buf!1702 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!66870 d!21272))

(declare-fun d!21274 () Bool)

(declare-fun e!44073 () Bool)

(assert (=> d!21274 e!44073))

(declare-fun res!55679 () Bool)

(assert (=> d!21274 (=> (not res!55679) (not e!44073))))

(declare-fun lt!107234 () (_ BitVec 64))

(declare-fun lt!107235 () (_ BitVec 64))

(declare-fun lt!107236 () (_ BitVec 64))

(assert (=> d!21274 (= res!55679 (= lt!107236 (bvsub lt!107235 lt!107234)))))

(assert (=> d!21274 (or (= (bvand lt!107235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107234 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107235 lt!107234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21274 (= lt!107234 (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106277))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106277)))))))

(declare-fun lt!107238 () (_ BitVec 64))

(declare-fun lt!107237 () (_ BitVec 64))

(assert (=> d!21274 (= lt!107235 (bvmul lt!107238 lt!107237))))

(assert (=> d!21274 (or (= lt!107238 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107237 (bvsdiv (bvmul lt!107238 lt!107237) lt!107238)))))

(assert (=> d!21274 (= lt!107237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21274 (= lt!107238 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))))))

(assert (=> d!21274 (= lt!107236 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106277))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106277)))))))

(assert (=> d!21274 (invariant!0 (currentBit!3375 (_2!3061 lt!106277)) (currentByte!3380 (_2!3061 lt!106277)) (size!1321 (buf!1702 (_2!3061 lt!106277))))))

(assert (=> d!21274 (= (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106277))) (currentByte!3380 (_2!3061 lt!106277)) (currentBit!3375 (_2!3061 lt!106277))) lt!107236)))

(declare-fun b!67260 () Bool)

(declare-fun res!55680 () Bool)

(assert (=> b!67260 (=> (not res!55680) (not e!44073))))

(assert (=> b!67260 (= res!55680 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107236))))

(declare-fun b!67261 () Bool)

(declare-fun lt!107239 () (_ BitVec 64))

(assert (=> b!67261 (= e!44073 (bvsle lt!107236 (bvmul lt!107239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67261 (or (= lt!107239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107239)))))

(assert (=> b!67261 (= lt!107239 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))))))

(assert (= (and d!21274 res!55679) b!67260))

(assert (= (and b!67260 res!55680) b!67261))

(declare-fun m!107143 () Bool)

(assert (=> d!21274 m!107143))

(assert (=> d!21274 m!106413))

(assert (=> b!66857 d!21274))

(declare-fun b!67262 () Bool)

(declare-fun e!44074 () Bool)

(declare-fun lt!107246 () (_ BitVec 64))

(declare-fun lt!107249 () tuple2!5902)

(declare-fun lt!107254 () (_ BitVec 64))

(assert (=> b!67262 (= e!44074 (= (_1!3062 lt!107249) (withMovedBitIndex!0 (_2!3062 lt!107249) (bvsub lt!107246 lt!107254))))))

(assert (=> b!67262 (or (= (bvand lt!107246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107246 lt!107254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67262 (= lt!107254 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106277))) (currentByte!3380 (_2!3061 lt!106277)) (currentBit!3375 (_2!3061 lt!106277))))))

(assert (=> b!67262 (= lt!107246 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(declare-fun d!21276 () Bool)

(assert (=> d!21276 e!44074))

(declare-fun res!55681 () Bool)

(assert (=> d!21276 (=> (not res!55681) (not e!44074))))

(assert (=> d!21276 (= res!55681 (isPrefixOf!0 (_1!3062 lt!107249) (_2!3062 lt!107249)))))

(declare-fun lt!107259 () BitStream!2270)

(assert (=> d!21276 (= lt!107249 (tuple2!5903 lt!107259 (_2!3061 lt!106277)))))

(declare-fun lt!107251 () Unit!4503)

(declare-fun lt!107243 () Unit!4503)

(assert (=> d!21276 (= lt!107251 lt!107243)))

(assert (=> d!21276 (isPrefixOf!0 lt!107259 (_2!3061 lt!106277))))

(assert (=> d!21276 (= lt!107243 (lemmaIsPrefixTransitive!0 lt!107259 (_2!3061 lt!106277) (_2!3061 lt!106277)))))

(declare-fun lt!107247 () Unit!4503)

(declare-fun lt!107258 () Unit!4503)

(assert (=> d!21276 (= lt!107247 lt!107258)))

(assert (=> d!21276 (isPrefixOf!0 lt!107259 (_2!3061 lt!106277))))

(assert (=> d!21276 (= lt!107258 (lemmaIsPrefixTransitive!0 lt!107259 thiss!1379 (_2!3061 lt!106277)))))

(declare-fun lt!107241 () Unit!4503)

(declare-fun e!44075 () Unit!4503)

(assert (=> d!21276 (= lt!107241 e!44075)))

(declare-fun c!4921 () Bool)

(assert (=> d!21276 (= c!4921 (not (= (size!1321 (buf!1702 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107248 () Unit!4503)

(declare-fun lt!107256 () Unit!4503)

(assert (=> d!21276 (= lt!107248 lt!107256)))

(assert (=> d!21276 (isPrefixOf!0 (_2!3061 lt!106277) (_2!3061 lt!106277))))

(assert (=> d!21276 (= lt!107256 (lemmaIsPrefixRefl!0 (_2!3061 lt!106277)))))

(declare-fun lt!107245 () Unit!4503)

(declare-fun lt!107253 () Unit!4503)

(assert (=> d!21276 (= lt!107245 lt!107253)))

(assert (=> d!21276 (= lt!107253 (lemmaIsPrefixRefl!0 (_2!3061 lt!106277)))))

(declare-fun lt!107250 () Unit!4503)

(declare-fun lt!107252 () Unit!4503)

(assert (=> d!21276 (= lt!107250 lt!107252)))

(assert (=> d!21276 (isPrefixOf!0 lt!107259 lt!107259)))

(assert (=> d!21276 (= lt!107252 (lemmaIsPrefixRefl!0 lt!107259))))

(declare-fun lt!107244 () Unit!4503)

(declare-fun lt!107255 () Unit!4503)

(assert (=> d!21276 (= lt!107244 lt!107255)))

(assert (=> d!21276 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21276 (= lt!107255 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21276 (= lt!107259 (BitStream!2271 (buf!1702 (_2!3061 lt!106277)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(assert (=> d!21276 (isPrefixOf!0 thiss!1379 (_2!3061 lt!106277))))

(assert (=> d!21276 (= (reader!0 thiss!1379 (_2!3061 lt!106277)) lt!107249)))

(declare-fun b!67263 () Bool)

(declare-fun res!55682 () Bool)

(assert (=> b!67263 (=> (not res!55682) (not e!44074))))

(assert (=> b!67263 (= res!55682 (isPrefixOf!0 (_2!3062 lt!107249) (_2!3061 lt!106277)))))

(declare-fun b!67264 () Bool)

(declare-fun Unit!4533 () Unit!4503)

(assert (=> b!67264 (= e!44075 Unit!4533)))

(declare-fun b!67265 () Bool)

(declare-fun res!55683 () Bool)

(assert (=> b!67265 (=> (not res!55683) (not e!44074))))

(assert (=> b!67265 (= res!55683 (isPrefixOf!0 (_1!3062 lt!107249) thiss!1379))))

(declare-fun b!67266 () Bool)

(declare-fun lt!107242 () Unit!4503)

(assert (=> b!67266 (= e!44075 lt!107242)))

(declare-fun lt!107257 () (_ BitVec 64))

(assert (=> b!67266 (= lt!107257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107240 () (_ BitVec 64))

(assert (=> b!67266 (= lt!107240 (bitIndex!0 (size!1321 (buf!1702 thiss!1379)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379)))))

(assert (=> b!67266 (= lt!107242 (arrayBitRangesEqSymmetric!0 (buf!1702 thiss!1379) (buf!1702 (_2!3061 lt!106277)) lt!107257 lt!107240))))

(assert (=> b!67266 (arrayBitRangesEq!0 (buf!1702 (_2!3061 lt!106277)) (buf!1702 thiss!1379) lt!107257 lt!107240)))

(assert (= (and d!21276 c!4921) b!67266))

(assert (= (and d!21276 (not c!4921)) b!67264))

(assert (= (and d!21276 res!55681) b!67265))

(assert (= (and b!67265 res!55683) b!67263))

(assert (= (and b!67263 res!55682) b!67262))

(declare-fun m!107145 () Bool)

(assert (=> d!21276 m!107145))

(declare-fun m!107147 () Bool)

(assert (=> d!21276 m!107147))

(declare-fun m!107149 () Bool)

(assert (=> d!21276 m!107149))

(declare-fun m!107151 () Bool)

(assert (=> d!21276 m!107151))

(declare-fun m!107153 () Bool)

(assert (=> d!21276 m!107153))

(declare-fun m!107155 () Bool)

(assert (=> d!21276 m!107155))

(declare-fun m!107157 () Bool)

(assert (=> d!21276 m!107157))

(assert (=> d!21276 m!106333))

(assert (=> d!21276 m!106331))

(assert (=> d!21276 m!106343))

(declare-fun m!107159 () Bool)

(assert (=> d!21276 m!107159))

(declare-fun m!107161 () Bool)

(assert (=> b!67263 m!107161))

(declare-fun m!107163 () Bool)

(assert (=> b!67262 m!107163))

(assert (=> b!67262 m!106363))

(assert (=> b!67262 m!106335))

(declare-fun m!107165 () Bool)

(assert (=> b!67265 m!107165))

(assert (=> b!67266 m!106335))

(declare-fun m!107167 () Bool)

(assert (=> b!67266 m!107167))

(declare-fun m!107169 () Bool)

(assert (=> b!67266 m!107169))

(assert (=> b!66868 d!21276))

(declare-fun d!21278 () Bool)

(assert (=> d!21278 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106271)))

(declare-fun lt!107260 () Unit!4503)

(assert (=> d!21278 (= lt!107260 (choose!9 (_2!3061 lt!106267) (buf!1702 (_2!3061 lt!106277)) lt!106271 (BitStream!2271 (buf!1702 (_2!3061 lt!106277)) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267)))))))

(assert (=> d!21278 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3061 lt!106267) (buf!1702 (_2!3061 lt!106277)) lt!106271) lt!107260)))

(declare-fun bs!5154 () Bool)

(assert (= bs!5154 d!21278))

(assert (=> bs!5154 m!106401))

(declare-fun m!107171 () Bool)

(assert (=> bs!5154 m!107171))

(assert (=> b!66868 d!21278))

(declare-fun d!21280 () Bool)

(declare-fun e!44077 () Bool)

(assert (=> d!21280 e!44077))

(declare-fun c!4923 () Bool)

(assert (=> d!21280 (= c!4923 (= lt!106271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107261 () List!710)

(declare-fun e!44076 () tuple2!5924)

(assert (=> d!21280 (= lt!107261 (_1!3073 e!44076))))

(declare-fun c!4922 () Bool)

(assert (=> d!21280 (= c!4922 (= lt!106271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21280 (bvsge lt!106271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21280 (= (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_1!3062 lt!106288) lt!106271) lt!107261)))

(declare-fun b!67267 () Bool)

(assert (=> b!67267 (= e!44076 (tuple2!5925 Nil!707 (_1!3062 lt!106288)))))

(declare-fun lt!107263 () (_ BitVec 64))

(declare-fun lt!107262 () tuple2!5926)

(declare-fun b!67268 () Bool)

(assert (=> b!67268 (= e!44076 (tuple2!5925 (Cons!706 (_1!3074 lt!107262) (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_2!3074 lt!107262) (bvsub lt!106271 lt!107263))) (_2!3074 lt!107262)))))

(assert (=> b!67268 (= lt!107262 (readBit!0 (_1!3062 lt!106288)))))

(assert (=> b!67268 (= lt!107263 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67270 () Bool)

(assert (=> b!67270 (= e!44077 (> (length!338 lt!107261) 0))))

(declare-fun b!67269 () Bool)

(assert (=> b!67269 (= e!44077 (isEmpty!212 lt!107261))))

(assert (= (and d!21280 c!4922) b!67267))

(assert (= (and d!21280 (not c!4922)) b!67268))

(assert (= (and d!21280 c!4923) b!67269))

(assert (= (and d!21280 (not c!4923)) b!67270))

(declare-fun m!107173 () Bool)

(assert (=> b!67268 m!107173))

(declare-fun m!107175 () Bool)

(assert (=> b!67268 m!107175))

(declare-fun m!107177 () Bool)

(assert (=> b!67270 m!107177))

(declare-fun m!107179 () Bool)

(assert (=> b!67269 m!107179))

(assert (=> b!66868 d!21280))

(declare-fun d!21282 () Bool)

(declare-fun e!44079 () Bool)

(assert (=> d!21282 e!44079))

(declare-fun c!4925 () Bool)

(assert (=> d!21282 (= c!4925 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107264 () List!710)

(declare-fun e!44078 () tuple2!5924)

(assert (=> d!21282 (= lt!107264 (_1!3073 e!44078))))

(declare-fun c!4924 () Bool)

(assert (=> d!21282 (= c!4924 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21282 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21282 (= (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_1!3062 lt!106286) (bvsub to!314 i!635)) lt!107264)))

(declare-fun b!67271 () Bool)

(assert (=> b!67271 (= e!44078 (tuple2!5925 Nil!707 (_1!3062 lt!106286)))))

(declare-fun lt!107265 () tuple2!5926)

(declare-fun b!67272 () Bool)

(declare-fun lt!107266 () (_ BitVec 64))

(assert (=> b!67272 (= e!44078 (tuple2!5925 (Cons!706 (_1!3074 lt!107265) (bitStreamReadBitsIntoList!0 (_2!3061 lt!106277) (_2!3074 lt!107265) (bvsub (bvsub to!314 i!635) lt!107266))) (_2!3074 lt!107265)))))

(assert (=> b!67272 (= lt!107265 (readBit!0 (_1!3062 lt!106286)))))

(assert (=> b!67272 (= lt!107266 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67274 () Bool)

(assert (=> b!67274 (= e!44079 (> (length!338 lt!107264) 0))))

(declare-fun b!67273 () Bool)

(assert (=> b!67273 (= e!44079 (isEmpty!212 lt!107264))))

(assert (= (and d!21282 c!4924) b!67271))

(assert (= (and d!21282 (not c!4924)) b!67272))

(assert (= (and d!21282 c!4925) b!67273))

(assert (= (and d!21282 (not c!4925)) b!67274))

(declare-fun m!107181 () Bool)

(assert (=> b!67272 m!107181))

(declare-fun m!107183 () Bool)

(assert (=> b!67272 m!107183))

(declare-fun m!107185 () Bool)

(assert (=> b!67274 m!107185))

(declare-fun m!107187 () Bool)

(assert (=> b!67273 m!107187))

(assert (=> b!66868 d!21282))

(declare-fun d!21284 () Bool)

(assert (=> d!21284 (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107267 () Unit!4503)

(assert (=> d!21284 (= lt!107267 (choose!9 thiss!1379 (buf!1702 (_2!3061 lt!106277)) (bvsub to!314 i!635) (BitStream!2271 (buf!1702 (_2!3061 lt!106277)) (currentByte!3380 thiss!1379) (currentBit!3375 thiss!1379))))))

(assert (=> d!21284 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1702 (_2!3061 lt!106277)) (bvsub to!314 i!635)) lt!107267)))

(declare-fun bs!5155 () Bool)

(assert (= bs!5155 d!21284))

(assert (=> bs!5155 m!106407))

(declare-fun m!107189 () Bool)

(assert (=> bs!5155 m!107189))

(assert (=> b!66868 d!21284))

(declare-fun d!21286 () Bool)

(assert (=> d!21286 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 thiss!1379)) ((_ sign_extend 32) (currentBit!3375 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5156 () Bool)

(assert (= bs!5156 d!21286))

(declare-fun m!107191 () Bool)

(assert (=> bs!5156 m!107191))

(assert (=> b!66868 d!21286))

(declare-fun d!21288 () Bool)

(assert (=> d!21288 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267))) lt!106271) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1321 (buf!1702 (_2!3061 lt!106277)))) ((_ sign_extend 32) (currentByte!3380 (_2!3061 lt!106267))) ((_ sign_extend 32) (currentBit!3375 (_2!3061 lt!106267)))) lt!106271))))

(declare-fun bs!5157 () Bool)

(assert (= bs!5157 d!21288))

(declare-fun m!107193 () Bool)

(assert (=> bs!5157 m!107193))

(assert (=> b!66868 d!21288))

(declare-fun lt!107274 () (_ BitVec 64))

(declare-fun lt!107282 () (_ BitVec 64))

(declare-fun e!44080 () Bool)

(declare-fun b!67275 () Bool)

(declare-fun lt!107277 () tuple2!5902)

(assert (=> b!67275 (= e!44080 (= (_1!3062 lt!107277) (withMovedBitIndex!0 (_2!3062 lt!107277) (bvsub lt!107274 lt!107282))))))

(assert (=> b!67275 (or (= (bvand lt!107274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107274 lt!107282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67275 (= lt!107282 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106277))) (currentByte!3380 (_2!3061 lt!106277)) (currentBit!3375 (_2!3061 lt!106277))))))

(assert (=> b!67275 (= lt!107274 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))))))

(declare-fun d!21290 () Bool)

(assert (=> d!21290 e!44080))

(declare-fun res!55684 () Bool)

(assert (=> d!21290 (=> (not res!55684) (not e!44080))))

(assert (=> d!21290 (= res!55684 (isPrefixOf!0 (_1!3062 lt!107277) (_2!3062 lt!107277)))))

(declare-fun lt!107287 () BitStream!2270)

(assert (=> d!21290 (= lt!107277 (tuple2!5903 lt!107287 (_2!3061 lt!106277)))))

(declare-fun lt!107279 () Unit!4503)

(declare-fun lt!107271 () Unit!4503)

(assert (=> d!21290 (= lt!107279 lt!107271)))

(assert (=> d!21290 (isPrefixOf!0 lt!107287 (_2!3061 lt!106277))))

(assert (=> d!21290 (= lt!107271 (lemmaIsPrefixTransitive!0 lt!107287 (_2!3061 lt!106277) (_2!3061 lt!106277)))))

(declare-fun lt!107275 () Unit!4503)

(declare-fun lt!107286 () Unit!4503)

(assert (=> d!21290 (= lt!107275 lt!107286)))

(assert (=> d!21290 (isPrefixOf!0 lt!107287 (_2!3061 lt!106277))))

(assert (=> d!21290 (= lt!107286 (lemmaIsPrefixTransitive!0 lt!107287 (_2!3061 lt!106267) (_2!3061 lt!106277)))))

(declare-fun lt!107269 () Unit!4503)

(declare-fun e!44081 () Unit!4503)

(assert (=> d!21290 (= lt!107269 e!44081)))

(declare-fun c!4926 () Bool)

(assert (=> d!21290 (= c!4926 (not (= (size!1321 (buf!1702 (_2!3061 lt!106267))) #b00000000000000000000000000000000)))))

(declare-fun lt!107276 () Unit!4503)

(declare-fun lt!107284 () Unit!4503)

(assert (=> d!21290 (= lt!107276 lt!107284)))

(assert (=> d!21290 (isPrefixOf!0 (_2!3061 lt!106277) (_2!3061 lt!106277))))

(assert (=> d!21290 (= lt!107284 (lemmaIsPrefixRefl!0 (_2!3061 lt!106277)))))

(declare-fun lt!107273 () Unit!4503)

(declare-fun lt!107281 () Unit!4503)

(assert (=> d!21290 (= lt!107273 lt!107281)))

(assert (=> d!21290 (= lt!107281 (lemmaIsPrefixRefl!0 (_2!3061 lt!106277)))))

(declare-fun lt!107278 () Unit!4503)

(declare-fun lt!107280 () Unit!4503)

(assert (=> d!21290 (= lt!107278 lt!107280)))

(assert (=> d!21290 (isPrefixOf!0 lt!107287 lt!107287)))

(assert (=> d!21290 (= lt!107280 (lemmaIsPrefixRefl!0 lt!107287))))

(declare-fun lt!107272 () Unit!4503)

(declare-fun lt!107283 () Unit!4503)

(assert (=> d!21290 (= lt!107272 lt!107283)))

(assert (=> d!21290 (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106267))))

(assert (=> d!21290 (= lt!107283 (lemmaIsPrefixRefl!0 (_2!3061 lt!106267)))))

(assert (=> d!21290 (= lt!107287 (BitStream!2271 (buf!1702 (_2!3061 lt!106277)) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))))))

(assert (=> d!21290 (isPrefixOf!0 (_2!3061 lt!106267) (_2!3061 lt!106277))))

(assert (=> d!21290 (= (reader!0 (_2!3061 lt!106267) (_2!3061 lt!106277)) lt!107277)))

(declare-fun b!67276 () Bool)

(declare-fun res!55685 () Bool)

(assert (=> b!67276 (=> (not res!55685) (not e!44080))))

(assert (=> b!67276 (= res!55685 (isPrefixOf!0 (_2!3062 lt!107277) (_2!3061 lt!106277)))))

(declare-fun b!67277 () Bool)

(declare-fun Unit!4534 () Unit!4503)

(assert (=> b!67277 (= e!44081 Unit!4534)))

(declare-fun b!67278 () Bool)

(declare-fun res!55686 () Bool)

(assert (=> b!67278 (=> (not res!55686) (not e!44080))))

(assert (=> b!67278 (= res!55686 (isPrefixOf!0 (_1!3062 lt!107277) (_2!3061 lt!106267)))))

(declare-fun b!67279 () Bool)

(declare-fun lt!107270 () Unit!4503)

(assert (=> b!67279 (= e!44081 lt!107270)))

(declare-fun lt!107285 () (_ BitVec 64))

(assert (=> b!67279 (= lt!107285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107268 () (_ BitVec 64))

(assert (=> b!67279 (= lt!107268 (bitIndex!0 (size!1321 (buf!1702 (_2!3061 lt!106267))) (currentByte!3380 (_2!3061 lt!106267)) (currentBit!3375 (_2!3061 lt!106267))))))

(assert (=> b!67279 (= lt!107270 (arrayBitRangesEqSymmetric!0 (buf!1702 (_2!3061 lt!106267)) (buf!1702 (_2!3061 lt!106277)) lt!107285 lt!107268))))

(assert (=> b!67279 (arrayBitRangesEq!0 (buf!1702 (_2!3061 lt!106277)) (buf!1702 (_2!3061 lt!106267)) lt!107285 lt!107268)))

(assert (= (and d!21290 c!4926) b!67279))

(assert (= (and d!21290 (not c!4926)) b!67277))

(assert (= (and d!21290 res!55684) b!67278))

(assert (= (and b!67278 res!55686) b!67276))

(assert (= (and b!67276 res!55685) b!67275))

(declare-fun m!107195 () Bool)

(assert (=> d!21290 m!107195))

(declare-fun m!107197 () Bool)

(assert (=> d!21290 m!107197))

(assert (=> d!21290 m!107149))

(assert (=> d!21290 m!107151))

(declare-fun m!107199 () Bool)

(assert (=> d!21290 m!107199))

(declare-fun m!107201 () Bool)

(assert (=> d!21290 m!107201))

(declare-fun m!107203 () Bool)

(assert (=> d!21290 m!107203))

(assert (=> d!21290 m!106489))

(assert (=> d!21290 m!106487))

(assert (=> d!21290 m!106345))

(declare-fun m!107205 () Bool)

(assert (=> d!21290 m!107205))

(declare-fun m!107207 () Bool)

(assert (=> b!67276 m!107207))

(declare-fun m!107209 () Bool)

(assert (=> b!67275 m!107209))

(assert (=> b!67275 m!106363))

(assert (=> b!67275 m!106411))

(declare-fun m!107211 () Bool)

(assert (=> b!67278 m!107211))

(assert (=> b!67279 m!106411))

(declare-fun m!107213 () Bool)

(assert (=> b!67279 m!107213))

(declare-fun m!107215 () Bool)

(assert (=> b!67279 m!107215))

(assert (=> b!66868 d!21290))

(declare-fun d!21292 () Bool)

(assert (=> d!21292 (= (bitAt!0 (buf!1702 (_1!3062 lt!106288)) lt!106281) (not (= (bvand ((_ sign_extend 24) (select (arr!1888 (buf!1702 (_1!3062 lt!106288))) ((_ extract 31 0) (bvsdiv lt!106281 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106281 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5158 () Bool)

(assert (= bs!5158 d!21292))

(declare-fun m!107217 () Bool)

(assert (=> bs!5158 m!107217))

(assert (=> bs!5158 m!107125))

(assert (=> b!66858 d!21292))

(declare-fun d!21294 () Bool)

(assert (=> d!21294 (= (bitAt!0 (buf!1702 (_1!3062 lt!106286)) lt!106281) (not (= (bvand ((_ sign_extend 24) (select (arr!1888 (buf!1702 (_1!3062 lt!106286))) ((_ extract 31 0) (bvsdiv lt!106281 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106281 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5159 () Bool)

(assert (= bs!5159 d!21294))

(declare-fun m!107219 () Bool)

(assert (=> bs!5159 m!107219))

(assert (=> bs!5159 m!107125))

(assert (=> b!66858 d!21294))

(push 1)

(assert (not b!67123))

(assert (not d!21268))

(assert (not b!67138))

(assert (not d!21168))

(assert (not d!21240))

(assert (not b!67272))

(assert (not d!21284))

(assert (not b!66955))

(assert (not d!21064))

(assert (not d!21270))

(assert (not d!21288))

(assert (not b!66953))

(assert (not b!67263))

(assert (not b!67257))

(assert (not b!67224))

(assert (not b!67124))

(assert (not d!21070))

(assert (not b!67242))

(assert (not b!67255))

(assert (not b!67220))

(assert (not b!67268))

(assert (not d!21178))

(assert (not b!67122))

(assert (not d!21274))

(assert (not b!67135))

(assert (not b!67276))

(assert (not b!67219))

(assert (not d!21180))

(assert (not d!21170))

(assert (not b!67262))

(assert (not b!67275))

(assert (not d!21076))

(assert (not b!67254))

(assert (not b!67274))

(assert (not d!21286))

(assert (not bm!859))

(assert (not b!67279))

(assert (not b!67234))

(assert (not b!66952))

(assert (not b!67270))

(assert (not b!67218))

(assert (not b!67136))

(assert (not b!67278))

(assert (not b!67265))

(assert (not b!67133))

(assert (not d!21278))

(assert (not b!67223))

(assert (not d!21246))

(assert (not b!67120))

(assert (not d!21182))

(assert (not b!67252))

(assert (not b!67225))

(assert (not b!67126))

(assert (not d!21172))

(assert (not d!21290))

(assert (not b!67266))

(assert (not d!21242))

(assert (not b!67253))

(assert (not b!67125))

(assert (not b!66956))

(assert (not b!67148))

(assert (not b!67273))

(assert (not b!67139))

(assert (not b!67240))

(assert (not b!67141))

(assert (not b!67269))

(assert (not b!67221))

(assert (not d!21276))

(assert (not b!67222))

(assert (not d!21238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

