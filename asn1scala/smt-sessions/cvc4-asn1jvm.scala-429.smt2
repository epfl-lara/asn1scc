; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11482 () Bool)

(assert start!11482)

(declare-fun lt!89359 () (_ BitVec 64))

(declare-fun e!37780 () Bool)

(declare-fun lt!89361 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!56833 () Bool)

(assert (=> b!56833 (= e!37780 (or (= lt!89361 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!89361 (bvand (bvsub lt!89359 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56833 (= lt!89361 (bvand lt!89359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2618 0))(
  ( (array!2619 (arr!1744 (Array (_ BitVec 32) (_ BitVec 8))) (size!1189 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2066 0))(
  ( (BitStream!2067 (buf!1561 array!2618) (currentByte!3161 (_ BitVec 32)) (currentBit!3156 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3929 0))(
  ( (Unit!3930) )
))
(declare-datatypes ((tuple2!5182 0))(
  ( (tuple2!5183 (_1!2702 Unit!3929) (_2!2702 BitStream!2066)) )
))
(declare-fun lt!89360 () tuple2!5182)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56833 (= lt!89359 (bvadd (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))) to!314))))

(declare-fun lt!89367 () tuple2!5182)

(declare-fun thiss!1379 () BitStream!2066)

(assert (=> b!56833 (= (size!1189 (buf!1561 (_2!2702 lt!89367))) (size!1189 (buf!1561 thiss!1379)))))

(declare-fun b!56834 () Bool)

(declare-fun res!47265 () Bool)

(assert (=> b!56834 (=> res!47265 e!37780)))

(assert (=> b!56834 (= res!47265 (not (= (size!1189 (buf!1561 thiss!1379)) (size!1189 (buf!1561 (_2!2702 lt!89367))))))))

(declare-fun b!56835 () Bool)

(declare-fun e!37783 () Bool)

(assert (=> b!56835 (= e!37783 e!37780)))

(declare-fun res!47261 () Bool)

(assert (=> b!56835 (=> res!47261 e!37780)))

(declare-fun isPrefixOf!0 (BitStream!2066 BitStream!2066) Bool)

(assert (=> b!56835 (= res!47261 (not (isPrefixOf!0 (_2!2702 lt!89360) (_2!2702 lt!89367))))))

(assert (=> b!56835 (isPrefixOf!0 thiss!1379 (_2!2702 lt!89367))))

(declare-fun lt!89364 () Unit!3929)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2066 BitStream!2066 BitStream!2066) Unit!3929)

(assert (=> b!56835 (= lt!89364 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2702 lt!89360) (_2!2702 lt!89367)))))

(declare-fun srcBuffer!2 () array!2618)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2066 array!2618 (_ BitVec 64) (_ BitVec 64)) tuple2!5182)

(assert (=> b!56835 (= lt!89367 (appendBitsMSBFirstLoop!0 (_2!2702 lt!89360) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!37784 () Bool)

(assert (=> b!56835 e!37784))

(declare-fun res!47257 () Bool)

(assert (=> b!56835 (=> (not res!47257) (not e!37784))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56835 (= res!47257 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89366 () Unit!3929)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2066 array!2618 (_ BitVec 64)) Unit!3929)

(assert (=> b!56835 (= lt!89366 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1561 (_2!2702 lt!89360)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5184 0))(
  ( (tuple2!5185 (_1!2703 BitStream!2066) (_2!2703 BitStream!2066)) )
))
(declare-fun lt!89362 () tuple2!5184)

(declare-fun reader!0 (BitStream!2066 BitStream!2066) tuple2!5184)

(assert (=> b!56835 (= lt!89362 (reader!0 thiss!1379 (_2!2702 lt!89360)))))

(declare-fun b!56836 () Bool)

(declare-fun res!47260 () Bool)

(assert (=> b!56836 (=> res!47260 e!37780)))

(declare-fun lt!89363 () (_ BitVec 64))

(assert (=> b!56836 (= res!47260 (not (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89367))) (currentByte!3161 (_2!2702 lt!89367)) (currentBit!3156 (_2!2702 lt!89367))) (bvsub (bvadd lt!89363 to!314) i!635))))))

(declare-fun b!56837 () Bool)

(declare-fun res!47263 () Bool)

(assert (=> b!56837 (=> res!47263 e!37780)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56837 (= res!47263 (not (invariant!0 (currentBit!3156 (_2!2702 lt!89367)) (currentByte!3161 (_2!2702 lt!89367)) (size!1189 (buf!1561 (_2!2702 lt!89367))))))))

(declare-fun b!56838 () Bool)

(declare-fun e!37785 () Bool)

(declare-fun e!37787 () Bool)

(assert (=> b!56838 (= e!37785 (not e!37787))))

(declare-fun res!47259 () Bool)

(assert (=> b!56838 (=> res!47259 e!37787)))

(assert (=> b!56838 (= res!47259 (bvsge i!635 to!314))))

(assert (=> b!56838 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89368 () Unit!3929)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2066) Unit!3929)

(assert (=> b!56838 (= lt!89368 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!56838 (= lt!89363 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)))))

(declare-fun b!56839 () Bool)

(declare-fun e!37781 () Bool)

(declare-fun array_inv!1092 (array!2618) Bool)

(assert (=> b!56839 (= e!37781 (array_inv!1092 (buf!1561 thiss!1379)))))

(declare-fun res!47262 () Bool)

(assert (=> start!11482 (=> (not res!47262) (not e!37785))))

(assert (=> start!11482 (= res!47262 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1189 srcBuffer!2))))))))

(assert (=> start!11482 e!37785))

(assert (=> start!11482 true))

(assert (=> start!11482 (array_inv!1092 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2066) Bool)

(assert (=> start!11482 (and (inv!12 thiss!1379) e!37781)))

(declare-fun b!56840 () Bool)

(declare-fun res!47264 () Bool)

(assert (=> b!56840 (=> (not res!47264) (not e!37785))))

(assert (=> b!56840 (= res!47264 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 thiss!1379))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56841 () Bool)

(declare-datatypes ((List!608 0))(
  ( (Nil!605) (Cons!604 (h!723 Bool) (t!1358 List!608)) )
))
(declare-fun head!427 (List!608) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2066 array!2618 (_ BitVec 64) (_ BitVec 64)) List!608)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2066 BitStream!2066 (_ BitVec 64)) List!608)

