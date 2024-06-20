; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5728 () Bool)

(assert start!5728)

(declare-fun b!24924 () Bool)

(declare-fun e!17037 () Bool)

(assert (=> b!24924 (= e!17037 true)))

(declare-datatypes ((array!1651 0))(
  ( (array!1652 (arr!1167 (Array (_ BitVec 32) (_ BitVec 8))) (size!711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1254 0))(
  ( (BitStream!1255 (buf!1032 array!1651) (currentByte!2345 (_ BitVec 32)) (currentBit!2340 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2065 0))(
  ( (Unit!2066) )
))
(declare-datatypes ((tuple2!2826 0))(
  ( (tuple2!2827 (_1!1500 Unit!2065) (_2!1500 BitStream!1254)) )
))
(declare-fun lt!35410 () tuple2!2826)

(declare-fun lt!35413 () tuple2!2826)

(declare-fun lt!35405 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24924 (validate_offset_bits!1 ((_ sign_extend 32) (size!711 (buf!1032 (_2!1500 lt!35410)))) ((_ sign_extend 32) (currentByte!2345 (_2!1500 lt!35413))) ((_ sign_extend 32) (currentBit!2340 (_2!1500 lt!35413))) lt!35405)))

(declare-fun lt!35408 () Unit!2065)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1254 array!1651 (_ BitVec 64)) Unit!2065)

(assert (=> b!24924 (= lt!35408 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1500 lt!35413) (buf!1032 (_2!1500 lt!35410)) lt!35405))))

(declare-datatypes ((tuple2!2828 0))(
  ( (tuple2!2829 (_1!1501 BitStream!1254) (_2!1501 BitStream!1254)) )
))
(declare-fun lt!35407 () tuple2!2828)

(declare-fun reader!0 (BitStream!1254 BitStream!1254) tuple2!2828)

(assert (=> b!24924 (= lt!35407 (reader!0 (_2!1500 lt!35413) (_2!1500 lt!35410)))))

(declare-fun thiss!1379 () BitStream!1254)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24924 (validate_offset_bits!1 ((_ sign_extend 32) (size!711 (buf!1032 (_2!1500 lt!35410)))) ((_ sign_extend 32) (currentByte!2345 thiss!1379)) ((_ sign_extend 32) (currentBit!2340 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35403 () Unit!2065)

(assert (=> b!24924 (= lt!35403 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1032 (_2!1500 lt!35410)) (bvsub to!314 i!635)))))

(declare-fun lt!35411 () tuple2!2828)

(assert (=> b!24924 (= lt!35411 (reader!0 thiss!1379 (_2!1500 lt!35410)))))

(declare-fun b!24925 () Bool)

(declare-fun e!17043 () Bool)

(declare-fun e!17040 () Bool)

(assert (=> b!24925 (= e!17043 e!17040)))

(declare-fun res!21548 () Bool)

(assert (=> b!24925 (=> res!21548 e!17040)))

(declare-fun lt!35406 () (_ BitVec 64))

(declare-fun lt!35401 () (_ BitVec 64))

(assert (=> b!24925 (= res!21548 (not (= lt!35401 (bvsub (bvadd lt!35406 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24925 (= lt!35401 (bitIndex!0 (size!711 (buf!1032 (_2!1500 lt!35410))) (currentByte!2345 (_2!1500 lt!35410)) (currentBit!2340 (_2!1500 lt!35410))))))

(declare-fun b!24926 () Bool)

(declare-fun e!17035 () Bool)

(assert (=> b!24926 (= e!17035 e!17043)))

(declare-fun res!21541 () Bool)

(assert (=> b!24926 (=> res!21541 e!17043)))

(declare-fun isPrefixOf!0 (BitStream!1254 BitStream!1254) Bool)

(assert (=> b!24926 (= res!21541 (not (isPrefixOf!0 (_2!1500 lt!35413) (_2!1500 lt!35410))))))

(assert (=> b!24926 (isPrefixOf!0 thiss!1379 (_2!1500 lt!35410))))

(declare-fun lt!35400 () Unit!2065)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1254 BitStream!1254 BitStream!1254) Unit!2065)

(assert (=> b!24926 (= lt!35400 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1500 lt!35413) (_2!1500 lt!35410)))))

(declare-fun srcBuffer!2 () array!1651)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1254 array!1651 (_ BitVec 64) (_ BitVec 64)) tuple2!2826)

