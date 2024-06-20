; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6884 () Bool)

(assert start!6884)

(declare-fun b!32423 () Bool)

(declare-fun res!27700 () Bool)

(declare-fun e!21427 () Bool)

(assert (=> b!32423 (=> res!27700 e!21427)))

(declare-datatypes ((array!1820 0))(
  ( (array!1821 (arr!1277 (Array (_ BitVec 32) (_ BitVec 8))) (size!802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1396 0))(
  ( (BitStream!1397 (buf!1130 array!1820) (currentByte!2497 (_ BitVec 32)) (currentBit!2492 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1396)

(declare-datatypes ((Unit!2459 0))(
  ( (Unit!2460) )
))
(declare-datatypes ((tuple2!3322 0))(
  ( (tuple2!3323 (_1!1748 Unit!2459) (_2!1748 BitStream!1396)) )
))
(declare-fun lt!48104 () tuple2!3322)

(assert (=> b!32423 (= res!27700 (not (= (size!802 (buf!1130 thiss!1379)) (size!802 (buf!1130 (_2!1748 lt!48104))))))))

(declare-fun b!32424 () Bool)

(declare-fun e!21429 () Bool)

(assert (=> b!32424 (= e!21429 e!21427)))

(declare-fun res!27703 () Bool)

(assert (=> b!32424 (=> res!27703 e!21427)))

(declare-fun lt!48092 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!48098 () (_ BitVec 64))

(assert (=> b!32424 (= res!27703 (not (= lt!48098 (bvsub (bvadd lt!48092 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32424 (= lt!48098 (bitIndex!0 (size!802 (buf!1130 (_2!1748 lt!48104))) (currentByte!2497 (_2!1748 lt!48104)) (currentBit!2492 (_2!1748 lt!48104))))))

(declare-fun b!32425 () Bool)

(declare-fun e!21439 () Bool)

(declare-fun e!21426 () Bool)

(assert (=> b!32425 (= e!21439 e!21426)))

(declare-fun res!27695 () Bool)

(assert (=> b!32425 (=> res!27695 e!21426)))

(declare-datatypes ((tuple2!3324 0))(
  ( (tuple2!3325 (_1!1749 BitStream!1396) (_2!1749 BitStream!1396)) )
))
(declare-fun lt!48106 () tuple2!3324)

(declare-fun lt!48101 () Bool)

(declare-fun bitAt!0 (array!1820 (_ BitVec 64)) Bool)

(assert (=> b!32425 (= res!27695 (not (= lt!48101 (bitAt!0 (buf!1130 (_1!1749 lt!48106)) lt!48092))))))

(declare-fun lt!48088 () tuple2!3324)

(assert (=> b!32425 (= lt!48101 (bitAt!0 (buf!1130 (_1!1749 lt!48088)) lt!48092))))

(declare-fun b!32426 () Bool)

(declare-fun res!27696 () Bool)

(declare-fun e!21428 () Bool)

(assert (=> b!32426 (=> res!27696 e!21428)))

(declare-fun lt!48102 () tuple2!3322)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32426 (= res!27696 (not (invariant!0 (currentBit!2492 (_2!1748 lt!48102)) (currentByte!2497 (_2!1748 lt!48102)) (size!802 (buf!1130 (_2!1748 lt!48104))))))))

(declare-fun b!32427 () Bool)

(declare-fun e!21434 () Bool)

(assert (=> b!32427 (= e!21434 e!21439)))

(declare-fun res!27704 () Bool)

(assert (=> b!32427 (=> res!27704 e!21439)))

(declare-datatypes ((List!399 0))(
  ( (Nil!396) (Cons!395 (h!514 Bool) (t!1149 List!399)) )
))
(declare-fun lt!48087 () List!399)

(declare-fun lt!48094 () List!399)

(assert (=> b!32427 (= res!27704 (not (= lt!48087 lt!48094)))))

(assert (=> b!32427 (= lt!48094 lt!48087)))

(declare-fun lt!48095 () List!399)

(declare-fun tail!116 (List!399) List!399)

(assert (=> b!32427 (= lt!48087 (tail!116 lt!48095))))

(declare-fun lt!48103 () Unit!2459)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1396 BitStream!1396 BitStream!1396 BitStream!1396 (_ BitVec 64) List!399) Unit!2459)

(assert (=> b!32427 (= lt!48103 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1748 lt!48104) (_2!1748 lt!48104) (_1!1749 lt!48088) (_1!1749 lt!48106) (bvsub to!314 i!635) lt!48095))))

(declare-fun b!32428 () Bool)

(assert (=> b!32428 (= e!21427 e!21428)))

(declare-fun res!27690 () Bool)

(assert (=> b!32428 (=> res!27690 e!21428)))

(assert (=> b!32428 (= res!27690 (not (= (size!802 (buf!1130 (_2!1748 lt!48102))) (size!802 (buf!1130 (_2!1748 lt!48104))))))))

(declare-fun e!21433 () Bool)

(assert (=> b!32428 e!21433))

(declare-fun res!27692 () Bool)

(assert (=> b!32428 (=> (not res!27692) (not e!21433))))

(assert (=> b!32428 (= res!27692 (= (size!802 (buf!1130 (_2!1748 lt!48104))) (size!802 (buf!1130 thiss!1379))))))

(declare-fun b!32429 () Bool)

(declare-fun e!21437 () Bool)

(declare-fun array_inv!751 (array!1820) Bool)

(assert (=> b!32429 (= e!21437 (array_inv!751 (buf!1130 thiss!1379)))))

(declare-fun b!32430 () Bool)

(declare-fun res!27694 () Bool)

(assert (=> b!32430 (=> res!27694 e!21434)))

(declare-fun length!125 (List!399) Int)

(assert (=> b!32430 (= res!27694 (<= (length!125 lt!48095) 0))))

(declare-fun res!27706 () Bool)

(declare-fun e!21436 () Bool)

(assert (=> start!6884 (=> (not res!27706) (not e!21436))))

(assert (=> start!6884 (= res!27706 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!6884 e!21436))

(assert (=> start!6884 true))

(declare-fun inv!12 (BitStream!1396) Bool)

(assert (=> start!6884 (and (inv!12 thiss!1379) e!21437)))

(declare-fun srcBuffer!2 () array!1820)

(assert (=> start!6884 (array_inv!751 srcBuffer!2)))

(declare-fun b!32431 () Bool)

(assert (=> b!32431 (= e!21428 e!21434)))

(declare-fun res!27689 () Bool)

(assert (=> b!32431 (=> res!27689 e!21434)))

(assert (=> b!32431 (= res!27689 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!48091 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1396 BitStream!1396 (_ BitVec 64)) List!399)

(assert (=> b!32431 (= lt!48094 (bitStreamReadBitsIntoList!0 (_2!1748 lt!48104) (_1!1749 lt!48106) lt!48091))))

(assert (=> b!32431 (= lt!48095 (bitStreamReadBitsIntoList!0 (_2!1748 lt!48104) (_1!1749 lt!48088) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32431 (validate_offset_bits!1 ((_ sign_extend 32) (size!802 (buf!1130 (_2!1748 lt!48104)))) ((_ sign_extend 32) (currentByte!2497 (_2!1748 lt!48102))) ((_ sign_extend 32) (currentBit!2492 (_2!1748 lt!48102))) lt!48091)))

(declare-fun lt!48100 () Unit!2459)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1396 array!1820 (_ BitVec 64)) Unit!2459)

(assert (=> b!32431 (= lt!48100 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1748 lt!48102) (buf!1130 (_2!1748 lt!48104)) lt!48091))))

(declare-fun reader!0 (BitStream!1396 BitStream!1396) tuple2!3324)

(assert (=> b!32431 (= lt!48106 (reader!0 (_2!1748 lt!48102) (_2!1748 lt!48104)))))

(assert (=> b!32431 (validate_offset_bits!1 ((_ sign_extend 32) (size!802 (buf!1130 (_2!1748 lt!48104)))) ((_ sign_extend 32) (currentByte!2497 thiss!1379)) ((_ sign_extend 32) (currentBit!2492 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48096 () Unit!2459)

(assert (=> b!32431 (= lt!48096 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1130 (_2!1748 lt!48104)) (bvsub to!314 i!635)))))

(assert (=> b!32431 (= lt!48088 (reader!0 thiss!1379 (_2!1748 lt!48104)))))

(declare-fun b!32432 () Bool)

(declare-fun res!27701 () Bool)

(assert (=> b!32432 (=> res!27701 e!21426)))

(declare-fun head!236 (List!399) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1396 array!1820 (_ BitVec 64) (_ BitVec 64)) List!399)

(assert (=> b!32432 (= res!27701 (not (= (head!236 (byteArrayBitContentToList!0 (_2!1748 lt!48104) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635))))))

(declare-fun b!32433 () Bool)

(declare-fun e!21432 () Bool)

(declare-fun e!21430 () Bool)

(assert (=> b!32433 (= e!21432 (not e!21430))))

(declare-fun res!27708 () Bool)

(assert (=> b!32433 (=> res!27708 e!21430)))

(assert (=> b!32433 (= res!27708 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1396 BitStream!1396) Bool)

(assert (=> b!32433 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48105 () Unit!2459)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1396) Unit!2459)

(assert (=> b!32433 (= lt!48105 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!32433 (= lt!48092 (bitIndex!0 (size!802 (buf!1130 thiss!1379)) (currentByte!2497 thiss!1379) (currentBit!2492 thiss!1379)))))

(declare-fun b!32434 () Bool)

(assert (=> b!32434 (= e!21433 (= lt!48098 (bvsub (bvsub (bvadd (bitIndex!0 (size!802 (buf!1130 (_2!1748 lt!48102))) (currentByte!2497 (_2!1748 lt!48102)) (currentBit!2492 (_2!1748 lt!48102))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32435 () Bool)

(declare-fun res!27705 () Bool)

(assert (=> b!32435 (=> (not res!27705) (not e!21432))))

(assert (=> b!32435 (= res!27705 (validate_offset_bits!1 ((_ sign_extend 32) (size!802 (buf!1130 thiss!1379))) ((_ sign_extend 32) (currentByte!2497 thiss!1379)) ((_ sign_extend 32) (currentBit!2492 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32436 () Bool)

(declare-fun res!27707 () Bool)

(assert (=> b!32436 (=> res!27707 e!21427)))

(assert (=> b!32436 (= res!27707 (not (invariant!0 (currentBit!2492 (_2!1748 lt!48104)) (currentByte!2497 (_2!1748 lt!48104)) (size!802 (buf!1130 (_2!1748 lt!48104))))))))

(declare-fun b!32437 () Bool)

(declare-fun e!21425 () Bool)

(assert (=> b!32437 (= e!21430 e!21425)))

(declare-fun res!27691 () Bool)

(assert (=> b!32437 (=> res!27691 e!21425)))

(assert (=> b!32437 (= res!27691 (not (isPrefixOf!0 thiss!1379 (_2!1748 lt!48102))))))

(assert (=> b!32437 (validate_offset_bits!1 ((_ sign_extend 32) (size!802 (buf!1130 (_2!1748 lt!48102)))) ((_ sign_extend 32) (currentByte!2497 (_2!1748 lt!48102))) ((_ sign_extend 32) (currentBit!2492 (_2!1748 lt!48102))) lt!48091)))

(assert (=> b!32437 (= lt!48091 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48097 () Unit!2459)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1396 BitStream!1396 (_ BitVec 64) (_ BitVec 64)) Unit!2459)

(assert (=> b!32437 (= lt!48097 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1748 lt!48102) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1396 (_ BitVec 8) (_ BitVec 32)) tuple2!3322)

(assert (=> b!32437 (= lt!48102 (appendBitFromByte!0 thiss!1379 (select (arr!1277 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32438 () Bool)

(assert (=> b!32438 (= e!21425 e!21429)))

(declare-fun res!27698 () Bool)

(assert (=> b!32438 (=> res!27698 e!21429)))

(assert (=> b!32438 (= res!27698 (not (isPrefixOf!0 (_2!1748 lt!48102) (_2!1748 lt!48104))))))

(assert (=> b!32438 (isPrefixOf!0 thiss!1379 (_2!1748 lt!48104))))

(declare-fun lt!48089 () Unit!2459)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1396 BitStream!1396 BitStream!1396) Unit!2459)

(assert (=> b!32438 (= lt!48089 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1748 lt!48102) (_2!1748 lt!48104)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1396 array!1820 (_ BitVec 64) (_ BitVec 64)) tuple2!3322)

(assert (=> b!32438 (= lt!48104 (appendBitsMSBFirstLoop!0 (_2!1748 lt!48102) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21431 () Bool)

(assert (=> b!32438 e!21431))

(declare-fun res!27697 () Bool)

(assert (=> b!32438 (=> (not res!27697) (not e!21431))))

(assert (=> b!32438 (= res!27697 (validate_offset_bits!1 ((_ sign_extend 32) (size!802 (buf!1130 (_2!1748 lt!48102)))) ((_ sign_extend 32) (currentByte!2497 thiss!1379)) ((_ sign_extend 32) (currentBit!2492 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48090 () Unit!2459)

(assert (=> b!32438 (= lt!48090 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1130 (_2!1748 lt!48102)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48099 () tuple2!3324)

(assert (=> b!32438 (= lt!48099 (reader!0 thiss!1379 (_2!1748 lt!48102)))))

(declare-fun b!32439 () Bool)

(declare-fun res!27699 () Bool)

(assert (=> b!32439 (=> res!27699 e!21428)))

(assert (=> b!32439 (= res!27699 (not (invariant!0 (currentBit!2492 (_2!1748 lt!48102)) (currentByte!2497 (_2!1748 lt!48102)) (size!802 (buf!1130 (_2!1748 lt!48102))))))))

(declare-fun b!32440 () Bool)

(declare-fun lt!48093 () (_ BitVec 64))

(assert (=> b!32440 (= e!21426 (bvslt i!635 lt!48093))))

(declare-fun b!32441 () Bool)

(assert (=> b!32441 (= e!21431 (= (head!236 (byteArrayBitContentToList!0 (_2!1748 lt!48102) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!236 (bitStreamReadBitsIntoList!0 (_2!1748 lt!48102) (_1!1749 lt!48099) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32442 () Bool)

(declare-fun res!27693 () Bool)

(assert (=> b!32442 (=> res!27693 e!21426)))

(assert (=> b!32442 (= res!27693 (not (= (head!236 lt!48095) lt!48101)))))

(declare-fun b!32443 () Bool)

(assert (=> b!32443 (= e!21436 e!21432)))

(declare-fun res!27702 () Bool)

(assert (=> b!32443 (=> (not res!27702) (not e!21432))))

(assert (=> b!32443 (= res!27702 (bvsle to!314 lt!48093))))

(assert (=> b!32443 (= lt!48093 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!802 srcBuffer!2))))))

(assert (= (and start!6884 res!27706) b!32443))

(assert (= (and b!32443 res!27702) b!32435))

(assert (= (and b!32435 res!27705) b!32433))

(assert (= (and b!32433 (not res!27708)) b!32437))

(assert (= (and b!32437 (not res!27691)) b!32438))

(assert (= (and b!32438 res!27697) b!32441))

(assert (= (and b!32438 (not res!27698)) b!32424))

(assert (= (and b!32424 (not res!27703)) b!32436))

(assert (= (and b!32436 (not res!27707)) b!32423))

(assert (= (and b!32423 (not res!27700)) b!32428))

(assert (= (and b!32428 res!27692) b!32434))

(assert (= (and b!32428 (not res!27690)) b!32439))

(assert (= (and b!32439 (not res!27699)) b!32426))

(assert (= (and b!32426 (not res!27696)) b!32431))

(assert (= (and b!32431 (not res!27689)) b!32430))

(assert (= (and b!32430 (not res!27694)) b!32427))

(assert (= (and b!32427 (not res!27704)) b!32425))

(assert (= (and b!32425 (not res!27695)) b!32442))

(assert (= (and b!32442 (not res!27693)) b!32432))

(assert (= (and b!32432 (not res!27701)) b!32440))

(assert (= start!6884 b!32429))

(declare-fun m!47967 () Bool)

(assert (=> b!32424 m!47967))

(declare-fun m!47969 () Bool)

(assert (=> b!32437 m!47969))

(declare-fun m!47971 () Bool)

(assert (=> b!32437 m!47971))

(assert (=> b!32437 m!47969))

(declare-fun m!47973 () Bool)

(assert (=> b!32437 m!47973))

(declare-fun m!47975 () Bool)

(assert (=> b!32437 m!47975))

(declare-fun m!47977 () Bool)

(assert (=> b!32437 m!47977))

(declare-fun m!47979 () Bool)

(assert (=> start!6884 m!47979))

(declare-fun m!47981 () Bool)

(assert (=> start!6884 m!47981))

(declare-fun m!47983 () Bool)

(assert (=> b!32433 m!47983))

(declare-fun m!47985 () Bool)

(assert (=> b!32433 m!47985))

(declare-fun m!47987 () Bool)

(assert (=> b!32433 m!47987))

(declare-fun m!47989 () Bool)

(assert (=> b!32426 m!47989))

(declare-fun m!47991 () Bool)

(assert (=> b!32434 m!47991))

(declare-fun m!47993 () Bool)

(assert (=> b!32430 m!47993))

(declare-fun m!47995 () Bool)

(assert (=> b!32436 m!47995))

(declare-fun m!47997 () Bool)

(assert (=> b!32439 m!47997))

(declare-fun m!47999 () Bool)

(assert (=> b!32429 m!47999))

(declare-fun m!48001 () Bool)

(assert (=> b!32435 m!48001))

(declare-fun m!48003 () Bool)

(assert (=> b!32441 m!48003))

(assert (=> b!32441 m!48003))

(declare-fun m!48005 () Bool)

(assert (=> b!32441 m!48005))

(declare-fun m!48007 () Bool)

(assert (=> b!32441 m!48007))

(assert (=> b!32441 m!48007))

(declare-fun m!48009 () Bool)

(assert (=> b!32441 m!48009))

(declare-fun m!48011 () Bool)

(assert (=> b!32431 m!48011))

(declare-fun m!48013 () Bool)

(assert (=> b!32431 m!48013))

(declare-fun m!48015 () Bool)

(assert (=> b!32431 m!48015))

(declare-fun m!48017 () Bool)

(assert (=> b!32431 m!48017))

(declare-fun m!48019 () Bool)

(assert (=> b!32431 m!48019))

(declare-fun m!48021 () Bool)

(assert (=> b!32431 m!48021))

(declare-fun m!48023 () Bool)

(assert (=> b!32431 m!48023))

(declare-fun m!48025 () Bool)

(assert (=> b!32431 m!48025))

(declare-fun m!48027 () Bool)

(assert (=> b!32427 m!48027))

(declare-fun m!48029 () Bool)

(assert (=> b!32427 m!48029))

(declare-fun m!48031 () Bool)

(assert (=> b!32438 m!48031))

(declare-fun m!48033 () Bool)

(assert (=> b!32438 m!48033))

(declare-fun m!48035 () Bool)

(assert (=> b!32438 m!48035))

(declare-fun m!48037 () Bool)

(assert (=> b!32438 m!48037))

(declare-fun m!48039 () Bool)

(assert (=> b!32438 m!48039))

(declare-fun m!48041 () Bool)

(assert (=> b!32438 m!48041))

(declare-fun m!48043 () Bool)

(assert (=> b!32438 m!48043))

(declare-fun m!48045 () Bool)

(assert (=> b!32425 m!48045))

(declare-fun m!48047 () Bool)

(assert (=> b!32425 m!48047))

(declare-fun m!48049 () Bool)

(assert (=> b!32432 m!48049))

(assert (=> b!32432 m!48049))

(declare-fun m!48051 () Bool)

(assert (=> b!32432 m!48051))

(declare-fun m!48053 () Bool)

(assert (=> b!32432 m!48053))

(declare-fun m!48055 () Bool)

(assert (=> b!32442 m!48055))

(push 1)

(assert (not b!32429))

(assert (not b!32442))

(assert (not b!32431))

(assert (not b!32427))

(assert (not b!32425))

(assert (not b!32435))

(assert (not b!32436))

(assert (not b!32439))

(assert (not b!32433))

(assert (not start!6884))

(assert (not b!32437))

(assert (not b!32438))

(assert (not b!32430))

(assert (not b!32426))

(assert (not b!32424))

(assert (not b!32434))

(assert (not b!32432))

(assert (not b!32441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