(assert (=> b!56841 (= e!37784 (= (head!427 (byteArrayBitContentToList!0 (_2!2702 lt!89360) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!427 (bitStreamReadBitsIntoList!0 (_2!2702 lt!89360) (_1!2703 lt!89362) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!56842 () Bool)

(assert (=> b!56842 (= e!37787 e!37783)))

(declare-fun res!47258 () Bool)

(assert (=> b!56842 (=> res!47258 e!37783)))

(assert (=> b!56842 (= res!47258 (not (isPrefixOf!0 thiss!1379 (_2!2702 lt!89360))))))

(assert (=> b!56842 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89365 () Unit!3929)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2066 BitStream!2066 (_ BitVec 64) (_ BitVec 64)) Unit!3929)

(assert (=> b!56842 (= lt!89365 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2702 lt!89360) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2066 (_ BitVec 8) (_ BitVec 32)) tuple2!5182)

(assert (=> b!56842 (= lt!89360 (appendBitFromByte!0 thiss!1379 (select (arr!1744 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11482 res!47262) b!56840))

(assert (= (and b!56840 res!47264) b!56838))

(assert (= (and b!56838 (not res!47259)) b!56842))

(assert (= (and b!56842 (not res!47258)) b!56835))

(assert (= (and b!56835 res!47257) b!56841))

(assert (= (and b!56835 (not res!47261)) b!56836))

(assert (= (and b!56836 (not res!47260)) b!56837))

(assert (= (and b!56837 (not res!47263)) b!56834))

(assert (= (and b!56834 (not res!47265)) b!56833))

(assert (= start!11482 b!56839))

(declare-fun m!89595 () Bool)

(assert (=> start!11482 m!89595))

(declare-fun m!89597 () Bool)

(assert (=> start!11482 m!89597))

(declare-fun m!89599 () Bool)

(assert (=> b!56840 m!89599))

(declare-fun m!89601 () Bool)

(assert (=> b!56839 m!89601))

(declare-fun m!89603 () Bool)

(assert (=> b!56838 m!89603))

(declare-fun m!89605 () Bool)

(assert (=> b!56838 m!89605))

(declare-fun m!89607 () Bool)

(assert (=> b!56838 m!89607))

(declare-fun m!89609 () Bool)

(assert (=> b!56835 m!89609))

(declare-fun m!89611 () Bool)

(assert (=> b!56835 m!89611))

(declare-fun m!89613 () Bool)

(assert (=> b!56835 m!89613))

(declare-fun m!89615 () Bool)

(assert (=> b!56835 m!89615))

(declare-fun m!89617 () Bool)

(assert (=> b!56835 m!89617))

(declare-fun m!89619 () Bool)

(assert (=> b!56835 m!89619))

(declare-fun m!89621 () Bool)

(assert (=> b!56835 m!89621))

(declare-fun m!89623 () Bool)

(assert (=> b!56842 m!89623))

(declare-fun m!89625 () Bool)

(assert (=> b!56842 m!89625))

(declare-fun m!89627 () Bool)

(assert (=> b!56842 m!89627))

(declare-fun m!89629 () Bool)

(assert (=> b!56842 m!89629))

(assert (=> b!56842 m!89625))

(declare-fun m!89631 () Bool)

(assert (=> b!56842 m!89631))

(declare-fun m!89633 () Bool)

(assert (=> b!56837 m!89633))

(declare-fun m!89635 () Bool)

(assert (=> b!56841 m!89635))

(assert (=> b!56841 m!89635))

(declare-fun m!89637 () Bool)

(assert (=> b!56841 m!89637))

(declare-fun m!89639 () Bool)

(assert (=> b!56841 m!89639))

(assert (=> b!56841 m!89639))

(declare-fun m!89641 () Bool)

(assert (=> b!56841 m!89641))

(declare-fun m!89643 () Bool)

(assert (=> b!56836 m!89643))

(declare-fun m!89645 () Bool)

(assert (=> b!56833 m!89645))

(push 1)

(assert (not b!56833))

(assert (not b!56837))

(assert (not b!56840))

(assert (not b!56841))

(assert (not start!11482))

(assert (not b!56838))

(assert (not b!56836))

(assert (not b!56842))

(assert (not b!56839))

(assert (not b!56835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18112 () Bool)

(declare-fun e!37810 () Bool)

(assert (=> d!18112 e!37810))

(declare-fun res!47300 () Bool)

(assert (=> d!18112 (=> (not res!47300) (not e!37810))))

(declare-fun lt!89404 () (_ BitVec 64))

(declare-fun lt!89406 () (_ BitVec 64))

(declare-fun lt!89405 () (_ BitVec 64))

(assert (=> d!18112 (= res!47300 (= lt!89405 (bvsub lt!89404 lt!89406)))))

(assert (=> d!18112 (or (= (bvand lt!89404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89404 lt!89406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18112 (= lt!89406 (remainingBits!0 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89367)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89367))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89367)))))))

(declare-fun lt!89407 () (_ BitVec 64))

(declare-fun lt!89402 () (_ BitVec 64))

(assert (=> d!18112 (= lt!89404 (bvmul lt!89407 lt!89402))))

(assert (=> d!18112 (or (= lt!89407 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89402 (bvsdiv (bvmul lt!89407 lt!89402) lt!89407)))))

(assert (=> d!18112 (= lt!89402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18112 (= lt!89407 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89367)))))))

(assert (=> d!18112 (= lt!89405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89367))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89367)))))))

(assert (=> d!18112 (invariant!0 (currentBit!3156 (_2!2702 lt!89367)) (currentByte!3161 (_2!2702 lt!89367)) (size!1189 (buf!1561 (_2!2702 lt!89367))))))

(assert (=> d!18112 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89367))) (currentByte!3161 (_2!2702 lt!89367)) (currentBit!3156 (_2!2702 lt!89367))) lt!89405)))

(declare-fun b!56877 () Bool)

(declare-fun res!47301 () Bool)

(assert (=> b!56877 (=> (not res!47301) (not e!37810))))

(assert (=> b!56877 (= res!47301 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89405))))

(declare-fun b!56878 () Bool)

(declare-fun lt!89403 () (_ BitVec 64))

(assert (=> b!56878 (= e!37810 (bvsle lt!89405 (bvmul lt!89403 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56878 (or (= lt!89403 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89403 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89403)))))

(assert (=> b!56878 (= lt!89403 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89367)))))))

(assert (= (and d!18112 res!47300) b!56877))

(assert (= (and b!56877 res!47301) b!56878))

(declare-fun m!89661 () Bool)

(assert (=> d!18112 m!89661))

(assert (=> d!18112 m!89633))

(assert (=> b!56836 d!18112))

(declare-fun d!18114 () Bool)

