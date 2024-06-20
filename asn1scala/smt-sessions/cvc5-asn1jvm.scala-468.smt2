; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13518 () Bool)

(assert start!13518)

(declare-fun b!69228 () Bool)

(declare-fun e!45210 () Bool)

(declare-fun e!45209 () Bool)

(assert (=> b!69228 (= e!45210 e!45209)))

(declare-fun res!57202 () Bool)

(assert (=> b!69228 (=> res!57202 e!45209)))

(declare-fun lt!111082 () Bool)

(declare-fun lt!111071 () (_ BitVec 64))

(declare-datatypes ((array!2899 0))(
  ( (array!2900 (arr!1925 (Array (_ BitVec 32) (_ BitVec 8))) (size!1346 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2296 0))(
  ( (BitStream!2297 (buf!1727 array!2899) (currentByte!3429 (_ BitVec 32)) (currentBit!3424 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6048 0))(
  ( (tuple2!6049 (_1!3135 BitStream!2296) (_2!3135 BitStream!2296)) )
))
(declare-fun lt!111083 () tuple2!6048)

(declare-fun bitAt!0 (array!2899 (_ BitVec 64)) Bool)

(assert (=> b!69228 (= res!57202 (not (= lt!111082 (bitAt!0 (buf!1727 (_1!3135 lt!111083)) lt!111071))))))

(declare-fun lt!111067 () tuple2!6048)

(assert (=> b!69228 (= lt!111082 (bitAt!0 (buf!1727 (_1!3135 lt!111067)) lt!111071))))

(declare-fun res!57210 () Bool)

(declare-fun e!45208 () Bool)

(assert (=> start!13518 (=> (not res!57210) (not e!45208))))

(declare-fun srcBuffer!2 () array!2899)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13518 (= res!57210 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1346 srcBuffer!2))))))))

(assert (=> start!13518 e!45208))

(assert (=> start!13518 true))

(declare-fun array_inv!1207 (array!2899) Bool)

(assert (=> start!13518 (array_inv!1207 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2296)

(declare-fun e!45220 () Bool)

(declare-fun inv!12 (BitStream!2296) Bool)

(assert (=> start!13518 (and (inv!12 thiss!1379) e!45220)))

(declare-fun b!69229 () Bool)

(declare-fun e!45215 () Bool)

(assert (=> b!69229 (= e!45215 e!45210)))

(declare-fun res!57193 () Bool)

(assert (=> b!69229 (=> res!57193 e!45210)))

(declare-datatypes ((List!723 0))(
  ( (Nil!720) (Cons!719 (h!838 Bool) (t!1473 List!723)) )
))
(declare-fun lt!111084 () List!723)

(declare-fun lt!111075 () List!723)

(assert (=> b!69229 (= res!57193 (not (= lt!111084 lt!111075)))))

(assert (=> b!69229 (= lt!111075 lt!111084)))

(declare-fun lt!111077 () List!723)

(declare-fun tail!327 (List!723) List!723)

(assert (=> b!69229 (= lt!111084 (tail!327 lt!111077))))

(declare-datatypes ((Unit!4649 0))(
  ( (Unit!4650) )
))
(declare-datatypes ((tuple2!6050 0))(
  ( (tuple2!6051 (_1!3136 Unit!4649) (_2!3136 BitStream!2296)) )
))
(declare-fun lt!111073 () tuple2!6050)

(declare-fun lt!111069 () Unit!4649)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2296 BitStream!2296 BitStream!2296 BitStream!2296 (_ BitVec 64) List!723) Unit!4649)

(assert (=> b!69229 (= lt!111069 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3136 lt!111073) (_2!3136 lt!111073) (_1!3135 lt!111067) (_1!3135 lt!111083) (bvsub to!314 i!635) lt!111077))))

(declare-fun b!69230 () Bool)

(declare-fun e!45214 () Bool)

(declare-fun e!45212 () Bool)

(assert (=> b!69230 (= e!45214 e!45212)))

(declare-fun res!57198 () Bool)

(assert (=> b!69230 (=> res!57198 e!45212)))

(declare-fun lt!111081 () tuple2!6050)

(declare-fun isPrefixOf!0 (BitStream!2296 BitStream!2296) Bool)

(assert (=> b!69230 (= res!57198 (not (isPrefixOf!0 thiss!1379 (_2!3136 lt!111081))))))

(declare-fun lt!111070 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69230 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111070)))

(assert (=> b!69230 (= lt!111070 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111076 () Unit!4649)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2296 BitStream!2296 (_ BitVec 64) (_ BitVec 64)) Unit!4649)

(assert (=> b!69230 (= lt!111076 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3136 lt!111081) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2296 (_ BitVec 8) (_ BitVec 32)) tuple2!6050)

(assert (=> b!69230 (= lt!111081 (appendBitFromByte!0 thiss!1379 (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!111068 () tuple2!6048)

(declare-fun e!45219 () Bool)

(declare-fun b!69231 () Bool)

(declare-fun head!542 (List!723) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2296 array!2899 (_ BitVec 64) (_ BitVec 64)) List!723)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2296 BitStream!2296 (_ BitVec 64)) List!723)

(assert (=> b!69231 (= e!45219 (= (head!542 (byteArrayBitContentToList!0 (_2!3136 lt!111081) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!542 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111081) (_1!3135 lt!111068) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!69232 () Bool)

(declare-fun res!57199 () Bool)

(declare-fun e!45218 () Bool)

(assert (=> b!69232 (=> res!57199 e!45218)))

(declare-fun lt!111072 () Bool)

(assert (=> b!69232 (= res!57199 (not (= (bitAt!0 (buf!1727 (_2!3136 lt!111081)) lt!111071) lt!111072)))))

(declare-fun b!69233 () Bool)

(assert (=> b!69233 (= e!45220 (array_inv!1207 (buf!1727 thiss!1379)))))

(declare-fun b!69234 () Bool)

(declare-fun lt!111074 () (_ BitVec 64))

(assert (=> b!69234 (= e!45218 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!111074) (bvsgt lt!111074 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111071) (bvslt lt!111071 lt!111074))))))

(declare-fun b!69235 () Bool)

(declare-fun e!45217 () Bool)

(declare-fun e!45211 () Bool)

(assert (=> b!69235 (= e!45217 e!45211)))

(declare-fun res!57192 () Bool)

(assert (=> b!69235 (=> res!57192 e!45211)))

(declare-fun lt!111078 () (_ BitVec 64))

(assert (=> b!69235 (= res!57192 (not (= lt!111078 (bvsub (bvadd lt!111071 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!69235 (= lt!111078 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111073))) (currentByte!3429 (_2!3136 lt!111073)) (currentBit!3424 (_2!3136 lt!111073))))))

(declare-fun b!69236 () Bool)

(declare-fun res!57203 () Bool)

(assert (=> b!69236 (=> res!57203 e!45211)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!69236 (= res!57203 (not (invariant!0 (currentBit!3424 (_2!3136 lt!111073)) (currentByte!3429 (_2!3136 lt!111073)) (size!1346 (buf!1727 (_2!3136 lt!111073))))))))

(declare-fun b!69237 () Bool)

(declare-fun e!45213 () Bool)

(assert (=> b!69237 (= e!45211 e!45213)))

(declare-fun res!57209 () Bool)

(assert (=> b!69237 (=> res!57209 e!45213)))

(assert (=> b!69237 (= res!57209 (not (= (size!1346 (buf!1727 (_2!3136 lt!111081))) (size!1346 (buf!1727 (_2!3136 lt!111073))))))))

(assert (=> b!69237 (= lt!111078 (bvsub (bvsub (bvadd lt!111074 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69237 (= lt!111074 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(assert (=> b!69237 (= (size!1346 (buf!1727 (_2!3136 lt!111073))) (size!1346 (buf!1727 thiss!1379)))))

(declare-fun b!69238 () Bool)

(assert (=> b!69238 (= e!45213 e!45215)))

(declare-fun res!57196 () Bool)

(assert (=> b!69238 (=> res!57196 e!45215)))

(assert (=> b!69238 (= res!57196 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!69238 (= lt!111075 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_1!3135 lt!111083) lt!111070))))

(assert (=> b!69238 (= lt!111077 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_1!3135 lt!111067) (bvsub to!314 i!635)))))

(assert (=> b!69238 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111070)))

(declare-fun lt!111066 () Unit!4649)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2296 array!2899 (_ BitVec 64)) Unit!4649)

(assert (=> b!69238 (= lt!111066 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3136 lt!111081) (buf!1727 (_2!3136 lt!111073)) lt!111070))))

(declare-fun reader!0 (BitStream!2296 BitStream!2296) tuple2!6048)

(assert (=> b!69238 (= lt!111083 (reader!0 (_2!3136 lt!111081) (_2!3136 lt!111073)))))

(assert (=> b!69238 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!111065 () Unit!4649)

(assert (=> b!69238 (= lt!111065 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1727 (_2!3136 lt!111073)) (bvsub to!314 i!635)))))

(assert (=> b!69238 (= lt!111067 (reader!0 thiss!1379 (_2!3136 lt!111073)))))

(declare-fun b!69239 () Bool)

(declare-fun res!57208 () Bool)

(assert (=> b!69239 (=> res!57208 e!45211)))

(assert (=> b!69239 (= res!57208 (not (= (size!1346 (buf!1727 thiss!1379)) (size!1346 (buf!1727 (_2!3136 lt!111073))))))))

(declare-fun b!69240 () Bool)

(assert (=> b!69240 (= e!45212 e!45217)))

(declare-fun res!57205 () Bool)

(assert (=> b!69240 (=> res!57205 e!45217)))

(assert (=> b!69240 (= res!57205 (not (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111073))))))

(assert (=> b!69240 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111073))))

(declare-fun lt!111079 () Unit!4649)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2296 BitStream!2296 BitStream!2296) Unit!4649)

(assert (=> b!69240 (= lt!111079 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3136 lt!111081) (_2!3136 lt!111073)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2296 array!2899 (_ BitVec 64) (_ BitVec 64)) tuple2!6050)

(assert (=> b!69240 (= lt!111073 (appendBitsMSBFirstLoop!0 (_2!3136 lt!111081) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!69240 e!45219))

(declare-fun res!57204 () Bool)

(assert (=> b!69240 (=> (not res!57204) (not e!45219))))

(assert (=> b!69240 (= res!57204 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111080 () Unit!4649)

(assert (=> b!69240 (= lt!111080 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1727 (_2!3136 lt!111081)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69240 (= lt!111068 (reader!0 thiss!1379 (_2!3136 lt!111081)))))

(declare-fun b!69241 () Bool)

(declare-fun res!57194 () Bool)

(assert (=> b!69241 (=> res!57194 e!45213)))

(assert (=> b!69241 (= res!57194 (not (invariant!0 (currentBit!3424 (_2!3136 lt!111081)) (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111073))))))))

(declare-fun b!69242 () Bool)

(declare-fun res!57200 () Bool)

(assert (=> b!69242 (=> res!57200 e!45209)))

(assert (=> b!69242 (= res!57200 (not (= (head!542 lt!111077) lt!111082)))))

(declare-fun b!69243 () Bool)

(declare-fun res!57195 () Bool)

(assert (=> b!69243 (=> res!57195 e!45213)))

(assert (=> b!69243 (= res!57195 (not (invariant!0 (currentBit!3424 (_2!3136 lt!111081)) (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111081))))))))

(declare-fun b!69244 () Bool)

(assert (=> b!69244 (= e!45208 (not e!45214))))

(declare-fun res!57201 () Bool)

(assert (=> b!69244 (=> res!57201 e!45214)))

(assert (=> b!69244 (= res!57201 (bvsge i!635 to!314))))

(assert (=> b!69244 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!111085 () Unit!4649)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2296) Unit!4649)

