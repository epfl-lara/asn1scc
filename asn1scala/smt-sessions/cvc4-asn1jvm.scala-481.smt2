; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14110 () Bool)

(assert start!14110)

(declare-fun b!73544 () Bool)

(declare-fun res!60827 () Bool)

(declare-fun e!48059 () Bool)

(assert (=> b!73544 (=> res!60827 e!48059)))

(declare-datatypes ((List!764 0))(
  ( (Nil!761) (Cons!760 (h!879 Bool) (t!1514 List!764)) )
))
(declare-fun lt!118227 () List!764)

(declare-fun lt!118218 () Bool)

(declare-fun head!583 (List!764) Bool)

(assert (=> b!73544 (= res!60827 (not (= (head!583 lt!118227) lt!118218)))))

(declare-fun b!73545 () Bool)

(declare-fun e!48072 () Bool)

(declare-fun e!48067 () Bool)

(assert (=> b!73545 (= e!48072 e!48067)))

(declare-fun res!60832 () Bool)

(assert (=> b!73545 (=> res!60832 e!48067)))

(declare-datatypes ((array!2993 0))(
  ( (array!2994 (arr!1990 (Array (_ BitVec 32) (_ BitVec 8))) (size!1399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2378 0))(
  ( (BitStream!2379 (buf!1780 array!2993) (currentByte!3506 (_ BitVec 32)) (currentBit!3501 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4851 0))(
  ( (Unit!4852) )
))
(declare-datatypes ((tuple2!6366 0))(
  ( (tuple2!6367 (_1!3297 Unit!4851) (_2!3297 BitStream!2378)) )
))
(declare-fun lt!118230 () tuple2!6366)

(declare-fun lt!118217 () tuple2!6366)

(assert (=> b!73545 (= res!60832 (not (= (size!1399 (buf!1780 (_2!3297 lt!118230))) (size!1399 (buf!1780 (_2!3297 lt!118217))))))))

(declare-fun lt!118213 () (_ BitVec 64))

(declare-fun lt!118211 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!73545 (= lt!118213 (bvsub (bvsub (bvadd lt!118211 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!73545 (= lt!118211 (bitIndex!0 (size!1399 (buf!1780 (_2!3297 lt!118230))) (currentByte!3506 (_2!3297 lt!118230)) (currentBit!3501 (_2!3297 lt!118230))))))

(declare-fun thiss!1379 () BitStream!2378)

(assert (=> b!73545 (= (size!1399 (buf!1780 (_2!3297 lt!118217))) (size!1399 (buf!1780 thiss!1379)))))

(declare-fun b!73546 () Bool)

(declare-fun e!48064 () Bool)

(declare-fun e!48062 () Bool)

(assert (=> b!73546 (= e!48064 e!48062)))

(declare-fun res!60839 () Bool)

(assert (=> b!73546 (=> res!60839 e!48062)))

(declare-fun lt!118207 () List!764)

(declare-fun lt!118231 () List!764)

(assert (=> b!73546 (= res!60839 (not (= lt!118207 lt!118231)))))

(assert (=> b!73546 (= lt!118231 lt!118207)))

(declare-fun tail!368 (List!764) List!764)

(assert (=> b!73546 (= lt!118207 (tail!368 lt!118227))))

(declare-datatypes ((tuple2!6368 0))(
  ( (tuple2!6369 (_1!3298 BitStream!2378) (_2!3298 BitStream!2378)) )
))
(declare-fun lt!118226 () tuple2!6368)

(declare-fun lt!118216 () tuple2!6368)

(declare-fun lt!118209 () Unit!4851)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2378 BitStream!2378 BitStream!2378 BitStream!2378 (_ BitVec 64) List!764) Unit!4851)

(assert (=> b!73546 (= lt!118209 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3297 lt!118217) (_2!3297 lt!118217) (_1!3298 lt!118226) (_1!3298 lt!118216) (bvsub to!314 i!635) lt!118227))))

(declare-fun b!73547 () Bool)

(declare-fun res!60828 () Bool)

(assert (=> b!73547 (=> res!60828 e!48064)))

(declare-fun length!392 (List!764) Int)

(assert (=> b!73547 (= res!60828 (<= (length!392 lt!118227) 0))))

(declare-fun srcBuffer!2 () array!2993)

(declare-fun b!73548 () Bool)

(declare-fun lt!118228 () tuple2!6368)

(declare-fun e!48061 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2378 array!2993 (_ BitVec 64) (_ BitVec 64)) List!764)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2378 BitStream!2378 (_ BitVec 64)) List!764)