(assert (=> d!18114 (= (invariant!0 (currentBit!3156 (_2!2702 lt!89367)) (currentByte!3161 (_2!2702 lt!89367)) (size!1189 (buf!1561 (_2!2702 lt!89367)))) (and (bvsge (currentBit!3156 (_2!2702 lt!89367)) #b00000000000000000000000000000000) (bvslt (currentBit!3156 (_2!2702 lt!89367)) #b00000000000000000000000000001000) (bvsge (currentByte!3161 (_2!2702 lt!89367)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3161 (_2!2702 lt!89367)) (size!1189 (buf!1561 (_2!2702 lt!89367)))) (and (= (currentBit!3156 (_2!2702 lt!89367)) #b00000000000000000000000000000000) (= (currentByte!3161 (_2!2702 lt!89367)) (size!1189 (buf!1561 (_2!2702 lt!89367))))))))))

(assert (=> b!56837 d!18114))

(declare-fun d!18116 () Bool)

(declare-fun res!47309 () Bool)

(declare-fun e!37815 () Bool)

(assert (=> d!18116 (=> (not res!47309) (not e!37815))))

(assert (=> d!18116 (= res!47309 (= (size!1189 (buf!1561 thiss!1379)) (size!1189 (buf!1561 (_2!2702 lt!89360)))))))

(assert (=> d!18116 (= (isPrefixOf!0 thiss!1379 (_2!2702 lt!89360)) e!37815)))

(declare-fun b!56885 () Bool)

(declare-fun res!47310 () Bool)

(assert (=> b!56885 (=> (not res!47310) (not e!37815))))

(assert (=> b!56885 (= res!47310 (bvsle (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)) (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360)))))))

(declare-fun b!56886 () Bool)

(declare-fun e!37816 () Bool)

(assert (=> b!56886 (= e!37815 e!37816)))

(declare-fun res!47308 () Bool)

(assert (=> b!56886 (=> res!47308 e!37816)))

(assert (=> b!56886 (= res!47308 (= (size!1189 (buf!1561 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56887 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2618 array!2618 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56887 (= e!37816 (arrayBitRangesEq!0 (buf!1561 thiss!1379) (buf!1561 (_2!2702 lt!89360)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379))))))

(assert (= (and d!18116 res!47309) b!56885))

(assert (= (and b!56885 res!47310) b!56886))

(assert (= (and b!56886 (not res!47308)) b!56887))

(assert (=> b!56885 m!89607))

(assert (=> b!56885 m!89645))

(assert (=> b!56887 m!89607))

(assert (=> b!56887 m!89607))

(declare-fun m!89663 () Bool)

(assert (=> b!56887 m!89663))

(assert (=> b!56842 d!18116))

(declare-fun d!18118 () Bool)

(assert (=> d!18118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4525 () Bool)

(assert (= bs!4525 d!18118))

(declare-fun m!89665 () Bool)

(assert (=> bs!4525 m!89665))

(assert (=> b!56842 d!18118))

(declare-fun d!18120 () Bool)

(declare-fun e!37819 () Bool)

(assert (=> d!18120 e!37819))

(declare-fun res!47313 () Bool)

(assert (=> d!18120 (=> (not res!47313) (not e!37819))))

(assert (=> d!18120 (= res!47313 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!89410 () Unit!3929)

(declare-fun choose!27 (BitStream!2066 BitStream!2066 (_ BitVec 64) (_ BitVec 64)) Unit!3929)

(assert (=> d!18120 (= lt!89410 (choose!27 thiss!1379 (_2!2702 lt!89360) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18120 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18120 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2702 lt!89360) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89410)))

(declare-fun b!56890 () Bool)

(assert (=> b!56890 (= e!37819 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18120 res!47313) b!56890))

(declare-fun m!89667 () Bool)

(assert (=> d!18120 m!89667))

(assert (=> b!56890 m!89629))

(assert (=> b!56842 d!18120))

(declare-fun b!56960 () Bool)

(declare-fun e!37855 () Bool)

(declare-fun e!37856 () Bool)

(assert (=> b!56960 (= e!37855 e!37856)))

(declare-fun res!47382 () Bool)

(assert (=> b!56960 (=> (not res!47382) (not e!37856))))

(declare-datatypes ((tuple2!5198 0))(
  ( (tuple2!5199 (_1!2710 BitStream!2066) (_2!2710 Bool)) )
))
(declare-fun lt!89557 () tuple2!5198)

(declare-fun lt!89559 () (_ BitVec 8))

(declare-fun lt!89558 () tuple2!5182)

(assert (=> b!56960 (= res!47382 (and (= (_2!2710 lt!89557) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1744 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!89559)) #b00000000000000000000000000000000))) (= (_1!2710 lt!89557) (_2!2702 lt!89558))))))

(declare-datatypes ((tuple2!5200 0))(
  ( (tuple2!5201 (_1!2711 array!2618) (_2!2711 BitStream!2066)) )
))
(declare-fun lt!89561 () tuple2!5200)

(declare-fun lt!89564 () BitStream!2066)

(declare-fun readBits!0 (BitStream!2066 (_ BitVec 64)) tuple2!5200)

(assert (=> b!56960 (= lt!89561 (readBits!0 lt!89564 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2066) tuple2!5198)

(assert (=> b!56960 (= lt!89557 (readBitPure!0 lt!89564))))

(declare-fun readerFrom!0 (BitStream!2066 (_ BitVec 32) (_ BitVec 32)) BitStream!2066)

(assert (=> b!56960 (= lt!89564 (readerFrom!0 (_2!2702 lt!89558) (currentBit!3156 thiss!1379) (currentByte!3161 thiss!1379)))))

(declare-fun b!56961 () Bool)

(declare-fun res!47378 () Bool)

(declare-fun e!37854 () Bool)

(assert (=> b!56961 (=> (not res!47378) (not e!37854))))

(declare-fun lt!89563 () tuple2!5182)

(assert (=> b!56961 (= res!47378 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89563))) (currentByte!3161 (_2!2702 lt!89563)) (currentBit!3156 (_2!2702 lt!89563))) (bvadd (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!56962 () Bool)

(assert (=> b!56962 (= e!37856 (= (bitIndex!0 (size!1189 (buf!1561 (_1!2710 lt!89557))) (currentByte!3161 (_1!2710 lt!89557)) (currentBit!3156 (_1!2710 lt!89557))) (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89558))) (currentByte!3161 (_2!2702 lt!89558)) (currentBit!3156 (_2!2702 lt!89558)))))))

(declare-fun b!56964 () Bool)

(declare-fun res!47379 () Bool)

(assert (=> b!56964 (=> (not res!47379) (not e!37855))))

(declare-fun lt!89566 () (_ BitVec 64))

(declare-fun lt!89556 () (_ BitVec 64))

(assert (=> b!56964 (= res!47379 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89558))) (currentByte!3161 (_2!2702 lt!89558)) (currentBit!3156 (_2!2702 lt!89558))) (bvadd lt!89566 lt!89556)))))

(assert (=> b!56964 (or (not (= (bvand lt!89566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89556 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89566 lt!89556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56964 (= lt!89556 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56964 (= lt!89566 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)))))

(declare-fun b!56965 () Bool)

(declare-fun res!47381 () Bool)

(assert (=> b!56965 (=> (not res!47381) (not e!37855))))

(assert (=> b!56965 (= res!47381 (isPrefixOf!0 thiss!1379 (_2!2702 lt!89558)))))

(declare-fun b!56966 () Bool)

(declare-fun e!37853 () Bool)

(declare-fun lt!89560 () tuple2!5198)

(assert (=> b!56966 (= e!37853 (= (bitIndex!0 (size!1189 (buf!1561 (_1!2710 lt!89560))) (currentByte!3161 (_1!2710 lt!89560)) (currentBit!3156 (_1!2710 lt!89560))) (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89563))) (currentByte!3161 (_2!2702 lt!89563)) (currentBit!3156 (_2!2702 lt!89563)))))))

(declare-fun b!56967 () Bool)

(assert (=> b!56967 (= e!37854 e!37853)))

(declare-fun res!47375 () Bool)

(assert (=> b!56967 (=> (not res!47375) (not e!37853))))

(declare-fun lt!89562 () Bool)

(assert (=> b!56967 (= res!47375 (and (= (_2!2710 lt!89560) lt!89562) (= (_1!2710 lt!89560) (_2!2702 lt!89563))))))

(assert (=> b!56967 (= lt!89560 (readBitPure!0 (readerFrom!0 (_2!2702 lt!89563) (currentBit!3156 thiss!1379) (currentByte!3161 thiss!1379))))))

(declare-fun d!18122 () Bool)

(assert (=> d!18122 e!37855))

(declare-fun res!47377 () Bool)

(assert (=> d!18122 (=> (not res!47377) (not e!37855))))

(assert (=> d!18122 (= res!47377 (= (size!1189 (buf!1561 (_2!2702 lt!89558))) (size!1189 (buf!1561 thiss!1379))))))

(declare-fun lt!89565 () array!2618)

(assert (=> d!18122 (= lt!89559 (select (arr!1744 lt!89565) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18122 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1189 lt!89565)))))

(assert (=> d!18122 (= lt!89565 (array!2619 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!89555 () tuple2!5182)

(assert (=> d!18122 (= lt!89558 (tuple2!5183 (_1!2702 lt!89555) (_2!2702 lt!89555)))))

(assert (=> d!18122 (= lt!89555 lt!89563)))

(assert (=> d!18122 e!37854))

(declare-fun res!47380 () Bool)

(assert (=> d!18122 (=> (not res!47380) (not e!37854))))

(assert (=> d!18122 (= res!47380 (= (size!1189 (buf!1561 thiss!1379)) (size!1189 (buf!1561 (_2!2702 lt!89563)))))))

(declare-fun appendBit!0 (BitStream!2066 Bool) tuple2!5182)

(assert (=> d!18122 (= lt!89563 (appendBit!0 thiss!1379 lt!89562))))

(assert (=> d!18122 (= lt!89562 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1744 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18122 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18122 (= (appendBitFromByte!0 thiss!1379 (select (arr!1744 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!89558)))

(declare-fun b!56963 () Bool)

(declare-fun res!47376 () Bool)

(assert (=> b!56963 (=> (not res!47376) (not e!37854))))

(assert (=> b!56963 (= res!47376 (isPrefixOf!0 thiss!1379 (_2!2702 lt!89563)))))

(assert (= (and d!18122 res!47380) b!56961))

(assert (= (and b!56961 res!47378) b!56963))

(assert (= (and b!56963 res!47376) b!56967))

(assert (= (and b!56967 res!47375) b!56966))

(assert (= (and d!18122 res!47377) b!56964))

(assert (= (and b!56964 res!47379) b!56965))

(assert (= (and b!56965 res!47381) b!56960))

(assert (= (and b!56960 res!47382) b!56962))

(declare-fun m!89733 () Bool)

(assert (=> b!56966 m!89733))

(declare-fun m!89735 () Bool)

(assert (=> b!56966 m!89735))

(declare-fun m!89737 () Bool)

(assert (=> b!56963 m!89737))

(declare-fun m!89739 () Bool)

(assert (=> b!56962 m!89739))

(declare-fun m!89741 () Bool)

(assert (=> b!56962 m!89741))

(declare-fun m!89743 () Bool)

(assert (=> d!18122 m!89743))

(declare-fun m!89745 () Bool)

(assert (=> d!18122 m!89745))

(declare-fun m!89747 () Bool)

(assert (=> d!18122 m!89747))

(assert (=> b!56961 m!89735))

(assert (=> b!56961 m!89607))

(declare-fun m!89749 () Bool)

(assert (=> b!56960 m!89749))

(declare-fun m!89751 () Bool)

(assert (=> b!56960 m!89751))

(declare-fun m!89753 () Bool)

(assert (=> b!56960 m!89753))

(declare-fun m!89755 () Bool)

(assert (=> b!56965 m!89755))

(assert (=> b!56964 m!89741))

(assert (=> b!56964 m!89607))

(declare-fun m!89757 () Bool)

(assert (=> b!56967 m!89757))

(assert (=> b!56967 m!89757))

(declare-fun m!89759 () Bool)

(assert (=> b!56967 m!89759))

(assert (=> b!56842 d!18122))

(declare-fun d!18138 () Bool)

(declare-fun e!37857 () Bool)

(assert (=> d!18138 e!37857))

(declare-fun res!47383 () Bool)

(assert (=> d!18138 (=> (not res!47383) (not e!37857))))

(declare-fun lt!89571 () (_ BitVec 64))

(declare-fun lt!89570 () (_ BitVec 64))

(declare-fun lt!89569 () (_ BitVec 64))

(assert (=> d!18138 (= res!47383 (= lt!89570 (bvsub lt!89569 lt!89571)))))

(assert (=> d!18138 (or (= (bvand lt!89569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89571 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89569 lt!89571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18138 (= lt!89571 (remainingBits!0 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360)))))))

(declare-fun lt!89572 () (_ BitVec 64))

(declare-fun lt!89567 () (_ BitVec 64))

(assert (=> d!18138 (= lt!89569 (bvmul lt!89572 lt!89567))))

(assert (=> d!18138 (or (= lt!89572 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89567 (bvsdiv (bvmul lt!89572 lt!89567) lt!89572)))))

(assert (=> d!18138 (= lt!89567 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18138 (= lt!89572 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))))))

(assert (=> d!18138 (= lt!89570 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360)))))))

(assert (=> d!18138 (invariant!0 (currentBit!3156 (_2!2702 lt!89360)) (currentByte!3161 (_2!2702 lt!89360)) (size!1189 (buf!1561 (_2!2702 lt!89360))))))

(assert (=> d!18138 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))) lt!89570)))

(declare-fun b!56968 () Bool)

(declare-fun res!47384 () Bool)

(assert (=> b!56968 (=> (not res!47384) (not e!37857))))

(assert (=> b!56968 (= res!47384 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89570))))

