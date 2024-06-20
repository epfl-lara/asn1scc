; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9274 () Bool)

(assert start!9274)

(declare-fun b!46072 () Bool)

(declare-fun res!38917 () Bool)

(declare-fun e!30637 () Bool)

(assert (=> b!46072 (=> res!38917 e!30637)))

(declare-datatypes ((array!2280 0))(
  ( (array!2281 (arr!1545 (Array (_ BitVec 32) (_ BitVec 8))) (size!1028 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1794 0))(
  ( (BitStream!1795 (buf!1377 array!2280) (currentByte!2876 (_ BitVec 32)) (currentBit!2871 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3269 0))(
  ( (Unit!3270) )
))
(declare-datatypes ((tuple2!4480 0))(
  ( (tuple2!4481 (_1!2333 Unit!3269) (_2!2333 BitStream!1794)) )
))
(declare-fun lt!71004 () tuple2!4480)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46072 (= res!38917 (not (invariant!0 (currentBit!2871 (_2!2333 lt!71004)) (currentByte!2876 (_2!2333 lt!71004)) (size!1028 (buf!1377 (_2!2333 lt!71004))))))))

(declare-fun b!46073 () Bool)

(declare-fun e!30633 () Bool)

(declare-fun e!30629 () Bool)

(assert (=> b!46073 (= e!30633 e!30629)))

(declare-fun res!38918 () Bool)

(assert (=> b!46073 (=> res!38918 e!30629)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!46073 (= res!38918 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4482 0))(
  ( (tuple2!4483 (_1!2334 BitStream!1794) (_2!2334 BitStream!1794)) )
))
(declare-fun lt!71006 () tuple2!4482)

(declare-fun lt!71008 () (_ BitVec 64))

(declare-datatypes ((List!538 0))(
  ( (Nil!535) (Cons!534 (h!653 Bool) (t!1288 List!538)) )
))
(declare-fun lt!70995 () List!538)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1794 BitStream!1794 (_ BitVec 64)) List!538)

(assert (=> b!46073 (= lt!70995 (bitStreamReadBitsIntoList!0 (_2!2333 lt!71004) (_1!2334 lt!71006) lt!71008))))

(declare-fun lt!70997 () List!538)

(declare-fun lt!71009 () tuple2!4482)

(assert (=> b!46073 (= lt!70997 (bitStreamReadBitsIntoList!0 (_2!2333 lt!71004) (_1!2334 lt!71009) (bvsub to!314 i!635)))))

(declare-fun lt!71007 () tuple2!4480)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46073 (validate_offset_bits!1 ((_ sign_extend 32) (size!1028 (buf!1377 (_2!2333 lt!71004)))) ((_ sign_extend 32) (currentByte!2876 (_2!2333 lt!71007))) ((_ sign_extend 32) (currentBit!2871 (_2!2333 lt!71007))) lt!71008)))

(declare-fun lt!71003 () Unit!3269)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1794 array!2280 (_ BitVec 64)) Unit!3269)

(assert (=> b!46073 (= lt!71003 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2333 lt!71007) (buf!1377 (_2!2333 lt!71004)) lt!71008))))

(declare-fun reader!0 (BitStream!1794 BitStream!1794) tuple2!4482)

(assert (=> b!46073 (= lt!71006 (reader!0 (_2!2333 lt!71007) (_2!2333 lt!71004)))))

(declare-fun thiss!1379 () BitStream!1794)