(assert (=> b!69244 (= lt!111085 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!69244 (= lt!111071 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(declare-fun b!69245 () Bool)

(assert (=> b!69245 (= e!45209 e!45218)))

(declare-fun res!57197 () Bool)

(assert (=> b!69245 (=> res!57197 e!45218)))

(assert (=> b!69245 (= res!57197 (not (= (head!542 (byteArrayBitContentToList!0 (_2!3136 lt!111073) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!111072)))))

(assert (=> b!69245 (= lt!111072 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!69246 () Bool)

(declare-fun res!57206 () Bool)

(assert (=> b!69246 (=> (not res!57206) (not e!45208))))

(assert (=> b!69246 (= res!57206 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 thiss!1379))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!69247 () Bool)

(declare-fun res!57207 () Bool)

(assert (=> b!69247 (=> res!57207 e!45215)))

(declare-fun length!351 (List!723) Int)

(assert (=> b!69247 (= res!57207 (<= (length!351 lt!111077) 0))))

(assert (= (and start!13518 res!57210) b!69246))

(assert (= (and b!69246 res!57206) b!69244))

(assert (= (and b!69244 (not res!57201)) b!69230))

(assert (= (and b!69230 (not res!57198)) b!69240))

(assert (= (and b!69240 res!57204) b!69231))

(assert (= (and b!69240 (not res!57205)) b!69235))

(assert (= (and b!69235 (not res!57192)) b!69236))

(assert (= (and b!69236 (not res!57203)) b!69239))

(assert (= (and b!69239 (not res!57208)) b!69237))

(assert (= (and b!69237 (not res!57209)) b!69243))

(assert (= (and b!69243 (not res!57195)) b!69241))

(assert (= (and b!69241 (not res!57194)) b!69238))

(assert (= (and b!69238 (not res!57196)) b!69247))

(assert (= (and b!69247 (not res!57207)) b!69229))

(assert (= (and b!69229 (not res!57193)) b!69228))

(assert (= (and b!69228 (not res!57202)) b!69242))

(assert (= (and b!69242 (not res!57200)) b!69245))

(assert (= (and b!69245 (not res!57197)) b!69232))

(assert (= (and b!69232 (not res!57199)) b!69234))

(assert (= start!13518 b!69233))

(declare-fun m!110677 () Bool)

(assert (=> b!69240 m!110677))

(declare-fun m!110679 () Bool)

(assert (=> b!69240 m!110679))

(declare-fun m!110681 () Bool)

(assert (=> b!69240 m!110681))

(declare-fun m!110683 () Bool)

(assert (=> b!69240 m!110683))

(declare-fun m!110685 () Bool)

(assert (=> b!69240 m!110685))

(declare-fun m!110687 () Bool)

(assert (=> b!69240 m!110687))

(declare-fun m!110689 () Bool)

(assert (=> b!69240 m!110689))

(declare-fun m!110691 () Bool)

(assert (=> b!69235 m!110691))

(declare-fun m!110693 () Bool)

(assert (=> b!69231 m!110693))

(assert (=> b!69231 m!110693))

(declare-fun m!110695 () Bool)

(assert (=> b!69231 m!110695))

(declare-fun m!110697 () Bool)

(assert (=> b!69231 m!110697))

(assert (=> b!69231 m!110697))

(declare-fun m!110699 () Bool)

(assert (=> b!69231 m!110699))

(declare-fun m!110701 () Bool)

(assert (=> b!69238 m!110701))

(declare-fun m!110703 () Bool)

(assert (=> b!69238 m!110703))

(declare-fun m!110705 () Bool)

(assert (=> b!69238 m!110705))

(declare-fun m!110707 () Bool)

(assert (=> b!69238 m!110707))

(declare-fun m!110709 () Bool)

(assert (=> b!69238 m!110709))

(declare-fun m!110711 () Bool)

(assert (=> b!69238 m!110711))

(declare-fun m!110713 () Bool)

(assert (=> b!69238 m!110713))

(declare-fun m!110715 () Bool)

(assert (=> b!69238 m!110715))

(declare-fun m!110717 () Bool)

(assert (=> b!69233 m!110717))

(declare-fun m!110719 () Bool)

(assert (=> b!69237 m!110719))

(declare-fun m!110721 () Bool)

(assert (=> b!69236 m!110721))

(declare-fun m!110723 () Bool)

(assert (=> b!69246 m!110723))

(declare-fun m!110725 () Bool)

(assert (=> b!69232 m!110725))

(declare-fun m!110727 () Bool)

(assert (=> b!69228 m!110727))

(declare-fun m!110729 () Bool)

(assert (=> b!69228 m!110729))

(declare-fun m!110731 () Bool)

(assert (=> start!13518 m!110731))

(declare-fun m!110733 () Bool)

(assert (=> start!13518 m!110733))

(declare-fun m!110735 () Bool)

(assert (=> b!69245 m!110735))

(assert (=> b!69245 m!110735))

(declare-fun m!110737 () Bool)

(assert (=> b!69245 m!110737))

(declare-fun m!110739 () Bool)

(assert (=> b!69245 m!110739))

(declare-fun m!110741 () Bool)

(assert (=> b!69229 m!110741))

(declare-fun m!110743 () Bool)

(assert (=> b!69229 m!110743))

(declare-fun m!110745 () Bool)

(assert (=> b!69247 m!110745))

(declare-fun m!110747 () Bool)

(assert (=> b!69230 m!110747))

(declare-fun m!110749 () Bool)

(assert (=> b!69230 m!110749))

(declare-fun m!110751 () Bool)

(assert (=> b!69230 m!110751))

(declare-fun m!110753 () Bool)

(assert (=> b!69230 m!110753))

(assert (=> b!69230 m!110747))

(declare-fun m!110755 () Bool)

(assert (=> b!69230 m!110755))

(declare-fun m!110757 () Bool)

(assert (=> b!69242 m!110757))

(declare-fun m!110759 () Bool)

(assert (=> b!69244 m!110759))

(declare-fun m!110761 () Bool)

(assert (=> b!69244 m!110761))

(declare-fun m!110763 () Bool)

(assert (=> b!69244 m!110763))

(declare-fun m!110765 () Bool)

(assert (=> b!69243 m!110765))

(declare-fun m!110767 () Bool)

(assert (=> b!69241 m!110767))

(push 1)

(assert (not b!69243))

(assert (not b!69235))

(assert (not b!69231))

(assert (not b!69236))

(assert (not b!69232))

(assert (not b!69245))

(assert (not b!69230))

(assert (not b!69242))

(assert (not b!69247))

(assert (not start!13518))

(assert (not b!69241))

(assert (not b!69238))

(assert (not b!69237))

(assert (not b!69240))

(assert (not b!69246))

(assert (not b!69244))

(assert (not b!69229))

(assert (not b!69228))

(assert (not b!69233))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!22178 () Bool)

(assert (=> d!22178 (= (tail!327 lt!111077) (t!1473 lt!111077))))

(assert (=> b!69229 d!22178))

(declare-fun d!22180 () Bool)

(declare-fun e!45349 () Bool)

(assert (=> d!22180 e!45349))

(declare-fun res!57379 () Bool)

(assert (=> d!22180 (=> (not res!57379) (not e!45349))))

(declare-fun lt!111307 () (_ BitVec 64))

(assert (=> d!22180 (= res!57379 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!111307) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22180 (= lt!111307 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111306 () Unit!4649)

(declare-fun choose!42 (BitStream!2296 BitStream!2296 BitStream!2296 BitStream!2296 (_ BitVec 64) List!723) Unit!4649)

(assert (=> d!22180 (= lt!111306 (choose!42 (_2!3136 lt!111073) (_2!3136 lt!111073) (_1!3135 lt!111067) (_1!3135 lt!111083) (bvsub to!314 i!635) lt!111077))))

(assert (=> d!22180 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22180 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3136 lt!111073) (_2!3136 lt!111073) (_1!3135 lt!111067) (_1!3135 lt!111083) (bvsub to!314 i!635) lt!111077) lt!111306)))

(declare-fun b!69443 () Bool)

(assert (=> b!69443 (= e!45349 (= (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_1!3135 lt!111083) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!327 lt!111077)))))

(assert (= (and d!22180 res!57379) b!69443))

(declare-fun m!111027 () Bool)

(assert (=> d!22180 m!111027))

(declare-fun m!111029 () Bool)

(assert (=> b!69443 m!111029))

(assert (=> b!69443 m!110741))

(assert (=> b!69229 d!22180))

(declare-fun d!22182 () Bool)

(assert (=> d!22182 (= (bitAt!0 (buf!1727 (_1!3135 lt!111083)) lt!111071) (not (= (bvand ((_ sign_extend 24) (select (arr!1925 (buf!1727 (_1!3135 lt!111083))) ((_ extract 31 0) (bvsdiv lt!111071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5339 () Bool)

(assert (= bs!5339 d!22182))

(declare-fun m!111031 () Bool)

(assert (=> bs!5339 m!111031))

(declare-fun m!111033 () Bool)

(assert (=> bs!5339 m!111033))

(assert (=> b!69228 d!22182))

(declare-fun d!22184 () Bool)

(assert (=> d!22184 (= (bitAt!0 (buf!1727 (_1!3135 lt!111067)) lt!111071) (not (= (bvand ((_ sign_extend 24) (select (arr!1925 (buf!1727 (_1!3135 lt!111067))) ((_ extract 31 0) (bvsdiv lt!111071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5340 () Bool)

(assert (= bs!5340 d!22184))

(declare-fun m!111035 () Bool)

(assert (=> bs!5340 m!111035))

(assert (=> bs!5340 m!111033))

(assert (=> b!69228 d!22184))

(declare-fun d!22186 () Bool)

(declare-fun res!57386 () Bool)

(declare-fun e!45354 () Bool)

(assert (=> d!22186 (=> (not res!57386) (not e!45354))))

(assert (=> d!22186 (= res!57386 (= (size!1346 (buf!1727 thiss!1379)) (size!1346 (buf!1727 (_2!3136 lt!111081)))))))

(assert (=> d!22186 (= (isPrefixOf!0 thiss!1379 (_2!3136 lt!111081)) e!45354)))

(declare-fun b!69450 () Bool)

(declare-fun res!57387 () Bool)

(assert (=> b!69450 (=> (not res!57387) (not e!45354))))

(assert (=> b!69450 (= res!57387 (bvsle (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)) (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081)))))))

(declare-fun b!69451 () Bool)

(declare-fun e!45355 () Bool)

(assert (=> b!69451 (= e!45354 e!45355)))

(declare-fun res!57388 () Bool)

(assert (=> b!69451 (=> res!57388 e!45355)))

(assert (=> b!69451 (= res!57388 (= (size!1346 (buf!1727 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69452 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2899 array!2899 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69452 (= e!45355 (arrayBitRangesEq!0 (buf!1727 thiss!1379) (buf!1727 (_2!3136 lt!111081)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379))))))

(assert (= (and d!22186 res!57386) b!69450))

(assert (= (and b!69450 res!57387) b!69451))

(assert (= (and b!69451 (not res!57388)) b!69452))

(assert (=> b!69450 m!110763))

(assert (=> b!69450 m!110719))

(assert (=> b!69452 m!110763))

(assert (=> b!69452 m!110763))

(declare-fun m!111037 () Bool)

(assert (=> b!69452 m!111037))

(assert (=> b!69230 d!22186))

(declare-fun d!22188 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22188 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111070) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081)))) lt!111070))))

(declare-fun bs!5341 () Bool)

(assert (= bs!5341 d!22188))

(declare-fun m!111039 () Bool)

(assert (=> bs!5341 m!111039))

(assert (=> b!69230 d!22188))

(declare-fun d!22190 () Bool)

(declare-fun e!45358 () Bool)

(assert (=> d!22190 e!45358))

(declare-fun res!57391 () Bool)

(assert (=> d!22190 (=> (not res!57391) (not e!45358))))

(assert (=> d!22190 (= res!57391 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!111310 () Unit!4649)

(declare-fun choose!27 (BitStream!2296 BitStream!2296 (_ BitVec 64) (_ BitVec 64)) Unit!4649)

(assert (=> d!22190 (= lt!111310 (choose!27 thiss!1379 (_2!3136 lt!111081) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22190 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22190 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3136 lt!111081) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111310)))

(declare-fun b!69455 () Bool)

(assert (=> b!69455 (= e!45358 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22190 res!57391) b!69455))

(declare-fun m!111041 () Bool)

(assert (=> d!22190 m!111041))

(declare-fun m!111043 () Bool)

(assert (=> b!69455 m!111043))

(assert (=> b!69230 d!22190))

(declare-fun b!69510 () Bool)

(declare-fun e!45388 () Bool)

(declare-datatypes ((tuple2!6072 0))(
  ( (tuple2!6073 (_1!3147 BitStream!2296) (_2!3147 Bool)) )
))
(declare-fun lt!111424 () tuple2!6072)

(declare-fun lt!111425 () tuple2!6050)

(assert (=> b!69510 (= e!45388 (= (bitIndex!0 (size!1346 (buf!1727 (_1!3147 lt!111424))) (currentByte!3429 (_1!3147 lt!111424)) (currentBit!3424 (_1!3147 lt!111424))) (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111425))) (currentByte!3429 (_2!3136 lt!111425)) (currentBit!3424 (_2!3136 lt!111425)))))))

(declare-fun b!69511 () Bool)

(declare-fun res!57425 () Bool)

(declare-fun e!45387 () Bool)

(assert (=> b!69511 (=> (not res!57425) (not e!45387))))

(assert (=> b!69511 (= res!57425 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111425)))))

(declare-fun b!69512 () Bool)

(declare-fun res!57427 () Bool)

(declare-fun e!45389 () Bool)

(assert (=> b!69512 (=> (not res!57427) (not e!45389))))

(declare-fun lt!111429 () tuple2!6050)

(assert (=> b!69512 (= res!57427 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111429))) (currentByte!3429 (_2!3136 lt!111429)) (currentBit!3424 (_2!3136 lt!111429))) (bvadd (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!69513 () Bool)

(assert (=> b!69513 (= e!45387 e!45388)))

(declare-fun res!57431 () Bool)

(assert (=> b!69513 (=> (not res!57431) (not e!45388))))

(declare-fun lt!111431 () (_ BitVec 8))

(assert (=> b!69513 (= res!57431 (and (= (_2!3147 lt!111424) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!111431)) #b00000000000000000000000000000000))) (= (_1!3147 lt!111424) (_2!3136 lt!111425))))))

(declare-datatypes ((tuple2!6074 0))(
  ( (tuple2!6075 (_1!3148 array!2899) (_2!3148 BitStream!2296)) )
))
(declare-fun lt!111426 () tuple2!6074)

(declare-fun lt!111420 () BitStream!2296)

(declare-fun readBits!0 (BitStream!2296 (_ BitVec 64)) tuple2!6074)

(assert (=> b!69513 (= lt!111426 (readBits!0 lt!111420 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2296) tuple2!6072)

(assert (=> b!69513 (= lt!111424 (readBitPure!0 lt!111420))))

(declare-fun readerFrom!0 (BitStream!2296 (_ BitVec 32) (_ BitVec 32)) BitStream!2296)

(assert (=> b!69513 (= lt!111420 (readerFrom!0 (_2!3136 lt!111425) (currentBit!3424 thiss!1379) (currentByte!3429 thiss!1379)))))

(declare-fun d!22192 () Bool)

(assert (=> d!22192 e!45387))

(declare-fun res!57430 () Bool)

(assert (=> d!22192 (=> (not res!57430) (not e!45387))))

(assert (=> d!22192 (= res!57430 (= (size!1346 (buf!1727 (_2!3136 lt!111425))) (size!1346 (buf!1727 thiss!1379))))))

(declare-fun lt!111423 () array!2899)

(assert (=> d!22192 (= lt!111431 (select (arr!1925 lt!111423) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22192 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1346 lt!111423)))))

(assert (=> d!22192 (= lt!111423 (array!2900 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!111422 () tuple2!6050)

(assert (=> d!22192 (= lt!111425 (tuple2!6051 (_1!3136 lt!111422) (_2!3136 lt!111422)))))

(assert (=> d!22192 (= lt!111422 lt!111429)))

(assert (=> d!22192 e!45389))

(declare-fun res!57426 () Bool)

(assert (=> d!22192 (=> (not res!57426) (not e!45389))))

(assert (=> d!22192 (= res!57426 (= (size!1346 (buf!1727 thiss!1379)) (size!1346 (buf!1727 (_2!3136 lt!111429)))))))

(declare-fun lt!111430 () Bool)

(declare-fun appendBit!0 (BitStream!2296 Bool) tuple2!6050)

(assert (=> d!22192 (= lt!111429 (appendBit!0 thiss!1379 lt!111430))))

(assert (=> d!22192 (= lt!111430 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22192 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22192 (= (appendBitFromByte!0 thiss!1379 (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!111425)))

(declare-fun b!69514 () Bool)

(declare-fun e!45386 () Bool)

(assert (=> b!69514 (= e!45389 e!45386)))

(declare-fun res!57432 () Bool)

(assert (=> b!69514 (=> (not res!57432) (not e!45386))))

(declare-fun lt!111427 () tuple2!6072)

(assert (=> b!69514 (= res!57432 (and (= (_2!3147 lt!111427) lt!111430) (= (_1!3147 lt!111427) (_2!3136 lt!111429))))))

(assert (=> b!69514 (= lt!111427 (readBitPure!0 (readerFrom!0 (_2!3136 lt!111429) (currentBit!3424 thiss!1379) (currentByte!3429 thiss!1379))))))

(declare-fun b!69515 () Bool)

(assert (=> b!69515 (= e!45386 (= (bitIndex!0 (size!1346 (buf!1727 (_1!3147 lt!111427))) (currentByte!3429 (_1!3147 lt!111427)) (currentBit!3424 (_1!3147 lt!111427))) (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111429))) (currentByte!3429 (_2!3136 lt!111429)) (currentBit!3424 (_2!3136 lt!111429)))))))

(declare-fun b!69516 () Bool)

(declare-fun res!57429 () Bool)

(assert (=> b!69516 (=> (not res!57429) (not e!45387))))

(declare-fun lt!111428 () (_ BitVec 64))

(declare-fun lt!111421 () (_ BitVec 64))

(assert (=> b!69516 (= res!57429 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111425))) (currentByte!3429 (_2!3136 lt!111425)) (currentBit!3424 (_2!3136 lt!111425))) (bvadd lt!111421 lt!111428)))))

(assert (=> b!69516 (or (not (= (bvand lt!111421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111428 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!111421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!111421 lt!111428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69516 (= lt!111428 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!69516 (= lt!111421 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(declare-fun b!69517 () Bool)

(declare-fun res!57428 () Bool)

(assert (=> b!69517 (=> (not res!57428) (not e!45389))))

(assert (=> b!69517 (= res!57428 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111429)))))

(assert (= (and d!22192 res!57426) b!69512))

(assert (= (and b!69512 res!57427) b!69517))

(assert (= (and b!69517 res!57428) b!69514))

(assert (= (and b!69514 res!57432) b!69515))

(assert (= (and d!22192 res!57430) b!69516))

(assert (= (and b!69516 res!57429) b!69511))

(assert (= (and b!69511 res!57425) b!69513))

(assert (= (and b!69513 res!57431) b!69510))

(declare-fun m!111075 () Bool)

(assert (=> b!69516 m!111075))

(assert (=> b!69516 m!110763))

(declare-fun m!111077 () Bool)

(assert (=> b!69517 m!111077))

(declare-fun m!111079 () Bool)

(assert (=> b!69515 m!111079))

(declare-fun m!111081 () Bool)

(assert (=> b!69515 m!111081))

(assert (=> b!69512 m!111081))

(assert (=> b!69512 m!110763))

(declare-fun m!111083 () Bool)

(assert (=> b!69514 m!111083))

(assert (=> b!69514 m!111083))

(declare-fun m!111085 () Bool)

(assert (=> b!69514 m!111085))

(declare-fun m!111087 () Bool)

(assert (=> b!69511 m!111087))

(declare-fun m!111089 () Bool)

(assert (=> d!22192 m!111089))

(declare-fun m!111091 () Bool)

(assert (=> d!22192 m!111091))

(declare-fun m!111093 () Bool)

(assert (=> d!22192 m!111093))

(declare-fun m!111095 () Bool)

(assert (=> b!69510 m!111095))

(assert (=> b!69510 m!111075))

(declare-fun m!111097 () Bool)

(assert (=> b!69513 m!111097))

(declare-fun m!111099 () Bool)

(assert (=> b!69513 m!111099))

(declare-fun m!111101 () Bool)

(assert (=> b!69513 m!111101))

(assert (=> b!69230 d!22192))

(declare-fun d!22216 () Bool)

(assert (=> d!22216 (= (invariant!0 (currentBit!3424 (_2!3136 lt!111081)) (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111073)))) (and (bvsge (currentBit!3424 (_2!3136 lt!111081)) #b00000000000000000000000000000000) (bvslt (currentBit!3424 (_2!3136 lt!111081)) #b00000000000000000000000000001000) (bvsge (currentByte!3429 (_2!3136 lt!111081)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111073)))) (and (= (currentBit!3424 (_2!3136 lt!111081)) #b00000000000000000000000000000000) (= (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111073))))))))))

(assert (=> b!69241 d!22216))

(declare-fun d!22218 () Bool)

(assert (=> d!22218 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111474 () Unit!4649)

(declare-fun choose!9 (BitStream!2296 array!2899 (_ BitVec 64) BitStream!2296) Unit!4649)

(assert (=> d!22218 (= lt!111474 (choose!9 thiss!1379 (buf!1727 (_2!3136 lt!111081)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2297 (buf!1727 (_2!3136 lt!111081)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379))))))

(assert (=> d!22218 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1727 (_2!3136 lt!111081)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111474)))

(declare-fun bs!5345 () Bool)

(assert (= bs!5345 d!22218))

(assert (=> bs!5345 m!110679))

(declare-fun m!111155 () Bool)

(assert (=> bs!5345 m!111155))

(assert (=> b!69240 d!22218))

(declare-fun d!22224 () Bool)

(declare-fun res!57439 () Bool)

(declare-fun e!45394 () Bool)

(assert (=> d!22224 (=> (not res!57439) (not e!45394))))

(assert (=> d!22224 (= res!57439 (= (size!1346 (buf!1727 thiss!1379)) (size!1346 (buf!1727 (_2!3136 lt!111073)))))))

(assert (=> d!22224 (= (isPrefixOf!0 thiss!1379 (_2!3136 lt!111073)) e!45394)))

(declare-fun b!69528 () Bool)

(declare-fun res!57440 () Bool)

(assert (=> b!69528 (=> (not res!57440) (not e!45394))))

(assert (=> b!69528 (= res!57440 (bvsle (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)) (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111073))) (currentByte!3429 (_2!3136 lt!111073)) (currentBit!3424 (_2!3136 lt!111073)))))))

(declare-fun b!69529 () Bool)

(declare-fun e!45395 () Bool)

(assert (=> b!69529 (= e!45394 e!45395)))

(declare-fun res!57441 () Bool)

(assert (=> b!69529 (=> res!57441 e!45395)))

(assert (=> b!69529 (= res!57441 (= (size!1346 (buf!1727 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69530 () Bool)

(assert (=> b!69530 (= e!45395 (arrayBitRangesEq!0 (buf!1727 thiss!1379) (buf!1727 (_2!3136 lt!111073)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379))))))

(assert (= (and d!22224 res!57439) b!69528))

(assert (= (and b!69528 res!57440) b!69529))

(assert (= (and b!69529 (not res!57441)) b!69530))

(assert (=> b!69528 m!110763))

(assert (=> b!69528 m!110691))

(assert (=> b!69530 m!110763))

(assert (=> b!69530 m!110763))

(declare-fun m!111159 () Bool)

(assert (=> b!69530 m!111159))

(assert (=> b!69240 d!22224))

(declare-fun e!45457 () Bool)

(declare-fun b!69659 () Bool)

(declare-fun lt!111871 () tuple2!6050)

(declare-fun lt!111863 () tuple2!6048)

(assert (=> b!69659 (= e!45457 (= (bitStreamReadBitsIntoList!0 (_2!3136 lt!111871) (_1!3135 lt!111863) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3136 lt!111871) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!69659 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69659 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!111890 () Unit!4649)

(declare-fun lt!111866 () Unit!4649)

(assert (=> b!69659 (= lt!111890 lt!111866)))

(declare-fun lt!111855 () (_ BitVec 64))

(assert (=> b!69659 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111871)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111855)))

(assert (=> b!69659 (= lt!111866 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3136 lt!111081) (buf!1727 (_2!3136 lt!111871)) lt!111855))))

(declare-fun e!45456 () Bool)

(assert (=> b!69659 e!45456))

(declare-fun res!57533 () Bool)

(assert (=> b!69659 (=> (not res!57533) (not e!45456))))

(assert (=> b!69659 (= res!57533 (and (= (size!1346 (buf!1727 (_2!3136 lt!111081))) (size!1346 (buf!1727 (_2!3136 lt!111871)))) (bvsge lt!111855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69659 (= lt!111855 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!69659 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69659 (= lt!111863 (reader!0 (_2!3136 lt!111081) (_2!3136 lt!111871)))))

(declare-fun b!69660 () Bool)

(declare-fun e!45458 () tuple2!6050)

(declare-fun lt!111858 () tuple2!6050)

(declare-fun Unit!4667 () Unit!4649)

(assert (=> b!69660 (= e!45458 (tuple2!6051 Unit!4667 (_2!3136 lt!111858)))))

(declare-fun lt!111875 () tuple2!6050)

(assert (=> b!69660 (= lt!111875 (appendBitFromByte!0 (_2!3136 lt!111081) (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!111868 () (_ BitVec 64))

(assert (=> b!69660 (= lt!111868 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111854 () (_ BitVec 64))

(assert (=> b!69660 (= lt!111854 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111865 () Unit!4649)

(assert (=> b!69660 (= lt!111865 (validateOffsetBitsIneqLemma!0 (_2!3136 lt!111081) (_2!3136 lt!111875) lt!111868 lt!111854))))

(assert (=> b!69660 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111875)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111875))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111875))) (bvsub lt!111868 lt!111854))))

(declare-fun lt!111885 () Unit!4649)

(assert (=> b!69660 (= lt!111885 lt!111865)))

(declare-fun lt!111895 () tuple2!6048)

(declare-fun call!895 () tuple2!6048)

(assert (=> b!69660 (= lt!111895 call!895)))

(declare-fun lt!111859 () (_ BitVec 64))

(assert (=> b!69660 (= lt!111859 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111870 () Unit!4649)

(assert (=> b!69660 (= lt!111870 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3136 lt!111081) (buf!1727 (_2!3136 lt!111875)) lt!111859))))

(assert (=> b!69660 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111875)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111859)))

(declare-fun lt!111892 () Unit!4649)

(assert (=> b!69660 (= lt!111892 lt!111870)))

(assert (=> b!69660 (= (head!542 (byteArrayBitContentToList!0 (_2!3136 lt!111875) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!542 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111875) (_1!3135 lt!111895) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111853 () Unit!4649)

(declare-fun Unit!4668 () Unit!4649)

(assert (=> b!69660 (= lt!111853 Unit!4668)))

(assert (=> b!69660 (= lt!111858 (appendBitsMSBFirstLoop!0 (_2!3136 lt!111875) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!111888 () Unit!4649)

(assert (=> b!69660 (= lt!111888 (lemmaIsPrefixTransitive!0 (_2!3136 lt!111081) (_2!3136 lt!111875) (_2!3136 lt!111858)))))

(assert (=> b!69660 (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111858))))

(declare-fun lt!111867 () Unit!4649)

(assert (=> b!69660 (= lt!111867 lt!111888)))

(assert (=> b!69660 (= (size!1346 (buf!1727 (_2!3136 lt!111858))) (size!1346 (buf!1727 (_2!3136 lt!111081))))))

(declare-fun lt!111873 () Unit!4649)

(declare-fun Unit!4669 () Unit!4649)

(assert (=> b!69660 (= lt!111873 Unit!4669)))

(assert (=> b!69660 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111858))) (currentByte!3429 (_2!3136 lt!111858)) (currentBit!3424 (_2!3136 lt!111858))) (bvsub (bvadd (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111886 () Unit!4649)

(declare-fun Unit!4670 () Unit!4649)

(assert (=> b!69660 (= lt!111886 Unit!4670)))

(assert (=> b!69660 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111858))) (currentByte!3429 (_2!3136 lt!111858)) (currentBit!3424 (_2!3136 lt!111858))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111875))) (currentByte!3429 (_2!3136 lt!111875)) (currentBit!3424 (_2!3136 lt!111875))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111884 () Unit!4649)

(declare-fun Unit!4671 () Unit!4649)

(assert (=> b!69660 (= lt!111884 Unit!4671)))

(declare-fun lt!111893 () tuple2!6048)

(assert (=> b!69660 (= lt!111893 (reader!0 (_2!3136 lt!111081) (_2!3136 lt!111858)))))

(declare-fun lt!111857 () (_ BitVec 64))

(assert (=> b!69660 (= lt!111857 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111861 () Unit!4649)

(assert (=> b!69660 (= lt!111861 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3136 lt!111081) (buf!1727 (_2!3136 lt!111858)) lt!111857))))

(assert (=> b!69660 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111858)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111857)))

(declare-fun lt!111874 () Unit!4649)

(assert (=> b!69660 (= lt!111874 lt!111861)))

(declare-fun lt!111881 () tuple2!6048)

(assert (=> b!69660 (= lt!111881 (reader!0 (_2!3136 lt!111875) (_2!3136 lt!111858)))))

(declare-fun lt!111872 () (_ BitVec 64))

(assert (=> b!69660 (= lt!111872 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111883 () Unit!4649)

(assert (=> b!69660 (= lt!111883 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3136 lt!111875) (buf!1727 (_2!3136 lt!111858)) lt!111872))))

(assert (=> b!69660 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111858)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111875))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111875))) lt!111872)))

(declare-fun lt!111894 () Unit!4649)

(assert (=> b!69660 (= lt!111894 lt!111883)))

(declare-fun lt!111869 () List!723)

(assert (=> b!69660 (= lt!111869 (byteArrayBitContentToList!0 (_2!3136 lt!111858) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!111879 () List!723)

(assert (=> b!69660 (= lt!111879 (byteArrayBitContentToList!0 (_2!3136 lt!111858) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111876 () List!723)

(assert (=> b!69660 (= lt!111876 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111858) (_1!3135 lt!111893) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!111864 () List!723)

(assert (=> b!69660 (= lt!111864 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111858) (_1!3135 lt!111881) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111891 () (_ BitVec 64))

(assert (=> b!69660 (= lt!111891 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111860 () Unit!4649)

(assert (=> b!69660 (= lt!111860 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3136 lt!111858) (_2!3136 lt!111858) (_1!3135 lt!111893) (_1!3135 lt!111881) lt!111891 lt!111876))))

(assert (=> b!69660 (= (bitStreamReadBitsIntoList!0 (_2!3136 lt!111858) (_1!3135 lt!111881) (bvsub lt!111891 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!327 lt!111876))))

(declare-fun lt!111880 () Unit!4649)

(assert (=> b!69660 (= lt!111880 lt!111860)))

(declare-fun lt!111882 () (_ BitVec 64))

(declare-fun lt!111862 () Unit!4649)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2899 array!2899 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4649)

(assert (=> b!69660 (= lt!111862 (arrayBitRangesEqImpliesEq!0 (buf!1727 (_2!3136 lt!111875)) (buf!1727 (_2!3136 lt!111858)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!111882 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111875))) (currentByte!3429 (_2!3136 lt!111875)) (currentBit!3424 (_2!3136 lt!111875)))))))

(assert (=> b!69660 (= (bitAt!0 (buf!1727 (_2!3136 lt!111875)) lt!111882) (bitAt!0 (buf!1727 (_2!3136 lt!111858)) lt!111882))))

(declare-fun lt!111877 () Unit!4649)

(assert (=> b!69660 (= lt!111877 lt!111862)))

(declare-fun b!69661 () Bool)

(declare-fun res!57531 () Bool)

(assert (=> b!69661 (=> (not res!57531) (not e!45457))))

(assert (=> b!69661 (= res!57531 (= (size!1346 (buf!1727 (_2!3136 lt!111081))) (size!1346 (buf!1727 (_2!3136 lt!111871)))))))

(declare-fun b!69662 () Bool)

(declare-fun res!57534 () Bool)

(assert (=> b!69662 (=> (not res!57534) (not e!45457))))

(assert (=> b!69662 (= res!57534 (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111871)))))

(declare-fun b!69663 () Bool)

(declare-fun res!57532 () Bool)

(assert (=> b!69663 (=> (not res!57532) (not e!45457))))

(assert (=> b!69663 (= res!57532 (= (size!1346 (buf!1727 (_2!3136 lt!111871))) (size!1346 (buf!1727 (_2!3136 lt!111081)))))))

(declare-fun d!22228 () Bool)

(assert (=> d!22228 e!45457))

(declare-fun res!57530 () Bool)

(assert (=> d!22228 (=> (not res!57530) (not e!45457))))

(declare-fun lt!111889 () (_ BitVec 64))

(assert (=> d!22228 (= res!57530 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111871))) (currentByte!3429 (_2!3136 lt!111871)) (currentBit!3424 (_2!3136 lt!111871))) (bvsub lt!111889 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22228 (or (= (bvand lt!111889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111889 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!111896 () (_ BitVec 64))

(assert (=> d!22228 (= lt!111889 (bvadd lt!111896 to!314))))

(assert (=> d!22228 (or (not (= (bvand lt!111896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!111896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!111896 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22228 (= lt!111896 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(assert (=> d!22228 (= lt!111871 e!45458)))

(declare-fun c!5167 () Bool)

(assert (=> d!22228 (= c!5167 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!111856 () Unit!4649)

(declare-fun lt!111887 () Unit!4649)

(assert (=> d!22228 (= lt!111856 lt!111887)))

(assert (=> d!22228 (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111081))))

(assert (=> d!22228 (= lt!111887 (lemmaIsPrefixRefl!0 (_2!3136 lt!111081)))))

(assert (=> d!22228 (= lt!111882 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(assert (=> d!22228 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22228 (= (appendBitsMSBFirstLoop!0 (_2!3136 lt!111081) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!111871)))

(declare-fun bm!892 () Bool)

(assert (=> bm!892 (= call!895 (reader!0 (_2!3136 lt!111081) (ite c!5167 (_2!3136 lt!111875) (_2!3136 lt!111081))))))

(declare-fun b!69664 () Bool)

(declare-fun res!57529 () Bool)

(assert (=> b!69664 (=> (not res!57529) (not e!45457))))

(assert (=> b!69664 (= res!57529 (invariant!0 (currentBit!3424 (_2!3136 lt!111871)) (currentByte!3429 (_2!3136 lt!111871)) (size!1346 (buf!1727 (_2!3136 lt!111871)))))))

(declare-fun b!69665 () Bool)

(assert (=> b!69665 (= e!45456 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111855))))

(declare-fun b!69666 () Bool)

(declare-fun Unit!4672 () Unit!4649)

(assert (=> b!69666 (= e!45458 (tuple2!6051 Unit!4672 (_2!3136 lt!111081)))))

(assert (=> b!69666 (= (size!1346 (buf!1727 (_2!3136 lt!111081))) (size!1346 (buf!1727 (_2!3136 lt!111081))))))

(declare-fun lt!111878 () Unit!4649)

(declare-fun Unit!4673 () Unit!4649)

(assert (=> b!69666 (= lt!111878 Unit!4673)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2296 array!2899 array!2899 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69666 (checkByteArrayBitContent!0 (_2!3136 lt!111081) srcBuffer!2 (_1!3148 (readBits!0 (_1!3135 call!895) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!22228 c!5167) b!69660))

(assert (= (and d!22228 (not c!5167)) b!69666))

(assert (= (or b!69660 b!69666) bm!892))

(assert (= (and d!22228 res!57530) b!69664))

(assert (= (and b!69664 res!57529) b!69661))

(assert (= (and b!69661 res!57531) b!69662))

(assert (= (and b!69662 res!57534) b!69663))

(assert (= (and b!69663 res!57532) b!69659))

(assert (= (and b!69659 res!57533) b!69665))

(declare-fun m!111413 () Bool)

(assert (=> b!69664 m!111413))

(declare-fun m!111415 () Bool)

(assert (=> d!22228 m!111415))

(assert (=> d!22228 m!110719))

(declare-fun m!111417 () Bool)

(assert (=> d!22228 m!111417))

(declare-fun m!111419 () Bool)

(assert (=> d!22228 m!111419))

(declare-fun m!111421 () Bool)

(assert (=> bm!892 m!111421))

(declare-fun m!111423 () Bool)

(assert (=> b!69666 m!111423))

(declare-fun m!111425 () Bool)

(assert (=> b!69666 m!111425))

(declare-fun m!111427 () Bool)

(assert (=> b!69659 m!111427))

(declare-fun m!111429 () Bool)

(assert (=> b!69659 m!111429))

(declare-fun m!111431 () Bool)

(assert (=> b!69659 m!111431))

(declare-fun m!111433 () Bool)

(assert (=> b!69659 m!111433))

(declare-fun m!111435 () Bool)

(assert (=> b!69659 m!111435))

(declare-fun m!111437 () Bool)

(assert (=> b!69660 m!111437))

(assert (=> b!69660 m!110719))

(declare-fun m!111439 () Bool)

(assert (=> b!69660 m!111439))

(declare-fun m!111441 () Bool)

(assert (=> b!69660 m!111441))

(declare-fun m!111443 () Bool)

(assert (=> b!69660 m!111443))

(assert (=> b!69660 m!111441))

(declare-fun m!111445 () Bool)

(assert (=> b!69660 m!111445))

(declare-fun m!111447 () Bool)

(assert (=> b!69660 m!111447))

(declare-fun m!111449 () Bool)

(assert (=> b!69660 m!111449))

(declare-fun m!111451 () Bool)

(assert (=> b!69660 m!111451))

(declare-fun m!111453 () Bool)

(assert (=> b!69660 m!111453))

(declare-fun m!111455 () Bool)

(assert (=> b!69660 m!111455))

(declare-fun m!111457 () Bool)

(assert (=> b!69660 m!111457))

(declare-fun m!111459 () Bool)

(assert (=> b!69660 m!111459))

(declare-fun m!111461 () Bool)

(assert (=> b!69660 m!111461))

(assert (=> b!69660 m!111437))

(declare-fun m!111463 () Bool)

(assert (=> b!69660 m!111463))

(declare-fun m!111465 () Bool)

(assert (=> b!69660 m!111465))

(declare-fun m!111467 () Bool)

(assert (=> b!69660 m!111467))

(declare-fun m!111469 () Bool)

(assert (=> b!69660 m!111469))

(declare-fun m!111471 () Bool)

(assert (=> b!69660 m!111471))

(declare-fun m!111473 () Bool)

(assert (=> b!69660 m!111473))

(declare-fun m!111475 () Bool)

(assert (=> b!69660 m!111475))

(declare-fun m!111477 () Bool)

(assert (=> b!69660 m!111477))

(declare-fun m!111479 () Bool)

(assert (=> b!69660 m!111479))

(declare-fun m!111481 () Bool)

(assert (=> b!69660 m!111481))

(declare-fun m!111483 () Bool)

(assert (=> b!69660 m!111483))

(declare-fun m!111485 () Bool)

(assert (=> b!69660 m!111485))

(declare-fun m!111487 () Bool)

(assert (=> b!69660 m!111487))

(declare-fun m!111489 () Bool)

(assert (=> b!69660 m!111489))

(declare-fun m!111491 () Bool)

(assert (=> b!69660 m!111491))

(declare-fun m!111493 () Bool)

(assert (=> b!69660 m!111493))

(assert (=> b!69660 m!111487))

(declare-fun m!111495 () Bool)

(assert (=> b!69660 m!111495))

(declare-fun m!111497 () Bool)

(assert (=> b!69660 m!111497))

(assert (=> b!69660 m!111447))

(declare-fun m!111499 () Bool)

(assert (=> b!69662 m!111499))

(declare-fun m!111501 () Bool)

(assert (=> b!69665 m!111501))

(assert (=> b!69240 d!22228))

(declare-fun d!22300 () Bool)

(declare-fun res!57535 () Bool)

(declare-fun e!45459 () Bool)

(assert (=> d!22300 (=> (not res!57535) (not e!45459))))

(assert (=> d!22300 (= res!57535 (= (size!1346 (buf!1727 (_2!3136 lt!111081))) (size!1346 (buf!1727 (_2!3136 lt!111073)))))))

(assert (=> d!22300 (= (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111073)) e!45459)))

(declare-fun b!69667 () Bool)

(declare-fun res!57536 () Bool)

(assert (=> b!69667 (=> (not res!57536) (not e!45459))))

(assert (=> b!69667 (= res!57536 (bvsle (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))) (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111073))) (currentByte!3429 (_2!3136 lt!111073)) (currentBit!3424 (_2!3136 lt!111073)))))))

(declare-fun b!69668 () Bool)

(declare-fun e!45460 () Bool)

(assert (=> b!69668 (= e!45459 e!45460)))

(declare-fun res!57537 () Bool)

(assert (=> b!69668 (=> res!57537 e!45460)))

(assert (=> b!69668 (= res!57537 (= (size!1346 (buf!1727 (_2!3136 lt!111081))) #b00000000000000000000000000000000))))

(declare-fun b!69669 () Bool)

(assert (=> b!69669 (= e!45460 (arrayBitRangesEq!0 (buf!1727 (_2!3136 lt!111081)) (buf!1727 (_2!3136 lt!111073)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081)))))))

(assert (= (and d!22300 res!57535) b!69667))

(assert (= (and b!69667 res!57536) b!69668))

(assert (= (and b!69668 (not res!57537)) b!69669))

(assert (=> b!69667 m!110719))

(assert (=> b!69667 m!110691))

(assert (=> b!69669 m!110719))

(assert (=> b!69669 m!110719))

(declare-fun m!111503 () Bool)

(assert (=> b!69669 m!111503))

(assert (=> b!69240 d!22300))

(declare-fun d!22302 () Bool)

(assert (=> d!22302 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111073))))

(declare-fun lt!111899 () Unit!4649)

(declare-fun choose!30 (BitStream!2296 BitStream!2296 BitStream!2296) Unit!4649)

(assert (=> d!22302 (= lt!111899 (choose!30 thiss!1379 (_2!3136 lt!111081) (_2!3136 lt!111073)))))

(assert (=> d!22302 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111081))))

(assert (=> d!22302 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3136 lt!111081) (_2!3136 lt!111073)) lt!111899)))

(declare-fun bs!5361 () Bool)

(assert (= bs!5361 d!22302))

(assert (=> bs!5361 m!110687))

(declare-fun m!111505 () Bool)

(assert (=> bs!5361 m!111505))

(assert (=> bs!5361 m!110749))

(assert (=> b!69240 d!22302))

(declare-fun b!69707 () Bool)

(declare-fun e!45476 () Unit!4649)

(declare-fun lt!112079 () Unit!4649)

(assert (=> b!69707 (= e!45476 lt!112079)))

(declare-fun lt!112077 () (_ BitVec 64))

(assert (=> b!69707 (= lt!112077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112082 () (_ BitVec 64))

(assert (=> b!69707 (= lt!112082 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2899 array!2899 (_ BitVec 64) (_ BitVec 64)) Unit!4649)

(assert (=> b!69707 (= lt!112079 (arrayBitRangesEqSymmetric!0 (buf!1727 thiss!1379) (buf!1727 (_2!3136 lt!111081)) lt!112077 lt!112082))))

(assert (=> b!69707 (arrayBitRangesEq!0 (buf!1727 (_2!3136 lt!111081)) (buf!1727 thiss!1379) lt!112077 lt!112082)))

(declare-fun d!22304 () Bool)

(declare-fun e!45477 () Bool)

(assert (=> d!22304 e!45477))

(declare-fun res!57565 () Bool)

(assert (=> d!22304 (=> (not res!57565) (not e!45477))))

(declare-fun lt!112090 () tuple2!6048)

(assert (=> d!22304 (= res!57565 (isPrefixOf!0 (_1!3135 lt!112090) (_2!3135 lt!112090)))))

(declare-fun lt!112073 () BitStream!2296)

(assert (=> d!22304 (= lt!112090 (tuple2!6049 lt!112073 (_2!3136 lt!111081)))))

(declare-fun lt!112078 () Unit!4649)

(declare-fun lt!112086 () Unit!4649)

(assert (=> d!22304 (= lt!112078 lt!112086)))

(assert (=> d!22304 (isPrefixOf!0 lt!112073 (_2!3136 lt!111081))))

(assert (=> d!22304 (= lt!112086 (lemmaIsPrefixTransitive!0 lt!112073 (_2!3136 lt!111081) (_2!3136 lt!111081)))))

(declare-fun lt!112085 () Unit!4649)

(declare-fun lt!112080 () Unit!4649)

(assert (=> d!22304 (= lt!112085 lt!112080)))

(assert (=> d!22304 (isPrefixOf!0 lt!112073 (_2!3136 lt!111081))))

(assert (=> d!22304 (= lt!112080 (lemmaIsPrefixTransitive!0 lt!112073 thiss!1379 (_2!3136 lt!111081)))))

(declare-fun lt!112084 () Unit!4649)

(assert (=> d!22304 (= lt!112084 e!45476)))

(declare-fun c!5173 () Bool)

(assert (=> d!22304 (= c!5173 (not (= (size!1346 (buf!1727 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!112083 () Unit!4649)

(declare-fun lt!112091 () Unit!4649)

(assert (=> d!22304 (= lt!112083 lt!112091)))

(assert (=> d!22304 (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111081))))

(assert (=> d!22304 (= lt!112091 (lemmaIsPrefixRefl!0 (_2!3136 lt!111081)))))

(declare-fun lt!112074 () Unit!4649)

(declare-fun lt!112072 () Unit!4649)

(assert (=> d!22304 (= lt!112074 lt!112072)))

(assert (=> d!22304 (= lt!112072 (lemmaIsPrefixRefl!0 (_2!3136 lt!111081)))))

(declare-fun lt!112087 () Unit!4649)

(declare-fun lt!112089 () Unit!4649)

(assert (=> d!22304 (= lt!112087 lt!112089)))

(assert (=> d!22304 (isPrefixOf!0 lt!112073 lt!112073)))

(assert (=> d!22304 (= lt!112089 (lemmaIsPrefixRefl!0 lt!112073))))

(declare-fun lt!112076 () Unit!4649)

(declare-fun lt!112081 () Unit!4649)

(assert (=> d!22304 (= lt!112076 lt!112081)))

(assert (=> d!22304 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22304 (= lt!112081 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22304 (= lt!112073 (BitStream!2297 (buf!1727 (_2!3136 lt!111081)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(assert (=> d!22304 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111081))))

(assert (=> d!22304 (= (reader!0 thiss!1379 (_2!3136 lt!111081)) lt!112090)))

(declare-fun b!69708 () Bool)

(declare-fun Unit!4674 () Unit!4649)

(assert (=> b!69708 (= e!45476 Unit!4674)))

(declare-fun lt!112088 () (_ BitVec 64))

(declare-fun b!69709 () Bool)

(declare-fun lt!112075 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2296 (_ BitVec 64)) BitStream!2296)

(assert (=> b!69709 (= e!45477 (= (_1!3135 lt!112090) (withMovedBitIndex!0 (_2!3135 lt!112090) (bvsub lt!112088 lt!112075))))))

(assert (=> b!69709 (or (= (bvand lt!112088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112088 lt!112075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69709 (= lt!112075 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(assert (=> b!69709 (= lt!112088 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(declare-fun b!69710 () Bool)

(declare-fun res!57567 () Bool)

(assert (=> b!69710 (=> (not res!57567) (not e!45477))))

(assert (=> b!69710 (= res!57567 (isPrefixOf!0 (_1!3135 lt!112090) thiss!1379))))

(declare-fun b!69711 () Bool)

(declare-fun res!57566 () Bool)

(assert (=> b!69711 (=> (not res!57566) (not e!45477))))

(assert (=> b!69711 (= res!57566 (isPrefixOf!0 (_2!3135 lt!112090) (_2!3136 lt!111081)))))

(assert (= (and d!22304 c!5173) b!69707))

(assert (= (and d!22304 (not c!5173)) b!69708))

(assert (= (and d!22304 res!57565) b!69710))

(assert (= (and b!69710 res!57567) b!69711))

(assert (= (and b!69711 res!57566) b!69709))

(declare-fun m!111597 () Bool)

(assert (=> b!69709 m!111597))

(assert (=> b!69709 m!110719))

(assert (=> b!69709 m!110763))

(declare-fun m!111599 () Bool)

(assert (=> d!22304 m!111599))

(assert (=> d!22304 m!110749))

(declare-fun m!111601 () Bool)

(assert (=> d!22304 m!111601))

(assert (=> d!22304 m!111419))

(declare-fun m!111603 () Bool)

(assert (=> d!22304 m!111603))

(declare-fun m!111605 () Bool)

(assert (=> d!22304 m!111605))

(assert (=> d!22304 m!110761))

(assert (=> d!22304 m!110759))

(assert (=> d!22304 m!111417))

(declare-fun m!111607 () Bool)

(assert (=> d!22304 m!111607))

(declare-fun m!111609 () Bool)

(assert (=> d!22304 m!111609))

(assert (=> b!69707 m!110763))

(declare-fun m!111611 () Bool)

(assert (=> b!69707 m!111611))

(declare-fun m!111613 () Bool)

(assert (=> b!69707 m!111613))

(declare-fun m!111615 () Bool)

(assert (=> b!69710 m!111615))

(declare-fun m!111617 () Bool)

(assert (=> b!69711 m!111617))

(assert (=> b!69240 d!22304))

(declare-fun d!22312 () Bool)

(assert (=> d!22312 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5363 () Bool)

(assert (= bs!5363 d!22312))

(declare-fun m!111619 () Bool)

(assert (=> bs!5363 m!111619))

(assert (=> b!69240 d!22312))

(declare-fun d!22314 () Bool)

(declare-fun e!45487 () Bool)

(assert (=> d!22314 e!45487))

(declare-fun res!57584 () Bool)

(assert (=> d!22314 (=> (not res!57584) (not e!45487))))

(declare-fun lt!112134 () (_ BitVec 64))

(declare-fun lt!112133 () (_ BitVec 64))

(declare-fun lt!112135 () (_ BitVec 64))

(assert (=> d!22314 (= res!57584 (= lt!112135 (bvsub lt!112133 lt!112134)))))

(assert (=> d!22314 (or (= (bvand lt!112133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112134 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112133 lt!112134) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22314 (= lt!112134 (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081)))))))

(declare-fun lt!112136 () (_ BitVec 64))

(declare-fun lt!112137 () (_ BitVec 64))

(assert (=> d!22314 (= lt!112133 (bvmul lt!112136 lt!112137))))

(assert (=> d!22314 (or (= lt!112136 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112137 (bvsdiv (bvmul lt!112136 lt!112137) lt!112136)))))

(assert (=> d!22314 (= lt!112137 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22314 (= lt!112136 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))))))

(assert (=> d!22314 (= lt!112135 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081)))))))

(assert (=> d!22314 (invariant!0 (currentBit!3424 (_2!3136 lt!111081)) (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111081))))))

(assert (=> d!22314 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))) lt!112135)))

(declare-fun b!69729 () Bool)

(declare-fun res!57583 () Bool)

(assert (=> b!69729 (=> (not res!57583) (not e!45487))))

(assert (=> b!69729 (= res!57583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112135))))

(declare-fun b!69730 () Bool)

(declare-fun lt!112138 () (_ BitVec 64))

(assert (=> b!69730 (= e!45487 (bvsle lt!112135 (bvmul lt!112138 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69730 (or (= lt!112138 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112138 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112138)))))

(assert (=> b!69730 (= lt!112138 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111081)))))))

(assert (= (and d!22314 res!57584) b!69729))

(assert (= (and b!69729 res!57583) b!69730))

(assert (=> d!22314 m!111039))

(assert (=> d!22314 m!110765))

(assert (=> b!69237 d!22314))

(declare-fun d!22330 () Bool)

(assert (=> d!22330 (= (invariant!0 (currentBit!3424 (_2!3136 lt!111073)) (currentByte!3429 (_2!3136 lt!111073)) (size!1346 (buf!1727 (_2!3136 lt!111073)))) (and (bvsge (currentBit!3424 (_2!3136 lt!111073)) #b00000000000000000000000000000000) (bvslt (currentBit!3424 (_2!3136 lt!111073)) #b00000000000000000000000000001000) (bvsge (currentByte!3429 (_2!3136 lt!111073)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3429 (_2!3136 lt!111073)) (size!1346 (buf!1727 (_2!3136 lt!111073)))) (and (= (currentBit!3424 (_2!3136 lt!111073)) #b00000000000000000000000000000000) (= (currentByte!3429 (_2!3136 lt!111073)) (size!1346 (buf!1727 (_2!3136 lt!111073))))))))))

(assert (=> b!69236 d!22330))

(declare-fun d!22332 () Bool)

(declare-fun size!1351 (List!723) Int)

(assert (=> d!22332 (= (length!351 lt!111077) (size!1351 lt!111077))))

(declare-fun bs!5368 () Bool)

(assert (= bs!5368 d!22332))

(declare-fun m!111653 () Bool)

(assert (=> bs!5368 m!111653))

(assert (=> b!69247 d!22332))

(declare-fun d!22334 () Bool)

(assert (=> d!22334 (= (array_inv!1207 srcBuffer!2) (bvsge (size!1346 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13518 d!22334))

(declare-fun d!22336 () Bool)

(assert (=> d!22336 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3424 thiss!1379) (currentByte!3429 thiss!1379) (size!1346 (buf!1727 thiss!1379))))))

(declare-fun bs!5369 () Bool)

(assert (= bs!5369 d!22336))

(declare-fun m!111655 () Bool)

(assert (=> bs!5369 m!111655))

(assert (=> start!13518 d!22336))

(declare-fun b!69731 () Bool)

(declare-fun e!45488 () Unit!4649)

(declare-fun lt!112146 () Unit!4649)

(assert (=> b!69731 (= e!45488 lt!112146)))

(declare-fun lt!112144 () (_ BitVec 64))

(assert (=> b!69731 (= lt!112144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112149 () (_ BitVec 64))

(assert (=> b!69731 (= lt!112149 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(assert (=> b!69731 (= lt!112146 (arrayBitRangesEqSymmetric!0 (buf!1727 thiss!1379) (buf!1727 (_2!3136 lt!111073)) lt!112144 lt!112149))))

(assert (=> b!69731 (arrayBitRangesEq!0 (buf!1727 (_2!3136 lt!111073)) (buf!1727 thiss!1379) lt!112144 lt!112149)))

(declare-fun d!22338 () Bool)

(declare-fun e!45489 () Bool)

(assert (=> d!22338 e!45489))

(declare-fun res!57585 () Bool)

(assert (=> d!22338 (=> (not res!57585) (not e!45489))))

(declare-fun lt!112157 () tuple2!6048)

(assert (=> d!22338 (= res!57585 (isPrefixOf!0 (_1!3135 lt!112157) (_2!3135 lt!112157)))))

(declare-fun lt!112140 () BitStream!2296)

(assert (=> d!22338 (= lt!112157 (tuple2!6049 lt!112140 (_2!3136 lt!111073)))))

(declare-fun lt!112145 () Unit!4649)

(declare-fun lt!112153 () Unit!4649)

(assert (=> d!22338 (= lt!112145 lt!112153)))

(assert (=> d!22338 (isPrefixOf!0 lt!112140 (_2!3136 lt!111073))))

(assert (=> d!22338 (= lt!112153 (lemmaIsPrefixTransitive!0 lt!112140 (_2!3136 lt!111073) (_2!3136 lt!111073)))))

(declare-fun lt!112152 () Unit!4649)

(declare-fun lt!112147 () Unit!4649)

(assert (=> d!22338 (= lt!112152 lt!112147)))

(assert (=> d!22338 (isPrefixOf!0 lt!112140 (_2!3136 lt!111073))))

(assert (=> d!22338 (= lt!112147 (lemmaIsPrefixTransitive!0 lt!112140 thiss!1379 (_2!3136 lt!111073)))))

(declare-fun lt!112151 () Unit!4649)

(assert (=> d!22338 (= lt!112151 e!45488)))

(declare-fun c!5175 () Bool)

(assert (=> d!22338 (= c!5175 (not (= (size!1346 (buf!1727 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!112150 () Unit!4649)

(declare-fun lt!112158 () Unit!4649)

(assert (=> d!22338 (= lt!112150 lt!112158)))

(assert (=> d!22338 (isPrefixOf!0 (_2!3136 lt!111073) (_2!3136 lt!111073))))

(assert (=> d!22338 (= lt!112158 (lemmaIsPrefixRefl!0 (_2!3136 lt!111073)))))

(declare-fun lt!112141 () Unit!4649)

(declare-fun lt!112139 () Unit!4649)

(assert (=> d!22338 (= lt!112141 lt!112139)))

(assert (=> d!22338 (= lt!112139 (lemmaIsPrefixRefl!0 (_2!3136 lt!111073)))))

(declare-fun lt!112154 () Unit!4649)

(declare-fun lt!112156 () Unit!4649)

(assert (=> d!22338 (= lt!112154 lt!112156)))

(assert (=> d!22338 (isPrefixOf!0 lt!112140 lt!112140)))

(assert (=> d!22338 (= lt!112156 (lemmaIsPrefixRefl!0 lt!112140))))

(declare-fun lt!112143 () Unit!4649)

(declare-fun lt!112148 () Unit!4649)

(assert (=> d!22338 (= lt!112143 lt!112148)))

(assert (=> d!22338 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22338 (= lt!112148 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22338 (= lt!112140 (BitStream!2297 (buf!1727 (_2!3136 lt!111073)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(assert (=> d!22338 (isPrefixOf!0 thiss!1379 (_2!3136 lt!111073))))

(assert (=> d!22338 (= (reader!0 thiss!1379 (_2!3136 lt!111073)) lt!112157)))

(declare-fun b!69732 () Bool)

(declare-fun Unit!4675 () Unit!4649)

(assert (=> b!69732 (= e!45488 Unit!4675)))

(declare-fun b!69733 () Bool)

(declare-fun lt!112155 () (_ BitVec 64))

(declare-fun lt!112142 () (_ BitVec 64))

(assert (=> b!69733 (= e!45489 (= (_1!3135 lt!112157) (withMovedBitIndex!0 (_2!3135 lt!112157) (bvsub lt!112155 lt!112142))))))

(assert (=> b!69733 (or (= (bvand lt!112155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112142 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112155 lt!112142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69733 (= lt!112142 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111073))) (currentByte!3429 (_2!3136 lt!111073)) (currentBit!3424 (_2!3136 lt!111073))))))

(assert (=> b!69733 (= lt!112155 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)))))

(declare-fun b!69734 () Bool)

(declare-fun res!57587 () Bool)

(assert (=> b!69734 (=> (not res!57587) (not e!45489))))

(assert (=> b!69734 (= res!57587 (isPrefixOf!0 (_1!3135 lt!112157) thiss!1379))))

(declare-fun b!69735 () Bool)

(declare-fun res!57586 () Bool)

(assert (=> b!69735 (=> (not res!57586) (not e!45489))))

(assert (=> b!69735 (= res!57586 (isPrefixOf!0 (_2!3135 lt!112157) (_2!3136 lt!111073)))))

(assert (= (and d!22338 c!5175) b!69731))

(assert (= (and d!22338 (not c!5175)) b!69732))

(assert (= (and d!22338 res!57585) b!69734))

(assert (= (and b!69734 res!57587) b!69735))

(assert (= (and b!69735 res!57586) b!69733))

(declare-fun m!111657 () Bool)

(assert (=> b!69733 m!111657))

(assert (=> b!69733 m!110691))

(assert (=> b!69733 m!110763))

(declare-fun m!111659 () Bool)

(assert (=> d!22338 m!111659))

(assert (=> d!22338 m!110687))

(declare-fun m!111661 () Bool)

(assert (=> d!22338 m!111661))

(declare-fun m!111663 () Bool)

(assert (=> d!22338 m!111663))

(declare-fun m!111665 () Bool)

(assert (=> d!22338 m!111665))

(declare-fun m!111667 () Bool)

(assert (=> d!22338 m!111667))

(assert (=> d!22338 m!110761))

(assert (=> d!22338 m!110759))

(declare-fun m!111669 () Bool)

(assert (=> d!22338 m!111669))

(declare-fun m!111671 () Bool)

(assert (=> d!22338 m!111671))

(declare-fun m!111673 () Bool)

(assert (=> d!22338 m!111673))

(assert (=> b!69731 m!110763))

(declare-fun m!111675 () Bool)

(assert (=> b!69731 m!111675))

(declare-fun m!111677 () Bool)

(assert (=> b!69731 m!111677))

(declare-fun m!111679 () Bool)

(assert (=> b!69734 m!111679))

(declare-fun m!111681 () Bool)

(assert (=> b!69735 m!111681))

(assert (=> b!69238 d!22338))

(declare-fun d!22340 () Bool)

(assert (=> d!22340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5370 () Bool)

(assert (= bs!5370 d!22340))

(declare-fun m!111683 () Bool)

(assert (=> bs!5370 m!111683))

(assert (=> b!69238 d!22340))

(declare-fun d!22342 () Bool)

(assert (=> d!22342 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111070)))

(declare-fun lt!112159 () Unit!4649)

(assert (=> d!22342 (= lt!112159 (choose!9 (_2!3136 lt!111081) (buf!1727 (_2!3136 lt!111073)) lt!111070 (BitStream!2297 (buf!1727 (_2!3136 lt!111073)) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081)))))))

(assert (=> d!22342 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3136 lt!111081) (buf!1727 (_2!3136 lt!111073)) lt!111070) lt!112159)))

(declare-fun bs!5371 () Bool)

(assert (= bs!5371 d!22342))

(assert (=> bs!5371 m!110711))

(declare-fun m!111685 () Bool)

(assert (=> bs!5371 m!111685))

(assert (=> b!69238 d!22342))

(declare-fun b!69736 () Bool)

(declare-fun e!45490 () Unit!4649)

(declare-fun lt!112167 () Unit!4649)

(assert (=> b!69736 (= e!45490 lt!112167)))

(declare-fun lt!112165 () (_ BitVec 64))

(assert (=> b!69736 (= lt!112165 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112170 () (_ BitVec 64))

(assert (=> b!69736 (= lt!112170 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(assert (=> b!69736 (= lt!112167 (arrayBitRangesEqSymmetric!0 (buf!1727 (_2!3136 lt!111081)) (buf!1727 (_2!3136 lt!111073)) lt!112165 lt!112170))))

(assert (=> b!69736 (arrayBitRangesEq!0 (buf!1727 (_2!3136 lt!111073)) (buf!1727 (_2!3136 lt!111081)) lt!112165 lt!112170)))

(declare-fun d!22344 () Bool)

(declare-fun e!45491 () Bool)

(assert (=> d!22344 e!45491))

(declare-fun res!57588 () Bool)

(assert (=> d!22344 (=> (not res!57588) (not e!45491))))

(declare-fun lt!112178 () tuple2!6048)

(assert (=> d!22344 (= res!57588 (isPrefixOf!0 (_1!3135 lt!112178) (_2!3135 lt!112178)))))

(declare-fun lt!112161 () BitStream!2296)

(assert (=> d!22344 (= lt!112178 (tuple2!6049 lt!112161 (_2!3136 lt!111073)))))

(declare-fun lt!112166 () Unit!4649)

(declare-fun lt!112174 () Unit!4649)

(assert (=> d!22344 (= lt!112166 lt!112174)))

(assert (=> d!22344 (isPrefixOf!0 lt!112161 (_2!3136 lt!111073))))

(assert (=> d!22344 (= lt!112174 (lemmaIsPrefixTransitive!0 lt!112161 (_2!3136 lt!111073) (_2!3136 lt!111073)))))

(declare-fun lt!112173 () Unit!4649)

(declare-fun lt!112168 () Unit!4649)

(assert (=> d!22344 (= lt!112173 lt!112168)))

(assert (=> d!22344 (isPrefixOf!0 lt!112161 (_2!3136 lt!111073))))

(assert (=> d!22344 (= lt!112168 (lemmaIsPrefixTransitive!0 lt!112161 (_2!3136 lt!111081) (_2!3136 lt!111073)))))

(declare-fun lt!112172 () Unit!4649)

(assert (=> d!22344 (= lt!112172 e!45490)))

(declare-fun c!5176 () Bool)

(assert (=> d!22344 (= c!5176 (not (= (size!1346 (buf!1727 (_2!3136 lt!111081))) #b00000000000000000000000000000000)))))

(declare-fun lt!112171 () Unit!4649)

(declare-fun lt!112179 () Unit!4649)

(assert (=> d!22344 (= lt!112171 lt!112179)))

(assert (=> d!22344 (isPrefixOf!0 (_2!3136 lt!111073) (_2!3136 lt!111073))))

(assert (=> d!22344 (= lt!112179 (lemmaIsPrefixRefl!0 (_2!3136 lt!111073)))))

(declare-fun lt!112162 () Unit!4649)

(declare-fun lt!112160 () Unit!4649)

(assert (=> d!22344 (= lt!112162 lt!112160)))

(assert (=> d!22344 (= lt!112160 (lemmaIsPrefixRefl!0 (_2!3136 lt!111073)))))

(declare-fun lt!112175 () Unit!4649)

(declare-fun lt!112177 () Unit!4649)

(assert (=> d!22344 (= lt!112175 lt!112177)))

(assert (=> d!22344 (isPrefixOf!0 lt!112161 lt!112161)))

(assert (=> d!22344 (= lt!112177 (lemmaIsPrefixRefl!0 lt!112161))))

(declare-fun lt!112164 () Unit!4649)

(declare-fun lt!112169 () Unit!4649)

(assert (=> d!22344 (= lt!112164 lt!112169)))

(assert (=> d!22344 (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111081))))

(assert (=> d!22344 (= lt!112169 (lemmaIsPrefixRefl!0 (_2!3136 lt!111081)))))

(assert (=> d!22344 (= lt!112161 (BitStream!2297 (buf!1727 (_2!3136 lt!111073)) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(assert (=> d!22344 (isPrefixOf!0 (_2!3136 lt!111081) (_2!3136 lt!111073))))

(assert (=> d!22344 (= (reader!0 (_2!3136 lt!111081) (_2!3136 lt!111073)) lt!112178)))

(declare-fun b!69737 () Bool)

(declare-fun Unit!4676 () Unit!4649)

(assert (=> b!69737 (= e!45490 Unit!4676)))

(declare-fun b!69738 () Bool)

(declare-fun lt!112163 () (_ BitVec 64))

(declare-fun lt!112176 () (_ BitVec 64))

(assert (=> b!69738 (= e!45491 (= (_1!3135 lt!112178) (withMovedBitIndex!0 (_2!3135 lt!112178) (bvsub lt!112176 lt!112163))))))

(assert (=> b!69738 (or (= (bvand lt!112176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112176 lt!112163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69738 (= lt!112163 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111073))) (currentByte!3429 (_2!3136 lt!111073)) (currentBit!3424 (_2!3136 lt!111073))))))

(assert (=> b!69738 (= lt!112176 (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111081))) (currentByte!3429 (_2!3136 lt!111081)) (currentBit!3424 (_2!3136 lt!111081))))))

(declare-fun b!69739 () Bool)

(declare-fun res!57590 () Bool)

(assert (=> b!69739 (=> (not res!57590) (not e!45491))))

(assert (=> b!69739 (= res!57590 (isPrefixOf!0 (_1!3135 lt!112178) (_2!3136 lt!111081)))))

(declare-fun b!69740 () Bool)

(declare-fun res!57589 () Bool)

(assert (=> b!69740 (=> (not res!57589) (not e!45491))))

(assert (=> b!69740 (= res!57589 (isPrefixOf!0 (_2!3135 lt!112178) (_2!3136 lt!111073)))))

(assert (= (and d!22344 c!5176) b!69736))

(assert (= (and d!22344 (not c!5176)) b!69737))

(assert (= (and d!22344 res!57588) b!69739))

(assert (= (and b!69739 res!57590) b!69740))

(assert (= (and b!69740 res!57589) b!69738))

(declare-fun m!111687 () Bool)

(assert (=> b!69738 m!111687))

(assert (=> b!69738 m!110691))

(assert (=> b!69738 m!110719))

(declare-fun m!111689 () Bool)

(assert (=> d!22344 m!111689))

(assert (=> d!22344 m!110681))

(declare-fun m!111691 () Bool)

(assert (=> d!22344 m!111691))

(assert (=> d!22344 m!111663))

(declare-fun m!111693 () Bool)

(assert (=> d!22344 m!111693))

(declare-fun m!111695 () Bool)

(assert (=> d!22344 m!111695))

(assert (=> d!22344 m!111419))

(assert (=> d!22344 m!111417))

(assert (=> d!22344 m!111669))

(declare-fun m!111697 () Bool)

(assert (=> d!22344 m!111697))

(declare-fun m!111699 () Bool)

(assert (=> d!22344 m!111699))

(assert (=> b!69736 m!110719))

(declare-fun m!111701 () Bool)

(assert (=> b!69736 m!111701))

(declare-fun m!111703 () Bool)

(assert (=> b!69736 m!111703))

(declare-fun m!111705 () Bool)

(assert (=> b!69739 m!111705))

(declare-fun m!111707 () Bool)

(assert (=> b!69740 m!111707))

(assert (=> b!69238 d!22344))

(declare-fun b!69749 () Bool)

(declare-datatypes ((tuple2!6080 0))(
  ( (tuple2!6081 (_1!3151 List!723) (_2!3151 BitStream!2296)) )
))
(declare-fun e!45497 () tuple2!6080)

(assert (=> b!69749 (= e!45497 (tuple2!6081 Nil!720 (_1!3135 lt!111083)))))

(declare-fun d!22346 () Bool)

(declare-fun e!45496 () Bool)

(assert (=> d!22346 e!45496))

(declare-fun c!5181 () Bool)

(assert (=> d!22346 (= c!5181 (= lt!111070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!112187 () List!723)

(assert (=> d!22346 (= lt!112187 (_1!3151 e!45497))))

(declare-fun c!5182 () Bool)

(assert (=> d!22346 (= c!5182 (= lt!111070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22346 (bvsge lt!111070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22346 (= (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_1!3135 lt!111083) lt!111070) lt!112187)))

(declare-fun b!69750 () Bool)

(declare-datatypes ((tuple2!6082 0))(
  ( (tuple2!6083 (_1!3152 Bool) (_2!3152 BitStream!2296)) )
))
(declare-fun lt!112186 () tuple2!6082)

(declare-fun lt!112188 () (_ BitVec 64))

(assert (=> b!69750 (= e!45497 (tuple2!6081 (Cons!719 (_1!3152 lt!112186) (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_2!3152 lt!112186) (bvsub lt!111070 lt!112188))) (_2!3152 lt!112186)))))

(declare-fun readBit!0 (BitStream!2296) tuple2!6082)

(assert (=> b!69750 (= lt!112186 (readBit!0 (_1!3135 lt!111083)))))

(assert (=> b!69750 (= lt!112188 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69752 () Bool)

(assert (=> b!69752 (= e!45496 (> (length!351 lt!112187) 0))))

(declare-fun b!69751 () Bool)

(declare-fun isEmpty!224 (List!723) Bool)

(assert (=> b!69751 (= e!45496 (isEmpty!224 lt!112187))))

(assert (= (and d!22346 c!5182) b!69749))

(assert (= (and d!22346 (not c!5182)) b!69750))

(assert (= (and d!22346 c!5181) b!69751))

(assert (= (and d!22346 (not c!5181)) b!69752))

(declare-fun m!111709 () Bool)

(assert (=> b!69750 m!111709))

(declare-fun m!111711 () Bool)

(assert (=> b!69750 m!111711))

(declare-fun m!111713 () Bool)

(assert (=> b!69752 m!111713))

(declare-fun m!111715 () Bool)

(assert (=> b!69751 m!111715))

(assert (=> b!69238 d!22346))

(declare-fun d!22348 () Bool)

(assert (=> d!22348 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081))) lt!111070) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111081))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111081)))) lt!111070))))

(declare-fun bs!5372 () Bool)

(assert (= bs!5372 d!22348))

(declare-fun m!111717 () Bool)

(assert (=> bs!5372 m!111717))

(assert (=> b!69238 d!22348))

(declare-fun d!22350 () Bool)

(assert (=> d!22350 (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!112189 () Unit!4649)

(assert (=> d!22350 (= lt!112189 (choose!9 thiss!1379 (buf!1727 (_2!3136 lt!111073)) (bvsub to!314 i!635) (BitStream!2297 (buf!1727 (_2!3136 lt!111073)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379))))))

(assert (=> d!22350 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1727 (_2!3136 lt!111073)) (bvsub to!314 i!635)) lt!112189)))

(declare-fun bs!5373 () Bool)

(assert (= bs!5373 d!22350))

(assert (=> bs!5373 m!110707))

(declare-fun m!111719 () Bool)

(assert (=> bs!5373 m!111719))

(assert (=> b!69238 d!22350))

(declare-fun b!69753 () Bool)

(declare-fun e!45499 () tuple2!6080)

(assert (=> b!69753 (= e!45499 (tuple2!6081 Nil!720 (_1!3135 lt!111067)))))

(declare-fun d!22352 () Bool)

(declare-fun e!45498 () Bool)

(assert (=> d!22352 e!45498))

(declare-fun c!5183 () Bool)

(assert (=> d!22352 (= c!5183 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!112191 () List!723)

(assert (=> d!22352 (= lt!112191 (_1!3151 e!45499))))

(declare-fun c!5184 () Bool)

(assert (=> d!22352 (= c!5184 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22352 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22352 (= (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_1!3135 lt!111067) (bvsub to!314 i!635)) lt!112191)))

(declare-fun lt!112190 () tuple2!6082)

(declare-fun lt!112192 () (_ BitVec 64))

(declare-fun b!69754 () Bool)

(assert (=> b!69754 (= e!45499 (tuple2!6081 (Cons!719 (_1!3152 lt!112190) (bitStreamReadBitsIntoList!0 (_2!3136 lt!111073) (_2!3152 lt!112190) (bvsub (bvsub to!314 i!635) lt!112192))) (_2!3152 lt!112190)))))

(assert (=> b!69754 (= lt!112190 (readBit!0 (_1!3135 lt!111067)))))

(assert (=> b!69754 (= lt!112192 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69756 () Bool)

(assert (=> b!69756 (= e!45498 (> (length!351 lt!112191) 0))))

(declare-fun b!69755 () Bool)

(assert (=> b!69755 (= e!45498 (isEmpty!224 lt!112191))))

(assert (= (and d!22352 c!5184) b!69753))

(assert (= (and d!22352 (not c!5184)) b!69754))

(assert (= (and d!22352 c!5183) b!69755))

(assert (= (and d!22352 (not c!5183)) b!69756))

(declare-fun m!111721 () Bool)

(assert (=> b!69754 m!111721))

(declare-fun m!111723 () Bool)

(assert (=> b!69754 m!111723))

(declare-fun m!111725 () Bool)

(assert (=> b!69756 m!111725))

(declare-fun m!111727 () Bool)

(assert (=> b!69755 m!111727))

(assert (=> b!69238 d!22352))

(declare-fun d!22354 () Bool)

(assert (=> d!22354 (= (head!542 (byteArrayBitContentToList!0 (_2!3136 lt!111073) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!838 (byteArrayBitContentToList!0 (_2!3136 lt!111073) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!69245 d!22354))

(declare-fun d!22356 () Bool)

(declare-fun c!5187 () Bool)

(assert (=> d!22356 (= c!5187 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45502 () List!723)

(assert (=> d!22356 (= (byteArrayBitContentToList!0 (_2!3136 lt!111073) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45502)))

(declare-fun b!69761 () Bool)

(assert (=> b!69761 (= e!45502 Nil!720)))

(declare-fun b!69762 () Bool)

(assert (=> b!69762 (= e!45502 (Cons!719 (not (= (bvand ((_ sign_extend 24) (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3136 lt!111073) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22356 c!5187) b!69761))

(assert (= (and d!22356 (not c!5187)) b!69762))

(assert (=> b!69762 m!110747))

(assert (=> b!69762 m!111093))

(declare-fun m!111729 () Bool)

(assert (=> b!69762 m!111729))

(assert (=> b!69245 d!22356))

(declare-fun d!22358 () Bool)

(assert (=> d!22358 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5374 () Bool)

(assert (= bs!5374 d!22358))

(assert (=> bs!5374 m!110747))

(assert (=> bs!5374 m!111093))

(assert (=> b!69245 d!22358))

(declare-fun d!22360 () Bool)

(declare-fun res!57591 () Bool)

(declare-fun e!45503 () Bool)

(assert (=> d!22360 (=> (not res!57591) (not e!45503))))

(assert (=> d!22360 (= res!57591 (= (size!1346 (buf!1727 thiss!1379)) (size!1346 (buf!1727 thiss!1379))))))

(assert (=> d!22360 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45503)))

(declare-fun b!69763 () Bool)

(declare-fun res!57592 () Bool)

(assert (=> b!69763 (=> (not res!57592) (not e!45503))))

(assert (=> b!69763 (= res!57592 (bvsle (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)) (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379))))))

(declare-fun b!69764 () Bool)

(declare-fun e!45504 () Bool)

(assert (=> b!69764 (= e!45503 e!45504)))

(declare-fun res!57593 () Bool)

(assert (=> b!69764 (=> res!57593 e!45504)))

(assert (=> b!69764 (= res!57593 (= (size!1346 (buf!1727 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69765 () Bool)

(assert (=> b!69765 (= e!45504 (arrayBitRangesEq!0 (buf!1727 thiss!1379) (buf!1727 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379))))))

(assert (= (and d!22360 res!57591) b!69763))

(assert (= (and b!69763 res!57592) b!69764))

(assert (= (and b!69764 (not res!57593)) b!69765))

(assert (=> b!69763 m!110763))

(assert (=> b!69763 m!110763))

(assert (=> b!69765 m!110763))

(assert (=> b!69765 m!110763))

(declare-fun m!111731 () Bool)

(assert (=> b!69765 m!111731))

(assert (=> b!69244 d!22360))

(declare-fun d!22362 () Bool)

(assert (=> d!22362 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!112195 () Unit!4649)

(declare-fun choose!11 (BitStream!2296) Unit!4649)

(assert (=> d!22362 (= lt!112195 (choose!11 thiss!1379))))

(assert (=> d!22362 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!112195)))

(declare-fun bs!5376 () Bool)

(assert (= bs!5376 d!22362))

(assert (=> bs!5376 m!110759))

(declare-fun m!111733 () Bool)

(assert (=> bs!5376 m!111733))

(assert (=> b!69244 d!22362))

(declare-fun d!22364 () Bool)

(declare-fun e!45505 () Bool)

(assert (=> d!22364 e!45505))

(declare-fun res!57595 () Bool)

(assert (=> d!22364 (=> (not res!57595) (not e!45505))))

(declare-fun lt!112197 () (_ BitVec 64))

(declare-fun lt!112198 () (_ BitVec 64))

(declare-fun lt!112196 () (_ BitVec 64))

(assert (=> d!22364 (= res!57595 (= lt!112198 (bvsub lt!112196 lt!112197)))))

(assert (=> d!22364 (or (= (bvand lt!112196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112197 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112196 lt!112197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22364 (= lt!112197 (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 thiss!1379))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379))))))

(declare-fun lt!112199 () (_ BitVec 64))

(declare-fun lt!112200 () (_ BitVec 64))

(assert (=> d!22364 (= lt!112196 (bvmul lt!112199 lt!112200))))

(assert (=> d!22364 (or (= lt!112199 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112200 (bvsdiv (bvmul lt!112199 lt!112200) lt!112199)))))

(assert (=> d!22364 (= lt!112200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22364 (= lt!112199 ((_ sign_extend 32) (size!1346 (buf!1727 thiss!1379))))))

(assert (=> d!22364 (= lt!112198 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3429 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3424 thiss!1379))))))

(assert (=> d!22364 (invariant!0 (currentBit!3424 thiss!1379) (currentByte!3429 thiss!1379) (size!1346 (buf!1727 thiss!1379)))))

(assert (=> d!22364 (= (bitIndex!0 (size!1346 (buf!1727 thiss!1379)) (currentByte!3429 thiss!1379) (currentBit!3424 thiss!1379)) lt!112198)))

(declare-fun b!69766 () Bool)

(declare-fun res!57594 () Bool)

(assert (=> b!69766 (=> (not res!57594) (not e!45505))))

(assert (=> b!69766 (= res!57594 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112198))))

(declare-fun b!69767 () Bool)

(declare-fun lt!112201 () (_ BitVec 64))

(assert (=> b!69767 (= e!45505 (bvsle lt!112198 (bvmul lt!112201 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69767 (or (= lt!112201 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112201 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112201)))))

(assert (=> b!69767 (= lt!112201 ((_ sign_extend 32) (size!1346 (buf!1727 thiss!1379))))))

(assert (= (and d!22364 res!57595) b!69766))

(assert (= (and b!69766 res!57594) b!69767))

(declare-fun m!111735 () Bool)

(assert (=> d!22364 m!111735))

(assert (=> d!22364 m!111655))

(assert (=> b!69244 d!22364))

(declare-fun d!22366 () Bool)

(assert (=> d!22366 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1346 (buf!1727 thiss!1379))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 thiss!1379))) ((_ sign_extend 32) (currentByte!3429 thiss!1379)) ((_ sign_extend 32) (currentBit!3424 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5377 () Bool)

(assert (= bs!5377 d!22366))

(assert (=> bs!5377 m!111735))

(assert (=> b!69246 d!22366))

(declare-fun d!22368 () Bool)

(declare-fun e!45506 () Bool)

(assert (=> d!22368 e!45506))

(declare-fun res!57597 () Bool)

(assert (=> d!22368 (=> (not res!57597) (not e!45506))))

(declare-fun lt!112203 () (_ BitVec 64))

(declare-fun lt!112202 () (_ BitVec 64))

(declare-fun lt!112204 () (_ BitVec 64))

(assert (=> d!22368 (= res!57597 (= lt!112204 (bvsub lt!112202 lt!112203)))))

(assert (=> d!22368 (or (= (bvand lt!112202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112202 lt!112203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22368 (= lt!112203 (remainingBits!0 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))) ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111073))) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111073)))))))

(declare-fun lt!112205 () (_ BitVec 64))

(declare-fun lt!112206 () (_ BitVec 64))

(assert (=> d!22368 (= lt!112202 (bvmul lt!112205 lt!112206))))

(assert (=> d!22368 (or (= lt!112205 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112206 (bvsdiv (bvmul lt!112205 lt!112206) lt!112205)))))

(assert (=> d!22368 (= lt!112206 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22368 (= lt!112205 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))))))

(assert (=> d!22368 (= lt!112204 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3429 (_2!3136 lt!111073))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3424 (_2!3136 lt!111073)))))))

(assert (=> d!22368 (invariant!0 (currentBit!3424 (_2!3136 lt!111073)) (currentByte!3429 (_2!3136 lt!111073)) (size!1346 (buf!1727 (_2!3136 lt!111073))))))

(assert (=> d!22368 (= (bitIndex!0 (size!1346 (buf!1727 (_2!3136 lt!111073))) (currentByte!3429 (_2!3136 lt!111073)) (currentBit!3424 (_2!3136 lt!111073))) lt!112204)))

(declare-fun b!69768 () Bool)

(declare-fun res!57596 () Bool)

(assert (=> b!69768 (=> (not res!57596) (not e!45506))))

(assert (=> b!69768 (= res!57596 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112204))))

(declare-fun b!69769 () Bool)

(declare-fun lt!112207 () (_ BitVec 64))

(assert (=> b!69769 (= e!45506 (bvsle lt!112204 (bvmul lt!112207 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69769 (or (= lt!112207 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112207 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112207)))))

(assert (=> b!69769 (= lt!112207 ((_ sign_extend 32) (size!1346 (buf!1727 (_2!3136 lt!111073)))))))

(assert (= (and d!22368 res!57597) b!69768))

(assert (= (and b!69768 res!57596) b!69769))

(declare-fun m!111737 () Bool)

(assert (=> d!22368 m!111737))

(assert (=> d!22368 m!110721))

(assert (=> b!69235 d!22368))

(declare-fun d!22370 () Bool)

(assert (=> d!22370 (= (head!542 lt!111077) (h!838 lt!111077))))

(assert (=> b!69242 d!22370))

(declare-fun d!22372 () Bool)

(assert (=> d!22372 (= (head!542 (byteArrayBitContentToList!0 (_2!3136 lt!111081) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!838 (byteArrayBitContentToList!0 (_2!3136 lt!111081) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69231 d!22372))

(declare-fun d!22374 () Bool)

(declare-fun c!5188 () Bool)

(assert (=> d!22374 (= c!5188 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45507 () List!723)

(assert (=> d!22374 (= (byteArrayBitContentToList!0 (_2!3136 lt!111081) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45507)))

(declare-fun b!69770 () Bool)

(assert (=> b!69770 (= e!45507 Nil!720)))

(declare-fun b!69771 () Bool)

(assert (=> b!69771 (= e!45507 (Cons!719 (not (= (bvand ((_ sign_extend 24) (select (arr!1925 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3136 lt!111081) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22374 c!5188) b!69770))

(assert (= (and d!22374 (not c!5188)) b!69771))

(assert (=> b!69771 m!110747))

(assert (=> b!69771 m!111093))

(declare-fun m!111739 () Bool)

(assert (=> b!69771 m!111739))

(assert (=> b!69231 d!22374))

(declare-fun d!22376 () Bool)

(assert (=> d!22376 (= (head!542 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111081) (_1!3135 lt!111068) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!838 (bitStreamReadBitsIntoList!0 (_2!3136 lt!111081) (_1!3135 lt!111068) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69231 d!22376))

(declare-fun b!69772 () Bool)

(declare-fun e!45509 () tuple2!6080)

(assert (=> b!69772 (= e!45509 (tuple2!6081 Nil!720 (_1!3135 lt!111068)))))

(declare-fun d!22378 () Bool)

(declare-fun e!45508 () Bool)

(assert (=> d!22378 e!45508))

(declare-fun c!5189 () Bool)

(assert (=> d!22378 (= c!5189 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!112209 () List!723)

(assert (=> d!22378 (= lt!112209 (_1!3151 e!45509))))

(declare-fun c!5190 () Bool)

(assert (=> d!22378 (= c!5190 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22378 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22378 (= (bitStreamReadBitsIntoList!0 (_2!3136 lt!111081) (_1!3135 lt!111068) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112209)))

(declare-fun lt!112208 () tuple2!6082)

(declare-fun b!69773 () Bool)

(declare-fun lt!112210 () (_ BitVec 64))

(assert (=> b!69773 (= e!45509 (tuple2!6081 (Cons!719 (_1!3152 lt!112208) (bitStreamReadBitsIntoList!0 (_2!3136 lt!111081) (_2!3152 lt!112208) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!112210))) (_2!3152 lt!112208)))))

(assert (=> b!69773 (= lt!112208 (readBit!0 (_1!3135 lt!111068)))))

(assert (=> b!69773 (= lt!112210 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69775 () Bool)

(assert (=> b!69775 (= e!45508 (> (length!351 lt!112209) 0))))

(declare-fun b!69774 () Bool)

(assert (=> b!69774 (= e!45508 (isEmpty!224 lt!112209))))

(assert (= (and d!22378 c!5190) b!69772))

(assert (= (and d!22378 (not c!5190)) b!69773))

(assert (= (and d!22378 c!5189) b!69774))

(assert (= (and d!22378 (not c!5189)) b!69775))

(declare-fun m!111741 () Bool)

(assert (=> b!69773 m!111741))

(declare-fun m!111743 () Bool)

(assert (=> b!69773 m!111743))

(declare-fun m!111745 () Bool)

(assert (=> b!69775 m!111745))

(declare-fun m!111747 () Bool)

(assert (=> b!69774 m!111747))

(assert (=> b!69231 d!22378))

(declare-fun d!22380 () Bool)

(assert (=> d!22380 (= (array_inv!1207 (buf!1727 thiss!1379)) (bvsge (size!1346 (buf!1727 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!69233 d!22380))

(declare-fun d!22382 () Bool)

(assert (=> d!22382 (= (bitAt!0 (buf!1727 (_2!3136 lt!111081)) lt!111071) (not (= (bvand ((_ sign_extend 24) (select (arr!1925 (buf!1727 (_2!3136 lt!111081))) ((_ extract 31 0) (bvsdiv lt!111071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5378 () Bool)

(assert (= bs!5378 d!22382))

(declare-fun m!111749 () Bool)

(assert (=> bs!5378 m!111749))

(assert (=> bs!5378 m!111033))

(assert (=> b!69232 d!22382))

(declare-fun d!22384 () Bool)

(assert (=> d!22384 (= (invariant!0 (currentBit!3424 (_2!3136 lt!111081)) (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111081)))) (and (bvsge (currentBit!3424 (_2!3136 lt!111081)) #b00000000000000000000000000000000) (bvslt (currentBit!3424 (_2!3136 lt!111081)) #b00000000000000000000000000001000) (bvsge (currentByte!3429 (_2!3136 lt!111081)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111081)))) (and (= (currentBit!3424 (_2!3136 lt!111081)) #b00000000000000000000000000000000) (= (currentByte!3429 (_2!3136 lt!111081)) (size!1346 (buf!1727 (_2!3136 lt!111081))))))))))

(assert (=> b!69243 d!22384))

(push 1)

(assert (not b!69660))

(assert (not b!69740))

(assert (not b!69754))

(assert (not b!69762))

(assert (not b!69710))

(assert (not b!69752))

(assert (not b!69659))

(assert (not b!69739))

(assert (not b!69773))

(assert (not b!69667))

(assert (not d!22340))

(assert (not d!22188))

(assert (not d!22190))

(assert (not b!69528))

(assert (not b!69516))

(assert (not b!69665))

(assert (not d!22336))

(assert (not b!69709))

(assert (not b!69735))

(assert (not b!69512))

(assert (not b!69750))

(assert (not b!69517))

(assert (not d!22314))

(assert (not d!22228))

(assert (not d!22344))

(assert (not b!69771))

(assert (not b!69707))

(assert (not d!22362))

(assert (not d!22304))

(assert (not b!69763))

(assert (not b!69510))

(assert (not b!69450))

(assert (not b!69775))

(assert (not b!69514))

(assert (not b!69669))

(assert (not b!69736))

(assert (not b!69662))

(assert (not b!69455))

(assert (not b!69733))

(assert (not b!69530))

(assert (not d!22192))

(assert (not b!69664))

(assert (not d!22312))

(assert (not b!69774))

(assert (not d!22338))

(assert (not d!22218))

(assert (not d!22366))

(assert (not b!69666))

(assert (not bm!892))

(assert (not d!22368))

(assert (not b!69513))

(assert (not d!22364))

(assert (not b!69756))

(assert (not d!22348))

(assert (not d!22302))

(assert (not b!69765))

(assert (not d!22180))

(assert (not d!22332))

(assert (not b!69443))

(assert (not d!22350))

(assert (not b!69511))

(assert (not b!69452))

(assert (not b!69711))

(assert (not b!69751))

(assert (not d!22342))

(assert (not b!69738))

(assert (not b!69734))

(assert (not b!69755))

(assert (not b!69731))

(assert (not b!69515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