(declare-fun b!56969 () Bool)

(declare-fun lt!89568 () (_ BitVec 64))

(assert (=> b!56969 (= e!37857 (bvsle lt!89570 (bvmul lt!89568 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56969 (or (= lt!89568 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89568 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89568)))))

(assert (=> b!56969 (= lt!89568 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))))))

(assert (= (and d!18138 res!47383) b!56968))

(assert (= (and b!56968 res!47384) b!56969))

(assert (=> d!18138 m!89665))

(declare-fun m!89761 () Bool)

(assert (=> d!18138 m!89761))

(assert (=> b!56833 d!18138))

(declare-fun d!18140 () Bool)

(assert (=> d!18140 (= (array_inv!1092 srcBuffer!2) (bvsge (size!1189 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11482 d!18140))

(declare-fun d!18142 () Bool)

(assert (=> d!18142 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3156 thiss!1379) (currentByte!3161 thiss!1379) (size!1189 (buf!1561 thiss!1379))))))

(declare-fun bs!4528 () Bool)

(assert (= bs!4528 d!18142))

(declare-fun m!89763 () Bool)

(assert (=> bs!4528 m!89763))

(assert (=> start!11482 d!18142))

(declare-fun d!18144 () Bool)

(declare-fun res!47386 () Bool)

(declare-fun e!37858 () Bool)

(assert (=> d!18144 (=> (not res!47386) (not e!37858))))

(assert (=> d!18144 (= res!47386 (= (size!1189 (buf!1561 thiss!1379)) (size!1189 (buf!1561 thiss!1379))))))

(assert (=> d!18144 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37858)))

(declare-fun b!56970 () Bool)

(declare-fun res!47387 () Bool)

(assert (=> b!56970 (=> (not res!47387) (not e!37858))))

(assert (=> b!56970 (= res!47387 (bvsle (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)) (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379))))))

(declare-fun b!56971 () Bool)

(declare-fun e!37859 () Bool)

(assert (=> b!56971 (= e!37858 e!37859)))

(declare-fun res!47385 () Bool)

(assert (=> b!56971 (=> res!47385 e!37859)))