(assert (=> b!46073 (validate_offset_bits!1 ((_ sign_extend 32) (size!1028 (buf!1377 (_2!2333 lt!71004)))) ((_ sign_extend 32) (currentByte!2876 thiss!1379)) ((_ sign_extend 32) (currentBit!2871 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!70994 () Unit!3269)

(assert (=> b!46073 (= lt!70994 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1377 (_2!2333 lt!71004)) (bvsub to!314 i!635)))))

(assert (=> b!46073 (= lt!71009 (reader!0 thiss!1379 (_2!2333 lt!71004)))))

(declare-fun b!46074 () Bool)

(declare-fun res!38919 () Bool)

(assert (=> b!46074 (=> res!38919 e!30629)))

(declare-fun length!233 (List!538) Int)

(assert (=> b!46074 (= res!38919 (<= (length!233 lt!70997) 0))))

(declare-fun b!46075 () Bool)

(declare-fun res!38927 () Bool)

(assert (=> b!46075 (=> res!38927 e!30637)))

(assert (=> b!46075 (= res!38927 (not (= (size!1028 (buf!1377 thiss!1379)) (size!1028 (buf!1377 (_2!2333 lt!71004))))))))

(declare-fun b!46076 () Bool)

(declare-fun res!38926 () Bool)

(declare-fun e!30634 () Bool)

(assert (=> b!46076 (=> (not res!38926) (not e!30634))))

(assert (=> b!46076 (= res!38926 (validate_offset_bits!1 ((_ sign_extend 32) (size!1028 (buf!1377 thiss!1379))) ((_ sign_extend 32) (currentByte!2876 thiss!1379)) ((_ sign_extend 32) (currentBit!2871 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46077 () Bool)

(declare-fun e!30630 () Bool)

(declare-fun array_inv!950 (array!2280) Bool)

(assert (=> b!46077 (= e!30630 (array_inv!950 (buf!1377 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2280)

(declare-fun lt!71005 () tuple2!4482)

(declare-fun b!46078 () Bool)

(declare-fun e!30631 () Bool)

(declare-fun head!357 (List!538) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1794 array!2280 (_ BitVec 64) (_ BitVec 64)) List!538)

(assert (=> b!46078 (= e!30631 (= (head!357 (byteArrayBitContentToList!0 (_2!2333 lt!71007) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!357 (bitStreamReadBitsIntoList!0 (_2!2333 lt!71007) (_1!2334 lt!71005) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46079 () Bool)

(declare-fun e!30632 () Bool)

(assert (=> b!46079 (= e!30632 e!30637)))

(declare-fun res!38923 () Bool)

(assert (=> b!46079 (=> res!38923 e!30637)))

(declare-fun lt!71011 () (_ BitVec 64))

(declare-fun lt!71010 () (_ BitVec 64))

(assert (=> b!46079 (= res!38923 (not (= lt!71011 (bvsub (bvadd lt!71010 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46079 (= lt!71011 (bitIndex!0 (size!1028 (buf!1377 (_2!2333 lt!71004))) (currentByte!2876 (_2!2333 lt!71004)) (currentBit!2871 (_2!2333 lt!71004))))))

(declare-fun res!38920 () Bool)

(assert (=> start!9274 (=> (not res!38920) (not e!30634))))

(assert (=> start!9274 (= res!38920 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1028 srcBuffer!2))))))))

(assert (=> start!9274 e!30634))

(assert (=> start!9274 true))

(assert (=> start!9274 (array_inv!950 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1794) Bool)

(assert (=> start!9274 (and (inv!12 thiss!1379) e!30630)))

(declare-fun e!30627 () Bool)

(declare-fun b!46080 () Bool)

(assert (=> b!46080 (= e!30627 (= lt!71011 (bvsub (bvsub (bvadd (bitIndex!0 (size!1028 (buf!1377 (_2!2333 lt!71007))) (currentByte!2876 (_2!2333 lt!71007)) (currentBit!2871 (_2!2333 lt!71007))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46081 () Bool)

(declare-fun e!30635 () Bool)

(assert (=> b!46081 (= e!30634 (not e!30635))))

(declare-fun res!38931 () Bool)

(assert (=> b!46081 (=> res!38931 e!30635)))

(assert (=> b!46081 (= res!38931 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1794 BitStream!1794) Bool)

(assert (=> b!46081 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!70998 () Unit!3269)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1794) Unit!3269)

(assert (=> b!46081 (= lt!70998 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!46081 (= lt!71010 (bitIndex!0 (size!1028 (buf!1377 thiss!1379)) (currentByte!2876 thiss!1379) (currentBit!2871 thiss!1379)))))

(declare-fun b!46082 () Bool)

(declare-fun res!38922 () Bool)

(assert (=> b!46082 (=> res!38922 e!30633)))

(assert (=> b!46082 (= res!38922 (not (invariant!0 (currentBit!2871 (_2!2333 lt!71007)) (currentByte!2876 (_2!2333 lt!71007)) (size!1028 (buf!1377 (_2!2333 lt!71007))))))))

(declare-fun b!46083 () Bool)

(declare-fun lt!71002 () List!538)

(assert (=> b!46083 (= e!30629 (= lt!71002 lt!70995))))

(assert (=> b!46083 (= lt!70995 lt!71002)))

(declare-fun tail!224 (List!538) List!538)

(assert (=> b!46083 (= lt!71002 (tail!224 lt!70997))))

(declare-fun lt!70996 () Unit!3269)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1794 BitStream!1794 BitStream!1794 BitStream!1794 (_ BitVec 64) List!538) Unit!3269)

(assert (=> b!46083 (= lt!70996 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2333 lt!71004) (_2!2333 lt!71004) (_1!2334 lt!71009) (_1!2334 lt!71006) (bvsub to!314 i!635) lt!70997))))

(declare-fun b!46084 () Bool)

(declare-fun e!30636 () Bool)

(assert (=> b!46084 (= e!30635 e!30636)))

(declare-fun res!38930 () Bool)

(assert (=> b!46084 (=> res!38930 e!30636)))

(assert (=> b!46084 (= res!38930 (not (isPrefixOf!0 thiss!1379 (_2!2333 lt!71007))))))

(assert (=> b!46084 (validate_offset_bits!1 ((_ sign_extend 32) (size!1028 (buf!1377 (_2!2333 lt!71007)))) ((_ sign_extend 32) (currentByte!2876 (_2!2333 lt!71007))) ((_ sign_extend 32) (currentBit!2871 (_2!2333 lt!71007))) lt!71008)))

(assert (=> b!46084 (= lt!71008 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71001 () Unit!3269)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1794 BitStream!1794 (_ BitVec 64) (_ BitVec 64)) Unit!3269)

(assert (=> b!46084 (= lt!71001 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2333 lt!71007) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1794 (_ BitVec 8) (_ BitVec 32)) tuple2!4480)

(assert (=> b!46084 (= lt!71007 (appendBitFromByte!0 thiss!1379 (select (arr!1545 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46085 () Bool)

(declare-fun res!38924 () Bool)

(assert (=> b!46085 (=> res!38924 e!30633)))

(assert (=> b!46085 (= res!38924 (not (invariant!0 (currentBit!2871 (_2!2333 lt!71007)) (currentByte!2876 (_2!2333 lt!71007)) (size!1028 (buf!1377 (_2!2333 lt!71004))))))))

(declare-fun b!46086 () Bool)

(assert (=> b!46086 (= e!30637 e!30633)))

(declare-fun res!38928 () Bool)

(assert (=> b!46086 (=> res!38928 e!30633)))

(assert (=> b!46086 (= res!38928 (not (= (size!1028 (buf!1377 (_2!2333 lt!71007))) (size!1028 (buf!1377 (_2!2333 lt!71004))))))))

(assert (=> b!46086 e!30627))

(declare-fun res!38925 () Bool)

(assert (=> b!46086 (=> (not res!38925) (not e!30627))))

(assert (=> b!46086 (= res!38925 (= (size!1028 (buf!1377 (_2!2333 lt!71004))) (size!1028 (buf!1377 thiss!1379))))))

(declare-fun b!46087 () Bool)

(assert (=> b!46087 (= e!30636 e!30632)))

(declare-fun res!38921 () Bool)

(assert (=> b!46087 (=> res!38921 e!30632)))

(assert (=> b!46087 (= res!38921 (not (isPrefixOf!0 (_2!2333 lt!71007) (_2!2333 lt!71004))))))

(assert (=> b!46087 (isPrefixOf!0 thiss!1379 (_2!2333 lt!71004))))

(declare-fun lt!71000 () Unit!3269)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1794 BitStream!1794 BitStream!1794) Unit!3269)

(assert (=> b!46087 (= lt!71000 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2333 lt!71007) (_2!2333 lt!71004)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1794 array!2280 (_ BitVec 64) (_ BitVec 64)) tuple2!4480)

(assert (=> b!46087 (= lt!71004 (appendBitsMSBFirstLoop!0 (_2!2333 lt!71007) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46087 e!30631))

(declare-fun res!38929 () Bool)

(assert (=> b!46087 (=> (not res!38929) (not e!30631))))

(assert (=> b!46087 (= res!38929 (validate_offset_bits!1 ((_ sign_extend 32) (size!1028 (buf!1377 (_2!2333 lt!71007)))) ((_ sign_extend 32) (currentByte!2876 thiss!1379)) ((_ sign_extend 32) (currentBit!2871 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70999 () Unit!3269)

(assert (=> b!46087 (= lt!70999 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1377 (_2!2333 lt!71007)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46087 (= lt!71005 (reader!0 thiss!1379 (_2!2333 lt!71007)))))

(assert (= (and start!9274 res!38920) b!46076))

(assert (= (and b!46076 res!38926) b!46081))

(assert (= (and b!46081 (not res!38931)) b!46084))

(assert (= (and b!46084 (not res!38930)) b!46087))

(assert (= (and b!46087 res!38929) b!46078))

(assert (= (and b!46087 (not res!38921)) b!46079))

(assert (= (and b!46079 (not res!38923)) b!46072))

(assert (= (and b!46072 (not res!38917)) b!46075))

(assert (= (and b!46075 (not res!38927)) b!46086))

(assert (= (and b!46086 res!38925) b!46080))

(assert (= (and b!46086 (not res!38928)) b!46082))

(assert (= (and b!46082 (not res!38922)) b!46085))

(assert (= (and b!46085 (not res!38924)) b!46073))

(assert (= (and b!46073 (not res!38918)) b!46074))

(assert (= (and b!46074 (not res!38919)) b!46083))

(assert (= start!9274 b!46077))

(declare-fun m!70471 () Bool)

(assert (=> b!46083 m!70471))

(declare-fun m!70473 () Bool)

(assert (=> b!46083 m!70473))

(declare-fun m!70475 () Bool)

(assert (=> start!9274 m!70475))

(declare-fun m!70477 () Bool)

(assert (=> start!9274 m!70477))

(declare-fun m!70479 () Bool)

(assert (=> b!46074 m!70479))

(declare-fun m!70481 () Bool)

(assert (=> b!46080 m!70481))

(declare-fun m!70483 () Bool)

(assert (=> b!46072 m!70483))

(declare-fun m!70485 () Bool)

(assert (=> b!46078 m!70485))

(assert (=> b!46078 m!70485))

(declare-fun m!70487 () Bool)

(assert (=> b!46078 m!70487))

(declare-fun m!70489 () Bool)

(assert (=> b!46078 m!70489))

(assert (=> b!46078 m!70489))

(declare-fun m!70491 () Bool)

(assert (=> b!46078 m!70491))

(declare-fun m!70493 () Bool)

(assert (=> b!46076 m!70493))

(declare-fun m!70495 () Bool)

(assert (=> b!46084 m!70495))

(declare-fun m!70497 () Bool)

(assert (=> b!46084 m!70497))

(declare-fun m!70499 () Bool)

(assert (=> b!46084 m!70499))

(declare-fun m!70501 () Bool)

(assert (=> b!46084 m!70501))

(assert (=> b!46084 m!70499))

(declare-fun m!70503 () Bool)

(assert (=> b!46084 m!70503))

(declare-fun m!70505 () Bool)

(assert (=> b!46077 m!70505))

(declare-fun m!70507 () Bool)

(assert (=> b!46082 m!70507))

(declare-fun m!70509 () Bool)

(assert (=> b!46081 m!70509))

(declare-fun m!70511 () Bool)

(assert (=> b!46081 m!70511))

(declare-fun m!70513 () Bool)

(assert (=> b!46081 m!70513))

(declare-fun m!70515 () Bool)

(assert (=> b!46087 m!70515))

(declare-fun m!70517 () Bool)

(assert (=> b!46087 m!70517))

(declare-fun m!70519 () Bool)

(assert (=> b!46087 m!70519))

(declare-fun m!70521 () Bool)

(assert (=> b!46087 m!70521))

(declare-fun m!70523 () Bool)

(assert (=> b!46087 m!70523))

(declare-fun m!70525 () Bool)

(assert (=> b!46087 m!70525))

(declare-fun m!70527 () Bool)

(assert (=> b!46087 m!70527))

(declare-fun m!70529 () Bool)

(assert (=> b!46079 m!70529))

(declare-fun m!70531 () Bool)

(assert (=> b!46073 m!70531))

(declare-fun m!70533 () Bool)

(assert (=> b!46073 m!70533))

(declare-fun m!70535 () Bool)

(assert (=> b!46073 m!70535))

(declare-fun m!70537 () Bool)

(assert (=> b!46073 m!70537))

(declare-fun m!70539 () Bool)

(assert (=> b!46073 m!70539))

(declare-fun m!70541 () Bool)

(assert (=> b!46073 m!70541))

(declare-fun m!70543 () Bool)

(assert (=> b!46073 m!70543))

(declare-fun m!70545 () Bool)

(assert (=> b!46073 m!70545))

(declare-fun m!70547 () Bool)

(assert (=> b!46085 m!70547))

(check-sat (not b!46079) (not b!46081) (not b!46073) (not b!46076) (not b!46074) (not b!46078) (not b!46072) (not b!46085) (not start!9274) (not b!46080) (not b!46077) (not b!46083) (not b!46082) (not b!46087) (not b!46084))