(assert (=> b!73548 (= e!48061 (= (head!583 (byteArrayBitContentToList!0 (_2!3297 lt!118230) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!583 (bitStreamReadBitsIntoList!0 (_2!3297 lt!118230) (_1!3298 lt!118228) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!73549 () Bool)

(assert (=> b!73549 (= e!48062 e!48059)))

(declare-fun res!60845 () Bool)

(assert (=> b!73549 (=> res!60845 e!48059)))

(declare-fun lt!118224 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2993 (_ BitVec 64)) Bool)

(assert (=> b!73549 (= res!60845 (not (= lt!118218 (bitAt!0 (buf!1780 (_1!3298 lt!118216)) lt!118224))))))

(assert (=> b!73549 (= lt!118218 (bitAt!0 (buf!1780 (_1!3298 lt!118226)) lt!118224))))

(declare-fun b!73550 () Bool)

(declare-fun res!60837 () Bool)

(declare-fun e!48065 () Bool)

(assert (=> b!73550 (=> (not res!60837) (not e!48065))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73550 (= res!60837 (validate_offset_bits!1 ((_ sign_extend 32) (size!1399 (buf!1780 thiss!1379))) ((_ sign_extend 32) (currentByte!3506 thiss!1379)) ((_ sign_extend 32) (currentBit!3501 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!73551 () Bool)

(declare-fun res!60835 () Bool)

(assert (=> b!73551 (=> res!60835 e!48067)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!73551 (= res!60835 (not (invariant!0 (currentBit!3501 (_2!3297 lt!118230)) (currentByte!3506 (_2!3297 lt!118230)) (size!1399 (buf!1780 (_2!3297 lt!118230))))))))

(declare-fun b!73553 () Bool)

(assert (=> b!73553 (= e!48067 e!48064)))

(declare-fun res!60836 () Bool)

(assert (=> b!73553 (=> res!60836 e!48064)))

(assert (=> b!73553 (= res!60836 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!118222 () (_ BitVec 64))

(assert (=> b!73553 (= lt!118231 (bitStreamReadBitsIntoList!0 (_2!3297 lt!118217) (_1!3298 lt!118216) lt!118222))))

(assert (=> b!73553 (= lt!118227 (bitStreamReadBitsIntoList!0 (_2!3297 lt!118217) (_1!3298 lt!118226) (bvsub to!314 i!635)))))

(assert (=> b!73553 (validate_offset_bits!1 ((_ sign_extend 32) (size!1399 (buf!1780 (_2!3297 lt!118217)))) ((_ sign_extend 32) (currentByte!3506 (_2!3297 lt!118230))) ((_ sign_extend 32) (currentBit!3501 (_2!3297 lt!118230))) lt!118222)))

(declare-fun lt!118223 () Unit!4851)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2378 array!2993 (_ BitVec 64)) Unit!4851)

(assert (=> b!73553 (= lt!118223 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3297 lt!118230) (buf!1780 (_2!3297 lt!118217)) lt!118222))))

(declare-fun reader!0 (BitStream!2378 BitStream!2378) tuple2!6368)

(assert (=> b!73553 (= lt!118216 (reader!0 (_2!3297 lt!118230) (_2!3297 lt!118217)))))

(assert (=> b!73553 (validate_offset_bits!1 ((_ sign_extend 32) (size!1399 (buf!1780 (_2!3297 lt!118217)))) ((_ sign_extend 32) (currentByte!3506 thiss!1379)) ((_ sign_extend 32) (currentBit!3501 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!118225 () Unit!4851)

(assert (=> b!73553 (= lt!118225 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1780 (_2!3297 lt!118217)) (bvsub to!314 i!635)))))

(assert (=> b!73553 (= lt!118226 (reader!0 thiss!1379 (_2!3297 lt!118217)))))

(declare-fun b!73554 () Bool)

(declare-fun e!48073 () Bool)

(declare-fun e!48069 () Bool)

(assert (=> b!73554 (= e!48073 e!48069)))

(declare-fun res!60843 () Bool)

(assert (=> b!73554 (=> res!60843 e!48069)))

(declare-fun isPrefixOf!0 (BitStream!2378 BitStream!2378) Bool)

(assert (=> b!73554 (= res!60843 (not (isPrefixOf!0 thiss!1379 (_2!3297 lt!118230))))))

(assert (=> b!73554 (validate_offset_bits!1 ((_ sign_extend 32) (size!1399 (buf!1780 (_2!3297 lt!118230)))) ((_ sign_extend 32) (currentByte!3506 (_2!3297 lt!118230))) ((_ sign_extend 32) (currentBit!3501 (_2!3297 lt!118230))) lt!118222)))

(assert (=> b!73554 (= lt!118222 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118212 () Unit!4851)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2378 BitStream!2378 (_ BitVec 64) (_ BitVec 64)) Unit!4851)

(assert (=> b!73554 (= lt!118212 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3297 lt!118230) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2378 (_ BitVec 8) (_ BitVec 32)) tuple2!6366)

(assert (=> b!73554 (= lt!118230 (appendBitFromByte!0 thiss!1379 (select (arr!1990 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!73555 () Bool)

(assert (=> b!73555 (= e!48065 (not e!48073))))

(declare-fun res!60830 () Bool)

(assert (=> b!73555 (=> res!60830 e!48073)))

(assert (=> b!73555 (= res!60830 (bvsge i!635 to!314))))

(assert (=> b!73555 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!118208 () Unit!4851)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2378) Unit!4851)

(assert (=> b!73555 (= lt!118208 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!73555 (= lt!118224 (bitIndex!0 (size!1399 (buf!1780 thiss!1379)) (currentByte!3506 thiss!1379) (currentBit!3501 thiss!1379)))))

(declare-fun b!73556 () Bool)

(declare-fun e!48066 () Bool)

(declare-fun e!48060 () Bool)

(assert (=> b!73556 (= e!48066 e!48060)))

(declare-fun res!60834 () Bool)

(assert (=> b!73556 (=> res!60834 e!48060)))

(declare-fun lt!118221 () Bool)

(declare-fun lt!118210 () Bool)

(assert (=> b!73556 (= res!60834 (not (= lt!118221 lt!118210)))))

(assert (=> b!73556 (= lt!118221 (bitAt!0 (buf!1780 (_2!3297 lt!118230)) lt!118224))))

(declare-fun b!73557 () Bool)

(declare-fun res!60841 () Bool)

(assert (=> b!73557 (=> res!60841 e!48072)))

(assert (=> b!73557 (= res!60841 (not (invariant!0 (currentBit!3501 (_2!3297 lt!118217)) (currentByte!3506 (_2!3297 lt!118217)) (size!1399 (buf!1780 (_2!3297 lt!118217))))))))

(declare-fun b!73558 () Bool)

(assert (=> b!73558 (= e!48059 e!48066)))

(declare-fun res!60844 () Bool)

(assert (=> b!73558 (=> res!60844 e!48066)))

(assert (=> b!73558 (= res!60844 (not (= (head!583 (byteArrayBitContentToList!0 (_2!3297 lt!118217) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!118210)))))

(assert (=> b!73558 (= lt!118210 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!73559 () Bool)

(declare-fun res!60842 () Bool)

(assert (=> b!73559 (=> res!60842 e!48067)))

(assert (=> b!73559 (= res!60842 (not (invariant!0 (currentBit!3501 (_2!3297 lt!118230)) (currentByte!3506 (_2!3297 lt!118230)) (size!1399 (buf!1780 (_2!3297 lt!118217))))))))

(declare-fun res!60831 () Bool)

(assert (=> start!14110 (=> (not res!60831) (not e!48065))))

(assert (=> start!14110 (= res!60831 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1399 srcBuffer!2))))))))

(assert (=> start!14110 e!48065))

(assert (=> start!14110 true))

(declare-fun array_inv!1248 (array!2993) Bool)

(assert (=> start!14110 (array_inv!1248 srcBuffer!2)))

(declare-fun e!48063 () Bool)

(declare-fun inv!12 (BitStream!2378) Bool)

(assert (=> start!14110 (and (inv!12 thiss!1379) e!48063)))

(declare-fun b!73552 () Bool)

(declare-fun res!60829 () Bool)

(assert (=> b!73552 (=> res!60829 e!48072)))

(assert (=> b!73552 (= res!60829 (not (= (size!1399 (buf!1780 thiss!1379)) (size!1399 (buf!1780 (_2!3297 lt!118217))))))))

(declare-fun b!73560 () Bool)

(assert (=> b!73560 (= e!48063 (array_inv!1248 (buf!1780 thiss!1379)))))

(declare-fun b!73561 () Bool)

(declare-fun e!48070 () Bool)

(assert (=> b!73561 (= e!48060 e!48070)))

(declare-fun res!60838 () Bool)

(assert (=> b!73561 (=> res!60838 e!48070)))

(declare-fun lt!118215 () Bool)

(assert (=> b!73561 (= res!60838 (not (= lt!118215 lt!118210)))))

(assert (=> b!73561 (= lt!118221 lt!118215)))

(assert (=> b!73561 (= lt!118215 (bitAt!0 (buf!1780 (_2!3297 lt!118217)) lt!118224))))

(declare-fun lt!118214 () Unit!4851)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2993 array!2993 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4851)

(assert (=> b!73561 (= lt!118214 (arrayBitRangesEqImpliesEq!0 (buf!1780 (_2!3297 lt!118230)) (buf!1780 (_2!3297 lt!118217)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118224 lt!118211))))

(declare-fun b!73562 () Bool)

(assert (=> b!73562 (= e!48070 true)))

(declare-datatypes ((tuple2!6370 0))(
  ( (tuple2!6371 (_1!3299 BitStream!2378) (_2!3299 Bool)) )
))
(declare-fun lt!118220 () tuple2!6370)

(declare-fun readBitPure!0 (BitStream!2378) tuple2!6370)

(assert (=> b!73562 (= lt!118220 (readBitPure!0 (_1!3298 lt!118226)))))

(declare-fun b!73563 () Bool)

(declare-fun e!48071 () Bool)

(assert (=> b!73563 (= e!48069 e!48071)))

(declare-fun res!60840 () Bool)

(assert (=> b!73563 (=> res!60840 e!48071)))

(assert (=> b!73563 (= res!60840 (not (isPrefixOf!0 (_2!3297 lt!118230) (_2!3297 lt!118217))))))

(assert (=> b!73563 (isPrefixOf!0 thiss!1379 (_2!3297 lt!118217))))

(declare-fun lt!118229 () Unit!4851)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2378 BitStream!2378 BitStream!2378) Unit!4851)

(assert (=> b!73563 (= lt!118229 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3297 lt!118230) (_2!3297 lt!118217)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2378 array!2993 (_ BitVec 64) (_ BitVec 64)) tuple2!6366)

(assert (=> b!73563 (= lt!118217 (appendBitsMSBFirstLoop!0 (_2!3297 lt!118230) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!73563 e!48061))

(declare-fun res!60833 () Bool)

(assert (=> b!73563 (=> (not res!60833) (not e!48061))))

(assert (=> b!73563 (= res!60833 (validate_offset_bits!1 ((_ sign_extend 32) (size!1399 (buf!1780 (_2!3297 lt!118230)))) ((_ sign_extend 32) (currentByte!3506 thiss!1379)) ((_ sign_extend 32) (currentBit!3501 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118219 () Unit!4851)

(assert (=> b!73563 (= lt!118219 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1780 (_2!3297 lt!118230)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73563 (= lt!118228 (reader!0 thiss!1379 (_2!3297 lt!118230)))))

(declare-fun b!73564 () Bool)

(assert (=> b!73564 (= e!48071 e!48072)))

(declare-fun res!60846 () Bool)

(assert (=> b!73564 (=> res!60846 e!48072)))

(assert (=> b!73564 (= res!60846 (not (= lt!118213 (bvsub (bvadd lt!118224 to!314) i!635))))))

(assert (=> b!73564 (= lt!118213 (bitIndex!0 (size!1399 (buf!1780 (_2!3297 lt!118217))) (currentByte!3506 (_2!3297 lt!118217)) (currentBit!3501 (_2!3297 lt!118217))))))

(assert (= (and start!14110 res!60831) b!73550))

(assert (= (and b!73550 res!60837) b!73555))

(assert (= (and b!73555 (not res!60830)) b!73554))

(assert (= (and b!73554 (not res!60843)) b!73563))

(assert (= (and b!73563 res!60833) b!73548))

(assert (= (and b!73563 (not res!60840)) b!73564))

(assert (= (and b!73564 (not res!60846)) b!73557))

(assert (= (and b!73557 (not res!60841)) b!73552))

(assert (= (and b!73552 (not res!60829)) b!73545))

(assert (= (and b!73545 (not res!60832)) b!73551))

(assert (= (and b!73551 (not res!60835)) b!73559))

(assert (= (and b!73559 (not res!60842)) b!73553))

(assert (= (and b!73553 (not res!60836)) b!73547))

(assert (= (and b!73547 (not res!60828)) b!73546))

(assert (= (and b!73546 (not res!60839)) b!73549))

(assert (= (and b!73549 (not res!60845)) b!73544))

(assert (= (and b!73544 (not res!60827)) b!73558))

(assert (= (and b!73558 (not res!60844)) b!73556))

(assert (= (and b!73556 (not res!60834)) b!73561))

(assert (= (and b!73561 (not res!60838)) b!73562))

(assert (= start!14110 b!73560))

(declare-fun m!117929 () Bool)

(assert (=> b!73551 m!117929))

(declare-fun m!117931 () Bool)

(assert (=> b!73550 m!117931))

(declare-fun m!117933 () Bool)

(assert (=> b!73562 m!117933))

(declare-fun m!117935 () Bool)

(assert (=> b!73555 m!117935))

(declare-fun m!117937 () Bool)

(assert (=> b!73555 m!117937))

(declare-fun m!117939 () Bool)

(assert (=> b!73555 m!117939))

(declare-fun m!117941 () Bool)

(assert (=> b!73563 m!117941))

(declare-fun m!117943 () Bool)

(assert (=> b!73563 m!117943))

(declare-fun m!117945 () Bool)

(assert (=> b!73563 m!117945))

(declare-fun m!117947 () Bool)

(assert (=> b!73563 m!117947))

(declare-fun m!117949 () Bool)

(assert (=> b!73563 m!117949))

(declare-fun m!117951 () Bool)

(assert (=> b!73563 m!117951))

(declare-fun m!117953 () Bool)

(assert (=> b!73563 m!117953))

(declare-fun m!117955 () Bool)

(assert (=> b!73547 m!117955))

(declare-fun m!117957 () Bool)

(assert (=> b!73546 m!117957))

(declare-fun m!117959 () Bool)

(assert (=> b!73546 m!117959))

(declare-fun m!117961 () Bool)

(assert (=> b!73548 m!117961))

(assert (=> b!73548 m!117961))

(declare-fun m!117963 () Bool)

(assert (=> b!73548 m!117963))

(declare-fun m!117965 () Bool)

(assert (=> b!73548 m!117965))

(assert (=> b!73548 m!117965))

(declare-fun m!117967 () Bool)

(assert (=> b!73548 m!117967))

(declare-fun m!117969 () Bool)

(assert (=> b!73549 m!117969))

(declare-fun m!117971 () Bool)

(assert (=> b!73549 m!117971))

(declare-fun m!117973 () Bool)

(assert (=> b!73561 m!117973))

(declare-fun m!117975 () Bool)

(assert (=> b!73561 m!117975))

(declare-fun m!117977 () Bool)

(assert (=> b!73545 m!117977))

(declare-fun m!117979 () Bool)

(assert (=> b!73556 m!117979))

(declare-fun m!117981 () Bool)

(assert (=> b!73558 m!117981))

(assert (=> b!73558 m!117981))

(declare-fun m!117983 () Bool)

(assert (=> b!73558 m!117983))

(declare-fun m!117985 () Bool)

(assert (=> b!73558 m!117985))

(declare-fun m!117987 () Bool)

(assert (=> b!73553 m!117987))

(declare-fun m!117989 () Bool)

(assert (=> b!73553 m!117989))

(declare-fun m!117991 () Bool)

(assert (=> b!73553 m!117991))

(declare-fun m!117993 () Bool)

(assert (=> b!73553 m!117993))

(declare-fun m!117995 () Bool)

(assert (=> b!73553 m!117995))

(declare-fun m!117997 () Bool)

(assert (=> b!73553 m!117997))

(declare-fun m!117999 () Bool)

(assert (=> b!73553 m!117999))

(declare-fun m!118001 () Bool)

(assert (=> b!73553 m!118001))

(declare-fun m!118003 () Bool)

(assert (=> b!73544 m!118003))

(declare-fun m!118005 () Bool)

(assert (=> b!73564 m!118005))

(declare-fun m!118007 () Bool)

(assert (=> b!73554 m!118007))

(declare-fun m!118009 () Bool)

(assert (=> b!73554 m!118009))

(declare-fun m!118011 () Bool)

(assert (=> b!73554 m!118011))

(assert (=> b!73554 m!118007))

(declare-fun m!118013 () Bool)

(assert (=> b!73554 m!118013))

(declare-fun m!118015 () Bool)

(assert (=> b!73554 m!118015))

(declare-fun m!118017 () Bool)

(assert (=> b!73560 m!118017))

(declare-fun m!118019 () Bool)

(assert (=> start!14110 m!118019))

(declare-fun m!118021 () Bool)

(assert (=> start!14110 m!118021))

(declare-fun m!118023 () Bool)

(assert (=> b!73559 m!118023))

(declare-fun m!118025 () Bool)

(assert (=> b!73557 m!118025))

(push 1)

(assert (not start!14110))

(assert (not b!73557))

(assert (not b!73554))

(assert (not b!73561))

(assert (not b!73544))

(assert (not b!73558))

(assert (not b!73547))

(assert (not b!73551))

(assert (not b!73560))

(assert (not b!73546))

(assert (not b!73563))

(assert (not b!73553))

(assert (not b!73562))

(assert (not b!73556))

(assert (not b!73555))

(assert (not b!73545))

(assert (not b!73550))

(assert (not b!73559))

(assert (not b!73564))

(assert (not b!73548))

(assert (not b!73549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