(assert (=> b!56971 (= res!47385 (= (size!1189 (buf!1561 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56972 () Bool)

(assert (=> b!56972 (= e!37859 (arrayBitRangesEq!0 (buf!1561 thiss!1379) (buf!1561 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379))))))

(assert (= (and d!18144 res!47386) b!56970))

(assert (= (and b!56970 res!47387) b!56971))

(assert (= (and b!56971 (not res!47385)) b!56972))

(assert (=> b!56970 m!89607))

(assert (=> b!56970 m!89607))

(assert (=> b!56972 m!89607))

(assert (=> b!56972 m!89607))

(declare-fun m!89765 () Bool)

(assert (=> b!56972 m!89765))

(assert (=> b!56838 d!18144))

(declare-fun d!18146 () Bool)

(assert (=> d!18146 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89575 () Unit!3929)

(declare-fun choose!11 (BitStream!2066) Unit!3929)

(assert (=> d!18146 (= lt!89575 (choose!11 thiss!1379))))

(assert (=> d!18146 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!89575)))

(declare-fun bs!4530 () Bool)

(assert (= bs!4530 d!18146))

(assert (=> bs!4530 m!89603))

(declare-fun m!89767 () Bool)

(assert (=> bs!4530 m!89767))

(assert (=> b!56838 d!18146))

(declare-fun d!18148 () Bool)

(declare-fun e!37860 () Bool)

(assert (=> d!18148 e!37860))

(declare-fun res!47388 () Bool)

(assert (=> d!18148 (=> (not res!47388) (not e!37860))))

(declare-fun lt!89580 () (_ BitVec 64))

(declare-fun lt!89578 () (_ BitVec 64))

(declare-fun lt!89579 () (_ BitVec 64))

(assert (=> d!18148 (= res!47388 (= lt!89579 (bvsub lt!89578 lt!89580)))))

(assert (=> d!18148 (or (= (bvand lt!89578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89580 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89578 lt!89580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18148 (= lt!89580 (remainingBits!0 ((_ sign_extend 32) (size!1189 (buf!1561 thiss!1379))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379))))))

(declare-fun lt!89581 () (_ BitVec 64))

(declare-fun lt!89576 () (_ BitVec 64))

(assert (=> d!18148 (= lt!89578 (bvmul lt!89581 lt!89576))))

(assert (=> d!18148 (or (= lt!89581 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89576 (bvsdiv (bvmul lt!89581 lt!89576) lt!89581)))))

(assert (=> d!18148 (= lt!89576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18148 (= lt!89581 ((_ sign_extend 32) (size!1189 (buf!1561 thiss!1379))))))

(assert (=> d!18148 (= lt!89579 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3161 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3156 thiss!1379))))))

(assert (=> d!18148 (invariant!0 (currentBit!3156 thiss!1379) (currentByte!3161 thiss!1379) (size!1189 (buf!1561 thiss!1379)))))

(assert (=> d!18148 (= (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)) lt!89579)))

(declare-fun b!56973 () Bool)

(declare-fun res!47389 () Bool)

(assert (=> b!56973 (=> (not res!47389) (not e!37860))))

(assert (=> b!56973 (= res!47389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89579))))

(declare-fun b!56974 () Bool)

(declare-fun lt!89577 () (_ BitVec 64))

(assert (=> b!56974 (= e!37860 (bvsle lt!89579 (bvmul lt!89577 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56974 (or (= lt!89577 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89577 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89577)))))

(assert (=> b!56974 (= lt!89577 ((_ sign_extend 32) (size!1189 (buf!1561 thiss!1379))))))

(assert (= (and d!18148 res!47388) b!56973))

(assert (= (and b!56973 res!47389) b!56974))

(declare-fun m!89769 () Bool)

(assert (=> d!18148 m!89769))

(assert (=> d!18148 m!89763))

(assert (=> b!56838 d!18148))

(declare-fun d!18150 () Bool)

(assert (=> d!18150 (= (array_inv!1092 (buf!1561 thiss!1379)) (bvsge (size!1189 (buf!1561 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!56839 d!18150))

(declare-fun e!37919 () Bool)

(declare-fun lt!90046 () tuple2!5182)

(declare-fun lt!90020 () tuple2!5184)

(declare-fun b!57102 () Bool)

(assert (=> b!57102 (= e!37919 (= (bitStreamReadBitsIntoList!0 (_2!2702 lt!90046) (_1!2703 lt!90020) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2702 lt!90046) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57102 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57102 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90027 () Unit!3929)

(declare-fun lt!90038 () Unit!3929)

(assert (=> b!57102 (= lt!90027 lt!90038)))

(declare-fun lt!90043 () (_ BitVec 64))

(assert (=> b!57102 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!90046)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) lt!90043)))

(assert (=> b!57102 (= lt!90038 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2702 lt!89360) (buf!1561 (_2!2702 lt!90046)) lt!90043))))

(declare-fun e!37918 () Bool)

(assert (=> b!57102 e!37918))

(declare-fun res!47478 () Bool)

(assert (=> b!57102 (=> (not res!47478) (not e!37918))))

(assert (=> b!57102 (= res!47478 (and (= (size!1189 (buf!1561 (_2!2702 lt!89360))) (size!1189 (buf!1561 (_2!2702 lt!90046)))) (bvsge lt!90043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57102 (= lt!90043 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57102 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57102 (= lt!90020 (reader!0 (_2!2702 lt!89360) (_2!2702 lt!90046)))))

(declare-fun b!57103 () Bool)

(declare-fun e!37920 () tuple2!5182)

(declare-fun Unit!3947 () Unit!3929)

(assert (=> b!57103 (= e!37920 (tuple2!5183 Unit!3947 (_2!2702 lt!89360)))))

(assert (=> b!57103 (= (size!1189 (buf!1561 (_2!2702 lt!89360))) (size!1189 (buf!1561 (_2!2702 lt!89360))))))

(declare-fun lt!90022 () Unit!3929)

(declare-fun Unit!3948 () Unit!3929)

(assert (=> b!57103 (= lt!90022 Unit!3948)))

(declare-fun call!744 () tuple2!5184)

(declare-fun checkByteArrayBitContent!0 (BitStream!2066 array!2618 array!2618 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57103 (checkByteArrayBitContent!0 (_2!2702 lt!89360) srcBuffer!2 (_1!2711 (readBits!0 (_1!2703 call!744) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!57104 () Bool)

(declare-fun res!47483 () Bool)

(assert (=> b!57104 (=> (not res!47483) (not e!37919))))

(assert (=> b!57104 (= res!47483 (invariant!0 (currentBit!3156 (_2!2702 lt!90046)) (currentByte!3161 (_2!2702 lt!90046)) (size!1189 (buf!1561 (_2!2702 lt!90046)))))))

(declare-fun b!57105 () Bool)

(declare-fun lt!90019 () tuple2!5182)

(declare-fun Unit!3949 () Unit!3929)

(assert (=> b!57105 (= e!37920 (tuple2!5183 Unit!3949 (_2!2702 lt!90019)))))

(declare-fun lt!90023 () tuple2!5182)

(assert (=> b!57105 (= lt!90023 (appendBitFromByte!0 (_2!2702 lt!89360) (select (arr!1744 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!90054 () (_ BitVec 64))

(assert (=> b!57105 (= lt!90054 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90052 () (_ BitVec 64))

(assert (=> b!57105 (= lt!90052 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90036 () Unit!3929)

(assert (=> b!57105 (= lt!90036 (validateOffsetBitsIneqLemma!0 (_2!2702 lt!89360) (_2!2702 lt!90023) lt!90054 lt!90052))))

(assert (=> b!57105 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!90023)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!90023))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!90023))) (bvsub lt!90054 lt!90052))))

(declare-fun lt!90044 () Unit!3929)

(assert (=> b!57105 (= lt!90044 lt!90036)))

(declare-fun lt!90032 () tuple2!5184)

(assert (=> b!57105 (= lt!90032 call!744)))

(declare-fun lt!90021 () (_ BitVec 64))

(assert (=> b!57105 (= lt!90021 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90033 () Unit!3929)

(assert (=> b!57105 (= lt!90033 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2702 lt!89360) (buf!1561 (_2!2702 lt!90023)) lt!90021))))

(assert (=> b!57105 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!90023)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) lt!90021)))

(declare-fun lt!90030 () Unit!3929)

(assert (=> b!57105 (= lt!90030 lt!90033)))

(assert (=> b!57105 (= (head!427 (byteArrayBitContentToList!0 (_2!2702 lt!90023) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!427 (bitStreamReadBitsIntoList!0 (_2!2702 lt!90023) (_1!2703 lt!90032) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90055 () Unit!3929)

(declare-fun Unit!3950 () Unit!3929)

(assert (=> b!57105 (= lt!90055 Unit!3950)))

(assert (=> b!57105 (= lt!90019 (appendBitsMSBFirstLoop!0 (_2!2702 lt!90023) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!90057 () Unit!3929)

(assert (=> b!57105 (= lt!90057 (lemmaIsPrefixTransitive!0 (_2!2702 lt!89360) (_2!2702 lt!90023) (_2!2702 lt!90019)))))

(assert (=> b!57105 (isPrefixOf!0 (_2!2702 lt!89360) (_2!2702 lt!90019))))

(declare-fun lt!90041 () Unit!3929)

(assert (=> b!57105 (= lt!90041 lt!90057)))

(assert (=> b!57105 (= (size!1189 (buf!1561 (_2!2702 lt!90019))) (size!1189 (buf!1561 (_2!2702 lt!89360))))))

(declare-fun lt!90042 () Unit!3929)

(declare-fun Unit!3951 () Unit!3929)

(assert (=> b!57105 (= lt!90042 Unit!3951)))

(assert (=> b!57105 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!90019))) (currentByte!3161 (_2!2702 lt!90019)) (currentBit!3156 (_2!2702 lt!90019))) (bvsub (bvadd (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90053 () Unit!3929)

(declare-fun Unit!3952 () Unit!3929)

(assert (=> b!57105 (= lt!90053 Unit!3952)))

(assert (=> b!57105 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!90019))) (currentByte!3161 (_2!2702 lt!90019)) (currentBit!3156 (_2!2702 lt!90019))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!90023))) (currentByte!3161 (_2!2702 lt!90023)) (currentBit!3156 (_2!2702 lt!90023))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90024 () Unit!3929)

(declare-fun Unit!3953 () Unit!3929)

(assert (=> b!57105 (= lt!90024 Unit!3953)))

(declare-fun lt!90026 () tuple2!5184)

(assert (=> b!57105 (= lt!90026 (reader!0 (_2!2702 lt!89360) (_2!2702 lt!90019)))))

(declare-fun lt!90062 () (_ BitVec 64))

(assert (=> b!57105 (= lt!90062 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90031 () Unit!3929)

(assert (=> b!57105 (= lt!90031 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2702 lt!89360) (buf!1561 (_2!2702 lt!90019)) lt!90062))))

(assert (=> b!57105 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!90019)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) lt!90062)))

(declare-fun lt!90045 () Unit!3929)

(assert (=> b!57105 (= lt!90045 lt!90031)))

(declare-fun lt!90049 () tuple2!5184)

(assert (=> b!57105 (= lt!90049 (reader!0 (_2!2702 lt!90023) (_2!2702 lt!90019)))))

(declare-fun lt!90037 () (_ BitVec 64))

(assert (=> b!57105 (= lt!90037 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90025 () Unit!3929)

(assert (=> b!57105 (= lt!90025 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2702 lt!90023) (buf!1561 (_2!2702 lt!90019)) lt!90037))))

(assert (=> b!57105 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!90019)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!90023))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!90023))) lt!90037)))

(declare-fun lt!90034 () Unit!3929)

(assert (=> b!57105 (= lt!90034 lt!90025)))

(declare-fun lt!90040 () List!608)

(assert (=> b!57105 (= lt!90040 (byteArrayBitContentToList!0 (_2!2702 lt!90019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90058 () List!608)

(assert (=> b!57105 (= lt!90058 (byteArrayBitContentToList!0 (_2!2702 lt!90019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90056 () List!608)

(assert (=> b!57105 (= lt!90056 (bitStreamReadBitsIntoList!0 (_2!2702 lt!90019) (_1!2703 lt!90026) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90029 () List!608)

(assert (=> b!57105 (= lt!90029 (bitStreamReadBitsIntoList!0 (_2!2702 lt!90019) (_1!2703 lt!90049) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90047 () (_ BitVec 64))

(assert (=> b!57105 (= lt!90047 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90028 () Unit!3929)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2066 BitStream!2066 BitStream!2066 BitStream!2066 (_ BitVec 64) List!608) Unit!3929)

(assert (=> b!57105 (= lt!90028 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2702 lt!90019) (_2!2702 lt!90019) (_1!2703 lt!90026) (_1!2703 lt!90049) lt!90047 lt!90056))))

(declare-fun tail!275 (List!608) List!608)

(assert (=> b!57105 (= (bitStreamReadBitsIntoList!0 (_2!2702 lt!90019) (_1!2703 lt!90049) (bvsub lt!90047 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!275 lt!90056))))

(declare-fun lt!90060 () Unit!3929)

(assert (=> b!57105 (= lt!90060 lt!90028)))

(declare-fun lt!90050 () (_ BitVec 64))

(declare-fun lt!90039 () Unit!3929)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2618 array!2618 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3929)

(assert (=> b!57105 (= lt!90039 (arrayBitRangesEqImpliesEq!0 (buf!1561 (_2!2702 lt!90023)) (buf!1561 (_2!2702 lt!90019)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!90050 (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!90023))) (currentByte!3161 (_2!2702 lt!90023)) (currentBit!3156 (_2!2702 lt!90023)))))))

(declare-fun bitAt!0 (array!2618 (_ BitVec 64)) Bool)

(assert (=> b!57105 (= (bitAt!0 (buf!1561 (_2!2702 lt!90023)) lt!90050) (bitAt!0 (buf!1561 (_2!2702 lt!90019)) lt!90050))))

(declare-fun lt!90061 () Unit!3929)

(assert (=> b!57105 (= lt!90061 lt!90039)))

(declare-fun b!57106 () Bool)

(declare-fun res!47481 () Bool)

(assert (=> b!57106 (=> (not res!47481) (not e!37919))))

(assert (=> b!57106 (= res!47481 (= (size!1189 (buf!1561 (_2!2702 lt!89360))) (size!1189 (buf!1561 (_2!2702 lt!90046)))))))

(declare-fun b!57107 () Bool)

(declare-fun res!47479 () Bool)

(assert (=> b!57107 (=> (not res!47479) (not e!37919))))

(assert (=> b!57107 (= res!47479 (= (size!1189 (buf!1561 (_2!2702 lt!90046))) (size!1189 (buf!1561 (_2!2702 lt!89360)))))))

(declare-fun bm!741 () Bool)

(declare-fun c!4115 () Bool)

(assert (=> bm!741 (= call!744 (reader!0 (_2!2702 lt!89360) (ite c!4115 (_2!2702 lt!90023) (_2!2702 lt!89360))))))

(declare-fun d!18152 () Bool)

(assert (=> d!18152 e!37919))

(declare-fun res!47480 () Bool)

(assert (=> d!18152 (=> (not res!47480) (not e!37919))))

(declare-fun lt!90051 () (_ BitVec 64))

(assert (=> d!18152 (= res!47480 (= (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!90046))) (currentByte!3161 (_2!2702 lt!90046)) (currentBit!3156 (_2!2702 lt!90046))) (bvsub lt!90051 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18152 (or (= (bvand lt!90051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90051 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90035 () (_ BitVec 64))

(assert (=> d!18152 (= lt!90051 (bvadd lt!90035 to!314))))

(assert (=> d!18152 (or (not (= (bvand lt!90035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90035 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18152 (= lt!90035 (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))))))

(assert (=> d!18152 (= lt!90046 e!37920)))

(assert (=> d!18152 (= c!4115 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!90059 () Unit!3929)

(declare-fun lt!90048 () Unit!3929)

(assert (=> d!18152 (= lt!90059 lt!90048)))

(assert (=> d!18152 (isPrefixOf!0 (_2!2702 lt!89360) (_2!2702 lt!89360))))

(assert (=> d!18152 (= lt!90048 (lemmaIsPrefixRefl!0 (_2!2702 lt!89360)))))

(assert (=> d!18152 (= lt!90050 (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))))))

(assert (=> d!18152 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18152 (= (appendBitsMSBFirstLoop!0 (_2!2702 lt!89360) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!90046)))

(declare-fun b!57108 () Bool)

(declare-fun res!47482 () Bool)

(assert (=> b!57108 (=> (not res!47482) (not e!37919))))

(assert (=> b!57108 (= res!47482 (isPrefixOf!0 (_2!2702 lt!89360) (_2!2702 lt!90046)))))

(declare-fun b!57109 () Bool)

(assert (=> b!57109 (= e!37918 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 (_2!2702 lt!89360))) ((_ sign_extend 32) (currentBit!3156 (_2!2702 lt!89360))) lt!90043))))

(assert (= (and d!18152 c!4115) b!57105))

(assert (= (and d!18152 (not c!4115)) b!57103))

(assert (= (or b!57105 b!57103) bm!741))

(assert (= (and d!18152 res!47480) b!57104))

(assert (= (and b!57104 res!47483) b!57106))

(assert (= (and b!57106 res!47481) b!57108))

(assert (= (and b!57108 res!47482) b!57107))

(assert (= (and b!57107 res!47479) b!57102))

(assert (= (and b!57102 res!47478) b!57109))

(declare-fun m!89941 () Bool)

(assert (=> b!57105 m!89941))

(declare-fun m!89943 () Bool)

(assert (=> b!57105 m!89943))

(declare-fun m!89945 () Bool)

(assert (=> b!57105 m!89945))

(declare-fun m!89947 () Bool)

(assert (=> b!57105 m!89947))

(assert (=> b!57105 m!89645))

(declare-fun m!89949 () Bool)

(assert (=> b!57105 m!89949))

(declare-fun m!89951 () Bool)

(assert (=> b!57105 m!89951))

(declare-fun m!89953 () Bool)

(assert (=> b!57105 m!89953))

(declare-fun m!89955 () Bool)

(assert (=> b!57105 m!89955))

(declare-fun m!89957 () Bool)

(assert (=> b!57105 m!89957))

(declare-fun m!89959 () Bool)

(assert (=> b!57105 m!89959))

(declare-fun m!89961 () Bool)

(assert (=> b!57105 m!89961))

(declare-fun m!89963 () Bool)

(assert (=> b!57105 m!89963))

(declare-fun m!89965 () Bool)

(assert (=> b!57105 m!89965))

(declare-fun m!89967 () Bool)

(assert (=> b!57105 m!89967))

(declare-fun m!89969 () Bool)

(assert (=> b!57105 m!89969))

(declare-fun m!89971 () Bool)

(assert (=> b!57105 m!89971))

(assert (=> b!57105 m!89955))

(declare-fun m!89973 () Bool)

(assert (=> b!57105 m!89973))

(declare-fun m!89975 () Bool)

(assert (=> b!57105 m!89975))

(assert (=> b!57105 m!89953))

(declare-fun m!89977 () Bool)

(assert (=> b!57105 m!89977))

(declare-fun m!89979 () Bool)

(assert (=> b!57105 m!89979))

(declare-fun m!89981 () Bool)

(assert (=> b!57105 m!89981))

(declare-fun m!89983 () Bool)

(assert (=> b!57105 m!89983))

(declare-fun m!89985 () Bool)

(assert (=> b!57105 m!89985))

(declare-fun m!89987 () Bool)

(assert (=> b!57105 m!89987))

(declare-fun m!89989 () Bool)

(assert (=> b!57105 m!89989))

(declare-fun m!89991 () Bool)

(assert (=> b!57105 m!89991))

(declare-fun m!89993 () Bool)

(assert (=> b!57105 m!89993))

(declare-fun m!89995 () Bool)

(assert (=> b!57105 m!89995))

(declare-fun m!89997 () Bool)

(assert (=> b!57105 m!89997))

(assert (=> b!57105 m!89975))

(declare-fun m!89999 () Bool)

(assert (=> b!57105 m!89999))

(declare-fun m!90001 () Bool)

(assert (=> b!57105 m!90001))

(assert (=> b!57105 m!89941))

(declare-fun m!90003 () Bool)

(assert (=> b!57104 m!90003))

(declare-fun m!90005 () Bool)

(assert (=> d!18152 m!90005))

(assert (=> d!18152 m!89645))

(declare-fun m!90007 () Bool)

(assert (=> d!18152 m!90007))

(declare-fun m!90009 () Bool)

(assert (=> d!18152 m!90009))

(declare-fun m!90011 () Bool)

(assert (=> b!57102 m!90011))

(declare-fun m!90013 () Bool)

(assert (=> b!57102 m!90013))

(declare-fun m!90015 () Bool)

(assert (=> b!57102 m!90015))

(declare-fun m!90017 () Bool)

(assert (=> b!57102 m!90017))

(declare-fun m!90019 () Bool)

(assert (=> b!57102 m!90019))

(declare-fun m!90021 () Bool)

(assert (=> b!57103 m!90021))

(declare-fun m!90023 () Bool)

(assert (=> b!57103 m!90023))

(declare-fun m!90025 () Bool)

(assert (=> b!57108 m!90025))

(declare-fun m!90027 () Bool)

(assert (=> bm!741 m!90027))

(declare-fun m!90029 () Bool)

(assert (=> b!57109 m!90029))

(assert (=> b!56835 d!18152))

(declare-fun d!18196 () Bool)

(assert (=> d!18196 (isPrefixOf!0 thiss!1379 (_2!2702 lt!89367))))

(declare-fun lt!90065 () Unit!3929)

(declare-fun choose!30 (BitStream!2066 BitStream!2066 BitStream!2066) Unit!3929)

(assert (=> d!18196 (= lt!90065 (choose!30 thiss!1379 (_2!2702 lt!89360) (_2!2702 lt!89367)))))

(assert (=> d!18196 (isPrefixOf!0 thiss!1379 (_2!2702 lt!89360))))

(assert (=> d!18196 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2702 lt!89360) (_2!2702 lt!89367)) lt!90065)))

(declare-fun bs!4539 () Bool)

(assert (= bs!4539 d!18196))

(assert (=> bs!4539 m!89617))

(declare-fun m!90031 () Bool)

(assert (=> bs!4539 m!90031))

(assert (=> bs!4539 m!89627))

(assert (=> b!56835 d!18196))

(declare-fun d!18198 () Bool)

(assert (=> d!18198 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4540 () Bool)

(assert (= bs!4540 d!18198))

(declare-fun m!90033 () Bool)

(assert (=> bs!4540 m!90033))

(assert (=> b!56835 d!18198))

(declare-fun d!18200 () Bool)

(assert (=> d!18200 (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 (_2!2702 lt!89360)))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90112 () Unit!3929)

(declare-fun choose!9 (BitStream!2066 array!2618 (_ BitVec 64) BitStream!2066) Unit!3929)

(assert (=> d!18200 (= lt!90112 (choose!9 thiss!1379 (buf!1561 (_2!2702 lt!89360)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2067 (buf!1561 (_2!2702 lt!89360)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379))))))

(assert (=> d!18200 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1561 (_2!2702 lt!89360)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90112)))

(declare-fun bs!4541 () Bool)

(assert (= bs!4541 d!18200))

(assert (=> bs!4541 m!89615))

(declare-fun m!90035 () Bool)

(assert (=> bs!4541 m!90035))

(assert (=> b!56835 d!18200))

(declare-fun b!57153 () Bool)

(declare-fun e!37941 () Unit!3929)

(declare-fun lt!90180 () Unit!3929)

(assert (=> b!57153 (= e!37941 lt!90180)))

(declare-fun lt!90182 () (_ BitVec 64))

(assert (=> b!57153 (= lt!90182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90178 () (_ BitVec 64))

(assert (=> b!57153 (= lt!90178 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2618 array!2618 (_ BitVec 64) (_ BitVec 64)) Unit!3929)

(assert (=> b!57153 (= lt!90180 (arrayBitRangesEqSymmetric!0 (buf!1561 thiss!1379) (buf!1561 (_2!2702 lt!89360)) lt!90182 lt!90178))))

(assert (=> b!57153 (arrayBitRangesEq!0 (buf!1561 (_2!2702 lt!89360)) (buf!1561 thiss!1379) lt!90182 lt!90178)))

(declare-fun e!37942 () Bool)

(declare-fun lt!90183 () tuple2!5184)

(declare-fun lt!90177 () (_ BitVec 64))

(declare-fun b!57154 () Bool)

(declare-fun lt!90189 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2066 (_ BitVec 64)) BitStream!2066)

(assert (=> b!57154 (= e!37942 (= (_1!2703 lt!90183) (withMovedBitIndex!0 (_2!2703 lt!90183) (bvsub lt!90189 lt!90177))))))

(assert (=> b!57154 (or (= (bvand lt!90189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90177 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90189 lt!90177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57154 (= lt!90177 (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))))))

(assert (=> b!57154 (= lt!90189 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)))))

(declare-fun b!57155 () Bool)

(declare-fun res!47504 () Bool)

(assert (=> b!57155 (=> (not res!47504) (not e!37942))))

(assert (=> b!57155 (= res!47504 (isPrefixOf!0 (_2!2703 lt!90183) (_2!2702 lt!89360)))))

(declare-fun b!57156 () Bool)

(declare-fun Unit!3954 () Unit!3929)

(assert (=> b!57156 (= e!37941 Unit!3954)))

(declare-fun d!18202 () Bool)

(assert (=> d!18202 e!37942))

(declare-fun res!47503 () Bool)

(assert (=> d!18202 (=> (not res!47503) (not e!37942))))

(assert (=> d!18202 (= res!47503 (isPrefixOf!0 (_1!2703 lt!90183) (_2!2703 lt!90183)))))

(declare-fun lt!90188 () BitStream!2066)

(assert (=> d!18202 (= lt!90183 (tuple2!5185 lt!90188 (_2!2702 lt!89360)))))

(declare-fun lt!90186 () Unit!3929)

(declare-fun lt!90194 () Unit!3929)

(assert (=> d!18202 (= lt!90186 lt!90194)))

(assert (=> d!18202 (isPrefixOf!0 lt!90188 (_2!2702 lt!89360))))

(assert (=> d!18202 (= lt!90194 (lemmaIsPrefixTransitive!0 lt!90188 (_2!2702 lt!89360) (_2!2702 lt!89360)))))

(declare-fun lt!90187 () Unit!3929)

(declare-fun lt!90191 () Unit!3929)

(assert (=> d!18202 (= lt!90187 lt!90191)))

(assert (=> d!18202 (isPrefixOf!0 lt!90188 (_2!2702 lt!89360))))

(assert (=> d!18202 (= lt!90191 (lemmaIsPrefixTransitive!0 lt!90188 thiss!1379 (_2!2702 lt!89360)))))

(declare-fun lt!90195 () Unit!3929)

(assert (=> d!18202 (= lt!90195 e!37941)))

(declare-fun c!4128 () Bool)

(assert (=> d!18202 (= c!4128 (not (= (size!1189 (buf!1561 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!90190 () Unit!3929)

(declare-fun lt!90185 () Unit!3929)

(assert (=> d!18202 (= lt!90190 lt!90185)))

(assert (=> d!18202 (isPrefixOf!0 (_2!2702 lt!89360) (_2!2702 lt!89360))))

(assert (=> d!18202 (= lt!90185 (lemmaIsPrefixRefl!0 (_2!2702 lt!89360)))))

(declare-fun lt!90196 () Unit!3929)

(declare-fun lt!90184 () Unit!3929)

(assert (=> d!18202 (= lt!90196 lt!90184)))

(assert (=> d!18202 (= lt!90184 (lemmaIsPrefixRefl!0 (_2!2702 lt!89360)))))

(declare-fun lt!90192 () Unit!3929)

(declare-fun lt!90179 () Unit!3929)

(assert (=> d!18202 (= lt!90192 lt!90179)))

(assert (=> d!18202 (isPrefixOf!0 lt!90188 lt!90188)))

(assert (=> d!18202 (= lt!90179 (lemmaIsPrefixRefl!0 lt!90188))))

(declare-fun lt!90193 () Unit!3929)

(declare-fun lt!90181 () Unit!3929)

(assert (=> d!18202 (= lt!90193 lt!90181)))

(assert (=> d!18202 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18202 (= lt!90181 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18202 (= lt!90188 (BitStream!2067 (buf!1561 (_2!2702 lt!89360)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)))))

(assert (=> d!18202 (isPrefixOf!0 thiss!1379 (_2!2702 lt!89360))))

(assert (=> d!18202 (= (reader!0 thiss!1379 (_2!2702 lt!89360)) lt!90183)))

(declare-fun b!57157 () Bool)

(declare-fun res!47505 () Bool)

(assert (=> b!57157 (=> (not res!47505) (not e!37942))))

(assert (=> b!57157 (= res!47505 (isPrefixOf!0 (_1!2703 lt!90183) thiss!1379))))

(assert (= (and d!18202 c!4128) b!57153))

(assert (= (and d!18202 (not c!4128)) b!57156))

(assert (= (and d!18202 res!47503) b!57157))

(assert (= (and b!57157 res!47505) b!57155))

(assert (= (and b!57155 res!47504) b!57154))

(declare-fun m!90145 () Bool)

(assert (=> b!57157 m!90145))

(declare-fun m!90147 () Bool)

(assert (=> b!57154 m!90147))

(assert (=> b!57154 m!89645))

(assert (=> b!57154 m!89607))

(declare-fun m!90149 () Bool)

(assert (=> b!57155 m!90149))

(declare-fun m!90151 () Bool)

(assert (=> d!18202 m!90151))

(declare-fun m!90153 () Bool)

(assert (=> d!18202 m!90153))

(declare-fun m!90155 () Bool)

(assert (=> d!18202 m!90155))

(declare-fun m!90157 () Bool)

(assert (=> d!18202 m!90157))

(declare-fun m!90159 () Bool)

(assert (=> d!18202 m!90159))

(assert (=> d!18202 m!89627))

(assert (=> d!18202 m!89603))

(declare-fun m!90161 () Bool)

(assert (=> d!18202 m!90161))

(assert (=> d!18202 m!89605))

(assert (=> d!18202 m!90007))

(assert (=> d!18202 m!90009))

(assert (=> b!57153 m!89607))

(declare-fun m!90163 () Bool)

(assert (=> b!57153 m!90163))

(declare-fun m!90165 () Bool)

(assert (=> b!57153 m!90165))

(assert (=> b!56835 d!18202))

(declare-fun d!18232 () Bool)

(declare-fun res!47507 () Bool)

(declare-fun e!37943 () Bool)

(assert (=> d!18232 (=> (not res!47507) (not e!37943))))

(assert (=> d!18232 (= res!47507 (= (size!1189 (buf!1561 thiss!1379)) (size!1189 (buf!1561 (_2!2702 lt!89367)))))))

(assert (=> d!18232 (= (isPrefixOf!0 thiss!1379 (_2!2702 lt!89367)) e!37943)))

(declare-fun b!57158 () Bool)

(declare-fun res!47508 () Bool)

(assert (=> b!57158 (=> (not res!47508) (not e!37943))))

(assert (=> b!57158 (= res!47508 (bvsle (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379)) (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89367))) (currentByte!3161 (_2!2702 lt!89367)) (currentBit!3156 (_2!2702 lt!89367)))))))

(declare-fun b!57159 () Bool)

(declare-fun e!37944 () Bool)

(assert (=> b!57159 (= e!37943 e!37944)))

(declare-fun res!47506 () Bool)

(assert (=> b!57159 (=> res!47506 e!37944)))

(assert (=> b!57159 (= res!47506 (= (size!1189 (buf!1561 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57160 () Bool)

(assert (=> b!57160 (= e!37944 (arrayBitRangesEq!0 (buf!1561 thiss!1379) (buf!1561 (_2!2702 lt!89367)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1189 (buf!1561 thiss!1379)) (currentByte!3161 thiss!1379) (currentBit!3156 thiss!1379))))))

(assert (= (and d!18232 res!47507) b!57158))

(assert (= (and b!57158 res!47508) b!57159))

(assert (= (and b!57159 (not res!47506)) b!57160))

(assert (=> b!57158 m!89607))

(assert (=> b!57158 m!89643))

(assert (=> b!57160 m!89607))

(assert (=> b!57160 m!89607))

(declare-fun m!90167 () Bool)

(assert (=> b!57160 m!90167))

(assert (=> b!56835 d!18232))

(declare-fun d!18234 () Bool)

(declare-fun res!47510 () Bool)

(declare-fun e!37945 () Bool)

(assert (=> d!18234 (=> (not res!47510) (not e!37945))))

(assert (=> d!18234 (= res!47510 (= (size!1189 (buf!1561 (_2!2702 lt!89360))) (size!1189 (buf!1561 (_2!2702 lt!89367)))))))

(assert (=> d!18234 (= (isPrefixOf!0 (_2!2702 lt!89360) (_2!2702 lt!89367)) e!37945)))

(declare-fun b!57161 () Bool)

(declare-fun res!47511 () Bool)

(assert (=> b!57161 (=> (not res!47511) (not e!37945))))

(assert (=> b!57161 (= res!47511 (bvsle (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360))) (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89367))) (currentByte!3161 (_2!2702 lt!89367)) (currentBit!3156 (_2!2702 lt!89367)))))))

(declare-fun b!57162 () Bool)

(declare-fun e!37946 () Bool)

(assert (=> b!57162 (= e!37945 e!37946)))

(declare-fun res!47509 () Bool)

(assert (=> b!57162 (=> res!47509 e!37946)))

(assert (=> b!57162 (= res!47509 (= (size!1189 (buf!1561 (_2!2702 lt!89360))) #b00000000000000000000000000000000))))

(declare-fun b!57163 () Bool)

(assert (=> b!57163 (= e!37946 (arrayBitRangesEq!0 (buf!1561 (_2!2702 lt!89360)) (buf!1561 (_2!2702 lt!89367)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1189 (buf!1561 (_2!2702 lt!89360))) (currentByte!3161 (_2!2702 lt!89360)) (currentBit!3156 (_2!2702 lt!89360)))))))

(assert (= (and d!18234 res!47510) b!57161))

(assert (= (and b!57161 res!47511) b!57162))

(assert (= (and b!57162 (not res!47509)) b!57163))

(assert (=> b!57161 m!89645))

(assert (=> b!57161 m!89643))

(assert (=> b!57163 m!89645))

(assert (=> b!57163 m!89645))

(declare-fun m!90169 () Bool)

(assert (=> b!57163 m!90169))

(assert (=> b!56835 d!18234))

(declare-fun d!18236 () Bool)

(assert (=> d!18236 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1189 (buf!1561 thiss!1379))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1189 (buf!1561 thiss!1379))) ((_ sign_extend 32) (currentByte!3161 thiss!1379)) ((_ sign_extend 32) (currentBit!3156 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4547 () Bool)

(assert (= bs!4547 d!18236))

(assert (=> bs!4547 m!89769))

(assert (=> b!56840 d!18236))

(declare-fun d!18238 () Bool)

(assert (=> d!18238 (= (head!427 (byteArrayBitContentToList!0 (_2!2702 lt!89360) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!723 (byteArrayBitContentToList!0 (_2!2702 lt!89360) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56841 d!18238))

(declare-fun d!18240 () Bool)

(declare-fun c!4131 () Bool)

(assert (=> d!18240 (= c!4131 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37949 () List!608)

(assert (=> d!18240 (= (byteArrayBitContentToList!0 (_2!2702 lt!89360) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37949)))

(declare-fun b!57168 () Bool)

(assert (=> b!57168 (= e!37949 Nil!605)))

(declare-fun b!57169 () Bool)

(assert (=> b!57169 (= e!37949 (Cons!604 (not (= (bvand ((_ sign_extend 24) (select (arr!1744 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2702 lt!89360) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18240 c!4131) b!57168))

(assert (= (and d!18240 (not c!4131)) b!57169))

(assert (=> b!57169 m!89625))

(assert (=> b!57169 m!89747))

(declare-fun m!90171 () Bool)

(assert (=> b!57169 m!90171))

(assert (=> b!56841 d!18240))

(declare-fun d!18242 () Bool)

(assert (=> d!18242 (= (head!427 (bitStreamReadBitsIntoList!0 (_2!2702 lt!89360) (_1!2703 lt!89362) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!723 (bitStreamReadBitsIntoList!0 (_2!2702 lt!89360) (_1!2703 lt!89362) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56841 d!18242))

(declare-datatypes ((tuple2!5206 0))(
  ( (tuple2!5207 (_1!2714 Bool) (_2!2714 BitStream!2066)) )
))
(declare-fun lt!90205 () tuple2!5206)

(declare-fun b!57179 () Bool)

(declare-fun lt!90204 () (_ BitVec 64))

(declare-datatypes ((tuple2!5208 0))(
  ( (tuple2!5209 (_1!2715 List!608) (_2!2715 BitStream!2066)) )
))
(declare-fun e!37954 () tuple2!5208)

(assert (=> b!57179 (= e!37954 (tuple2!5209 (Cons!604 (_1!2714 lt!90205) (bitStreamReadBitsIntoList!0 (_2!2702 lt!89360) (_2!2714 lt!90205) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!90204))) (_2!2714 lt!90205)))))

(declare-fun readBit!0 (BitStream!2066) tuple2!5206)

(assert (=> b!57179 (= lt!90205 (readBit!0 (_1!2703 lt!89362)))))

(assert (=> b!57179 (= lt!90204 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57178 () Bool)

(assert (=> b!57178 (= e!37954 (tuple2!5209 Nil!605 (_1!2703 lt!89362)))))

(declare-fun b!57180 () Bool)

(declare-fun e!37955 () Bool)

(declare-fun lt!90203 () List!608)

(declare-fun isEmpty!173 (List!608) Bool)

(assert (=> b!57180 (= e!37955 (isEmpty!173 lt!90203))))

(declare-fun b!57181 () Bool)

(declare-fun length!287 (List!608) Int)

(assert (=> b!57181 (= e!37955 (> (length!287 lt!90203) 0))))

(declare-fun d!18244 () Bool)

(assert (=> d!18244 e!37955))

(declare-fun c!4136 () Bool)

(assert (=> d!18244 (= c!4136 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18244 (= lt!90203 (_1!2715 e!37954))))

(declare-fun c!4137 () Bool)

(assert (=> d!18244 (= c!4137 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18244 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18244 (= (bitStreamReadBitsIntoList!0 (_2!2702 lt!89360) (_1!2703 lt!89362) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90203)))

(assert (= (and d!18244 c!4137) b!57178))

(assert (= (and d!18244 (not c!4137)) b!57179))

(assert (= (and d!18244 c!4136) b!57180))

(assert (= (and d!18244 (not c!4136)) b!57181))

(declare-fun m!90173 () Bool)

(assert (=> b!57179 m!90173))

(declare-fun m!90175 () Bool)

(assert (=> b!57179 m!90175))

(declare-fun m!90177 () Bool)

(assert (=> b!57180 m!90177))

(declare-fun m!90179 () Bool)

(assert (=> b!57181 m!90179))

(assert (=> b!56841 d!18244))

(push 1)

(assert (not b!56967))

(assert (not b!56972))

(assert (not d!18122))

(assert (not d!18236))

(assert (not b!57181))

(assert (not b!56964))

(assert (not b!57155))

(assert (not bm!741))

(assert (not d!18146))

(assert (not b!57161))

(assert (not b!56962))

(assert (not b!57153))

(assert (not b!57102))

(assert (not d!18200))

(assert (not b!56890))

(assert (not d!18198))

(assert (not b!57160))

(assert (not b!57180))

(assert (not b!56965))

(assert (not b!56887))

(assert (not b!57109))

(assert (not d!18120))

(assert (not b!57154))

(assert (not b!57157))

(assert (not b!57158))

(assert (not b!56963))

(assert (not d!18196))

(assert (not b!57105))

(assert (not b!56966))

(assert (not b!57163))

(assert (not b!57179))

(assert (not d!18112))

(assert (not b!57108))

(assert (not d!18152))

(assert (not d!18142))

(assert (not b!57104))

(assert (not b!57103))

(assert (not d!18138))

(assert (not d!18202))

(assert (not d!18118))

(assert (not b!56885))

(assert (not b!56960))

(assert (not b!57169))

(assert (not b!56970))

(assert (not d!18148))

(assert (not b!56961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

