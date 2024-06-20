; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14112 () Bool)

(assert start!14112)

(declare-fun b!73609 () Bool)

(declare-fun res!60907 () Bool)

(declare-fun e!48119 () Bool)

(assert (=> b!73609 (=> res!60907 e!48119)))

(declare-datatypes ((array!2995 0))(
  ( (array!2996 (arr!1991 (Array (_ BitVec 32) (_ BitVec 8))) (size!1400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2380 0))(
  ( (BitStream!2381 (buf!1781 array!2995) (currentByte!3507 (_ BitVec 32)) (currentBit!3502 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2380)

(declare-datatypes ((Unit!4853 0))(
  ( (Unit!4854) )
))
(declare-datatypes ((tuple2!6372 0))(
  ( (tuple2!6373 (_1!3300 Unit!4853) (_2!3300 BitStream!2380)) )
))
(declare-fun lt!118302 () tuple2!6372)

(assert (=> b!73609 (= res!60907 (not (= (size!1400 (buf!1781 thiss!1379)) (size!1400 (buf!1781 (_2!3300 lt!118302))))))))

(declare-fun b!73610 () Bool)

(declare-fun res!60900 () Bool)

(assert (=> b!73610 (=> res!60900 e!48119)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!73610 (= res!60900 (not (invariant!0 (currentBit!3502 (_2!3300 lt!118302)) (currentByte!3507 (_2!3300 lt!118302)) (size!1400 (buf!1781 (_2!3300 lt!118302))))))))

(declare-fun b!73612 () Bool)

(declare-fun e!48120 () Bool)

(declare-fun e!48121 () Bool)

(assert (=> b!73612 (= e!48120 e!48121)))

(declare-fun res!60908 () Bool)

(assert (=> b!73612 (=> res!60908 e!48121)))

(declare-datatypes ((tuple2!6374 0))(
  ( (tuple2!6375 (_1!3301 BitStream!2380) (_2!3301 BitStream!2380)) )
))
(declare-fun lt!118293 () tuple2!6374)

(declare-fun lt!118291 () Bool)

(declare-fun lt!118295 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2995 (_ BitVec 64)) Bool)

(assert (=> b!73612 (= res!60908 (not (= lt!118291 (bitAt!0 (buf!1781 (_1!3301 lt!118293)) lt!118295))))))

(declare-fun lt!118307 () tuple2!6374)

(assert (=> b!73612 (= lt!118291 (bitAt!0 (buf!1781 (_1!3301 lt!118307)) lt!118295))))

(declare-fun b!73613 () Bool)

(declare-fun res!60906 () Bool)

(declare-fun e!48118 () Bool)

(assert (=> b!73613 (=> res!60906 e!48118)))

(declare-datatypes ((List!765 0))(
  ( (Nil!762) (Cons!761 (h!880 Bool) (t!1515 List!765)) )
))
(declare-fun lt!118304 () List!765)

(declare-fun length!393 (List!765) Int)

(assert (=> b!73613 (= res!60906 (<= (length!393 lt!118304) 0))))

(declare-fun b!73614 () Bool)

(declare-fun e!48116 () Bool)

(declare-fun e!48123 () Bool)

(assert (=> b!73614 (= e!48116 (not e!48123))))

(declare-fun res!60894 () Bool)

(assert (=> b!73614 (=> res!60894 e!48123)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!73614 (= res!60894 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2380 BitStream!2380) Bool)

(assert (=> b!73614 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!118296 () Unit!4853)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2380) Unit!4853)

(assert (=> b!73614 (= lt!118296 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!73614 (= lt!118295 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(declare-fun b!73615 () Bool)

(declare-fun e!48113 () Bool)

(assert (=> b!73615 (= e!48113 e!48118)))

(declare-fun res!60893 () Bool)

(assert (=> b!73615 (=> res!60893 e!48118)))

(assert (=> b!73615 (= res!60893 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!118308 () List!765)

(declare-fun lt!118297 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2380 BitStream!2380 (_ BitVec 64)) List!765)

(assert (=> b!73615 (= lt!118308 (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_1!3301 lt!118293) lt!118297))))

(assert (=> b!73615 (= lt!118304 (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_1!3301 lt!118307) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2995)

(declare-fun lt!118292 () List!765)

(declare-fun byteArrayBitContentToList!0 (BitStream!2380 array!2995 (_ BitVec 64) (_ BitVec 64)) List!765)

(assert (=> b!73615 (= lt!118292 (byteArrayBitContentToList!0 (_2!3300 lt!118302) srcBuffer!2 i!635 (bvsub to!314 i!635)))))

(declare-fun lt!118298 () tuple2!6372)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73615 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!118297)))

(declare-fun lt!118306 () Unit!4853)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2380 array!2995 (_ BitVec 64)) Unit!4853)

(assert (=> b!73615 (= lt!118306 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3300 lt!118298) (buf!1781 (_2!3300 lt!118302)) lt!118297))))

(declare-fun reader!0 (BitStream!2380 BitStream!2380) tuple2!6374)

(assert (=> b!73615 (= lt!118293 (reader!0 (_2!3300 lt!118298) (_2!3300 lt!118302)))))

(assert (=> b!73615 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!118287 () Unit!4853)

(assert (=> b!73615 (= lt!118287 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1781 (_2!3300 lt!118302)) (bvsub to!314 i!635)))))

(assert (=> b!73615 (= lt!118307 (reader!0 thiss!1379 (_2!3300 lt!118302)))))

(declare-fun lt!118288 () tuple2!6374)

(declare-fun e!48111 () Bool)

(declare-fun b!73616 () Bool)

(declare-fun head!584 (List!765) Bool)

(assert (=> b!73616 (= e!48111 (= (head!584 (byteArrayBitContentToList!0 (_2!3300 lt!118298) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!584 (bitStreamReadBitsIntoList!0 (_2!3300 lt!118298) (_1!3301 lt!118288) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!73617 () Bool)

(declare-fun res!60896 () Bool)

(declare-fun e!48117 () Bool)

(assert (=> b!73617 (=> res!60896 e!48117)))

(declare-fun lt!118286 () Bool)

(declare-datatypes ((tuple2!6376 0))(
  ( (tuple2!6377 (_1!3302 BitStream!2380) (_2!3302 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2380) tuple2!6376)

(assert (=> b!73617 (= res!60896 (not (= (_2!3302 (readBitPure!0 (_1!3301 lt!118307))) lt!118286)))))

(declare-fun b!73618 () Bool)

(declare-fun e!48125 () Bool)

(assert (=> b!73618 (= e!48125 e!48119)))

(declare-fun res!60904 () Bool)

(assert (=> b!73618 (=> res!60904 e!48119)))

(declare-fun lt!118311 () (_ BitVec 64))

(assert (=> b!73618 (= res!60904 (not (= lt!118311 (bvsub (bvadd lt!118295 to!314) i!635))))))

(assert (=> b!73618 (= lt!118311 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118302))) (currentByte!3507 (_2!3300 lt!118302)) (currentBit!3502 (_2!3300 lt!118302))))))

(declare-fun b!73619 () Bool)

(declare-fun e!48112 () Bool)

(declare-fun array_inv!1249 (array!2995) Bool)

(assert (=> b!73619 (= e!48112 (array_inv!1249 (buf!1781 thiss!1379)))))

(declare-fun b!73620 () Bool)

(declare-fun e!48110 () Bool)

(assert (=> b!73620 (= e!48123 e!48110)))

(declare-fun res!60892 () Bool)

(assert (=> b!73620 (=> res!60892 e!48110)))

(assert (=> b!73620 (= res!60892 (not (isPrefixOf!0 thiss!1379 (_2!3300 lt!118298))))))

(assert (=> b!73620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!118297)))

(assert (=> b!73620 (= lt!118297 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118303 () Unit!4853)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2380 BitStream!2380 (_ BitVec 64) (_ BitVec 64)) Unit!4853)

(assert (=> b!73620 (= lt!118303 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3300 lt!118298) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2380 (_ BitVec 8) (_ BitVec 32)) tuple2!6372)

(assert (=> b!73620 (= lt!118298 (appendBitFromByte!0 thiss!1379 (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!73621 () Bool)

(assert (=> b!73621 (= e!48110 e!48125)))

(declare-fun res!60891 () Bool)

(assert (=> b!73621 (=> res!60891 e!48125)))

(assert (=> b!73621 (= res!60891 (not (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!118302))))))

(assert (=> b!73621 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118302))))

(declare-fun lt!118299 () Unit!4853)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2380 BitStream!2380 BitStream!2380) Unit!4853)

(assert (=> b!73621 (= lt!118299 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3300 lt!118298) (_2!3300 lt!118302)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2380 array!2995 (_ BitVec 64) (_ BitVec 64)) tuple2!6372)

(assert (=> b!73621 (= lt!118302 (appendBitsMSBFirstLoop!0 (_2!3300 lt!118298) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!73621 e!48111))

(declare-fun res!60897 () Bool)

(assert (=> b!73621 (=> (not res!60897) (not e!48111))))

(assert (=> b!73621 (= res!60897 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118300 () Unit!4853)

(assert (=> b!73621 (= lt!118300 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1781 (_2!3300 lt!118298)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73621 (= lt!118288 (reader!0 thiss!1379 (_2!3300 lt!118298)))))

(declare-fun b!73622 () Bool)

(assert (=> b!73622 (= e!48119 e!48113)))

(declare-fun res!60902 () Bool)

(assert (=> b!73622 (=> res!60902 e!48113)))

(assert (=> b!73622 (= res!60902 (not (= (size!1400 (buf!1781 (_2!3300 lt!118298))) (size!1400 (buf!1781 (_2!3300 lt!118302))))))))

(declare-fun lt!118301 () (_ BitVec 64))

(assert (=> b!73622 (= lt!118311 (bvsub (bvsub (bvadd lt!118301 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73622 (= lt!118301 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(assert (=> b!73622 (= (size!1400 (buf!1781 (_2!3300 lt!118302))) (size!1400 (buf!1781 thiss!1379)))))

(declare-fun b!73623 () Bool)

(assert (=> b!73623 (= e!48118 e!48120)))

(declare-fun res!60901 () Bool)

(assert (=> b!73623 (=> res!60901 e!48120)))

(declare-fun lt!118312 () List!765)

(assert (=> b!73623 (= res!60901 (not (= lt!118312 lt!118308)))))

(assert (=> b!73623 (= lt!118308 lt!118312)))

(declare-fun tail!369 (List!765) List!765)

(assert (=> b!73623 (= lt!118312 (tail!369 lt!118304))))

(declare-fun lt!118289 () Unit!4853)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2380 BitStream!2380 BitStream!2380 BitStream!2380 (_ BitVec 64) List!765) Unit!4853)

(assert (=> b!73623 (= lt!118289 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3300 lt!118302) (_2!3300 lt!118302) (_1!3301 lt!118307) (_1!3301 lt!118293) (bvsub to!314 i!635) lt!118304))))

(declare-fun b!73624 () Bool)

(declare-fun res!60889 () Bool)

(assert (=> b!73624 (=> res!60889 e!48113)))

(assert (=> b!73624 (= res!60889 (not (invariant!0 (currentBit!3502 (_2!3300 lt!118298)) (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118298))))))))

(declare-fun lt!118290 () Bool)

(declare-fun b!73611 () Bool)

(declare-fun lt!118310 () Bool)

(assert (=> b!73611 (= e!48117 (or (not (= lt!118290 lt!118310)) (= lt!118304 lt!118292)))))

(declare-fun res!60909 () Bool)

(assert (=> start!14112 (=> (not res!60909) (not e!48116))))

(assert (=> start!14112 (= res!60909 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1400 srcBuffer!2))))))))

(assert (=> start!14112 e!48116))

(assert (=> start!14112 true))

(assert (=> start!14112 (array_inv!1249 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2380) Bool)

(assert (=> start!14112 (and (inv!12 thiss!1379) e!48112)))

(declare-fun b!73625 () Bool)

(declare-fun e!48124 () Bool)

(declare-fun e!48115 () Bool)

(assert (=> b!73625 (= e!48124 e!48115)))

(declare-fun res!60905 () Bool)

(assert (=> b!73625 (=> res!60905 e!48115)))

(declare-fun lt!118294 () Bool)

(assert (=> b!73625 (= res!60905 (not (= lt!118294 lt!118286)))))

(assert (=> b!73625 (= lt!118294 (bitAt!0 (buf!1781 (_2!3300 lt!118298)) lt!118295))))

(declare-fun b!73626 () Bool)

(assert (=> b!73626 (= e!48115 e!48117)))

(declare-fun res!60898 () Bool)

(assert (=> b!73626 (=> res!60898 e!48117)))

(declare-fun lt!118305 () Bool)

(assert (=> b!73626 (= res!60898 (not (= lt!118305 lt!118286)))))

(assert (=> b!73626 (= lt!118294 lt!118305)))

(assert (=> b!73626 (= lt!118305 (bitAt!0 (buf!1781 (_2!3300 lt!118302)) lt!118295))))

(declare-fun lt!118309 () Unit!4853)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2995 array!2995 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4853)

(assert (=> b!73626 (= lt!118309 (arrayBitRangesEqImpliesEq!0 (buf!1781 (_2!3300 lt!118298)) (buf!1781 (_2!3300 lt!118302)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118295 lt!118301))))

(declare-fun b!73627 () Bool)

(declare-fun e!48122 () Bool)

(assert (=> b!73627 (= e!48121 e!48122)))

(declare-fun res!60890 () Bool)

(assert (=> b!73627 (=> res!60890 e!48122)))

(assert (=> b!73627 (= res!60890 (not (= lt!118290 lt!118291)))))

(assert (=> b!73627 (= lt!118290 (head!584 lt!118304))))

(declare-fun b!73628 () Bool)

(assert (=> b!73628 (= e!48122 e!48124)))

(declare-fun res!60899 () Bool)

(assert (=> b!73628 (=> res!60899 e!48124)))

(assert (=> b!73628 (= res!60899 (not (= lt!118310 lt!118286)))))

(assert (=> b!73628 (= lt!118286 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!73628 (= lt!118310 (head!584 lt!118292))))

(declare-fun b!73629 () Bool)

(declare-fun res!60895 () Bool)

(assert (=> b!73629 (=> (not res!60895) (not e!48116))))

(assert (=> b!73629 (= res!60895 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 thiss!1379))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!73630 () Bool)

(declare-fun res!60903 () Bool)

(assert (=> b!73630 (=> res!60903 e!48113)))

(assert (=> b!73630 (= res!60903 (not (invariant!0 (currentBit!3502 (_2!3300 lt!118298)) (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118302))))))))

(assert (= (and start!14112 res!60909) b!73629))

(assert (= (and b!73629 res!60895) b!73614))

(assert (= (and b!73614 (not res!60894)) b!73620))

(assert (= (and b!73620 (not res!60892)) b!73621))

(assert (= (and b!73621 res!60897) b!73616))

(assert (= (and b!73621 (not res!60891)) b!73618))

(assert (= (and b!73618 (not res!60904)) b!73610))

(assert (= (and b!73610 (not res!60900)) b!73609))

(assert (= (and b!73609 (not res!60907)) b!73622))

(assert (= (and b!73622 (not res!60902)) b!73624))

(assert (= (and b!73624 (not res!60889)) b!73630))

(assert (= (and b!73630 (not res!60903)) b!73615))

(assert (= (and b!73615 (not res!60893)) b!73613))

(assert (= (and b!73613 (not res!60906)) b!73623))

(assert (= (and b!73623 (not res!60901)) b!73612))

(assert (= (and b!73612 (not res!60908)) b!73627))

(assert (= (and b!73627 (not res!60890)) b!73628))

(assert (= (and b!73628 (not res!60899)) b!73625))

(assert (= (and b!73625 (not res!60905)) b!73626))

(assert (= (and b!73626 (not res!60898)) b!73617))

(assert (= (and b!73617 (not res!60896)) b!73611))

(assert (= start!14112 b!73619))

(declare-fun m!118027 () Bool)

(assert (=> b!73620 m!118027))

(declare-fun m!118029 () Bool)

(assert (=> b!73620 m!118029))

(declare-fun m!118031 () Bool)

(assert (=> b!73620 m!118031))

(assert (=> b!73620 m!118029))

(declare-fun m!118033 () Bool)

(assert (=> b!73620 m!118033))

(declare-fun m!118035 () Bool)

(assert (=> b!73620 m!118035))

(declare-fun m!118037 () Bool)

(assert (=> b!73624 m!118037))

(declare-fun m!118039 () Bool)

(assert (=> b!73623 m!118039))

(declare-fun m!118041 () Bool)

(assert (=> b!73623 m!118041))

(declare-fun m!118043 () Bool)

(assert (=> b!73629 m!118043))

(declare-fun m!118045 () Bool)

(assert (=> b!73621 m!118045))

(declare-fun m!118047 () Bool)

(assert (=> b!73621 m!118047))

(declare-fun m!118049 () Bool)

(assert (=> b!73621 m!118049))

(declare-fun m!118051 () Bool)

(assert (=> b!73621 m!118051))

(declare-fun m!118053 () Bool)

(assert (=> b!73621 m!118053))

(declare-fun m!118055 () Bool)

(assert (=> b!73621 m!118055))

(declare-fun m!118057 () Bool)

(assert (=> b!73621 m!118057))

(declare-fun m!118059 () Bool)

(assert (=> b!73625 m!118059))

(declare-fun m!118061 () Bool)

(assert (=> b!73622 m!118061))

(declare-fun m!118063 () Bool)

(assert (=> b!73614 m!118063))

(declare-fun m!118065 () Bool)

(assert (=> b!73614 m!118065))

(declare-fun m!118067 () Bool)

(assert (=> b!73614 m!118067))

(declare-fun m!118069 () Bool)

(assert (=> b!73628 m!118069))

(declare-fun m!118071 () Bool)

(assert (=> b!73628 m!118071))

(declare-fun m!118073 () Bool)

(assert (=> b!73617 m!118073))

(declare-fun m!118075 () Bool)

(assert (=> start!14112 m!118075))

(declare-fun m!118077 () Bool)

(assert (=> start!14112 m!118077))

(declare-fun m!118079 () Bool)

(assert (=> b!73615 m!118079))

(declare-fun m!118081 () Bool)

(assert (=> b!73615 m!118081))

(declare-fun m!118083 () Bool)

(assert (=> b!73615 m!118083))

(declare-fun m!118085 () Bool)

(assert (=> b!73615 m!118085))

(declare-fun m!118087 () Bool)

(assert (=> b!73615 m!118087))

(declare-fun m!118089 () Bool)

(assert (=> b!73615 m!118089))

(declare-fun m!118091 () Bool)

(assert (=> b!73615 m!118091))

(declare-fun m!118093 () Bool)

(assert (=> b!73615 m!118093))

(declare-fun m!118095 () Bool)

(assert (=> b!73615 m!118095))

(declare-fun m!118097 () Bool)

(assert (=> b!73630 m!118097))

(declare-fun m!118099 () Bool)

(assert (=> b!73619 m!118099))

(declare-fun m!118101 () Bool)

(assert (=> b!73616 m!118101))

(assert (=> b!73616 m!118101))

(declare-fun m!118103 () Bool)

(assert (=> b!73616 m!118103))

(declare-fun m!118105 () Bool)

(assert (=> b!73616 m!118105))

(assert (=> b!73616 m!118105))

(declare-fun m!118107 () Bool)

(assert (=> b!73616 m!118107))

(declare-fun m!118109 () Bool)

(assert (=> b!73618 m!118109))

(declare-fun m!118111 () Bool)

(assert (=> b!73626 m!118111))

(declare-fun m!118113 () Bool)

(assert (=> b!73626 m!118113))

(declare-fun m!118115 () Bool)

(assert (=> b!73627 m!118115))

(declare-fun m!118117 () Bool)

(assert (=> b!73612 m!118117))

(declare-fun m!118119 () Bool)

(assert (=> b!73612 m!118119))

(declare-fun m!118121 () Bool)

(assert (=> b!73613 m!118121))

(declare-fun m!118123 () Bool)

(assert (=> b!73610 m!118123))

(push 1)

(assert (not b!73615))

(assert (not b!73618))

(assert (not start!14112))

(assert (not b!73628))

(assert (not b!73625))

(assert (not b!73630))

(assert (not b!73620))

(assert (not b!73624))

(assert (not b!73623))

(assert (not b!73629))

(assert (not b!73616))

(assert (not b!73610))

(assert (not b!73613))

(assert (not b!73614))

(assert (not b!73627))

(assert (not b!73626))

(assert (not b!73617))

(assert (not b!73612))

(assert (not b!73619))

(assert (not b!73622))

(assert (not b!73621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23308 () Bool)

(assert (=> d!23308 (= (array_inv!1249 (buf!1781 thiss!1379)) (bvsge (size!1400 (buf!1781 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!73619 d!23308))

(declare-fun d!23310 () Bool)

(assert (=> d!23310 (= (invariant!0 (currentBit!3502 (_2!3300 lt!118298)) (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118302)))) (and (bvsge (currentBit!3502 (_2!3300 lt!118298)) #b00000000000000000000000000000000) (bvslt (currentBit!3502 (_2!3300 lt!118298)) #b00000000000000000000000000001000) (bvsge (currentByte!3507 (_2!3300 lt!118298)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118302)))) (and (= (currentBit!3502 (_2!3300 lt!118298)) #b00000000000000000000000000000000) (= (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118302))))))))))

(assert (=> b!73630 d!23310))

(declare-fun d!23314 () Bool)

(assert (=> d!23314 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5600 () Bool)

(assert (= bs!5600 d!23314))

(assert (=> bs!5600 m!118029))

(declare-fun m!118417 () Bool)

(assert (=> bs!5600 m!118417))

(assert (=> b!73628 d!23314))

(declare-fun d!23316 () Bool)

(assert (=> d!23316 (= (head!584 lt!118292) (h!880 lt!118292))))

(assert (=> b!73628 d!23316))

(declare-fun d!23318 () Bool)

(declare-fun e!48265 () Bool)

(assert (=> d!23318 e!48265))

(declare-fun res!61076 () Bool)

(assert (=> d!23318 (=> (not res!61076) (not e!48265))))

(declare-fun lt!118619 () (_ BitVec 64))

(declare-fun lt!118620 () (_ BitVec 64))

(declare-fun lt!118623 () (_ BitVec 64))

(assert (=> d!23318 (= res!61076 (= lt!118623 (bvsub lt!118620 lt!118619)))))

(assert (=> d!23318 (or (= (bvand lt!118620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118620 lt!118619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23318 (= lt!118619 (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118302))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118302)))))))

(declare-fun lt!118622 () (_ BitVec 64))

(declare-fun lt!118621 () (_ BitVec 64))

(assert (=> d!23318 (= lt!118620 (bvmul lt!118622 lt!118621))))

(assert (=> d!23318 (or (= lt!118622 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!118621 (bvsdiv (bvmul lt!118622 lt!118621) lt!118622)))))

(assert (=> d!23318 (= lt!118621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23318 (= lt!118622 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))))))

(assert (=> d!23318 (= lt!118623 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118302))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118302)))))))

(assert (=> d!23318 (invariant!0 (currentBit!3502 (_2!3300 lt!118302)) (currentByte!3507 (_2!3300 lt!118302)) (size!1400 (buf!1781 (_2!3300 lt!118302))))))

(assert (=> d!23318 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118302))) (currentByte!3507 (_2!3300 lt!118302)) (currentBit!3502 (_2!3300 lt!118302))) lt!118623)))

(declare-fun b!73832 () Bool)

(declare-fun res!61075 () Bool)

(assert (=> b!73832 (=> (not res!61075) (not e!48265))))

(assert (=> b!73832 (= res!61075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118623))))