(assert (=> b!24926 (= lt!35410 (appendBitsMSBFirstLoop!0 (_2!1500 lt!35413) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17034 () Bool)

(assert (=> b!24926 e!17034))

(declare-fun res!21552 () Bool)

(assert (=> b!24926 (=> (not res!21552) (not e!17034))))

(assert (=> b!24926 (= res!21552 (validate_offset_bits!1 ((_ sign_extend 32) (size!711 (buf!1032 (_2!1500 lt!35413)))) ((_ sign_extend 32) (currentByte!2345 thiss!1379)) ((_ sign_extend 32) (currentBit!2340 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35412 () Unit!2065)

(assert (=> b!24926 (= lt!35412 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1032 (_2!1500 lt!35413)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35402 () tuple2!2828)

(assert (=> b!24926 (= lt!35402 (reader!0 thiss!1379 (_2!1500 lt!35413)))))

(declare-fun b!24927 () Bool)

(declare-fun e!17039 () Bool)

(declare-fun e!17044 () Bool)

(assert (=> b!24927 (= e!17039 (not e!17044))))

(declare-fun res!21551 () Bool)

(assert (=> b!24927 (=> res!21551 e!17044)))

(assert (=> b!24927 (= res!21551 (bvsge i!635 to!314))))

(assert (=> b!24927 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35404 () Unit!2065)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1254) Unit!2065)

(assert (=> b!24927 (= lt!35404 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24927 (= lt!35406 (bitIndex!0 (size!711 (buf!1032 thiss!1379)) (currentByte!2345 thiss!1379) (currentBit!2340 thiss!1379)))))

(declare-fun b!24928 () Bool)

(assert (=> b!24928 (= e!17044 e!17035)))

(declare-fun res!21544 () Bool)

(assert (=> b!24928 (=> res!21544 e!17035)))

(assert (=> b!24928 (= res!21544 (not (isPrefixOf!0 thiss!1379 (_2!1500 lt!35413))))))

(assert (=> b!24928 (validate_offset_bits!1 ((_ sign_extend 32) (size!711 (buf!1032 (_2!1500 lt!35413)))) ((_ sign_extend 32) (currentByte!2345 (_2!1500 lt!35413))) ((_ sign_extend 32) (currentBit!2340 (_2!1500 lt!35413))) lt!35405)))

(assert (=> b!24928 (= lt!35405 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35409 () Unit!2065)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1254 BitStream!1254 (_ BitVec 64) (_ BitVec 64)) Unit!2065)

(assert (=> b!24928 (= lt!35409 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1500 lt!35413) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1254 (_ BitVec 8) (_ BitVec 32)) tuple2!2826)

(assert (=> b!24928 (= lt!35413 (appendBitFromByte!0 thiss!1379 (select (arr!1167 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24929 () Bool)

(declare-fun res!21546 () Bool)

(assert (=> b!24929 (=> res!21546 e!17040)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24929 (= res!21546 (not (invariant!0 (currentBit!2340 (_2!1500 lt!35410)) (currentByte!2345 (_2!1500 lt!35410)) (size!711 (buf!1032 (_2!1500 lt!35410))))))))

(declare-fun res!21540 () Bool)

(assert (=> start!5728 (=> (not res!21540) (not e!17039))))

(assert (=> start!5728 (= res!21540 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!711 srcBuffer!2))))))))

(assert (=> start!5728 e!17039))

(assert (=> start!5728 true))

(declare-fun array_inv!680 (array!1651) Bool)

(assert (=> start!5728 (array_inv!680 srcBuffer!2)))

(declare-fun e!17042 () Bool)

(declare-fun inv!12 (BitStream!1254) Bool)

(assert (=> start!5728 (and (inv!12 thiss!1379) e!17042)))

(declare-fun b!24930 () Bool)

(assert (=> b!24930 (= e!17040 e!17037)))

(declare-fun res!21545 () Bool)

(assert (=> b!24930 (=> res!21545 e!17037)))

(assert (=> b!24930 (= res!21545 (not (= (size!711 (buf!1032 (_2!1500 lt!35413))) (size!711 (buf!1032 (_2!1500 lt!35410))))))))

(declare-fun e!17036 () Bool)

(assert (=> b!24930 e!17036))

(declare-fun res!21549 () Bool)

(assert (=> b!24930 (=> (not res!21549) (not e!17036))))

(assert (=> b!24930 (= res!21549 (= (size!711 (buf!1032 (_2!1500 lt!35410))) (size!711 (buf!1032 thiss!1379))))))

(declare-fun b!24931 () Bool)

(declare-fun res!21542 () Bool)

(assert (=> b!24931 (=> res!21542 e!17037)))

(assert (=> b!24931 (= res!21542 (not (invariant!0 (currentBit!2340 (_2!1500 lt!35413)) (currentByte!2345 (_2!1500 lt!35413)) (size!711 (buf!1032 (_2!1500 lt!35413))))))))

(declare-fun b!24932 () Bool)

(assert (=> b!24932 (= e!17036 (= lt!35401 (bvsub (bvsub (bvadd (bitIndex!0 (size!711 (buf!1032 (_2!1500 lt!35413))) (currentByte!2345 (_2!1500 lt!35413)) (currentBit!2340 (_2!1500 lt!35413))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24933 () Bool)

(declare-fun res!21547 () Bool)

(assert (=> b!24933 (=> res!21547 e!17037)))

(assert (=> b!24933 (= res!21547 (not (invariant!0 (currentBit!2340 (_2!1500 lt!35413)) (currentByte!2345 (_2!1500 lt!35413)) (size!711 (buf!1032 (_2!1500 lt!35410))))))))

(declare-fun b!24934 () Bool)

(declare-datatypes ((List!328 0))(
  ( (Nil!325) (Cons!324 (h!443 Bool) (t!1078 List!328)) )
))
(declare-fun head!165 (List!328) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1254 array!1651 (_ BitVec 64) (_ BitVec 64)) List!328)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1254 BitStream!1254 (_ BitVec 64)) List!328)

(assert (=> b!24934 (= e!17034 (= (head!165 (byteArrayBitContentToList!0 (_2!1500 lt!35413) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!165 (bitStreamReadBitsIntoList!0 (_2!1500 lt!35413) (_1!1501 lt!35402) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24935 () Bool)

(declare-fun res!21543 () Bool)

(assert (=> b!24935 (=> res!21543 e!17040)))

(assert (=> b!24935 (= res!21543 (not (= (size!711 (buf!1032 thiss!1379)) (size!711 (buf!1032 (_2!1500 lt!35410))))))))

(declare-fun b!24936 () Bool)

(assert (=> b!24936 (= e!17042 (array_inv!680 (buf!1032 thiss!1379)))))

(declare-fun b!24937 () Bool)

(declare-fun res!21550 () Bool)

(assert (=> b!24937 (=> (not res!21550) (not e!17039))))

(assert (=> b!24937 (= res!21550 (validate_offset_bits!1 ((_ sign_extend 32) (size!711 (buf!1032 thiss!1379))) ((_ sign_extend 32) (currentByte!2345 thiss!1379)) ((_ sign_extend 32) (currentBit!2340 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5728 res!21540) b!24937))

(assert (= (and b!24937 res!21550) b!24927))

(assert (= (and b!24927 (not res!21551)) b!24928))

(assert (= (and b!24928 (not res!21544)) b!24926))

(assert (= (and b!24926 res!21552) b!24934))

(assert (= (and b!24926 (not res!21541)) b!24925))

(assert (= (and b!24925 (not res!21548)) b!24929))

(assert (= (and b!24929 (not res!21546)) b!24935))

(assert (= (and b!24935 (not res!21543)) b!24930))

(assert (= (and b!24930 res!21549) b!24932))

(assert (= (and b!24930 (not res!21545)) b!24931))

(assert (= (and b!24931 (not res!21542)) b!24933))

(assert (= (and b!24933 (not res!21547)) b!24924))

(assert (= start!5728 b!24936))

(declare-fun m!35297 () Bool)

(assert (=> b!24928 m!35297))

(declare-fun m!35299 () Bool)

(assert (=> b!24928 m!35299))

(declare-fun m!35301 () Bool)

(assert (=> b!24928 m!35301))

(declare-fun m!35303 () Bool)

(assert (=> b!24928 m!35303))

(assert (=> b!24928 m!35297))

(declare-fun m!35305 () Bool)

(assert (=> b!24928 m!35305))

(declare-fun m!35307 () Bool)

(assert (=> b!24936 m!35307))

(declare-fun m!35309 () Bool)

(assert (=> b!24929 m!35309))

(declare-fun m!35311 () Bool)

(assert (=> b!24933 m!35311))

(declare-fun m!35313 () Bool)

(assert (=> start!5728 m!35313))

(declare-fun m!35315 () Bool)

(assert (=> start!5728 m!35315))

(declare-fun m!35317 () Bool)

(assert (=> b!24926 m!35317))

(declare-fun m!35319 () Bool)

(assert (=> b!24926 m!35319))

(declare-fun m!35321 () Bool)

(assert (=> b!24926 m!35321))

(declare-fun m!35323 () Bool)

(assert (=> b!24926 m!35323))

(declare-fun m!35325 () Bool)

(assert (=> b!24926 m!35325))

(declare-fun m!35327 () Bool)

(assert (=> b!24926 m!35327))

(declare-fun m!35329 () Bool)

(assert (=> b!24926 m!35329))

(declare-fun m!35331 () Bool)

(assert (=> b!24925 m!35331))

(declare-fun m!35333 () Bool)

(assert (=> b!24937 m!35333))

(declare-fun m!35335 () Bool)

(assert (=> b!24927 m!35335))

(declare-fun m!35337 () Bool)

(assert (=> b!24927 m!35337))

(declare-fun m!35339 () Bool)

(assert (=> b!24927 m!35339))

(declare-fun m!35341 () Bool)

(assert (=> b!24932 m!35341))

(declare-fun m!35343 () Bool)

(assert (=> b!24924 m!35343))

(declare-fun m!35345 () Bool)

(assert (=> b!24924 m!35345))

(declare-fun m!35347 () Bool)

(assert (=> b!24924 m!35347))

(declare-fun m!35349 () Bool)

(assert (=> b!24924 m!35349))

(declare-fun m!35351 () Bool)

(assert (=> b!24924 m!35351))

(declare-fun m!35353 () Bool)

(assert (=> b!24924 m!35353))

(declare-fun m!35355 () Bool)

(assert (=> b!24931 m!35355))

(declare-fun m!35357 () Bool)

(assert (=> b!24934 m!35357))

(assert (=> b!24934 m!35357))

(declare-fun m!35359 () Bool)

(assert (=> b!24934 m!35359))

(declare-fun m!35361 () Bool)

(assert (=> b!24934 m!35361))

(assert (=> b!24934 m!35361))

(declare-fun m!35363 () Bool)

(assert (=> b!24934 m!35363))

(check-sat (not b!24932) (not b!24933) (not b!24929) (not b!24931) (not b!24934) (not b!24925) (not b!24937) (not start!5728) (not b!24936) (not b!24928) (not b!24926) (not b!24927) (not b!24924))