(declare-fun b!73833 () Bool)

(declare-fun lt!118624 () (_ BitVec 64))

(assert (=> b!73833 (= e!48265 (bvsle lt!118623 (bvmul lt!118624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!73833 (or (= lt!118624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!118624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!118624)))))

(assert (=> b!73833 (= lt!118624 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))))))

(assert (= (and d!23318 res!61076) b!73832))

(assert (= (and b!73832 res!61075) b!73833))

(declare-fun m!118419 () Bool)

(assert (=> d!23318 m!118419))

(assert (=> d!23318 m!118123))

(assert (=> b!73618 d!23318))

(declare-fun d!23320 () Bool)

(assert (=> d!23320 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 thiss!1379))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 thiss!1379))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5601 () Bool)

(assert (= bs!5601 d!23320))

(declare-fun m!118421 () Bool)

(assert (=> bs!5601 m!118421))

(assert (=> b!73629 d!23320))

(declare-fun d!23322 () Bool)

(assert (=> d!23322 (= (head!584 (byteArrayBitContentToList!0 (_2!3300 lt!118298) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!880 (byteArrayBitContentToList!0 (_2!3300 lt!118298) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!73616 d!23322))

(declare-fun d!23324 () Bool)

(declare-fun c!5415 () Bool)

(assert (=> d!23324 (= c!5415 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48268 () List!765)

(assert (=> d!23324 (= (byteArrayBitContentToList!0 (_2!3300 lt!118298) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!48268)))

(declare-fun b!73838 () Bool)

(assert (=> b!73838 (= e!48268 Nil!762)))

(declare-fun b!73839 () Bool)

(assert (=> b!73839 (= e!48268 (Cons!761 (not (= (bvand ((_ sign_extend 24) (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3300 lt!118298) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23324 c!5415) b!73838))

(assert (= (and d!23324 (not c!5415)) b!73839))

(assert (=> b!73839 m!118029))

(assert (=> b!73839 m!118417))

(declare-fun m!118423 () Bool)

(assert (=> b!73839 m!118423))

(assert (=> b!73616 d!23324))

(declare-fun d!23326 () Bool)

(assert (=> d!23326 (= (head!584 (bitStreamReadBitsIntoList!0 (_2!3300 lt!118298) (_1!3301 lt!118288) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!880 (bitStreamReadBitsIntoList!0 (_2!3300 lt!118298) (_1!3301 lt!118288) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!73616 d!23326))

(declare-fun b!73848 () Bool)

(declare-datatypes ((tuple2!6390 0))(
  ( (tuple2!6391 (_1!3309 List!765) (_2!3309 BitStream!2380)) )
))
(declare-fun e!48274 () tuple2!6390)

(assert (=> b!73848 (= e!48274 (tuple2!6391 Nil!762 (_1!3301 lt!118288)))))

(declare-fun b!73849 () Bool)

(declare-datatypes ((tuple2!6392 0))(
  ( (tuple2!6393 (_1!3310 Bool) (_2!3310 BitStream!2380)) )
))
(declare-fun lt!118631 () tuple2!6392)

(declare-fun lt!118633 () (_ BitVec 64))

(assert (=> b!73849 (= e!48274 (tuple2!6391 (Cons!761 (_1!3310 lt!118631) (bitStreamReadBitsIntoList!0 (_2!3300 lt!118298) (_2!3310 lt!118631) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!118633))) (_2!3310 lt!118631)))))

(declare-fun readBit!0 (BitStream!2380) tuple2!6392)

(assert (=> b!73849 (= lt!118631 (readBit!0 (_1!3301 lt!118288)))))

(assert (=> b!73849 (= lt!118633 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!73851 () Bool)

(declare-fun e!48273 () Bool)

(declare-fun lt!118632 () List!765)

(assert (=> b!73851 (= e!48273 (> (length!393 lt!118632) 0))))

(declare-fun b!73850 () Bool)

(declare-fun isEmpty!234 (List!765) Bool)

(assert (=> b!73850 (= e!48273 (isEmpty!234 lt!118632))))

(declare-fun d!23328 () Bool)

(assert (=> d!23328 e!48273))

(declare-fun c!5421 () Bool)

(assert (=> d!23328 (= c!5421 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23328 (= lt!118632 (_1!3309 e!48274))))

(declare-fun c!5420 () Bool)

(assert (=> d!23328 (= c!5420 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23328 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23328 (= (bitStreamReadBitsIntoList!0 (_2!3300 lt!118298) (_1!3301 lt!118288) #b0000000000000000000000000000000000000000000000000000000000000001) lt!118632)))

(assert (= (and d!23328 c!5420) b!73848))

(assert (= (and d!23328 (not c!5420)) b!73849))

(assert (= (and d!23328 c!5421) b!73850))

(assert (= (and d!23328 (not c!5421)) b!73851))

(declare-fun m!118425 () Bool)

(assert (=> b!73849 m!118425))

(declare-fun m!118427 () Bool)

(assert (=> b!73849 m!118427))

(declare-fun m!118429 () Bool)

(assert (=> b!73851 m!118429))

(declare-fun m!118431 () Bool)

(assert (=> b!73850 m!118431))

(assert (=> b!73616 d!23328))

(declare-fun d!23330 () Bool)

(assert (=> d!23330 (= (head!584 lt!118304) (h!880 lt!118304))))

(assert (=> b!73627 d!23330))

(declare-fun d!23332 () Bool)

(declare-fun lt!118636 () tuple2!6392)

(assert (=> d!23332 (= lt!118636 (readBit!0 (_1!3301 lt!118307)))))

(assert (=> d!23332 (= (readBitPure!0 (_1!3301 lt!118307)) (tuple2!6377 (_2!3310 lt!118636) (_1!3310 lt!118636)))))

(declare-fun bs!5602 () Bool)

(assert (= bs!5602 d!23332))

(declare-fun m!118433 () Bool)

(assert (=> bs!5602 m!118433))

(assert (=> b!73617 d!23332))

(declare-fun b!73852 () Bool)

(declare-fun e!48276 () tuple2!6390)

(assert (=> b!73852 (= e!48276 (tuple2!6391 Nil!762 (_1!3301 lt!118293)))))

(declare-fun lt!118637 () tuple2!6392)

(declare-fun lt!118639 () (_ BitVec 64))

(declare-fun b!73853 () Bool)

(assert (=> b!73853 (= e!48276 (tuple2!6391 (Cons!761 (_1!3310 lt!118637) (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_2!3310 lt!118637) (bvsub lt!118297 lt!118639))) (_2!3310 lt!118637)))))

(assert (=> b!73853 (= lt!118637 (readBit!0 (_1!3301 lt!118293)))))

(assert (=> b!73853 (= lt!118639 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!73855 () Bool)

(declare-fun e!48275 () Bool)

(declare-fun lt!118638 () List!765)

(assert (=> b!73855 (= e!48275 (> (length!393 lt!118638) 0))))

(declare-fun b!73854 () Bool)

(assert (=> b!73854 (= e!48275 (isEmpty!234 lt!118638))))

(declare-fun d!23334 () Bool)

(assert (=> d!23334 e!48275))

(declare-fun c!5423 () Bool)

(assert (=> d!23334 (= c!5423 (= lt!118297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23334 (= lt!118638 (_1!3309 e!48276))))

(declare-fun c!5422 () Bool)

(assert (=> d!23334 (= c!5422 (= lt!118297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23334 (bvsge lt!118297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23334 (= (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_1!3301 lt!118293) lt!118297) lt!118638)))

(assert (= (and d!23334 c!5422) b!73852))

(assert (= (and d!23334 (not c!5422)) b!73853))

(assert (= (and d!23334 c!5423) b!73854))

(assert (= (and d!23334 (not c!5423)) b!73855))

(declare-fun m!118435 () Bool)

(assert (=> b!73853 m!118435))

(declare-fun m!118437 () Bool)

(assert (=> b!73853 m!118437))

(declare-fun m!118439 () Bool)

(assert (=> b!73855 m!118439))

(declare-fun m!118441 () Bool)

(assert (=> b!73854 m!118441))

(assert (=> b!73615 d!23334))

(declare-fun d!23336 () Bool)

(assert (=> d!23336 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!118297)))

(declare-fun lt!118642 () Unit!4853)

(declare-fun choose!9 (BitStream!2380 array!2995 (_ BitVec 64) BitStream!2380) Unit!4853)

(assert (=> d!23336 (= lt!118642 (choose!9 (_2!3300 lt!118298) (buf!1781 (_2!3300 lt!118302)) lt!118297 (BitStream!2381 (buf!1781 (_2!3300 lt!118302)) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298)))))))

(assert (=> d!23336 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3300 lt!118298) (buf!1781 (_2!3300 lt!118302)) lt!118297) lt!118642)))

(declare-fun bs!5603 () Bool)

(assert (= bs!5603 d!23336))

(assert (=> bs!5603 m!118093))

(declare-fun m!118443 () Bool)

(assert (=> bs!5603 m!118443))

(assert (=> b!73615 d!23336))

(declare-fun d!23338 () Bool)

(declare-fun c!5424 () Bool)

(assert (=> d!23338 (= c!5424 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48277 () List!765)

(assert (=> d!23338 (= (byteArrayBitContentToList!0 (_2!3300 lt!118302) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!48277)))

(declare-fun b!73856 () Bool)

(assert (=> b!73856 (= e!48277 Nil!762)))

(declare-fun b!73857 () Bool)

(assert (=> b!73857 (= e!48277 (Cons!761 (not (= (bvand ((_ sign_extend 24) (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3300 lt!118302) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23338 c!5424) b!73856))

(assert (= (and d!23338 (not c!5424)) b!73857))

(assert (=> b!73857 m!118029))

(assert (=> b!73857 m!118417))

(declare-fun m!118445 () Bool)

(assert (=> b!73857 m!118445))

(assert (=> b!73615 d!23338))

(declare-fun b!73877 () Bool)

(declare-fun e!48289 () Unit!4853)

(declare-fun lt!118686 () Unit!4853)

(assert (=> b!73877 (= e!48289 lt!118686)))

(declare-fun lt!118698 () (_ BitVec 64))

(assert (=> b!73877 (= lt!118698 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118687 () (_ BitVec 64))

(assert (=> b!73877 (= lt!118687 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2995 array!2995 (_ BitVec 64) (_ BitVec 64)) Unit!4853)

(assert (=> b!73877 (= lt!118686 (arrayBitRangesEqSymmetric!0 (buf!1781 (_2!3300 lt!118298)) (buf!1781 (_2!3300 lt!118302)) lt!118698 lt!118687))))

(declare-fun arrayBitRangesEq!0 (array!2995 array!2995 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73877 (arrayBitRangesEq!0 (buf!1781 (_2!3300 lt!118302)) (buf!1781 (_2!3300 lt!118298)) lt!118698 lt!118687)))

(declare-fun b!73878 () Bool)

(declare-fun lt!118693 () (_ BitVec 64))

(declare-fun e!48288 () Bool)

(declare-fun lt!118692 () (_ BitVec 64))

(declare-fun lt!118695 () tuple2!6374)

(declare-fun withMovedBitIndex!0 (BitStream!2380 (_ BitVec 64)) BitStream!2380)

(assert (=> b!73878 (= e!48288 (= (_1!3301 lt!118695) (withMovedBitIndex!0 (_2!3301 lt!118695) (bvsub lt!118692 lt!118693))))))

(assert (=> b!73878 (or (= (bvand lt!118692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118692 lt!118693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73878 (= lt!118693 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118302))) (currentByte!3507 (_2!3300 lt!118302)) (currentBit!3502 (_2!3300 lt!118302))))))

(assert (=> b!73878 (= lt!118692 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(declare-fun b!73879 () Bool)

(declare-fun res!61092 () Bool)

(assert (=> b!73879 (=> (not res!61092) (not e!48288))))

(assert (=> b!73879 (= res!61092 (isPrefixOf!0 (_2!3301 lt!118695) (_2!3300 lt!118302)))))

(declare-fun d!23340 () Bool)

(assert (=> d!23340 e!48288))

(declare-fun res!61093 () Bool)

(assert (=> d!23340 (=> (not res!61093) (not e!48288))))

(assert (=> d!23340 (= res!61093 (isPrefixOf!0 (_1!3301 lt!118695) (_2!3301 lt!118695)))))

(declare-fun lt!118689 () BitStream!2380)

(assert (=> d!23340 (= lt!118695 (tuple2!6375 lt!118689 (_2!3300 lt!118302)))))

(declare-fun lt!118703 () Unit!4853)

(declare-fun lt!118688 () Unit!4853)

(assert (=> d!23340 (= lt!118703 lt!118688)))

(assert (=> d!23340 (isPrefixOf!0 lt!118689 (_2!3300 lt!118302))))

(assert (=> d!23340 (= lt!118688 (lemmaIsPrefixTransitive!0 lt!118689 (_2!3300 lt!118302) (_2!3300 lt!118302)))))

(declare-fun lt!118704 () Unit!4853)

(declare-fun lt!118701 () Unit!4853)

(assert (=> d!23340 (= lt!118704 lt!118701)))

(assert (=> d!23340 (isPrefixOf!0 lt!118689 (_2!3300 lt!118302))))

(assert (=> d!23340 (= lt!118701 (lemmaIsPrefixTransitive!0 lt!118689 (_2!3300 lt!118298) (_2!3300 lt!118302)))))

(declare-fun lt!118697 () Unit!4853)

(assert (=> d!23340 (= lt!118697 e!48289)))

(declare-fun c!5427 () Bool)

(assert (=> d!23340 (= c!5427 (not (= (size!1400 (buf!1781 (_2!3300 lt!118298))) #b00000000000000000000000000000000)))))

(declare-fun lt!118691 () Unit!4853)

(declare-fun lt!118694 () Unit!4853)

(assert (=> d!23340 (= lt!118691 lt!118694)))

(assert (=> d!23340 (isPrefixOf!0 (_2!3300 lt!118302) (_2!3300 lt!118302))))

(assert (=> d!23340 (= lt!118694 (lemmaIsPrefixRefl!0 (_2!3300 lt!118302)))))

(declare-fun lt!118690 () Unit!4853)

(declare-fun lt!118705 () Unit!4853)

(assert (=> d!23340 (= lt!118690 lt!118705)))

(assert (=> d!23340 (= lt!118705 (lemmaIsPrefixRefl!0 (_2!3300 lt!118302)))))

(declare-fun lt!118696 () Unit!4853)

(declare-fun lt!118699 () Unit!4853)

(assert (=> d!23340 (= lt!118696 lt!118699)))

(assert (=> d!23340 (isPrefixOf!0 lt!118689 lt!118689)))

(assert (=> d!23340 (= lt!118699 (lemmaIsPrefixRefl!0 lt!118689))))

(declare-fun lt!118702 () Unit!4853)

(declare-fun lt!118700 () Unit!4853)

(assert (=> d!23340 (= lt!118702 lt!118700)))

(assert (=> d!23340 (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!118298))))

(assert (=> d!23340 (= lt!118700 (lemmaIsPrefixRefl!0 (_2!3300 lt!118298)))))

(assert (=> d!23340 (= lt!118689 (BitStream!2381 (buf!1781 (_2!3300 lt!118302)) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(assert (=> d!23340 (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!118302))))

(assert (=> d!23340 (= (reader!0 (_2!3300 lt!118298) (_2!3300 lt!118302)) lt!118695)))

(declare-fun b!73880 () Bool)

(declare-fun res!61094 () Bool)

(assert (=> b!73880 (=> (not res!61094) (not e!48288))))

(assert (=> b!73880 (= res!61094 (isPrefixOf!0 (_1!3301 lt!118695) (_2!3300 lt!118298)))))

(declare-fun b!73881 () Bool)

(declare-fun Unit!4859 () Unit!4853)

(assert (=> b!73881 (= e!48289 Unit!4859)))

(assert (= (and d!23340 c!5427) b!73877))

(assert (= (and d!23340 (not c!5427)) b!73881))

(assert (= (and d!23340 res!61093) b!73880))

(assert (= (and b!73880 res!61094) b!73879))

(assert (= (and b!73879 res!61092) b!73878))

(assert (=> b!73877 m!118061))

(declare-fun m!118453 () Bool)

(assert (=> b!73877 m!118453))

(declare-fun m!118455 () Bool)

(assert (=> b!73877 m!118455))

(declare-fun m!118457 () Bool)

(assert (=> d!23340 m!118457))

(declare-fun m!118459 () Bool)

(assert (=> d!23340 m!118459))

(declare-fun m!118461 () Bool)

(assert (=> d!23340 m!118461))

(declare-fun m!118463 () Bool)

(assert (=> d!23340 m!118463))

(declare-fun m!118465 () Bool)

(assert (=> d!23340 m!118465))

(declare-fun m!118467 () Bool)

(assert (=> d!23340 m!118467))

(declare-fun m!118469 () Bool)

(assert (=> d!23340 m!118469))

(assert (=> d!23340 m!118045))

(declare-fun m!118471 () Bool)

(assert (=> d!23340 m!118471))

(declare-fun m!118473 () Bool)

(assert (=> d!23340 m!118473))

(declare-fun m!118475 () Bool)

(assert (=> d!23340 m!118475))

(declare-fun m!118477 () Bool)

(assert (=> b!73879 m!118477))

(declare-fun m!118479 () Bool)

(assert (=> b!73878 m!118479))

(assert (=> b!73878 m!118109))

(assert (=> b!73878 m!118061))

(declare-fun m!118481 () Bool)

(assert (=> b!73880 m!118481))

(assert (=> b!73615 d!23340))

(declare-fun d!23350 () Bool)

(assert (=> d!23350 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5606 () Bool)

(assert (= bs!5606 d!23350))

(declare-fun m!118483 () Bool)

(assert (=> bs!5606 m!118483))

(assert (=> b!73615 d!23350))

(declare-fun b!73882 () Bool)

(declare-fun e!48291 () Unit!4853)

(declare-fun lt!118706 () Unit!4853)

(assert (=> b!73882 (= e!48291 lt!118706)))

(declare-fun lt!118718 () (_ BitVec 64))

(assert (=> b!73882 (= lt!118718 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118707 () (_ BitVec 64))

(assert (=> b!73882 (= lt!118707 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(assert (=> b!73882 (= lt!118706 (arrayBitRangesEqSymmetric!0 (buf!1781 thiss!1379) (buf!1781 (_2!3300 lt!118302)) lt!118718 lt!118707))))

(assert (=> b!73882 (arrayBitRangesEq!0 (buf!1781 (_2!3300 lt!118302)) (buf!1781 thiss!1379) lt!118718 lt!118707)))

(declare-fun lt!118713 () (_ BitVec 64))

(declare-fun lt!118715 () tuple2!6374)

(declare-fun b!73883 () Bool)

(declare-fun lt!118712 () (_ BitVec 64))

(declare-fun e!48290 () Bool)

(assert (=> b!73883 (= e!48290 (= (_1!3301 lt!118715) (withMovedBitIndex!0 (_2!3301 lt!118715) (bvsub lt!118712 lt!118713))))))

(assert (=> b!73883 (or (= (bvand lt!118712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118713 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118712 lt!118713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73883 (= lt!118713 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118302))) (currentByte!3507 (_2!3300 lt!118302)) (currentBit!3502 (_2!3300 lt!118302))))))

(assert (=> b!73883 (= lt!118712 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(declare-fun b!73884 () Bool)

(declare-fun res!61095 () Bool)

(assert (=> b!73884 (=> (not res!61095) (not e!48290))))

(assert (=> b!73884 (= res!61095 (isPrefixOf!0 (_2!3301 lt!118715) (_2!3300 lt!118302)))))

(declare-fun d!23352 () Bool)

(assert (=> d!23352 e!48290))

(declare-fun res!61096 () Bool)

(assert (=> d!23352 (=> (not res!61096) (not e!48290))))

(assert (=> d!23352 (= res!61096 (isPrefixOf!0 (_1!3301 lt!118715) (_2!3301 lt!118715)))))

(declare-fun lt!118709 () BitStream!2380)

(assert (=> d!23352 (= lt!118715 (tuple2!6375 lt!118709 (_2!3300 lt!118302)))))

(declare-fun lt!118723 () Unit!4853)

(declare-fun lt!118708 () Unit!4853)

(assert (=> d!23352 (= lt!118723 lt!118708)))

(assert (=> d!23352 (isPrefixOf!0 lt!118709 (_2!3300 lt!118302))))

(assert (=> d!23352 (= lt!118708 (lemmaIsPrefixTransitive!0 lt!118709 (_2!3300 lt!118302) (_2!3300 lt!118302)))))

(declare-fun lt!118724 () Unit!4853)

(declare-fun lt!118721 () Unit!4853)

(assert (=> d!23352 (= lt!118724 lt!118721)))

(assert (=> d!23352 (isPrefixOf!0 lt!118709 (_2!3300 lt!118302))))

(assert (=> d!23352 (= lt!118721 (lemmaIsPrefixTransitive!0 lt!118709 thiss!1379 (_2!3300 lt!118302)))))

(declare-fun lt!118717 () Unit!4853)

(assert (=> d!23352 (= lt!118717 e!48291)))

(declare-fun c!5428 () Bool)

(assert (=> d!23352 (= c!5428 (not (= (size!1400 (buf!1781 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!118711 () Unit!4853)

(declare-fun lt!118714 () Unit!4853)

(assert (=> d!23352 (= lt!118711 lt!118714)))

(assert (=> d!23352 (isPrefixOf!0 (_2!3300 lt!118302) (_2!3300 lt!118302))))

(assert (=> d!23352 (= lt!118714 (lemmaIsPrefixRefl!0 (_2!3300 lt!118302)))))

(declare-fun lt!118710 () Unit!4853)

(declare-fun lt!118725 () Unit!4853)

(assert (=> d!23352 (= lt!118710 lt!118725)))

(assert (=> d!23352 (= lt!118725 (lemmaIsPrefixRefl!0 (_2!3300 lt!118302)))))

(declare-fun lt!118716 () Unit!4853)

(declare-fun lt!118719 () Unit!4853)

(assert (=> d!23352 (= lt!118716 lt!118719)))

(assert (=> d!23352 (isPrefixOf!0 lt!118709 lt!118709)))

(assert (=> d!23352 (= lt!118719 (lemmaIsPrefixRefl!0 lt!118709))))

(declare-fun lt!118722 () Unit!4853)

(declare-fun lt!118720 () Unit!4853)

(assert (=> d!23352 (= lt!118722 lt!118720)))

(assert (=> d!23352 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23352 (= lt!118720 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23352 (= lt!118709 (BitStream!2381 (buf!1781 (_2!3300 lt!118302)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(assert (=> d!23352 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118302))))

(assert (=> d!23352 (= (reader!0 thiss!1379 (_2!3300 lt!118302)) lt!118715)))

(declare-fun b!73885 () Bool)

(declare-fun res!61097 () Bool)

(assert (=> b!73885 (=> (not res!61097) (not e!48290))))

(assert (=> b!73885 (= res!61097 (isPrefixOf!0 (_1!3301 lt!118715) thiss!1379))))

(declare-fun b!73886 () Bool)

(declare-fun Unit!4861 () Unit!4853)

(assert (=> b!73886 (= e!48291 Unit!4861)))

(assert (= (and d!23352 c!5428) b!73882))

(assert (= (and d!23352 (not c!5428)) b!73886))

(assert (= (and d!23352 res!61096) b!73885))

(assert (= (and b!73885 res!61097) b!73884))

(assert (= (and b!73884 res!61095) b!73883))

(assert (=> b!73882 m!118067))

(declare-fun m!118485 () Bool)

(assert (=> b!73882 m!118485))

(declare-fun m!118487 () Bool)

(assert (=> b!73882 m!118487))

(declare-fun m!118489 () Bool)

(assert (=> d!23352 m!118489))

(declare-fun m!118491 () Bool)

(assert (=> d!23352 m!118491))

(declare-fun m!118493 () Bool)

(assert (=> d!23352 m!118493))

(assert (=> d!23352 m!118063))

(assert (=> d!23352 m!118065))

(assert (=> d!23352 m!118467))

(declare-fun m!118495 () Bool)

(assert (=> d!23352 m!118495))

(assert (=> d!23352 m!118053))

(assert (=> d!23352 m!118471))

(declare-fun m!118497 () Bool)

(assert (=> d!23352 m!118497))

(declare-fun m!118499 () Bool)

(assert (=> d!23352 m!118499))

(declare-fun m!118501 () Bool)

(assert (=> b!73884 m!118501))

(declare-fun m!118503 () Bool)

(assert (=> b!73883 m!118503))

(assert (=> b!73883 m!118109))

(assert (=> b!73883 m!118067))

(declare-fun m!118505 () Bool)

(assert (=> b!73885 m!118505))

(assert (=> b!73615 d!23352))

(declare-fun b!73887 () Bool)

(declare-fun e!48293 () tuple2!6390)

(assert (=> b!73887 (= e!48293 (tuple2!6391 Nil!762 (_1!3301 lt!118307)))))

(declare-fun b!73888 () Bool)

(declare-fun lt!118728 () (_ BitVec 64))

(declare-fun lt!118726 () tuple2!6392)

(assert (=> b!73888 (= e!48293 (tuple2!6391 (Cons!761 (_1!3310 lt!118726) (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_2!3310 lt!118726) (bvsub (bvsub to!314 i!635) lt!118728))) (_2!3310 lt!118726)))))

(assert (=> b!73888 (= lt!118726 (readBit!0 (_1!3301 lt!118307)))))

(assert (=> b!73888 (= lt!118728 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!73890 () Bool)

(declare-fun e!48292 () Bool)

(declare-fun lt!118727 () List!765)

(assert (=> b!73890 (= e!48292 (> (length!393 lt!118727) 0))))

(declare-fun b!73889 () Bool)

(assert (=> b!73889 (= e!48292 (isEmpty!234 lt!118727))))

(declare-fun d!23354 () Bool)

(assert (=> d!23354 e!48292))

(declare-fun c!5430 () Bool)

(assert (=> d!23354 (= c!5430 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23354 (= lt!118727 (_1!3309 e!48293))))

(declare-fun c!5429 () Bool)

(assert (=> d!23354 (= c!5429 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23354 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23354 (= (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_1!3301 lt!118307) (bvsub to!314 i!635)) lt!118727)))

(assert (= (and d!23354 c!5429) b!73887))

(assert (= (and d!23354 (not c!5429)) b!73888))

(assert (= (and d!23354 c!5430) b!73889))

(assert (= (and d!23354 (not c!5430)) b!73890))

(declare-fun m!118507 () Bool)

(assert (=> b!73888 m!118507))

(assert (=> b!73888 m!118433))

(declare-fun m!118509 () Bool)

(assert (=> b!73890 m!118509))

(declare-fun m!118511 () Bool)

(assert (=> b!73889 m!118511))

(assert (=> b!73615 d!23354))

(declare-fun d!23356 () Bool)

(assert (=> d!23356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!118729 () Unit!4853)

(assert (=> d!23356 (= lt!118729 (choose!9 thiss!1379 (buf!1781 (_2!3300 lt!118302)) (bvsub to!314 i!635) (BitStream!2381 (buf!1781 (_2!3300 lt!118302)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379))))))

(assert (=> d!23356 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1781 (_2!3300 lt!118302)) (bvsub to!314 i!635)) lt!118729)))

(declare-fun bs!5607 () Bool)

(assert (= bs!5607 d!23356))

(assert (=> bs!5607 m!118095))

(declare-fun m!118513 () Bool)

(assert (=> bs!5607 m!118513))

(assert (=> b!73615 d!23356))

(declare-fun d!23358 () Bool)

(assert (=> d!23358 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!118297) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118302)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298)))) lt!118297))))

(declare-fun bs!5608 () Bool)

(assert (= bs!5608 d!23358))

(declare-fun m!118515 () Bool)

(assert (=> bs!5608 m!118515))

(assert (=> b!73615 d!23358))

(declare-fun d!23360 () Bool)

(assert (=> d!23360 (= (bitAt!0 (buf!1781 (_2!3300 lt!118302)) lt!118295) (not (= (bvand ((_ sign_extend 24) (select (arr!1991 (buf!1781 (_2!3300 lt!118302))) ((_ extract 31 0) (bvsdiv lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5609 () Bool)

(assert (= bs!5609 d!23360))

(declare-fun m!118517 () Bool)

(assert (=> bs!5609 m!118517))

(declare-fun m!118519 () Bool)

(assert (=> bs!5609 m!118519))

(assert (=> b!73626 d!23360))

(declare-fun d!23362 () Bool)

(assert (=> d!23362 (= (bitAt!0 (buf!1781 (_2!3300 lt!118298)) lt!118295) (bitAt!0 (buf!1781 (_2!3300 lt!118302)) lt!118295))))

(declare-fun lt!118746 () Unit!4853)

(declare-fun choose!31 (array!2995 array!2995 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4853)

(assert (=> d!23362 (= lt!118746 (choose!31 (buf!1781 (_2!3300 lt!118298)) (buf!1781 (_2!3300 lt!118302)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118295 lt!118301))))

(assert (=> d!23362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118301))))

(assert (=> d!23362 (= (arrayBitRangesEqImpliesEq!0 (buf!1781 (_2!3300 lt!118298)) (buf!1781 (_2!3300 lt!118302)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118295 lt!118301) lt!118746)))

(declare-fun bs!5610 () Bool)

(assert (= bs!5610 d!23362))

(assert (=> bs!5610 m!118059))

(assert (=> bs!5610 m!118111))

(declare-fun m!118521 () Bool)

(assert (=> bs!5610 m!118521))

(assert (=> b!73626 d!23362))

(declare-fun d!23364 () Bool)

(assert (=> d!23364 (= (invariant!0 (currentBit!3502 (_2!3300 lt!118298)) (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118298)))) (and (bvsge (currentBit!3502 (_2!3300 lt!118298)) #b00000000000000000000000000000000) (bvslt (currentBit!3502 (_2!3300 lt!118298)) #b00000000000000000000000000001000) (bvsge (currentByte!3507 (_2!3300 lt!118298)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118298)))) (and (= (currentBit!3502 (_2!3300 lt!118298)) #b00000000000000000000000000000000) (= (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118298))))))))))

(assert (=> b!73624 d!23364))

(declare-fun d!23366 () Bool)

(declare-fun res!61126 () Bool)

(declare-fun e!48311 () Bool)

(assert (=> d!23366 (=> (not res!61126) (not e!48311))))

(assert (=> d!23366 (= res!61126 (= (size!1400 (buf!1781 thiss!1379)) (size!1400 (buf!1781 thiss!1379))))))

(assert (=> d!23366 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48311)))

(declare-fun b!73924 () Bool)

(declare-fun res!61127 () Bool)

(assert (=> b!73924 (=> (not res!61127) (not e!48311))))

(assert (=> b!73924 (= res!61127 (bvsle (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)) (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379))))))

(declare-fun b!73925 () Bool)

(declare-fun e!48310 () Bool)

(assert (=> b!73925 (= e!48311 e!48310)))

(declare-fun res!61128 () Bool)

(assert (=> b!73925 (=> res!61128 e!48310)))

(assert (=> b!73925 (= res!61128 (= (size!1400 (buf!1781 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!73926 () Bool)

(assert (=> b!73926 (= e!48310 (arrayBitRangesEq!0 (buf!1781 thiss!1379) (buf!1781 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379))))))

(assert (= (and d!23366 res!61126) b!73924))

(assert (= (and b!73924 res!61127) b!73925))

(assert (= (and b!73925 (not res!61128)) b!73926))

(assert (=> b!73924 m!118067))

(assert (=> b!73924 m!118067))

(assert (=> b!73926 m!118067))

(assert (=> b!73926 m!118067))

(declare-fun m!118523 () Bool)

(assert (=> b!73926 m!118523))

(assert (=> b!73614 d!23366))

(declare-fun d!23368 () Bool)

(assert (=> d!23368 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!118819 () Unit!4853)

(declare-fun choose!11 (BitStream!2380) Unit!4853)

(assert (=> d!23368 (= lt!118819 (choose!11 thiss!1379))))

(assert (=> d!23368 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!118819)))

(declare-fun bs!5612 () Bool)

(assert (= bs!5612 d!23368))

(assert (=> bs!5612 m!118063))

(declare-fun m!118551 () Bool)

(assert (=> bs!5612 m!118551))

(assert (=> b!73614 d!23368))

(declare-fun d!23372 () Bool)

(declare-fun e!48316 () Bool)

(assert (=> d!23372 e!48316))

(declare-fun res!61136 () Bool)

(assert (=> d!23372 (=> (not res!61136) (not e!48316))))

(declare-fun lt!118821 () (_ BitVec 64))

(declare-fun lt!118820 () (_ BitVec 64))

(declare-fun lt!118824 () (_ BitVec 64))

(assert (=> d!23372 (= res!61136 (= lt!118824 (bvsub lt!118821 lt!118820)))))

(assert (=> d!23372 (or (= (bvand lt!118821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118821 lt!118820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23372 (= lt!118820 (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 thiss!1379))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379))))))

(declare-fun lt!118823 () (_ BitVec 64))

(declare-fun lt!118822 () (_ BitVec 64))

(assert (=> d!23372 (= lt!118821 (bvmul lt!118823 lt!118822))))

(assert (=> d!23372 (or (= lt!118823 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!118822 (bvsdiv (bvmul lt!118823 lt!118822) lt!118823)))))

(assert (=> d!23372 (= lt!118822 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23372 (= lt!118823 ((_ sign_extend 32) (size!1400 (buf!1781 thiss!1379))))))

(assert (=> d!23372 (= lt!118824 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3507 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3502 thiss!1379))))))

(assert (=> d!23372 (invariant!0 (currentBit!3502 thiss!1379) (currentByte!3507 thiss!1379) (size!1400 (buf!1781 thiss!1379)))))

(assert (=> d!23372 (= (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)) lt!118824)))

(declare-fun b!73935 () Bool)

(declare-fun res!61135 () Bool)

(assert (=> b!73935 (=> (not res!61135) (not e!48316))))

(assert (=> b!73935 (= res!61135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118824))))

(declare-fun b!73936 () Bool)

(declare-fun lt!118825 () (_ BitVec 64))

(assert (=> b!73936 (= e!48316 (bvsle lt!118824 (bvmul lt!118825 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!73936 (or (= lt!118825 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!118825 #b0000000000000000000000000000000000000000000000000000000000001000) lt!118825)))))

(assert (=> b!73936 (= lt!118825 ((_ sign_extend 32) (size!1400 (buf!1781 thiss!1379))))))

(assert (= (and d!23372 res!61136) b!73935))

(assert (= (and b!73935 res!61135) b!73936))

(assert (=> d!23372 m!118421))

(declare-fun m!118555 () Bool)

(assert (=> d!23372 m!118555))

(assert (=> b!73614 d!23372))

(declare-fun d!23376 () Bool)

(assert (=> d!23376 (= (bitAt!0 (buf!1781 (_2!3300 lt!118298)) lt!118295) (not (= (bvand ((_ sign_extend 24) (select (arr!1991 (buf!1781 (_2!3300 lt!118298))) ((_ extract 31 0) (bvsdiv lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5613 () Bool)

(assert (= bs!5613 d!23376))

(declare-fun m!118557 () Bool)

(assert (=> bs!5613 m!118557))

(assert (=> bs!5613 m!118519))

(assert (=> b!73625 d!23376))

(declare-fun d!23378 () Bool)

(assert (=> d!23378 (= (array_inv!1249 srcBuffer!2) (bvsge (size!1400 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14112 d!23378))

(declare-fun d!23380 () Bool)

(assert (=> d!23380 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3502 thiss!1379) (currentByte!3507 thiss!1379) (size!1400 (buf!1781 thiss!1379))))))

(declare-fun bs!5614 () Bool)

(assert (= bs!5614 d!23380))

(assert (=> bs!5614 m!118555))

(assert (=> start!14112 d!23380))

(declare-fun d!23382 () Bool)

(assert (=> d!23382 (= (bitAt!0 (buf!1781 (_1!3301 lt!118293)) lt!118295) (not (= (bvand ((_ sign_extend 24) (select (arr!1991 (buf!1781 (_1!3301 lt!118293))) ((_ extract 31 0) (bvsdiv lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5615 () Bool)

(assert (= bs!5615 d!23382))

(declare-fun m!118559 () Bool)

(assert (=> bs!5615 m!118559))

(assert (=> bs!5615 m!118519))

(assert (=> b!73612 d!23382))

(declare-fun d!23384 () Bool)

(assert (=> d!23384 (= (bitAt!0 (buf!1781 (_1!3301 lt!118307)) lt!118295) (not (= (bvand ((_ sign_extend 24) (select (arr!1991 (buf!1781 (_1!3301 lt!118307))) ((_ extract 31 0) (bvsdiv lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118295 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5616 () Bool)

(assert (= bs!5616 d!23384))

(declare-fun m!118561 () Bool)

(assert (=> bs!5616 m!118561))

(assert (=> bs!5616 m!118519))

(assert (=> b!73612 d!23384))

(declare-fun d!23386 () Bool)

(assert (=> d!23386 (= (tail!369 lt!118304) (t!1515 lt!118304))))

(assert (=> b!73623 d!23386))

(declare-fun d!23388 () Bool)

(declare-fun e!48327 () Bool)

(assert (=> d!23388 e!48327))

(declare-fun res!61153 () Bool)

(assert (=> d!23388 (=> (not res!61153) (not e!48327))))

(declare-fun lt!118846 () (_ BitVec 64))

(assert (=> d!23388 (= res!61153 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!118846) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23388 (= lt!118846 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!118845 () Unit!4853)

(declare-fun choose!42 (BitStream!2380 BitStream!2380 BitStream!2380 BitStream!2380 (_ BitVec 64) List!765) Unit!4853)

(assert (=> d!23388 (= lt!118845 (choose!42 (_2!3300 lt!118302) (_2!3300 lt!118302) (_1!3301 lt!118307) (_1!3301 lt!118293) (bvsub to!314 i!635) lt!118304))))

(assert (=> d!23388 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23388 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3300 lt!118302) (_2!3300 lt!118302) (_1!3301 lt!118307) (_1!3301 lt!118293) (bvsub to!314 i!635) lt!118304) lt!118845)))

(declare-fun b!73953 () Bool)

(assert (=> b!73953 (= e!48327 (= (bitStreamReadBitsIntoList!0 (_2!3300 lt!118302) (_1!3301 lt!118293) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!369 lt!118304)))))

(assert (= (and d!23388 res!61153) b!73953))

(declare-fun m!118597 () Bool)

(assert (=> d!23388 m!118597))

(declare-fun m!118599 () Bool)

(assert (=> b!73953 m!118599))

(assert (=> b!73953 m!118039))

(assert (=> b!73623 d!23388))

(declare-fun d!23400 () Bool)

(declare-fun size!1405 (List!765) Int)

(assert (=> d!23400 (= (length!393 lt!118304) (size!1405 lt!118304))))

(declare-fun bs!5619 () Bool)

(assert (= bs!5619 d!23400))

(declare-fun m!118601 () Bool)

(assert (=> bs!5619 m!118601))

(assert (=> b!73613 d!23400))

(declare-fun d!23402 () Bool)

(declare-fun e!48328 () Bool)

(assert (=> d!23402 e!48328))

(declare-fun res!61155 () Bool)

(assert (=> d!23402 (=> (not res!61155) (not e!48328))))

(declare-fun lt!118848 () (_ BitVec 64))

(declare-fun lt!118847 () (_ BitVec 64))

(declare-fun lt!118851 () (_ BitVec 64))

(assert (=> d!23402 (= res!61155 (= lt!118851 (bvsub lt!118848 lt!118847)))))

(assert (=> d!23402 (or (= (bvand lt!118848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118848 lt!118847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23402 (= lt!118847 (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298)))))))

(declare-fun lt!118850 () (_ BitVec 64))

(declare-fun lt!118849 () (_ BitVec 64))

(assert (=> d!23402 (= lt!118848 (bvmul lt!118850 lt!118849))))

(assert (=> d!23402 (or (= lt!118850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!118849 (bvsdiv (bvmul lt!118850 lt!118849) lt!118850)))))

(assert (=> d!23402 (= lt!118849 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23402 (= lt!118850 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))))))

(assert (=> d!23402 (= lt!118851 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298)))))))

(assert (=> d!23402 (invariant!0 (currentBit!3502 (_2!3300 lt!118298)) (currentByte!3507 (_2!3300 lt!118298)) (size!1400 (buf!1781 (_2!3300 lt!118298))))))

(assert (=> d!23402 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))) lt!118851)))

(declare-fun b!73954 () Bool)

(declare-fun res!61154 () Bool)

(assert (=> b!73954 (=> (not res!61154) (not e!48328))))

(assert (=> b!73954 (= res!61154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118851))))

(declare-fun b!73955 () Bool)

(declare-fun lt!118852 () (_ BitVec 64))

(assert (=> b!73955 (= e!48328 (bvsle lt!118851 (bvmul lt!118852 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!73955 (or (= lt!118852 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!118852 #b0000000000000000000000000000000000000000000000000000000000001000) lt!118852)))))

(assert (=> b!73955 (= lt!118852 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))))))

(assert (= (and d!23402 res!61155) b!73954))

(assert (= (and b!73954 res!61154) b!73955))

(declare-fun m!118603 () Bool)

(assert (=> d!23402 m!118603))

(assert (=> d!23402 m!118037))

(assert (=> b!73622 d!23402))

(declare-fun d!23404 () Bool)

(declare-fun res!61156 () Bool)

(declare-fun e!48330 () Bool)

(assert (=> d!23404 (=> (not res!61156) (not e!48330))))

(assert (=> d!23404 (= res!61156 (= (size!1400 (buf!1781 thiss!1379)) (size!1400 (buf!1781 (_2!3300 lt!118298)))))))

(assert (=> d!23404 (= (isPrefixOf!0 thiss!1379 (_2!3300 lt!118298)) e!48330)))

(declare-fun b!73956 () Bool)

(declare-fun res!61157 () Bool)

(assert (=> b!73956 (=> (not res!61157) (not e!48330))))

(assert (=> b!73956 (= res!61157 (bvsle (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)) (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298)))))))

(declare-fun b!73957 () Bool)

(declare-fun e!48329 () Bool)

(assert (=> b!73957 (= e!48330 e!48329)))

(declare-fun res!61158 () Bool)

(assert (=> b!73957 (=> res!61158 e!48329)))

(assert (=> b!73957 (= res!61158 (= (size!1400 (buf!1781 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!73958 () Bool)

(assert (=> b!73958 (= e!48329 (arrayBitRangesEq!0 (buf!1781 thiss!1379) (buf!1781 (_2!3300 lt!118298)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379))))))

(assert (= (and d!23404 res!61156) b!73956))

(assert (= (and b!73956 res!61157) b!73957))

(assert (= (and b!73957 (not res!61158)) b!73958))

(assert (=> b!73956 m!118067))

(assert (=> b!73956 m!118061))

(assert (=> b!73958 m!118067))

(assert (=> b!73958 m!118067))

(declare-fun m!118605 () Bool)

(assert (=> b!73958 m!118605))

(assert (=> b!73620 d!23404))

(declare-fun d!23406 () Bool)

(assert (=> d!23406 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!118297) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298)))) lt!118297))))

(declare-fun bs!5620 () Bool)

(assert (= bs!5620 d!23406))

(assert (=> bs!5620 m!118603))

(assert (=> b!73620 d!23406))

(declare-fun d!23408 () Bool)

(declare-fun e!48333 () Bool)

(assert (=> d!23408 e!48333))

(declare-fun res!61161 () Bool)

(assert (=> d!23408 (=> (not res!61161) (not e!48333))))

(assert (=> d!23408 (= res!61161 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!118855 () Unit!4853)

(declare-fun choose!27 (BitStream!2380 BitStream!2380 (_ BitVec 64) (_ BitVec 64)) Unit!4853)

(assert (=> d!23408 (= lt!118855 (choose!27 thiss!1379 (_2!3300 lt!118298) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!23408 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!23408 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3300 lt!118298) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!118855)))

(declare-fun b!73961 () Bool)

(assert (=> b!73961 (= e!48333 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23408 res!61161) b!73961))

(declare-fun m!118607 () Bool)

(assert (=> d!23408 m!118607))

(declare-fun m!118609 () Bool)

(assert (=> b!73961 m!118609))

(assert (=> b!73620 d!23408))

(declare-fun b!73979 () Bool)

(declare-fun res!61178 () Bool)

(declare-fun e!48342 () Bool)

(assert (=> b!73979 (=> (not res!61178) (not e!48342))))

(declare-fun lt!118887 () (_ BitVec 64))

(declare-fun lt!118883 () tuple2!6372)

(declare-fun lt!118881 () (_ BitVec 64))

(assert (=> b!73979 (= res!61178 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118883))) (currentByte!3507 (_2!3300 lt!118883)) (currentBit!3502 (_2!3300 lt!118883))) (bvadd lt!118881 lt!118887)))))

(assert (=> b!73979 (or (not (= (bvand lt!118881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118887 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!118881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!118881 lt!118887) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73979 (= lt!118887 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!73979 (= lt!118881 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(declare-fun b!73980 () Bool)

(declare-fun e!48345 () Bool)

(assert (=> b!73980 (= e!48342 e!48345)))

(declare-fun res!61181 () Bool)

(assert (=> b!73980 (=> (not res!61181) (not e!48345))))

(declare-fun lt!118880 () (_ BitVec 8))

(declare-fun lt!118882 () tuple2!6376)

(assert (=> b!73980 (= res!61181 (and (= (_2!3302 lt!118882) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!118880)) #b00000000000000000000000000000000))) (= (_1!3302 lt!118882) (_2!3300 lt!118883))))))

(declare-datatypes ((tuple2!6398 0))(
  ( (tuple2!6399 (_1!3313 array!2995) (_2!3313 BitStream!2380)) )
))
(declare-fun lt!118891 () tuple2!6398)

(declare-fun lt!118886 () BitStream!2380)

(declare-fun readBits!0 (BitStream!2380 (_ BitVec 64)) tuple2!6398)

(assert (=> b!73980 (= lt!118891 (readBits!0 lt!118886 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73980 (= lt!118882 (readBitPure!0 lt!118886))))

(declare-fun readerFrom!0 (BitStream!2380 (_ BitVec 32) (_ BitVec 32)) BitStream!2380)

(assert (=> b!73980 (= lt!118886 (readerFrom!0 (_2!3300 lt!118883) (currentBit!3502 thiss!1379) (currentByte!3507 thiss!1379)))))

(declare-fun b!73981 () Bool)

(assert (=> b!73981 (= e!48345 (= (bitIndex!0 (size!1400 (buf!1781 (_1!3302 lt!118882))) (currentByte!3507 (_1!3302 lt!118882)) (currentBit!3502 (_1!3302 lt!118882))) (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118883))) (currentByte!3507 (_2!3300 lt!118883)) (currentBit!3502 (_2!3300 lt!118883)))))))

(declare-fun b!73982 () Bool)

(declare-fun res!61184 () Bool)

(declare-fun e!48344 () Bool)

(assert (=> b!73982 (=> (not res!61184) (not e!48344))))

(declare-fun lt!118889 () tuple2!6372)

(assert (=> b!73982 (= res!61184 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118889)))))

(declare-fun b!73984 () Bool)

(declare-fun res!61180 () Bool)

(assert (=> b!73984 (=> (not res!61180) (not e!48344))))

(assert (=> b!73984 (= res!61180 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118889))) (currentByte!3507 (_2!3300 lt!118889)) (currentBit!3502 (_2!3300 lt!118889))) (bvadd (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!73985 () Bool)

(declare-fun e!48343 () Bool)

(declare-fun lt!118888 () tuple2!6376)

(assert (=> b!73985 (= e!48343 (= (bitIndex!0 (size!1400 (buf!1781 (_1!3302 lt!118888))) (currentByte!3507 (_1!3302 lt!118888)) (currentBit!3502 (_1!3302 lt!118888))) (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118889))) (currentByte!3507 (_2!3300 lt!118889)) (currentBit!3502 (_2!3300 lt!118889)))))))

(declare-fun b!73986 () Bool)

(declare-fun res!61183 () Bool)

(assert (=> b!73986 (=> (not res!61183) (not e!48342))))

(assert (=> b!73986 (= res!61183 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118883)))))

(declare-fun b!73983 () Bool)

(assert (=> b!73983 (= e!48344 e!48343)))

(declare-fun res!61185 () Bool)

(assert (=> b!73983 (=> (not res!61185) (not e!48343))))

(declare-fun lt!118885 () Bool)

(assert (=> b!73983 (= res!61185 (and (= (_2!3302 lt!118888) lt!118885) (= (_1!3302 lt!118888) (_2!3300 lt!118889))))))

(assert (=> b!73983 (= lt!118888 (readBitPure!0 (readerFrom!0 (_2!3300 lt!118889) (currentBit!3502 thiss!1379) (currentByte!3507 thiss!1379))))))

(declare-fun d!23410 () Bool)

(assert (=> d!23410 e!48342))

(declare-fun res!61182 () Bool)

(assert (=> d!23410 (=> (not res!61182) (not e!48342))))

(assert (=> d!23410 (= res!61182 (= (size!1400 (buf!1781 (_2!3300 lt!118883))) (size!1400 (buf!1781 thiss!1379))))))

(declare-fun lt!118890 () array!2995)

(assert (=> d!23410 (= lt!118880 (select (arr!1991 lt!118890) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!23410 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1400 lt!118890)))))

(assert (=> d!23410 (= lt!118890 (array!2996 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!118884 () tuple2!6372)

(assert (=> d!23410 (= lt!118883 (tuple2!6373 (_1!3300 lt!118884) (_2!3300 lt!118884)))))

(assert (=> d!23410 (= lt!118884 lt!118889)))

(assert (=> d!23410 e!48344))

(declare-fun res!61179 () Bool)

(assert (=> d!23410 (=> (not res!61179) (not e!48344))))

(assert (=> d!23410 (= res!61179 (= (size!1400 (buf!1781 thiss!1379)) (size!1400 (buf!1781 (_2!3300 lt!118889)))))))

(declare-fun appendBit!0 (BitStream!2380 Bool) tuple2!6372)

(assert (=> d!23410 (= lt!118889 (appendBit!0 thiss!1379 lt!118885))))

(assert (=> d!23410 (= lt!118885 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!23410 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!23410 (= (appendBitFromByte!0 thiss!1379 (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!118883)))

(assert (= (and d!23410 res!61179) b!73984))

(assert (= (and b!73984 res!61180) b!73982))

(assert (= (and b!73982 res!61184) b!73983))

(assert (= (and b!73983 res!61185) b!73985))

(assert (= (and d!23410 res!61182) b!73979))

(assert (= (and b!73979 res!61178) b!73986))

(assert (= (and b!73986 res!61183) b!73980))

(assert (= (and b!73980 res!61181) b!73981))

(declare-fun m!118611 () Bool)

(assert (=> d!23410 m!118611))

(declare-fun m!118613 () Bool)

(assert (=> d!23410 m!118613))

(assert (=> d!23410 m!118417))

(declare-fun m!118615 () Bool)

(assert (=> b!73986 m!118615))

(declare-fun m!118617 () Bool)

(assert (=> b!73979 m!118617))

(assert (=> b!73979 m!118067))

(declare-fun m!118619 () Bool)

(assert (=> b!73981 m!118619))

(assert (=> b!73981 m!118617))

(declare-fun m!118621 () Bool)

(assert (=> b!73983 m!118621))

(assert (=> b!73983 m!118621))

(declare-fun m!118623 () Bool)

(assert (=> b!73983 m!118623))

(declare-fun m!118625 () Bool)

(assert (=> b!73985 m!118625))

(declare-fun m!118627 () Bool)

(assert (=> b!73985 m!118627))

(assert (=> b!73984 m!118627))

(assert (=> b!73984 m!118067))

(declare-fun m!118629 () Bool)

(assert (=> b!73982 m!118629))

(declare-fun m!118631 () Bool)

(assert (=> b!73980 m!118631))

(declare-fun m!118633 () Bool)

(assert (=> b!73980 m!118633))

(declare-fun m!118635 () Bool)

(assert (=> b!73980 m!118635))

(assert (=> b!73620 d!23410))

(declare-fun d!23412 () Bool)

(assert (=> d!23412 (= (invariant!0 (currentBit!3502 (_2!3300 lt!118302)) (currentByte!3507 (_2!3300 lt!118302)) (size!1400 (buf!1781 (_2!3300 lt!118302)))) (and (bvsge (currentBit!3502 (_2!3300 lt!118302)) #b00000000000000000000000000000000) (bvslt (currentBit!3502 (_2!3300 lt!118302)) #b00000000000000000000000000001000) (bvsge (currentByte!3507 (_2!3300 lt!118302)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3507 (_2!3300 lt!118302)) (size!1400 (buf!1781 (_2!3300 lt!118302)))) (and (= (currentBit!3502 (_2!3300 lt!118302)) #b00000000000000000000000000000000) (= (currentByte!3507 (_2!3300 lt!118302)) (size!1400 (buf!1781 (_2!3300 lt!118302))))))))))

(assert (=> b!73610 d!23412))

(declare-fun d!23414 () Bool)

(assert (=> d!23414 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118302))))

(declare-fun lt!118894 () Unit!4853)

(declare-fun choose!30 (BitStream!2380 BitStream!2380 BitStream!2380) Unit!4853)

(assert (=> d!23414 (= lt!118894 (choose!30 thiss!1379 (_2!3300 lt!118298) (_2!3300 lt!118302)))))

(assert (=> d!23414 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118298))))

(assert (=> d!23414 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3300 lt!118298) (_2!3300 lt!118302)) lt!118894)))

(declare-fun bs!5621 () Bool)

(assert (= bs!5621 d!23414))

(assert (=> bs!5621 m!118053))

(declare-fun m!118637 () Bool)

(assert (=> bs!5621 m!118637))

(assert (=> bs!5621 m!118031))

(assert (=> b!73621 d!23414))

(declare-fun d!23416 () Bool)

(assert (=> d!23416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5622 () Bool)

(assert (= bs!5622 d!23416))

(declare-fun m!118639 () Bool)

(assert (=> bs!5622 m!118639))

(assert (=> b!73621 d!23416))

(declare-fun d!23418 () Bool)

(assert (=> d!23418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 thiss!1379)) ((_ sign_extend 32) (currentBit!3502 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!118895 () Unit!4853)

(assert (=> d!23418 (= lt!118895 (choose!9 thiss!1379 (buf!1781 (_2!3300 lt!118298)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2381 (buf!1781 (_2!3300 lt!118298)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379))))))

(assert (=> d!23418 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1781 (_2!3300 lt!118298)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!118895)))

(declare-fun bs!5623 () Bool)

(assert (= bs!5623 d!23418))

(assert (=> bs!5623 m!118049))

(declare-fun m!118641 () Bool)

(assert (=> bs!5623 m!118641))

(assert (=> b!73621 d!23418))

(declare-fun d!23420 () Bool)

(declare-fun res!61186 () Bool)

(declare-fun e!48347 () Bool)

(assert (=> d!23420 (=> (not res!61186) (not e!48347))))

(assert (=> d!23420 (= res!61186 (= (size!1400 (buf!1781 (_2!3300 lt!118298))) (size!1400 (buf!1781 (_2!3300 lt!118302)))))))

(assert (=> d!23420 (= (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!118302)) e!48347)))

(declare-fun b!73987 () Bool)

(declare-fun res!61187 () Bool)

(assert (=> b!73987 (=> (not res!61187) (not e!48347))))

(assert (=> b!73987 (= res!61187 (bvsle (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))) (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118302))) (currentByte!3507 (_2!3300 lt!118302)) (currentBit!3502 (_2!3300 lt!118302)))))))

(declare-fun b!73988 () Bool)

(declare-fun e!48346 () Bool)

(assert (=> b!73988 (= e!48347 e!48346)))

(declare-fun res!61188 () Bool)

(assert (=> b!73988 (=> res!61188 e!48346)))

(assert (=> b!73988 (= res!61188 (= (size!1400 (buf!1781 (_2!3300 lt!118298))) #b00000000000000000000000000000000))))

(declare-fun b!73989 () Bool)

(assert (=> b!73989 (= e!48346 (arrayBitRangesEq!0 (buf!1781 (_2!3300 lt!118298)) (buf!1781 (_2!3300 lt!118302)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298)))))))

(assert (= (and d!23420 res!61186) b!73987))

(assert (= (and b!73987 res!61187) b!73988))

(assert (= (and b!73988 (not res!61188)) b!73989))

(assert (=> b!73987 m!118061))

(assert (=> b!73987 m!118109))

(assert (=> b!73989 m!118061))

(assert (=> b!73989 m!118061))

(declare-fun m!118643 () Bool)

(assert (=> b!73989 m!118643))

(assert (=> b!73621 d!23420))

(declare-fun b!74094 () Bool)

(declare-fun res!61251 () Bool)

(declare-fun e!48398 () Bool)

(assert (=> b!74094 (=> (not res!61251) (not e!48398))))

(declare-fun lt!119292 () tuple2!6372)

(assert (=> b!74094 (= res!61251 (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!119292)))))

(declare-fun b!74095 () Bool)

(declare-fun e!48400 () tuple2!6372)

(declare-fun lt!119274 () tuple2!6372)

(declare-fun Unit!4872 () Unit!4853)

(assert (=> b!74095 (= e!48400 (tuple2!6373 Unit!4872 (_2!3300 lt!119274)))))

(declare-fun lt!119264 () tuple2!6372)

(assert (=> b!74095 (= lt!119264 (appendBitFromByte!0 (_2!3300 lt!118298) (select (arr!1991 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!119288 () (_ BitVec 64))

(assert (=> b!74095 (= lt!119288 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119286 () (_ BitVec 64))

(assert (=> b!74095 (= lt!119286 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119266 () Unit!4853)

(assert (=> b!74095 (= lt!119266 (validateOffsetBitsIneqLemma!0 (_2!3300 lt!118298) (_2!3300 lt!119264) lt!119288 lt!119286))))

(assert (=> b!74095 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!119264)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!119264))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!119264))) (bvsub lt!119288 lt!119286))))

(declare-fun lt!119293 () Unit!4853)

(assert (=> b!74095 (= lt!119293 lt!119266)))

(declare-fun lt!119265 () tuple2!6374)

(assert (=> b!74095 (= lt!119265 (reader!0 (_2!3300 lt!118298) (_2!3300 lt!119264)))))

(declare-fun lt!119261 () (_ BitVec 64))

(assert (=> b!74095 (= lt!119261 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119295 () Unit!4853)

(assert (=> b!74095 (= lt!119295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3300 lt!118298) (buf!1781 (_2!3300 lt!119264)) lt!119261))))

(assert (=> b!74095 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!119264)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!119261)))

(declare-fun lt!119260 () Unit!4853)

(assert (=> b!74095 (= lt!119260 lt!119295)))

(assert (=> b!74095 (= (head!584 (byteArrayBitContentToList!0 (_2!3300 lt!119264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!584 (bitStreamReadBitsIntoList!0 (_2!3300 lt!119264) (_1!3301 lt!119265) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119262 () Unit!4853)

(declare-fun Unit!4876 () Unit!4853)

(assert (=> b!74095 (= lt!119262 Unit!4876)))

(assert (=> b!74095 (= lt!119274 (appendBitsMSBFirstLoop!0 (_2!3300 lt!119264) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!119280 () Unit!4853)

(assert (=> b!74095 (= lt!119280 (lemmaIsPrefixTransitive!0 (_2!3300 lt!118298) (_2!3300 lt!119264) (_2!3300 lt!119274)))))

(assert (=> b!74095 (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!119274))))

(declare-fun lt!119284 () Unit!4853)

(assert (=> b!74095 (= lt!119284 lt!119280)))

(assert (=> b!74095 (= (size!1400 (buf!1781 (_2!3300 lt!119274))) (size!1400 (buf!1781 (_2!3300 lt!118298))))))

(declare-fun lt!119291 () Unit!4853)

(declare-fun Unit!4878 () Unit!4853)

(assert (=> b!74095 (= lt!119291 Unit!4878)))

(assert (=> b!74095 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!119274))) (currentByte!3507 (_2!3300 lt!119274)) (currentBit!3502 (_2!3300 lt!119274))) (bvsub (bvadd (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119279 () Unit!4853)

(declare-fun Unit!4879 () Unit!4853)

(assert (=> b!74095 (= lt!119279 Unit!4879)))

(assert (=> b!74095 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!119274))) (currentByte!3507 (_2!3300 lt!119274)) (currentBit!3502 (_2!3300 lt!119274))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!119264))) (currentByte!3507 (_2!3300 lt!119264)) (currentBit!3502 (_2!3300 lt!119264))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!119301 () Unit!4853)

(declare-fun Unit!4880 () Unit!4853)

(assert (=> b!74095 (= lt!119301 Unit!4880)))

(declare-fun lt!119294 () tuple2!6374)

(declare-fun call!940 () tuple2!6374)

(assert (=> b!74095 (= lt!119294 call!940)))

(declare-fun lt!119299 () (_ BitVec 64))

(assert (=> b!74095 (= lt!119299 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119285 () Unit!4853)

(assert (=> b!74095 (= lt!119285 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3300 lt!118298) (buf!1781 (_2!3300 lt!119274)) lt!119299))))

(assert (=> b!74095 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!119274)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!119299)))

(declare-fun lt!119271 () Unit!4853)

(assert (=> b!74095 (= lt!119271 lt!119285)))

(declare-fun lt!119302 () tuple2!6374)

(assert (=> b!74095 (= lt!119302 (reader!0 (_2!3300 lt!119264) (_2!3300 lt!119274)))))

(declare-fun lt!119300 () (_ BitVec 64))

(assert (=> b!74095 (= lt!119300 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!119289 () Unit!4853)

(assert (=> b!74095 (= lt!119289 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3300 lt!119264) (buf!1781 (_2!3300 lt!119274)) lt!119300))))

(assert (=> b!74095 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!119274)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!119264))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!119264))) lt!119300)))

(declare-fun lt!119269 () Unit!4853)

(assert (=> b!74095 (= lt!119269 lt!119289)))

(declare-fun lt!119277 () List!765)

(assert (=> b!74095 (= lt!119277 (byteArrayBitContentToList!0 (_2!3300 lt!119274) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!119281 () List!765)

(assert (=> b!74095 (= lt!119281 (byteArrayBitContentToList!0 (_2!3300 lt!119274) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119287 () List!765)

(assert (=> b!74095 (= lt!119287 (bitStreamReadBitsIntoList!0 (_2!3300 lt!119274) (_1!3301 lt!119294) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!119276 () List!765)

(assert (=> b!74095 (= lt!119276 (bitStreamReadBitsIntoList!0 (_2!3300 lt!119274) (_1!3301 lt!119302) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119263 () (_ BitVec 64))

(assert (=> b!74095 (= lt!119263 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119259 () Unit!4853)

(assert (=> b!74095 (= lt!119259 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3300 lt!119274) (_2!3300 lt!119274) (_1!3301 lt!119294) (_1!3301 lt!119302) lt!119263 lt!119287))))

(assert (=> b!74095 (= (bitStreamReadBitsIntoList!0 (_2!3300 lt!119274) (_1!3301 lt!119302) (bvsub lt!119263 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!369 lt!119287))))

(declare-fun lt!119270 () Unit!4853)

(assert (=> b!74095 (= lt!119270 lt!119259)))

(declare-fun lt!119267 () (_ BitVec 64))

(declare-fun lt!119273 () Unit!4853)

(assert (=> b!74095 (= lt!119273 (arrayBitRangesEqImpliesEq!0 (buf!1781 (_2!3300 lt!119264)) (buf!1781 (_2!3300 lt!119274)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!119267 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!119264))) (currentByte!3507 (_2!3300 lt!119264)) (currentBit!3502 (_2!3300 lt!119264)))))))

(assert (=> b!74095 (= (bitAt!0 (buf!1781 (_2!3300 lt!119264)) lt!119267) (bitAt!0 (buf!1781 (_2!3300 lt!119274)) lt!119267))))

(declare-fun lt!119296 () Unit!4853)

(assert (=> b!74095 (= lt!119296 lt!119273)))

(declare-fun d!23422 () Bool)

(assert (=> d!23422 e!48398))

(declare-fun res!61247 () Bool)

(assert (=> d!23422 (=> (not res!61247) (not e!48398))))

(declare-fun lt!119275 () (_ BitVec 64))

(assert (=> d!23422 (= res!61247 (= (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!119292))) (currentByte!3507 (_2!3300 lt!119292)) (currentBit!3502 (_2!3300 lt!119292))) (bvsub lt!119275 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!23422 (or (= (bvand lt!119275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119275 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!119268 () (_ BitVec 64))

(assert (=> d!23422 (= lt!119275 (bvadd lt!119268 to!314))))

(assert (=> d!23422 (or (not (= (bvand lt!119268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119268 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23422 (= lt!119268 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(assert (=> d!23422 (= lt!119292 e!48400)))

(declare-fun c!5457 () Bool)

(assert (=> d!23422 (= c!5457 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!119297 () Unit!4853)

(declare-fun lt!119282 () Unit!4853)

(assert (=> d!23422 (= lt!119297 lt!119282)))

(assert (=> d!23422 (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!118298))))

(assert (=> d!23422 (= lt!119282 (lemmaIsPrefixRefl!0 (_2!3300 lt!118298)))))

(assert (=> d!23422 (= lt!119267 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(assert (=> d!23422 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23422 (= (appendBitsMSBFirstLoop!0 (_2!3300 lt!118298) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!119292)))

(declare-fun bm!937 () Bool)

(assert (=> bm!937 (= call!940 (reader!0 (_2!3300 lt!118298) (ite c!5457 (_2!3300 lt!119274) (_2!3300 lt!118298))))))

(declare-fun b!74096 () Bool)

(declare-fun lt!119278 () tuple2!6374)

(assert (=> b!74096 (= e!48398 (= (bitStreamReadBitsIntoList!0 (_2!3300 lt!119292) (_1!3301 lt!119278) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3300 lt!119292) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!74096 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74096 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!119290 () Unit!4853)

(declare-fun lt!119298 () Unit!4853)

(assert (=> b!74096 (= lt!119290 lt!119298)))

(declare-fun lt!119283 () (_ BitVec 64))

(assert (=> b!74096 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!119292)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!119283)))

(assert (=> b!74096 (= lt!119298 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3300 lt!118298) (buf!1781 (_2!3300 lt!119292)) lt!119283))))

(declare-fun e!48399 () Bool)

(assert (=> b!74096 e!48399))

(declare-fun res!61248 () Bool)

(assert (=> b!74096 (=> (not res!61248) (not e!48399))))

(assert (=> b!74096 (= res!61248 (and (= (size!1400 (buf!1781 (_2!3300 lt!118298))) (size!1400 (buf!1781 (_2!3300 lt!119292)))) (bvsge lt!119283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74096 (= lt!119283 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!74096 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74096 (= lt!119278 (reader!0 (_2!3300 lt!118298) (_2!3300 lt!119292)))))

(declare-fun b!74097 () Bool)

(assert (=> b!74097 (= e!48399 (validate_offset_bits!1 ((_ sign_extend 32) (size!1400 (buf!1781 (_2!3300 lt!118298)))) ((_ sign_extend 32) (currentByte!3507 (_2!3300 lt!118298))) ((_ sign_extend 32) (currentBit!3502 (_2!3300 lt!118298))) lt!119283))))

(declare-fun b!74098 () Bool)

(declare-fun res!61249 () Bool)

(assert (=> b!74098 (=> (not res!61249) (not e!48398))))

(assert (=> b!74098 (= res!61249 (= (size!1400 (buf!1781 (_2!3300 lt!119292))) (size!1400 (buf!1781 (_2!3300 lt!118298)))))))

(declare-fun b!74099 () Bool)

(declare-fun res!61252 () Bool)

(assert (=> b!74099 (=> (not res!61252) (not e!48398))))

(assert (=> b!74099 (= res!61252 (invariant!0 (currentBit!3502 (_2!3300 lt!119292)) (currentByte!3507 (_2!3300 lt!119292)) (size!1400 (buf!1781 (_2!3300 lt!119292)))))))

(declare-fun b!74100 () Bool)

(declare-fun Unit!4883 () Unit!4853)

(assert (=> b!74100 (= e!48400 (tuple2!6373 Unit!4883 (_2!3300 lt!118298)))))

(assert (=> b!74100 (= (size!1400 (buf!1781 (_2!3300 lt!118298))) (size!1400 (buf!1781 (_2!3300 lt!118298))))))

(declare-fun lt!119272 () Unit!4853)

(declare-fun Unit!4884 () Unit!4853)

(assert (=> b!74100 (= lt!119272 Unit!4884)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2380 array!2995 array!2995 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74100 (checkByteArrayBitContent!0 (_2!3300 lt!118298) srcBuffer!2 (_1!3313 (readBits!0 (_1!3301 call!940) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!74101 () Bool)

(declare-fun res!61250 () Bool)

(assert (=> b!74101 (=> (not res!61250) (not e!48398))))

(assert (=> b!74101 (= res!61250 (= (size!1400 (buf!1781 (_2!3300 lt!118298))) (size!1400 (buf!1781 (_2!3300 lt!119292)))))))

(assert (= (and d!23422 c!5457) b!74095))

(assert (= (and d!23422 (not c!5457)) b!74100))

(assert (= (or b!74095 b!74100) bm!937))

(assert (= (and d!23422 res!61247) b!74099))

(assert (= (and b!74099 res!61252) b!74101))

(assert (= (and b!74101 res!61250) b!74094))

(assert (= (and b!74094 res!61251) b!74098))

(assert (= (and b!74098 res!61249) b!74096))

(assert (= (and b!74096 res!61248) b!74097))

(declare-fun m!118851 () Bool)

(assert (=> b!74100 m!118851))

(declare-fun m!118853 () Bool)

(assert (=> b!74100 m!118853))

(declare-fun m!118855 () Bool)

(assert (=> b!74097 m!118855))

(declare-fun m!118857 () Bool)

(assert (=> d!23422 m!118857))

(assert (=> d!23422 m!118061))

(assert (=> d!23422 m!118463))

(assert (=> d!23422 m!118465))

(declare-fun m!118859 () Bool)

(assert (=> b!74096 m!118859))

(declare-fun m!118861 () Bool)

(assert (=> b!74096 m!118861))

(declare-fun m!118863 () Bool)

(assert (=> b!74096 m!118863))

(declare-fun m!118865 () Bool)

(assert (=> b!74096 m!118865))

(declare-fun m!118867 () Bool)

(assert (=> b!74096 m!118867))

(declare-fun m!118869 () Bool)

(assert (=> bm!937 m!118869))

(declare-fun m!118871 () Bool)

(assert (=> b!74099 m!118871))

(declare-fun m!118873 () Bool)

(assert (=> b!74094 m!118873))

(assert (=> b!74095 m!118061))

(declare-fun m!118875 () Bool)

(assert (=> b!74095 m!118875))

(declare-fun m!118877 () Bool)

(assert (=> b!74095 m!118877))

(declare-fun m!118879 () Bool)

(assert (=> b!74095 m!118879))

(declare-fun m!118881 () Bool)

(assert (=> b!74095 m!118881))

(declare-fun m!118883 () Bool)

(assert (=> b!74095 m!118883))

(declare-fun m!118885 () Bool)

(assert (=> b!74095 m!118885))

(declare-fun m!118887 () Bool)

(assert (=> b!74095 m!118887))

(declare-fun m!118889 () Bool)

(assert (=> b!74095 m!118889))

(declare-fun m!118891 () Bool)

(assert (=> b!74095 m!118891))

(declare-fun m!118893 () Bool)

(assert (=> b!74095 m!118893))

(assert (=> b!74095 m!118877))

(declare-fun m!118895 () Bool)

(assert (=> b!74095 m!118895))

(declare-fun m!118897 () Bool)

(assert (=> b!74095 m!118897))

(assert (=> b!74095 m!118893))

(declare-fun m!118899 () Bool)

(assert (=> b!74095 m!118899))

(declare-fun m!118901 () Bool)

(assert (=> b!74095 m!118901))

(assert (=> b!74095 m!118879))

(declare-fun m!118903 () Bool)

(assert (=> b!74095 m!118903))

(declare-fun m!118905 () Bool)

(assert (=> b!74095 m!118905))

(declare-fun m!118907 () Bool)

(assert (=> b!74095 m!118907))

(declare-fun m!118909 () Bool)

(assert (=> b!74095 m!118909))

(declare-fun m!118911 () Bool)

(assert (=> b!74095 m!118911))

(declare-fun m!118913 () Bool)

(assert (=> b!74095 m!118913))

(declare-fun m!118915 () Bool)

(assert (=> b!74095 m!118915))

(declare-fun m!118917 () Bool)

(assert (=> b!74095 m!118917))

(declare-fun m!118919 () Bool)

(assert (=> b!74095 m!118919))

(declare-fun m!118921 () Bool)

(assert (=> b!74095 m!118921))

(declare-fun m!118923 () Bool)

(assert (=> b!74095 m!118923))

(declare-fun m!118925 () Bool)

(assert (=> b!74095 m!118925))

(declare-fun m!118927 () Bool)

(assert (=> b!74095 m!118927))

(declare-fun m!118929 () Bool)

(assert (=> b!74095 m!118929))

(declare-fun m!118931 () Bool)

(assert (=> b!74095 m!118931))

(assert (=> b!74095 m!118921))

(declare-fun m!118933 () Bool)

(assert (=> b!74095 m!118933))

(declare-fun m!118935 () Bool)

(assert (=> b!74095 m!118935))

(assert (=> b!73621 d!23422))

(declare-fun d!23492 () Bool)

(declare-fun res!61253 () Bool)

(declare-fun e!48402 () Bool)

(assert (=> d!23492 (=> (not res!61253) (not e!48402))))

(assert (=> d!23492 (= res!61253 (= (size!1400 (buf!1781 thiss!1379)) (size!1400 (buf!1781 (_2!3300 lt!118302)))))))

(assert (=> d!23492 (= (isPrefixOf!0 thiss!1379 (_2!3300 lt!118302)) e!48402)))

(declare-fun b!74102 () Bool)

(declare-fun res!61254 () Bool)

(assert (=> b!74102 (=> (not res!61254) (not e!48402))))

(assert (=> b!74102 (= res!61254 (bvsle (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)) (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118302))) (currentByte!3507 (_2!3300 lt!118302)) (currentBit!3502 (_2!3300 lt!118302)))))))

(declare-fun b!74103 () Bool)

(declare-fun e!48401 () Bool)

(assert (=> b!74103 (= e!48402 e!48401)))

(declare-fun res!61255 () Bool)

(assert (=> b!74103 (=> res!61255 e!48401)))

(assert (=> b!74103 (= res!61255 (= (size!1400 (buf!1781 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74104 () Bool)

(assert (=> b!74104 (= e!48401 (arrayBitRangesEq!0 (buf!1781 thiss!1379) (buf!1781 (_2!3300 lt!118302)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379))))))

(assert (= (and d!23492 res!61253) b!74102))

(assert (= (and b!74102 res!61254) b!74103))

(assert (= (and b!74103 (not res!61255)) b!74104))

(assert (=> b!74102 m!118067))

(assert (=> b!74102 m!118109))

(assert (=> b!74104 m!118067))

(assert (=> b!74104 m!118067))

(declare-fun m!118937 () Bool)

(assert (=> b!74104 m!118937))

(assert (=> b!73621 d!23492))

(declare-fun b!74105 () Bool)

(declare-fun e!48404 () Unit!4853)

(declare-fun lt!119341 () Unit!4853)

(assert (=> b!74105 (= e!48404 lt!119341)))

(declare-fun lt!119353 () (_ BitVec 64))

(assert (=> b!74105 (= lt!119353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119342 () (_ BitVec 64))

(assert (=> b!74105 (= lt!119342 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(assert (=> b!74105 (= lt!119341 (arrayBitRangesEqSymmetric!0 (buf!1781 thiss!1379) (buf!1781 (_2!3300 lt!118298)) lt!119353 lt!119342))))

(assert (=> b!74105 (arrayBitRangesEq!0 (buf!1781 (_2!3300 lt!118298)) (buf!1781 thiss!1379) lt!119353 lt!119342)))

(declare-fun lt!119348 () (_ BitVec 64))

(declare-fun lt!119350 () tuple2!6374)

(declare-fun lt!119347 () (_ BitVec 64))

(declare-fun e!48403 () Bool)

(declare-fun b!74106 () Bool)

(assert (=> b!74106 (= e!48403 (= (_1!3301 lt!119350) (withMovedBitIndex!0 (_2!3301 lt!119350) (bvsub lt!119347 lt!119348))))))

(assert (=> b!74106 (or (= (bvand lt!119347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119347 lt!119348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74106 (= lt!119348 (bitIndex!0 (size!1400 (buf!1781 (_2!3300 lt!118298))) (currentByte!3507 (_2!3300 lt!118298)) (currentBit!3502 (_2!3300 lt!118298))))))

(assert (=> b!74106 (= lt!119347 (bitIndex!0 (size!1400 (buf!1781 thiss!1379)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(declare-fun b!74107 () Bool)

(declare-fun res!61256 () Bool)

(assert (=> b!74107 (=> (not res!61256) (not e!48403))))

(assert (=> b!74107 (= res!61256 (isPrefixOf!0 (_2!3301 lt!119350) (_2!3300 lt!118298)))))

(declare-fun d!23494 () Bool)

(assert (=> d!23494 e!48403))

(declare-fun res!61257 () Bool)

(assert (=> d!23494 (=> (not res!61257) (not e!48403))))

(assert (=> d!23494 (= res!61257 (isPrefixOf!0 (_1!3301 lt!119350) (_2!3301 lt!119350)))))

(declare-fun lt!119344 () BitStream!2380)

(assert (=> d!23494 (= lt!119350 (tuple2!6375 lt!119344 (_2!3300 lt!118298)))))

(declare-fun lt!119358 () Unit!4853)

(declare-fun lt!119343 () Unit!4853)

(assert (=> d!23494 (= lt!119358 lt!119343)))

(assert (=> d!23494 (isPrefixOf!0 lt!119344 (_2!3300 lt!118298))))

(assert (=> d!23494 (= lt!119343 (lemmaIsPrefixTransitive!0 lt!119344 (_2!3300 lt!118298) (_2!3300 lt!118298)))))

(declare-fun lt!119359 () Unit!4853)

(declare-fun lt!119356 () Unit!4853)

(assert (=> d!23494 (= lt!119359 lt!119356)))

(assert (=> d!23494 (isPrefixOf!0 lt!119344 (_2!3300 lt!118298))))

(assert (=> d!23494 (= lt!119356 (lemmaIsPrefixTransitive!0 lt!119344 thiss!1379 (_2!3300 lt!118298)))))

(declare-fun lt!119352 () Unit!4853)

(assert (=> d!23494 (= lt!119352 e!48404)))

(declare-fun c!5458 () Bool)

(assert (=> d!23494 (= c!5458 (not (= (size!1400 (buf!1781 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!119346 () Unit!4853)

(declare-fun lt!119349 () Unit!4853)

(assert (=> d!23494 (= lt!119346 lt!119349)))

(assert (=> d!23494 (isPrefixOf!0 (_2!3300 lt!118298) (_2!3300 lt!118298))))

(assert (=> d!23494 (= lt!119349 (lemmaIsPrefixRefl!0 (_2!3300 lt!118298)))))

(declare-fun lt!119345 () Unit!4853)

(declare-fun lt!119360 () Unit!4853)

(assert (=> d!23494 (= lt!119345 lt!119360)))

(assert (=> d!23494 (= lt!119360 (lemmaIsPrefixRefl!0 (_2!3300 lt!118298)))))

(declare-fun lt!119351 () Unit!4853)

(declare-fun lt!119354 () Unit!4853)

(assert (=> d!23494 (= lt!119351 lt!119354)))

(assert (=> d!23494 (isPrefixOf!0 lt!119344 lt!119344)))

(assert (=> d!23494 (= lt!119354 (lemmaIsPrefixRefl!0 lt!119344))))

(declare-fun lt!119357 () Unit!4853)

(declare-fun lt!119355 () Unit!4853)

(assert (=> d!23494 (= lt!119357 lt!119355)))

(assert (=> d!23494 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23494 (= lt!119355 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23494 (= lt!119344 (BitStream!2381 (buf!1781 (_2!3300 lt!118298)) (currentByte!3507 thiss!1379) (currentBit!3502 thiss!1379)))))

(assert (=> d!23494 (isPrefixOf!0 thiss!1379 (_2!3300 lt!118298))))

(assert (=> d!23494 (= (reader!0 thiss!1379 (_2!3300 lt!118298)) lt!119350)))

(declare-fun b!74108 () Bool)

(declare-fun res!61258 () Bool)

(assert (=> b!74108 (=> (not res!61258) (not e!48403))))

(assert (=> b!74108 (= res!61258 (isPrefixOf!0 (_1!3301 lt!119350) thiss!1379))))

(declare-fun b!74109 () Bool)

(declare-fun Unit!4887 () Unit!4853)

(assert (=> b!74109 (= e!48404 Unit!4887)))

(assert (= (and d!23494 c!5458) b!74105))

(assert (= (and d!23494 (not c!5458)) b!74109))

(assert (= (and d!23494 res!61257) b!74108))

(assert (= (and b!74108 res!61258) b!74107))

(assert (= (and b!74107 res!61256) b!74106))

(assert (=> b!74105 m!118067))

(declare-fun m!118939 () Bool)

(assert (=> b!74105 m!118939))

(declare-fun m!118941 () Bool)

(assert (=> b!74105 m!118941))

(declare-fun m!118943 () Bool)

(assert (=> d!23494 m!118943))

(declare-fun m!118945 () Bool)

(assert (=> d!23494 m!118945))

(declare-fun m!118947 () Bool)

(assert (=> d!23494 m!118947))

(assert (=> d!23494 m!118063))

(assert (=> d!23494 m!118065))

(assert (=> d!23494 m!118465))

(declare-fun m!118949 () Bool)

(assert (=> d!23494 m!118949))

(assert (=> d!23494 m!118031))

(assert (=> d!23494 m!118463))

(declare-fun m!118951 () Bool)

(assert (=> d!23494 m!118951))

(declare-fun m!118953 () Bool)

(assert (=> d!23494 m!118953))

(declare-fun m!118955 () Bool)

(assert (=> b!74107 m!118955))

(declare-fun m!118957 () Bool)

(assert (=> b!74106 m!118957))

(assert (=> b!74106 m!118061))

(assert (=> b!74106 m!118067))

(declare-fun m!118959 () Bool)

(assert (=> b!74108 m!118959))

(assert (=> b!73621 d!23494))

(push 1)

(assert (not b!73857))

(assert (not b!73853))

(assert (not b!73877))

(assert (not b!73851))

(assert (not b!73854))

(assert (not d!23494))

(assert (not b!73924))

(assert (not d!23332))

(assert (not b!73980))

(assert (not b!73888))

(assert (not b!73987))

(assert (not b!73890))

(assert (not b!74108))

(assert (not b!74104))

(assert (not d!23358))

(assert (not d!23356))

(assert (not b!74097))

(assert (not d!23414))

(assert (not b!73984))

(assert (not b!73882))

(assert (not b!73953))

(assert (not b!74106))

(assert (not d!23350))

(assert (not b!73885))

(assert (not b!73884))

(assert (not d!23416))

(assert (not b!73989))

(assert (not b!73986))

(assert (not b!73850))

(assert (not b!73961))

(assert (not d!23320))

(assert (not b!73883))

(assert (not d!23408))

(assert (not d!23362))

(assert (not d!23410))

(assert (not b!73839))

(assert (not b!73958))

(assert (not b!74102))

(assert (not b!73878))

(assert (not d!23352))

(assert (not b!73889))

(assert (not b!73855))

(assert (not d!23388))

(assert (not b!74095))

(assert (not d!23422))

(assert (not b!74105))

(assert (not b!73985))

(assert (not d!23402))

(assert (not d!23418))

(assert (not d!23400))

(assert (not d!23318))

(assert (not b!73983))

(assert (not b!73926))

(assert (not b!73849))

(assert (not b!73880))

(assert (not bm!937))

(assert (not d!23380))

(assert (not d!23340))

(assert (not d!23406))

(assert (not b!73956))

(assert (not b!74096))

(assert (not b!74099))

(assert (not b!74094))

(assert (not d!23368))

(assert (not d!23336))

(assert (not b!73879))

(assert (not b!73982))

(assert (not b!73979))

(assert (not d!23372))

(assert (not b!74100))

(assert (not b!73981))

(assert (not b!74107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

