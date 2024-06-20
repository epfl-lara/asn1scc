; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7626 () Bool)

(assert start!7626)

(declare-fun b!37243 () Bool)

(declare-fun e!24534 () Bool)

(declare-datatypes ((array!1935 0))(
  ( (array!1936 (arr!1357 (Array (_ BitVec 32) (_ BitVec 8))) (size!867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1496 0))(
  ( (BitStream!1497 (buf!1195 array!1935) (currentByte!2595 (_ BitVec 32)) (currentBit!2590 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1496)

(declare-fun array_inv!801 (array!1935) Bool)

(assert (=> b!37243 (= e!24534 (array_inv!801 (buf!1195 thiss!1379)))))

(declare-fun b!37244 () Bool)

(declare-fun e!24528 () Bool)

(declare-fun e!24533 () Bool)

(assert (=> b!37244 (= e!24528 e!24533)))

(declare-fun res!31693 () Bool)

(assert (=> b!37244 (=> res!31693 e!24533)))

(declare-fun lt!56200 () Bool)

(declare-fun lt!56209 () Bool)

(assert (=> b!37244 (= res!31693 (not (= lt!56200 lt!56209)))))

(declare-fun lt!56210 () Bool)

(assert (=> b!37244 (= lt!56210 lt!56200)))

(declare-datatypes ((Unit!2709 0))(
  ( (Unit!2710) )
))
(declare-datatypes ((tuple2!3646 0))(
  ( (tuple2!3647 (_1!1910 Unit!2709) (_2!1910 BitStream!1496)) )
))
(declare-fun lt!56214 () tuple2!3646)

(declare-fun lt!56205 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1935 (_ BitVec 64)) Bool)

(assert (=> b!37244 (= lt!56200 (bitAt!0 (buf!1195 (_2!1910 lt!56214)) lt!56205))))

(declare-fun lt!56216 () (_ BitVec 64))

(declare-fun lt!56213 () Unit!2709)

(declare-fun lt!56195 () tuple2!3646)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1935 array!1935 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2709)

(assert (=> b!37244 (= lt!56213 (arrayBitRangesEqImpliesEq!0 (buf!1195 (_2!1910 lt!56195)) (buf!1195 (_2!1910 lt!56214)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56205 lt!56216))))

(declare-fun b!37245 () Bool)

(declare-datatypes ((List!449 0))(
  ( (Nil!446) (Cons!445 (h!564 Bool) (t!1199 List!449)) )
))
(declare-fun lt!56212 () List!449)

(assert (=> b!37245 (= e!24533 (not (= lt!56212 Nil!446)))))

(declare-fun res!31694 () Bool)

(declare-fun e!24535 () Bool)

(assert (=> start!7626 (=> (not res!31694) (not e!24535))))

(declare-fun srcBuffer!2 () array!1935)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!7626 (= res!31694 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!867 srcBuffer!2))))))))

(assert (=> start!7626 e!24535))

(assert (=> start!7626 true))

(assert (=> start!7626 (array_inv!801 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1496) Bool)

(assert (=> start!7626 (and (inv!12 thiss!1379) e!24534)))

(declare-fun b!37246 () Bool)

(declare-fun res!31688 () Bool)

(declare-fun e!24536 () Bool)

(assert (=> b!37246 (=> res!31688 e!24536)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!37246 (= res!31688 (not (invariant!0 (currentBit!2590 (_2!1910 lt!56195)) (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56214))))))))

(declare-fun b!37247 () Bool)

(declare-fun e!24531 () Bool)

(declare-fun e!24538 () Bool)

(assert (=> b!37247 (= e!24531 e!24538)))

(declare-fun res!31687 () Bool)

(assert (=> b!37247 (=> res!31687 e!24538)))

(declare-fun isPrefixOf!0 (BitStream!1496 BitStream!1496) Bool)

(assert (=> b!37247 (= res!31687 (not (isPrefixOf!0 thiss!1379 (_2!1910 lt!56195))))))

(declare-fun lt!56207 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37247 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195))) lt!56207)))

(assert (=> b!37247 (= lt!56207 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56198 () Unit!2709)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1496 BitStream!1496 (_ BitVec 64) (_ BitVec 64)) Unit!2709)

(assert (=> b!37247 (= lt!56198 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1910 lt!56195) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1496 (_ BitVec 8) (_ BitVec 32)) tuple2!3646)

(assert (=> b!37247 (= lt!56195 (appendBitFromByte!0 thiss!1379 (select (arr!1357 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!37248 () Bool)

(declare-fun e!24537 () Bool)

(assert (=> b!37248 (= e!24536 e!24537)))

(declare-fun res!31690 () Bool)

(assert (=> b!37248 (=> res!31690 e!24537)))

(assert (=> b!37248 (= res!31690 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!56218 () List!449)

(declare-datatypes ((tuple2!3648 0))(
  ( (tuple2!3649 (_1!1911 BitStream!1496) (_2!1911 BitStream!1496)) )
))
(declare-fun lt!56201 () tuple2!3648)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1496 BitStream!1496 (_ BitVec 64)) List!449)

(assert (=> b!37248 (= lt!56218 (bitStreamReadBitsIntoList!0 (_2!1910 lt!56214) (_1!1911 lt!56201) lt!56207))))

(declare-fun lt!56194 () List!449)

(declare-fun lt!56196 () tuple2!3648)

(assert (=> b!37248 (= lt!56194 (bitStreamReadBitsIntoList!0 (_2!1910 lt!56214) (_1!1911 lt!56196) (bvsub to!314 i!635)))))

(declare-fun byteArrayBitContentToList!0 (BitStream!1496 array!1935 (_ BitVec 64) (_ BitVec 64)) List!449)

(assert (=> b!37248 (= lt!56212 (byteArrayBitContentToList!0 (_2!1910 lt!56214) srcBuffer!2 i!635 (bvsub to!314 i!635)))))

(assert (=> b!37248 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56214)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195))) lt!56207)))

(declare-fun lt!56203 () Unit!2709)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1496 array!1935 (_ BitVec 64)) Unit!2709)

(assert (=> b!37248 (= lt!56203 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1910 lt!56195) (buf!1195 (_2!1910 lt!56214)) lt!56207))))

(declare-fun reader!0 (BitStream!1496 BitStream!1496) tuple2!3648)

(assert (=> b!37248 (= lt!56201 (reader!0 (_2!1910 lt!56195) (_2!1910 lt!56214)))))

(assert (=> b!37248 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56214)))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!56215 () Unit!2709)

(assert (=> b!37248 (= lt!56215 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1195 (_2!1910 lt!56214)) (bvsub to!314 i!635)))))

(assert (=> b!37248 (= lt!56196 (reader!0 thiss!1379 (_2!1910 lt!56214)))))

(declare-fun b!37249 () Bool)

(declare-fun res!31691 () Bool)

(assert (=> b!37249 (=> (not res!31691) (not e!24535))))

(assert (=> b!37249 (= res!31691 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 thiss!1379))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!37250 () Bool)

(declare-fun res!31686 () Bool)

(assert (=> b!37250 (=> res!31686 e!24536)))

(assert (=> b!37250 (= res!31686 (not (invariant!0 (currentBit!2590 (_2!1910 lt!56195)) (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56195))))))))

(declare-fun b!37251 () Bool)

(declare-fun res!31704 () Bool)

(assert (=> b!37251 (=> res!31704 e!24533)))

(declare-datatypes ((tuple2!3650 0))(
  ( (tuple2!3651 (_1!1912 BitStream!1496) (_2!1912 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1496) tuple2!3650)

(assert (=> b!37251 (= res!31704 (not (= (_2!1912 (readBitPure!0 (_1!1911 lt!56196))) lt!56209)))))

(declare-fun lt!56199 () tuple2!3648)

(declare-fun e!24529 () Bool)

(declare-fun b!37252 () Bool)

(declare-fun head!286 (List!449) Bool)

(assert (=> b!37252 (= e!24529 (= (head!286 (byteArrayBitContentToList!0 (_2!1910 lt!56195) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!286 (bitStreamReadBitsIntoList!0 (_2!1910 lt!56195) (_1!1911 lt!56199) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!37253 () Bool)

(declare-fun e!24524 () Bool)

(declare-fun e!24527 () Bool)

(assert (=> b!37253 (= e!24524 e!24527)))

(declare-fun res!31692 () Bool)

(assert (=> b!37253 (=> res!31692 e!24527)))

(declare-fun lt!56217 () Bool)

(assert (=> b!37253 (= res!31692 (not (= lt!56217 (bitAt!0 (buf!1195 (_1!1911 lt!56201)) lt!56205))))))

(assert (=> b!37253 (= lt!56217 (bitAt!0 (buf!1195 (_1!1911 lt!56196)) lt!56205))))

(declare-fun b!37254 () Bool)

(declare-fun e!24532 () Bool)

(assert (=> b!37254 (= e!24532 e!24528)))

(declare-fun res!31702 () Bool)

(assert (=> b!37254 (=> res!31702 e!24528)))

(assert (=> b!37254 (= res!31702 (not (= lt!56210 lt!56209)))))

(assert (=> b!37254 (= lt!56210 (bitAt!0 (buf!1195 (_2!1910 lt!56195)) lt!56205))))

(declare-fun b!37255 () Bool)

(assert (=> b!37255 (= e!24535 (not e!24531))))

(declare-fun res!31698 () Bool)

(assert (=> b!37255 (=> res!31698 e!24531)))

(assert (=> b!37255 (= res!31698 (bvsge i!635 to!314))))

(assert (=> b!37255 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!56206 () Unit!2709)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1496) Unit!2709)

(assert (=> b!37255 (= lt!56206 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!37255 (= lt!56205 (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)))))

(declare-fun b!37256 () Bool)

(declare-fun e!24526 () Bool)

(assert (=> b!37256 (= e!24538 e!24526)))

(declare-fun res!31700 () Bool)

(assert (=> b!37256 (=> res!31700 e!24526)))

(assert (=> b!37256 (= res!31700 (not (isPrefixOf!0 (_2!1910 lt!56195) (_2!1910 lt!56214))))))

(assert (=> b!37256 (isPrefixOf!0 thiss!1379 (_2!1910 lt!56214))))

(declare-fun lt!56197 () Unit!2709)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1496 BitStream!1496 BitStream!1496) Unit!2709)

(assert (=> b!37256 (= lt!56197 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1910 lt!56195) (_2!1910 lt!56214)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1496 array!1935 (_ BitVec 64) (_ BitVec 64)) tuple2!3646)

(assert (=> b!37256 (= lt!56214 (appendBitsMSBFirstLoop!0 (_2!1910 lt!56195) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!37256 e!24529))

(declare-fun res!31685 () Bool)

(assert (=> b!37256 (=> (not res!31685) (not e!24529))))

(assert (=> b!37256 (= res!31685 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56204 () Unit!2709)

(assert (=> b!37256 (= lt!56204 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1195 (_2!1910 lt!56195)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37256 (= lt!56199 (reader!0 thiss!1379 (_2!1910 lt!56195)))))

(declare-fun b!37257 () Bool)

(declare-fun e!24525 () Bool)

(assert (=> b!37257 (= e!24526 e!24525)))

(declare-fun res!31695 () Bool)

(assert (=> b!37257 (=> res!31695 e!24525)))

(declare-fun lt!56208 () (_ BitVec 64))

(assert (=> b!37257 (= res!31695 (not (= lt!56208 (bvsub (bvadd lt!56205 to!314) i!635))))))

(assert (=> b!37257 (= lt!56208 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56214))) (currentByte!2595 (_2!1910 lt!56214)) (currentBit!2590 (_2!1910 lt!56214))))))

(declare-fun b!37258 () Bool)

(declare-fun res!31703 () Bool)

(assert (=> b!37258 (=> res!31703 e!24525)))

(assert (=> b!37258 (= res!31703 (not (invariant!0 (currentBit!2590 (_2!1910 lt!56214)) (currentByte!2595 (_2!1910 lt!56214)) (size!867 (buf!1195 (_2!1910 lt!56214))))))))

(declare-fun b!37259 () Bool)

(declare-fun res!31701 () Bool)

(assert (=> b!37259 (=> res!31701 e!24527)))

(assert (=> b!37259 (= res!31701 (not (= (head!286 lt!56194) lt!56217)))))

(declare-fun b!37260 () Bool)

(assert (=> b!37260 (= e!24525 e!24536)))

(declare-fun res!31684 () Bool)

(assert (=> b!37260 (=> res!31684 e!24536)))

(assert (=> b!37260 (= res!31684 (not (= (size!867 (buf!1195 (_2!1910 lt!56195))) (size!867 (buf!1195 (_2!1910 lt!56214))))))))

(assert (=> b!37260 (= lt!56208 (bvsub (bvsub (bvadd lt!56216 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37260 (= lt!56216 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))))))

(assert (=> b!37260 (= (size!867 (buf!1195 (_2!1910 lt!56214))) (size!867 (buf!1195 thiss!1379)))))

(declare-fun b!37261 () Bool)

(declare-fun res!31696 () Bool)

(assert (=> b!37261 (=> res!31696 e!24525)))

(assert (=> b!37261 (= res!31696 (not (= (size!867 (buf!1195 thiss!1379)) (size!867 (buf!1195 (_2!1910 lt!56214))))))))

(declare-fun b!37262 () Bool)

(assert (=> b!37262 (= e!24527 e!24532)))

(declare-fun res!31697 () Bool)

(assert (=> b!37262 (=> res!31697 e!24532)))

(assert (=> b!37262 (= res!31697 (not (= (head!286 lt!56212) lt!56209)))))

(assert (=> b!37262 (= lt!56209 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!37263 () Bool)

(declare-fun res!31689 () Bool)

(assert (=> b!37263 (=> res!31689 e!24537)))

(declare-fun length!175 (List!449) Int)

(assert (=> b!37263 (= res!31689 (<= (length!175 lt!56194) 0))))

(declare-fun b!37264 () Bool)

(assert (=> b!37264 (= e!24537 e!24524)))

(declare-fun res!31699 () Bool)

(assert (=> b!37264 (=> res!31699 e!24524)))

(declare-fun lt!56211 () List!449)

(assert (=> b!37264 (= res!31699 (not (= lt!56211 lt!56218)))))

(assert (=> b!37264 (= lt!56218 lt!56211)))

(declare-fun tail!166 (List!449) List!449)

(assert (=> b!37264 (= lt!56211 (tail!166 lt!56194))))

(declare-fun lt!56202 () Unit!2709)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1496 BitStream!1496 BitStream!1496 BitStream!1496 (_ BitVec 64) List!449) Unit!2709)

(assert (=> b!37264 (= lt!56202 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1910 lt!56214) (_2!1910 lt!56214) (_1!1911 lt!56196) (_1!1911 lt!56201) (bvsub to!314 i!635) lt!56194))))

(assert (= (and start!7626 res!31694) b!37249))

(assert (= (and b!37249 res!31691) b!37255))

(assert (= (and b!37255 (not res!31698)) b!37247))

(assert (= (and b!37247 (not res!31687)) b!37256))

(assert (= (and b!37256 res!31685) b!37252))

(assert (= (and b!37256 (not res!31700)) b!37257))

(assert (= (and b!37257 (not res!31695)) b!37258))

(assert (= (and b!37258 (not res!31703)) b!37261))

(assert (= (and b!37261 (not res!31696)) b!37260))

(assert (= (and b!37260 (not res!31684)) b!37250))

(assert (= (and b!37250 (not res!31686)) b!37246))

(assert (= (and b!37246 (not res!31688)) b!37248))

(assert (= (and b!37248 (not res!31690)) b!37263))

(assert (= (and b!37263 (not res!31689)) b!37264))

(assert (= (and b!37264 (not res!31699)) b!37253))

(assert (= (and b!37253 (not res!31692)) b!37259))

(assert (= (and b!37259 (not res!31701)) b!37262))

(assert (= (and b!37262 (not res!31697)) b!37254))

(assert (= (and b!37254 (not res!31702)) b!37244))

(assert (= (and b!37244 (not res!31693)) b!37251))

(assert (= (and b!37251 (not res!31704)) b!37245))

(assert (= start!7626 b!37243))

(declare-fun m!56389 () Bool)

(assert (=> b!37244 m!56389))

(declare-fun m!56391 () Bool)

(assert (=> b!37244 m!56391))

(declare-fun m!56393 () Bool)

(assert (=> b!37243 m!56393))

(declare-fun m!56395 () Bool)

(assert (=> b!37256 m!56395))

(declare-fun m!56397 () Bool)

(assert (=> b!37256 m!56397))

(declare-fun m!56399 () Bool)

(assert (=> b!37256 m!56399))

(declare-fun m!56401 () Bool)

(assert (=> b!37256 m!56401))

(declare-fun m!56403 () Bool)

(assert (=> b!37256 m!56403))

(declare-fun m!56405 () Bool)

(assert (=> b!37256 m!56405))

(declare-fun m!56407 () Bool)

(assert (=> b!37256 m!56407))

(declare-fun m!56409 () Bool)

(assert (=> b!37252 m!56409))

(assert (=> b!37252 m!56409))

(declare-fun m!56411 () Bool)

(assert (=> b!37252 m!56411))

(declare-fun m!56413 () Bool)

(assert (=> b!37252 m!56413))

(assert (=> b!37252 m!56413))

(declare-fun m!56415 () Bool)

(assert (=> b!37252 m!56415))

(declare-fun m!56417 () Bool)

(assert (=> b!37254 m!56417))

(declare-fun m!56419 () Bool)

(assert (=> b!37257 m!56419))

(declare-fun m!56421 () Bool)

(assert (=> b!37250 m!56421))

(declare-fun m!56423 () Bool)

(assert (=> b!37251 m!56423))

(declare-fun m!56425 () Bool)

(assert (=> b!37248 m!56425))

(declare-fun m!56427 () Bool)

(assert (=> b!37248 m!56427))

(declare-fun m!56429 () Bool)

(assert (=> b!37248 m!56429))

(declare-fun m!56431 () Bool)

(assert (=> b!37248 m!56431))

(declare-fun m!56433 () Bool)

(assert (=> b!37248 m!56433))

(declare-fun m!56435 () Bool)

(assert (=> b!37248 m!56435))

(declare-fun m!56437 () Bool)

(assert (=> b!37248 m!56437))

(declare-fun m!56439 () Bool)

(assert (=> b!37248 m!56439))

(declare-fun m!56441 () Bool)

(assert (=> b!37248 m!56441))

(declare-fun m!56443 () Bool)

(assert (=> b!37255 m!56443))

(declare-fun m!56445 () Bool)

(assert (=> b!37255 m!56445))

(declare-fun m!56447 () Bool)

(assert (=> b!37255 m!56447))

(declare-fun m!56449 () Bool)

(assert (=> b!37247 m!56449))

(declare-fun m!56451 () Bool)

(assert (=> b!37247 m!56451))

(declare-fun m!56453 () Bool)

(assert (=> b!37247 m!56453))

(declare-fun m!56455 () Bool)

(assert (=> b!37247 m!56455))

(assert (=> b!37247 m!56451))

(declare-fun m!56457 () Bool)

(assert (=> b!37247 m!56457))

(declare-fun m!56459 () Bool)

(assert (=> b!37262 m!56459))

(declare-fun m!56461 () Bool)

(assert (=> b!37262 m!56461))

(declare-fun m!56463 () Bool)

(assert (=> b!37259 m!56463))

(declare-fun m!56465 () Bool)

(assert (=> b!37263 m!56465))

(declare-fun m!56467 () Bool)

(assert (=> b!37253 m!56467))

(declare-fun m!56469 () Bool)

(assert (=> b!37253 m!56469))

(declare-fun m!56471 () Bool)

(assert (=> b!37258 m!56471))

(declare-fun m!56473 () Bool)

(assert (=> b!37260 m!56473))

(declare-fun m!56475 () Bool)

(assert (=> b!37264 m!56475))

(declare-fun m!56477 () Bool)

(assert (=> b!37264 m!56477))

(declare-fun m!56479 () Bool)

(assert (=> b!37249 m!56479))

(declare-fun m!56481 () Bool)

(assert (=> b!37246 m!56481))

(declare-fun m!56483 () Bool)

(assert (=> start!7626 m!56483))

(declare-fun m!56485 () Bool)

(assert (=> start!7626 m!56485))

(push 1)

(assert (not b!37258))

(assert (not b!37247))

(assert (not b!37251))

(assert (not b!37257))

(assert (not b!37246))

(assert (not b!37250))

(assert (not b!37264))

(assert (not b!37262))

(assert (not b!37255))

(assert (not b!37254))

(assert (not start!7626))

(assert (not b!37244))

(assert (not b!37243))

(assert (not b!37248))

(assert (not b!37252))

(assert (not b!37253))

(assert (not b!37263))

(assert (not b!37259))

(assert (not b!37260))

(assert (not b!37249))

(assert (not b!37256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11084 () Bool)

(assert (=> d!11084 (= (invariant!0 (currentBit!2590 (_2!1910 lt!56195)) (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56195)))) (and (bvsge (currentBit!2590 (_2!1910 lt!56195)) #b00000000000000000000000000000000) (bvslt (currentBit!2590 (_2!1910 lt!56195)) #b00000000000000000000000000001000) (bvsge (currentByte!2595 (_2!1910 lt!56195)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56195)))) (and (= (currentBit!2590 (_2!1910 lt!56195)) #b00000000000000000000000000000000) (= (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56195))))))))))

(assert (=> b!37250 d!11084))

(declare-fun d!11092 () Bool)

(declare-fun e!24590 () Bool)

(assert (=> d!11092 e!24590))

(declare-fun res!31766 () Bool)

(assert (=> d!11092 (=> (not res!31766) (not e!24590))))

(declare-fun lt!56452 () (_ BitVec 64))

(declare-fun lt!56447 () (_ BitVec 64))

(declare-fun lt!56449 () (_ BitVec 64))

(assert (=> d!11092 (= res!31766 (= lt!56452 (bvsub lt!56449 lt!56447)))))

(assert (=> d!11092 (or (= (bvand lt!56449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56449 lt!56447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11092 (= lt!56447 (remainingBits!0 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195)))))))

(declare-fun lt!56450 () (_ BitVec 64))

(declare-fun lt!56448 () (_ BitVec 64))

(assert (=> d!11092 (= lt!56449 (bvmul lt!56450 lt!56448))))

(assert (=> d!11092 (or (= lt!56450 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56448 (bvsdiv (bvmul lt!56450 lt!56448) lt!56450)))))

(assert (=> d!11092 (= lt!56448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11092 (= lt!56450 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))))))

(assert (=> d!11092 (= lt!56452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195)))))))

(assert (=> d!11092 (invariant!0 (currentBit!2590 (_2!1910 lt!56195)) (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56195))))))

(assert (=> d!11092 (= (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))) lt!56452)))

(declare-fun b!37364 () Bool)

(declare-fun res!31767 () Bool)

(assert (=> b!37364 (=> (not res!31767) (not e!24590))))

(assert (=> b!37364 (= res!31767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56452))))

(declare-fun b!37365 () Bool)

(declare-fun lt!56451 () (_ BitVec 64))

(assert (=> b!37365 (= e!24590 (bvsle lt!56452 (bvmul lt!56451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37365 (or (= lt!56451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56451)))))

(assert (=> b!37365 (= lt!56451 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))))))

(assert (= (and d!11092 res!31766) b!37364))

(assert (= (and b!37364 res!31767) b!37365))

(declare-fun m!56653 () Bool)

(assert (=> d!11092 m!56653))

(assert (=> d!11092 m!56421))

(assert (=> b!37260 d!11092))

(declare-fun d!11108 () Bool)

(assert (=> d!11108 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 thiss!1379))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!867 (buf!1195 thiss!1379))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2968 () Bool)

(assert (= bs!2968 d!11108))

(declare-fun m!56655 () Bool)

(assert (=> bs!2968 m!56655))

(assert (=> b!37249 d!11108))

(declare-fun d!11110 () Bool)

(assert (=> d!11110 (= (head!286 lt!56212) (h!564 lt!56212))))

(assert (=> b!37262 d!11110))

(declare-fun d!11112 () Bool)

(assert (=> d!11112 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1357 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2969 () Bool)

(assert (= bs!2969 d!11112))

(assert (=> bs!2969 m!56451))

(declare-fun m!56657 () Bool)

(assert (=> bs!2969 m!56657))

(assert (=> b!37262 d!11112))

(declare-fun d!11114 () Bool)

(declare-datatypes ((tuple2!3664 0))(
  ( (tuple2!3665 (_1!1919 Bool) (_2!1919 BitStream!1496)) )
))
(declare-fun lt!56455 () tuple2!3664)

(declare-fun readBit!0 (BitStream!1496) tuple2!3664)

(assert (=> d!11114 (= lt!56455 (readBit!0 (_1!1911 lt!56196)))))

(assert (=> d!11114 (= (readBitPure!0 (_1!1911 lt!56196)) (tuple2!3651 (_2!1919 lt!56455) (_1!1919 lt!56455)))))

(declare-fun bs!2970 () Bool)

(assert (= bs!2970 d!11114))

(declare-fun m!56659 () Bool)

(assert (=> bs!2970 m!56659))

(assert (=> b!37251 d!11114))

(declare-fun d!11116 () Bool)

(declare-fun size!869 (List!449) Int)

(assert (=> d!11116 (= (length!175 lt!56194) (size!869 lt!56194))))

(declare-fun bs!2971 () Bool)

(assert (= bs!2971 d!11116))

(declare-fun m!56661 () Bool)

(assert (=> bs!2971 m!56661))

(assert (=> b!37263 d!11116))

(declare-fun d!11118 () Bool)

(assert (=> d!11118 (= (head!286 (byteArrayBitContentToList!0 (_2!1910 lt!56195) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!564 (byteArrayBitContentToList!0 (_2!1910 lt!56195) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37252 d!11118))

(declare-fun d!11120 () Bool)

(declare-fun c!2575 () Bool)

(assert (=> d!11120 (= c!2575 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24593 () List!449)

(assert (=> d!11120 (= (byteArrayBitContentToList!0 (_2!1910 lt!56195) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!24593)))

(declare-fun b!37370 () Bool)

(assert (=> b!37370 (= e!24593 Nil!446)))

(declare-fun b!37371 () Bool)

(assert (=> b!37371 (= e!24593 (Cons!445 (not (= (bvand ((_ sign_extend 24) (select (arr!1357 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1910 lt!56195) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11120 c!2575) b!37370))

(assert (= (and d!11120 (not c!2575)) b!37371))

(assert (=> b!37371 m!56451))

(assert (=> b!37371 m!56657))

(declare-fun m!56663 () Bool)

(assert (=> b!37371 m!56663))

(assert (=> b!37252 d!11120))

(declare-fun d!11122 () Bool)

(assert (=> d!11122 (= (head!286 (bitStreamReadBitsIntoList!0 (_2!1910 lt!56195) (_1!1911 lt!56199) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!564 (bitStreamReadBitsIntoList!0 (_2!1910 lt!56195) (_1!1911 lt!56199) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37252 d!11122))

(declare-fun b!37382 () Bool)

(declare-fun e!24598 () Bool)

(declare-fun lt!56463 () List!449)

(declare-fun isEmpty!107 (List!449) Bool)

(assert (=> b!37382 (= e!24598 (isEmpty!107 lt!56463))))

(declare-fun d!11124 () Bool)

(assert (=> d!11124 e!24598))

(declare-fun c!2581 () Bool)

(assert (=> d!11124 (= c!2581 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3666 0))(
  ( (tuple2!3667 (_1!1920 List!449) (_2!1920 BitStream!1496)) )
))
(declare-fun e!24599 () tuple2!3666)

(assert (=> d!11124 (= lt!56463 (_1!1920 e!24599))))

(declare-fun c!2580 () Bool)

(assert (=> d!11124 (= c!2580 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11124 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11124 (= (bitStreamReadBitsIntoList!0 (_2!1910 lt!56195) (_1!1911 lt!56199) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56463)))

(declare-fun b!37383 () Bool)

(assert (=> b!37383 (= e!24598 (> (length!175 lt!56463) 0))))

(declare-fun b!37380 () Bool)

(assert (=> b!37380 (= e!24599 (tuple2!3667 Nil!446 (_1!1911 lt!56199)))))

(declare-fun lt!56464 () (_ BitVec 64))

(declare-fun lt!56462 () tuple2!3664)

(declare-fun b!37381 () Bool)

(assert (=> b!37381 (= e!24599 (tuple2!3667 (Cons!445 (_1!1919 lt!56462) (bitStreamReadBitsIntoList!0 (_2!1910 lt!56195) (_2!1919 lt!56462) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!56464))) (_2!1919 lt!56462)))))

(assert (=> b!37381 (= lt!56462 (readBit!0 (_1!1911 lt!56199)))))

(assert (=> b!37381 (= lt!56464 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11124 c!2580) b!37380))

(assert (= (and d!11124 (not c!2580)) b!37381))

(assert (= (and d!11124 c!2581) b!37382))

(assert (= (and d!11124 (not c!2581)) b!37383))

(declare-fun m!56665 () Bool)

(assert (=> b!37382 m!56665))

(declare-fun m!56667 () Bool)

(assert (=> b!37383 m!56667))

(declare-fun m!56669 () Bool)

(assert (=> b!37381 m!56669))

(declare-fun m!56671 () Bool)

(assert (=> b!37381 m!56671))

(assert (=> b!37252 d!11124))

(declare-fun d!11126 () Bool)

(assert (=> d!11126 (= (bitAt!0 (buf!1195 (_2!1910 lt!56195)) lt!56205) (not (= (bvand ((_ sign_extend 24) (select (arr!1357 (buf!1195 (_2!1910 lt!56195))) ((_ extract 31 0) (bvsdiv lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2972 () Bool)

(assert (= bs!2972 d!11126))

(declare-fun m!56673 () Bool)

(assert (=> bs!2972 m!56673))

(declare-fun m!56675 () Bool)

(assert (=> bs!2972 m!56675))

(assert (=> b!37254 d!11126))

(declare-fun d!11128 () Bool)

(assert (=> d!11128 (= (array_inv!801 (buf!1195 thiss!1379)) (bvsge (size!867 (buf!1195 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!37243 d!11128))

(declare-fun d!11130 () Bool)

(assert (=> d!11130 (= (tail!166 lt!56194) (t!1199 lt!56194))))

(assert (=> b!37264 d!11130))

(declare-fun d!11132 () Bool)

(declare-fun e!24602 () Bool)

(assert (=> d!11132 e!24602))

(declare-fun res!31770 () Bool)

(assert (=> d!11132 (=> (not res!31770) (not e!24602))))

(declare-fun lt!56470 () (_ BitVec 64))

(assert (=> d!11132 (= res!31770 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!56470) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11132 (= lt!56470 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56469 () Unit!2709)

(declare-fun choose!42 (BitStream!1496 BitStream!1496 BitStream!1496 BitStream!1496 (_ BitVec 64) List!449) Unit!2709)

(assert (=> d!11132 (= lt!56469 (choose!42 (_2!1910 lt!56214) (_2!1910 lt!56214) (_1!1911 lt!56196) (_1!1911 lt!56201) (bvsub to!314 i!635) lt!56194))))

(assert (=> d!11132 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11132 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1910 lt!56214) (_2!1910 lt!56214) (_1!1911 lt!56196) (_1!1911 lt!56201) (bvsub to!314 i!635) lt!56194) lt!56469)))

(declare-fun b!37386 () Bool)

(assert (=> b!37386 (= e!24602 (= (bitStreamReadBitsIntoList!0 (_2!1910 lt!56214) (_1!1911 lt!56201) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!166 lt!56194)))))

(assert (= (and d!11132 res!31770) b!37386))

(declare-fun m!56677 () Bool)

(assert (=> d!11132 m!56677))

(declare-fun m!56679 () Bool)

(assert (=> b!37386 m!56679))

(assert (=> b!37386 m!56475))

(assert (=> b!37264 d!11132))

(declare-fun d!11134 () Bool)

(assert (=> d!11134 (= (bitAt!0 (buf!1195 (_1!1911 lt!56201)) lt!56205) (not (= (bvand ((_ sign_extend 24) (select (arr!1357 (buf!1195 (_1!1911 lt!56201))) ((_ extract 31 0) (bvsdiv lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2973 () Bool)

(assert (= bs!2973 d!11134))

(declare-fun m!56681 () Bool)

(assert (=> bs!2973 m!56681))

(assert (=> bs!2973 m!56675))

(assert (=> b!37253 d!11134))

(declare-fun d!11136 () Bool)

(assert (=> d!11136 (= (bitAt!0 (buf!1195 (_1!1911 lt!56196)) lt!56205) (not (= (bvand ((_ sign_extend 24) (select (arr!1357 (buf!1195 (_1!1911 lt!56196))) ((_ extract 31 0) (bvsdiv lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2974 () Bool)

(assert (= bs!2974 d!11136))

(declare-fun m!56683 () Bool)

(assert (=> bs!2974 m!56683))

(assert (=> bs!2974 m!56675))

(assert (=> b!37253 d!11136))

(declare-fun d!11138 () Bool)

(declare-fun res!31777 () Bool)

(declare-fun e!24608 () Bool)

(assert (=> d!11138 (=> (not res!31777) (not e!24608))))

(assert (=> d!11138 (= res!31777 (= (size!867 (buf!1195 thiss!1379)) (size!867 (buf!1195 thiss!1379))))))

(assert (=> d!11138 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!24608)))

(declare-fun b!37393 () Bool)

(declare-fun res!31779 () Bool)

(assert (=> b!37393 (=> (not res!31779) (not e!24608))))

(assert (=> b!37393 (= res!31779 (bvsle (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)) (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379))))))

(declare-fun b!37394 () Bool)

(declare-fun e!24607 () Bool)

(assert (=> b!37394 (= e!24608 e!24607)))

(declare-fun res!31778 () Bool)

(assert (=> b!37394 (=> res!31778 e!24607)))

(assert (=> b!37394 (= res!31778 (= (size!867 (buf!1195 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37395 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1935 array!1935 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37395 (= e!24607 (arrayBitRangesEq!0 (buf!1195 thiss!1379) (buf!1195 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379))))))

(assert (= (and d!11138 res!31777) b!37393))

(assert (= (and b!37393 res!31779) b!37394))

(assert (= (and b!37394 (not res!31778)) b!37395))

(assert (=> b!37393 m!56447))

(assert (=> b!37393 m!56447))

(assert (=> b!37395 m!56447))

(assert (=> b!37395 m!56447))

(declare-fun m!56685 () Bool)

(assert (=> b!37395 m!56685))

(assert (=> b!37255 d!11138))

(declare-fun d!11140 () Bool)

(assert (=> d!11140 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!56473 () Unit!2709)

(declare-fun choose!11 (BitStream!1496) Unit!2709)

(assert (=> d!11140 (= lt!56473 (choose!11 thiss!1379))))

(assert (=> d!11140 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!56473)))

(declare-fun bs!2976 () Bool)

(assert (= bs!2976 d!11140))

(assert (=> bs!2976 m!56443))

(declare-fun m!56687 () Bool)

(assert (=> bs!2976 m!56687))

(assert (=> b!37255 d!11140))

(declare-fun d!11142 () Bool)

(declare-fun e!24609 () Bool)

(assert (=> d!11142 e!24609))

(declare-fun res!31780 () Bool)

(assert (=> d!11142 (=> (not res!31780) (not e!24609))))

(declare-fun lt!56479 () (_ BitVec 64))

(declare-fun lt!56476 () (_ BitVec 64))

(declare-fun lt!56474 () (_ BitVec 64))

(assert (=> d!11142 (= res!31780 (= lt!56479 (bvsub lt!56476 lt!56474)))))

(assert (=> d!11142 (or (= (bvand lt!56476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56474 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56476 lt!56474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11142 (= lt!56474 (remainingBits!0 ((_ sign_extend 32) (size!867 (buf!1195 thiss!1379))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379))))))

(declare-fun lt!56477 () (_ BitVec 64))

(declare-fun lt!56475 () (_ BitVec 64))

(assert (=> d!11142 (= lt!56476 (bvmul lt!56477 lt!56475))))

(assert (=> d!11142 (or (= lt!56477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56475 (bvsdiv (bvmul lt!56477 lt!56475) lt!56477)))))

(assert (=> d!11142 (= lt!56475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11142 (= lt!56477 ((_ sign_extend 32) (size!867 (buf!1195 thiss!1379))))))

(assert (=> d!11142 (= lt!56479 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2595 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2590 thiss!1379))))))

(assert (=> d!11142 (invariant!0 (currentBit!2590 thiss!1379) (currentByte!2595 thiss!1379) (size!867 (buf!1195 thiss!1379)))))

(assert (=> d!11142 (= (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)) lt!56479)))

(declare-fun b!37396 () Bool)

(declare-fun res!31781 () Bool)

(assert (=> b!37396 (=> (not res!31781) (not e!24609))))

(assert (=> b!37396 (= res!31781 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56479))))

(declare-fun b!37397 () Bool)

(declare-fun lt!56478 () (_ BitVec 64))

(assert (=> b!37397 (= e!24609 (bvsle lt!56479 (bvmul lt!56478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37397 (or (= lt!56478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56478)))))

(assert (=> b!37397 (= lt!56478 ((_ sign_extend 32) (size!867 (buf!1195 thiss!1379))))))

(assert (= (and d!11142 res!31780) b!37396))

(assert (= (and b!37396 res!31781) b!37397))

(assert (=> d!11142 m!56655))

(declare-fun m!56689 () Bool)

(assert (=> d!11142 m!56689))

(assert (=> b!37255 d!11142))

(declare-fun d!11144 () Bool)

(assert (=> d!11144 (= (bitAt!0 (buf!1195 (_2!1910 lt!56214)) lt!56205) (not (= (bvand ((_ sign_extend 24) (select (arr!1357 (buf!1195 (_2!1910 lt!56214))) ((_ extract 31 0) (bvsdiv lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2977 () Bool)

(assert (= bs!2977 d!11144))

(declare-fun m!56691 () Bool)

(assert (=> bs!2977 m!56691))

(assert (=> bs!2977 m!56675))

(assert (=> b!37244 d!11144))

(declare-fun d!11146 () Bool)

(assert (=> d!11146 (= (bitAt!0 (buf!1195 (_2!1910 lt!56195)) lt!56205) (bitAt!0 (buf!1195 (_2!1910 lt!56214)) lt!56205))))

(declare-fun lt!56482 () Unit!2709)

(declare-fun choose!31 (array!1935 array!1935 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2709)

(assert (=> d!11146 (= lt!56482 (choose!31 (buf!1195 (_2!1910 lt!56195)) (buf!1195 (_2!1910 lt!56214)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56205 lt!56216))))

(assert (=> d!11146 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56216))))

(assert (=> d!11146 (= (arrayBitRangesEqImpliesEq!0 (buf!1195 (_2!1910 lt!56195)) (buf!1195 (_2!1910 lt!56214)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56205 lt!56216) lt!56482)))

(declare-fun bs!2978 () Bool)

(assert (= bs!2978 d!11146))

(assert (=> bs!2978 m!56417))

(assert (=> bs!2978 m!56389))

(declare-fun m!56693 () Bool)

(assert (=> bs!2978 m!56693))

(assert (=> b!37244 d!11146))

(declare-fun d!11148 () Bool)

(assert (=> d!11148 (= (invariant!0 (currentBit!2590 (_2!1910 lt!56195)) (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56214)))) (and (bvsge (currentBit!2590 (_2!1910 lt!56195)) #b00000000000000000000000000000000) (bvslt (currentBit!2590 (_2!1910 lt!56195)) #b00000000000000000000000000001000) (bvsge (currentByte!2595 (_2!1910 lt!56195)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56214)))) (and (= (currentBit!2590 (_2!1910 lt!56195)) #b00000000000000000000000000000000) (= (currentByte!2595 (_2!1910 lt!56195)) (size!867 (buf!1195 (_2!1910 lt!56214))))))))))

(assert (=> b!37246 d!11148))

(declare-fun d!11150 () Bool)

(declare-fun res!31782 () Bool)

(declare-fun e!24611 () Bool)

(assert (=> d!11150 (=> (not res!31782) (not e!24611))))

(assert (=> d!11150 (= res!31782 (= (size!867 (buf!1195 thiss!1379)) (size!867 (buf!1195 (_2!1910 lt!56214)))))))

(assert (=> d!11150 (= (isPrefixOf!0 thiss!1379 (_2!1910 lt!56214)) e!24611)))

(declare-fun b!37398 () Bool)

(declare-fun res!31784 () Bool)

(assert (=> b!37398 (=> (not res!31784) (not e!24611))))

(assert (=> b!37398 (= res!31784 (bvsle (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)) (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56214))) (currentByte!2595 (_2!1910 lt!56214)) (currentBit!2590 (_2!1910 lt!56214)))))))

(declare-fun b!37399 () Bool)

(declare-fun e!24610 () Bool)

(assert (=> b!37399 (= e!24611 e!24610)))

(declare-fun res!31783 () Bool)

(assert (=> b!37399 (=> res!31783 e!24610)))

(assert (=> b!37399 (= res!31783 (= (size!867 (buf!1195 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37400 () Bool)

(assert (=> b!37400 (= e!24610 (arrayBitRangesEq!0 (buf!1195 thiss!1379) (buf!1195 (_2!1910 lt!56214)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379))))))

(assert (= (and d!11150 res!31782) b!37398))

(assert (= (and b!37398 res!31784) b!37399))

(assert (= (and b!37399 (not res!31783)) b!37400))

(assert (=> b!37398 m!56447))

(assert (=> b!37398 m!56419))

(assert (=> b!37400 m!56447))

(assert (=> b!37400 m!56447))

(declare-fun m!56695 () Bool)

(assert (=> b!37400 m!56695))

(assert (=> b!37256 d!11150))

(declare-fun d!11152 () Bool)

(assert (=> d!11152 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2979 () Bool)

(assert (= bs!2979 d!11152))

(declare-fun m!56697 () Bool)

(assert (=> bs!2979 m!56697))

(assert (=> b!37256 d!11152))

(declare-fun b!37411 () Bool)

(declare-fun e!24617 () Unit!2709)

(declare-fun Unit!2731 () Unit!2709)

(assert (=> b!37411 (= e!24617 Unit!2731)))

(declare-fun b!37412 () Bool)

(declare-fun res!31792 () Bool)

(declare-fun e!24616 () Bool)

(assert (=> b!37412 (=> (not res!31792) (not e!24616))))

(declare-fun lt!56539 () tuple2!3648)

(assert (=> b!37412 (= res!31792 (isPrefixOf!0 (_1!1911 lt!56539) thiss!1379))))

(declare-fun b!37414 () Bool)

(declare-fun lt!56536 () Unit!2709)

(assert (=> b!37414 (= e!24617 lt!56536)))

(declare-fun lt!56530 () (_ BitVec 64))

(assert (=> b!37414 (= lt!56530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56542 () (_ BitVec 64))

(assert (=> b!37414 (= lt!56542 (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1935 array!1935 (_ BitVec 64) (_ BitVec 64)) Unit!2709)

(assert (=> b!37414 (= lt!56536 (arrayBitRangesEqSymmetric!0 (buf!1195 thiss!1379) (buf!1195 (_2!1910 lt!56195)) lt!56530 lt!56542))))

(assert (=> b!37414 (arrayBitRangesEq!0 (buf!1195 (_2!1910 lt!56195)) (buf!1195 thiss!1379) lt!56530 lt!56542)))

(declare-fun b!37415 () Bool)

(declare-fun res!31793 () Bool)

(assert (=> b!37415 (=> (not res!31793) (not e!24616))))

(assert (=> b!37415 (= res!31793 (isPrefixOf!0 (_2!1911 lt!56539) (_2!1910 lt!56195)))))

(declare-fun d!11154 () Bool)

(assert (=> d!11154 e!24616))

(declare-fun res!31791 () Bool)

(assert (=> d!11154 (=> (not res!31791) (not e!24616))))

(assert (=> d!11154 (= res!31791 (isPrefixOf!0 (_1!1911 lt!56539) (_2!1911 lt!56539)))))

(declare-fun lt!56532 () BitStream!1496)

(assert (=> d!11154 (= lt!56539 (tuple2!3649 lt!56532 (_2!1910 lt!56195)))))

(declare-fun lt!56524 () Unit!2709)

(declare-fun lt!56538 () Unit!2709)

(assert (=> d!11154 (= lt!56524 lt!56538)))

(assert (=> d!11154 (isPrefixOf!0 lt!56532 (_2!1910 lt!56195))))

(assert (=> d!11154 (= lt!56538 (lemmaIsPrefixTransitive!0 lt!56532 (_2!1910 lt!56195) (_2!1910 lt!56195)))))

(declare-fun lt!56534 () Unit!2709)

(declare-fun lt!56525 () Unit!2709)

(assert (=> d!11154 (= lt!56534 lt!56525)))

(assert (=> d!11154 (isPrefixOf!0 lt!56532 (_2!1910 lt!56195))))

(assert (=> d!11154 (= lt!56525 (lemmaIsPrefixTransitive!0 lt!56532 thiss!1379 (_2!1910 lt!56195)))))

(declare-fun lt!56527 () Unit!2709)

(assert (=> d!11154 (= lt!56527 e!24617)))

(declare-fun c!2584 () Bool)

(assert (=> d!11154 (= c!2584 (not (= (size!867 (buf!1195 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!56540 () Unit!2709)

(declare-fun lt!56541 () Unit!2709)

(assert (=> d!11154 (= lt!56540 lt!56541)))

(assert (=> d!11154 (isPrefixOf!0 (_2!1910 lt!56195) (_2!1910 lt!56195))))

(assert (=> d!11154 (= lt!56541 (lemmaIsPrefixRefl!0 (_2!1910 lt!56195)))))

(declare-fun lt!56526 () Unit!2709)

(declare-fun lt!56535 () Unit!2709)

(assert (=> d!11154 (= lt!56526 lt!56535)))

(assert (=> d!11154 (= lt!56535 (lemmaIsPrefixRefl!0 (_2!1910 lt!56195)))))

(declare-fun lt!56531 () Unit!2709)

(declare-fun lt!56537 () Unit!2709)

(assert (=> d!11154 (= lt!56531 lt!56537)))

(assert (=> d!11154 (isPrefixOf!0 lt!56532 lt!56532)))

(assert (=> d!11154 (= lt!56537 (lemmaIsPrefixRefl!0 lt!56532))))

(declare-fun lt!56533 () Unit!2709)

(declare-fun lt!56529 () Unit!2709)

(assert (=> d!11154 (= lt!56533 lt!56529)))

(assert (=> d!11154 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11154 (= lt!56529 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11154 (= lt!56532 (BitStream!1497 (buf!1195 (_2!1910 lt!56195)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)))))

(assert (=> d!11154 (isPrefixOf!0 thiss!1379 (_2!1910 lt!56195))))

(assert (=> d!11154 (= (reader!0 thiss!1379 (_2!1910 lt!56195)) lt!56539)))

(declare-fun b!37413 () Bool)

(declare-fun lt!56523 () (_ BitVec 64))

(declare-fun lt!56528 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1496 (_ BitVec 64)) BitStream!1496)

(assert (=> b!37413 (= e!24616 (= (_1!1911 lt!56539) (withMovedBitIndex!0 (_2!1911 lt!56539) (bvsub lt!56528 lt!56523))))))

(assert (=> b!37413 (or (= (bvand lt!56528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56528 lt!56523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37413 (= lt!56523 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))))))

(assert (=> b!37413 (= lt!56528 (bitIndex!0 (size!867 (buf!1195 thiss!1379)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379)))))

(assert (= (and d!11154 c!2584) b!37414))

(assert (= (and d!11154 (not c!2584)) b!37411))

(assert (= (and d!11154 res!31791) b!37412))

(assert (= (and b!37412 res!31792) b!37415))

(assert (= (and b!37415 res!31793) b!37413))

(assert (=> b!37414 m!56447))

(declare-fun m!56699 () Bool)

(assert (=> b!37414 m!56699))

(declare-fun m!56701 () Bool)

(assert (=> b!37414 m!56701))

(declare-fun m!56703 () Bool)

(assert (=> b!37415 m!56703))

(declare-fun m!56705 () Bool)

(assert (=> b!37412 m!56705))

(assert (=> d!11154 m!56449))

(assert (=> d!11154 m!56445))

(declare-fun m!56707 () Bool)

(assert (=> d!11154 m!56707))

(declare-fun m!56709 () Bool)

(assert (=> d!11154 m!56709))

(declare-fun m!56711 () Bool)

(assert (=> d!11154 m!56711))

(declare-fun m!56713 () Bool)

(assert (=> d!11154 m!56713))

(assert (=> d!11154 m!56443))

(declare-fun m!56715 () Bool)

(assert (=> d!11154 m!56715))

(declare-fun m!56717 () Bool)

(assert (=> d!11154 m!56717))

(declare-fun m!56719 () Bool)

(assert (=> d!11154 m!56719))

(declare-fun m!56721 () Bool)

(assert (=> d!11154 m!56721))

(declare-fun m!56723 () Bool)

(assert (=> b!37413 m!56723))

(assert (=> b!37413 m!56473))

(assert (=> b!37413 m!56447))

(assert (=> b!37256 d!11154))

(declare-fun lt!57098 () tuple2!3646)

(declare-fun e!24713 () Bool)

(declare-fun lt!57099 () tuple2!3648)

(declare-fun b!37609 () Bool)

(assert (=> b!37609 (= e!24713 (= (bitStreamReadBitsIntoList!0 (_2!1910 lt!57098) (_1!1911 lt!57099) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1910 lt!57098) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!37609 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37609 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!57135 () Unit!2709)

(declare-fun lt!57119 () Unit!2709)

(assert (=> b!37609 (= lt!57135 lt!57119)))

(declare-fun lt!57111 () (_ BitVec 64))

(assert (=> b!37609 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!57098)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195))) lt!57111)))

(assert (=> b!37609 (= lt!57119 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1910 lt!56195) (buf!1195 (_2!1910 lt!57098)) lt!57111))))

(declare-fun e!24711 () Bool)

(assert (=> b!37609 e!24711))

(declare-fun res!31936 () Bool)

(assert (=> b!37609 (=> (not res!31936) (not e!24711))))

(assert (=> b!37609 (= res!31936 (and (= (size!867 (buf!1195 (_2!1910 lt!56195))) (size!867 (buf!1195 (_2!1910 lt!57098)))) (bvsge lt!57111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37609 (= lt!57111 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!37609 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37609 (= lt!57099 (reader!0 (_2!1910 lt!56195) (_2!1910 lt!57098)))))

(declare-fun b!37610 () Bool)

(assert (=> b!37610 (= e!24711 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195))) lt!57111))))

(declare-fun b!37611 () Bool)

(declare-fun res!31933 () Bool)

(assert (=> b!37611 (=> (not res!31933) (not e!24713))))

(assert (=> b!37611 (= res!31933 (invariant!0 (currentBit!2590 (_2!1910 lt!57098)) (currentByte!2595 (_2!1910 lt!57098)) (size!867 (buf!1195 (_2!1910 lt!57098)))))))

(declare-fun b!37612 () Bool)

(declare-fun e!24712 () tuple2!3646)

(declare-fun lt!57134 () tuple2!3646)

(declare-fun Unit!2732 () Unit!2709)

(assert (=> b!37612 (= e!24712 (tuple2!3647 Unit!2732 (_2!1910 lt!57134)))))

(declare-fun lt!57126 () tuple2!3646)

(assert (=> b!37612 (= lt!57126 (appendBitFromByte!0 (_2!1910 lt!56195) (select (arr!1357 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!57113 () (_ BitVec 64))

(assert (=> b!37612 (= lt!57113 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57112 () (_ BitVec 64))

(assert (=> b!37612 (= lt!57112 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57114 () Unit!2709)

(assert (=> b!37612 (= lt!57114 (validateOffsetBitsIneqLemma!0 (_2!1910 lt!56195) (_2!1910 lt!57126) lt!57113 lt!57112))))

(assert (=> b!37612 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!57126)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!57126))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!57126))) (bvsub lt!57113 lt!57112))))

(declare-fun lt!57130 () Unit!2709)

(assert (=> b!37612 (= lt!57130 lt!57114)))

(declare-fun lt!57131 () tuple2!3648)

(declare-fun call!472 () tuple2!3648)

(assert (=> b!37612 (= lt!57131 call!472)))

(declare-fun lt!57118 () (_ BitVec 64))

(assert (=> b!37612 (= lt!57118 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57136 () Unit!2709)

(assert (=> b!37612 (= lt!57136 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1910 lt!56195) (buf!1195 (_2!1910 lt!57126)) lt!57118))))

(assert (=> b!37612 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!57126)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195))) lt!57118)))

(declare-fun lt!57133 () Unit!2709)

(assert (=> b!37612 (= lt!57133 lt!57136)))

(assert (=> b!37612 (= (head!286 (byteArrayBitContentToList!0 (_2!1910 lt!57126) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!286 (bitStreamReadBitsIntoList!0 (_2!1910 lt!57126) (_1!1911 lt!57131) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!57121 () Unit!2709)

(declare-fun Unit!2733 () Unit!2709)

(assert (=> b!37612 (= lt!57121 Unit!2733)))

(assert (=> b!37612 (= lt!57134 (appendBitsMSBFirstLoop!0 (_2!1910 lt!57126) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!57102 () Unit!2709)

(assert (=> b!37612 (= lt!57102 (lemmaIsPrefixTransitive!0 (_2!1910 lt!56195) (_2!1910 lt!57126) (_2!1910 lt!57134)))))

(assert (=> b!37612 (isPrefixOf!0 (_2!1910 lt!56195) (_2!1910 lt!57134))))

(declare-fun lt!57116 () Unit!2709)

(assert (=> b!37612 (= lt!57116 lt!57102)))

(assert (=> b!37612 (= (size!867 (buf!1195 (_2!1910 lt!57134))) (size!867 (buf!1195 (_2!1910 lt!56195))))))

(declare-fun lt!57128 () Unit!2709)

(declare-fun Unit!2734 () Unit!2709)

(assert (=> b!37612 (= lt!57128 Unit!2734)))

(assert (=> b!37612 (= (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!57134))) (currentByte!2595 (_2!1910 lt!57134)) (currentBit!2590 (_2!1910 lt!57134))) (bvsub (bvadd (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57109 () Unit!2709)

(declare-fun Unit!2735 () Unit!2709)

(assert (=> b!37612 (= lt!57109 Unit!2735)))

(assert (=> b!37612 (= (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!57134))) (currentByte!2595 (_2!1910 lt!57134)) (currentBit!2590 (_2!1910 lt!57134))) (bvsub (bvsub (bvadd (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!57126))) (currentByte!2595 (_2!1910 lt!57126)) (currentBit!2590 (_2!1910 lt!57126))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57123 () Unit!2709)

(declare-fun Unit!2736 () Unit!2709)

(assert (=> b!37612 (= lt!57123 Unit!2736)))

(declare-fun lt!57108 () tuple2!3648)

(assert (=> b!37612 (= lt!57108 (reader!0 (_2!1910 lt!56195) (_2!1910 lt!57134)))))

(declare-fun lt!57125 () (_ BitVec 64))

(assert (=> b!37612 (= lt!57125 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57096 () Unit!2709)

(assert (=> b!37612 (= lt!57096 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1910 lt!56195) (buf!1195 (_2!1910 lt!57134)) lt!57125))))

(assert (=> b!37612 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!57134)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!56195))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!56195))) lt!57125)))

(declare-fun lt!57095 () Unit!2709)

(assert (=> b!37612 (= lt!57095 lt!57096)))

(declare-fun lt!57120 () tuple2!3648)

(assert (=> b!37612 (= lt!57120 (reader!0 (_2!1910 lt!57126) (_2!1910 lt!57134)))))

(declare-fun lt!57106 () (_ BitVec 64))

(assert (=> b!37612 (= lt!57106 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57107 () Unit!2709)

(assert (=> b!37612 (= lt!57107 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1910 lt!57126) (buf!1195 (_2!1910 lt!57134)) lt!57106))))

(assert (=> b!37612 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!57134)))) ((_ sign_extend 32) (currentByte!2595 (_2!1910 lt!57126))) ((_ sign_extend 32) (currentBit!2590 (_2!1910 lt!57126))) lt!57106)))

(declare-fun lt!57115 () Unit!2709)

(assert (=> b!37612 (= lt!57115 lt!57107)))

(declare-fun lt!57103 () List!449)

(assert (=> b!37612 (= lt!57103 (byteArrayBitContentToList!0 (_2!1910 lt!57134) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!57127 () List!449)

(assert (=> b!37612 (= lt!57127 (byteArrayBitContentToList!0 (_2!1910 lt!57134) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!57117 () List!449)

(assert (=> b!37612 (= lt!57117 (bitStreamReadBitsIntoList!0 (_2!1910 lt!57134) (_1!1911 lt!57108) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!57122 () List!449)

(assert (=> b!37612 (= lt!57122 (bitStreamReadBitsIntoList!0 (_2!1910 lt!57134) (_1!1911 lt!57120) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!57105 () (_ BitVec 64))

(assert (=> b!37612 (= lt!57105 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57104 () Unit!2709)

(assert (=> b!37612 (= lt!57104 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1910 lt!57134) (_2!1910 lt!57134) (_1!1911 lt!57108) (_1!1911 lt!57120) lt!57105 lt!57117))))

(assert (=> b!37612 (= (bitStreamReadBitsIntoList!0 (_2!1910 lt!57134) (_1!1911 lt!57120) (bvsub lt!57105 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!166 lt!57117))))

(declare-fun lt!57110 () Unit!2709)

(assert (=> b!37612 (= lt!57110 lt!57104)))

(declare-fun lt!57101 () (_ BitVec 64))

(declare-fun lt!57129 () Unit!2709)

(assert (=> b!37612 (= lt!57129 (arrayBitRangesEqImpliesEq!0 (buf!1195 (_2!1910 lt!57126)) (buf!1195 (_2!1910 lt!57134)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57101 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!57126))) (currentByte!2595 (_2!1910 lt!57126)) (currentBit!2590 (_2!1910 lt!57126)))))))

(assert (=> b!37612 (= (bitAt!0 (buf!1195 (_2!1910 lt!57126)) lt!57101) (bitAt!0 (buf!1195 (_2!1910 lt!57134)) lt!57101))))

(declare-fun lt!57132 () Unit!2709)

(assert (=> b!37612 (= lt!57132 lt!57129)))

(declare-fun d!11156 () Bool)

(assert (=> d!11156 e!24713))

(declare-fun res!31935 () Bool)

(assert (=> d!11156 (=> (not res!31935) (not e!24713))))

(declare-fun lt!57097 () (_ BitVec 64))

(assert (=> d!11156 (= res!31935 (= (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!57098))) (currentByte!2595 (_2!1910 lt!57098)) (currentBit!2590 (_2!1910 lt!57098))) (bvsub lt!57097 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11156 (or (= (bvand lt!57097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!57097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!57097 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!57124 () (_ BitVec 64))

(assert (=> d!11156 (= lt!57097 (bvadd lt!57124 to!314))))

(assert (=> d!11156 (or (not (= (bvand lt!57124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!57124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!57124 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11156 (= lt!57124 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))))))

(assert (=> d!11156 (= lt!57098 e!24712)))

(declare-fun c!2612 () Bool)

(assert (=> d!11156 (= c!2612 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!57094 () Unit!2709)

(declare-fun lt!57093 () Unit!2709)

(assert (=> d!11156 (= lt!57094 lt!57093)))

(assert (=> d!11156 (isPrefixOf!0 (_2!1910 lt!56195) (_2!1910 lt!56195))))

(assert (=> d!11156 (= lt!57093 (lemmaIsPrefixRefl!0 (_2!1910 lt!56195)))))

(assert (=> d!11156 (= lt!57101 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))))))

(assert (=> d!11156 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11156 (= (appendBitsMSBFirstLoop!0 (_2!1910 lt!56195) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!57098)))

(declare-fun b!37613 () Bool)

(declare-fun Unit!2737 () Unit!2709)

(assert (=> b!37613 (= e!24712 (tuple2!3647 Unit!2737 (_2!1910 lt!56195)))))

(assert (=> b!37613 (= (size!867 (buf!1195 (_2!1910 lt!56195))) (size!867 (buf!1195 (_2!1910 lt!56195))))))

(declare-fun lt!57100 () Unit!2709)

(declare-fun Unit!2738 () Unit!2709)

(assert (=> b!37613 (= lt!57100 Unit!2738)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1496 array!1935 array!1935 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3668 0))(
  ( (tuple2!3669 (_1!1921 array!1935) (_2!1921 BitStream!1496)) )
))
(declare-fun readBits!0 (BitStream!1496 (_ BitVec 64)) tuple2!3668)

(assert (=> b!37613 (checkByteArrayBitContent!0 (_2!1910 lt!56195) srcBuffer!2 (_1!1921 (readBits!0 (_1!1911 call!472) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!37614 () Bool)

(declare-fun res!31931 () Bool)

(assert (=> b!37614 (=> (not res!31931) (not e!24713))))

(assert (=> b!37614 (= res!31931 (= (size!867 (buf!1195 (_2!1910 lt!57098))) (size!867 (buf!1195 (_2!1910 lt!56195)))))))

(declare-fun b!37615 () Bool)

(declare-fun res!31932 () Bool)

(assert (=> b!37615 (=> (not res!31932) (not e!24713))))

(assert (=> b!37615 (= res!31932 (= (size!867 (buf!1195 (_2!1910 lt!56195))) (size!867 (buf!1195 (_2!1910 lt!57098)))))))

(declare-fun b!37616 () Bool)

(declare-fun res!31934 () Bool)

(assert (=> b!37616 (=> (not res!31934) (not e!24713))))

(assert (=> b!37616 (= res!31934 (isPrefixOf!0 (_2!1910 lt!56195) (_2!1910 lt!57098)))))

(declare-fun bm!469 () Bool)

(assert (=> bm!469 (= call!472 (reader!0 (_2!1910 lt!56195) (ite c!2612 (_2!1910 lt!57126) (_2!1910 lt!56195))))))

(assert (= (and d!11156 c!2612) b!37612))

(assert (= (and d!11156 (not c!2612)) b!37613))

(assert (= (or b!37612 b!37613) bm!469))

(assert (= (and d!11156 res!31935) b!37611))

(assert (= (and b!37611 res!31933) b!37615))

(assert (= (and b!37615 res!31932) b!37616))

(assert (= (and b!37616 res!31934) b!37614))

(assert (= (and b!37614 res!31931) b!37609))

(assert (= (and b!37609 res!31936) b!37610))

(declare-fun m!57099 () Bool)

(assert (=> b!37611 m!57099))

(declare-fun m!57101 () Bool)

(assert (=> b!37609 m!57101))

(declare-fun m!57103 () Bool)

(assert (=> b!37609 m!57103))

(declare-fun m!57105 () Bool)

(assert (=> b!37609 m!57105))

(declare-fun m!57107 () Bool)

(assert (=> b!37609 m!57107))

(declare-fun m!57109 () Bool)

(assert (=> b!37609 m!57109))

(declare-fun m!57111 () Bool)

(assert (=> bm!469 m!57111))

(declare-fun m!57113 () Bool)

(assert (=> d!11156 m!57113))

(assert (=> d!11156 m!56473))

(assert (=> d!11156 m!56713))

(assert (=> d!11156 m!56719))

(declare-fun m!57115 () Bool)

(assert (=> b!37616 m!57115))

(declare-fun m!57117 () Bool)

(assert (=> b!37610 m!57117))

(declare-fun m!57119 () Bool)

(assert (=> b!37612 m!57119))

(declare-fun m!57121 () Bool)

(assert (=> b!37612 m!57121))

(declare-fun m!57123 () Bool)

(assert (=> b!37612 m!57123))

(declare-fun m!57125 () Bool)

(assert (=> b!37612 m!57125))

(declare-fun m!57127 () Bool)

(assert (=> b!37612 m!57127))

(declare-fun m!57129 () Bool)

(assert (=> b!37612 m!57129))

(declare-fun m!57131 () Bool)

(assert (=> b!37612 m!57131))

(declare-fun m!57133 () Bool)

(assert (=> b!37612 m!57133))

(declare-fun m!57135 () Bool)

(assert (=> b!37612 m!57135))

(declare-fun m!57137 () Bool)

(assert (=> b!37612 m!57137))

(declare-fun m!57139 () Bool)

(assert (=> b!37612 m!57139))

(declare-fun m!57141 () Bool)

(assert (=> b!37612 m!57141))

(declare-fun m!57143 () Bool)

(assert (=> b!37612 m!57143))

(declare-fun m!57145 () Bool)

(assert (=> b!37612 m!57145))

(declare-fun m!57147 () Bool)

(assert (=> b!37612 m!57147))

(assert (=> b!37612 m!57143))

(declare-fun m!57149 () Bool)

(assert (=> b!37612 m!57149))

(declare-fun m!57151 () Bool)

(assert (=> b!37612 m!57151))

(declare-fun m!57153 () Bool)

(assert (=> b!37612 m!57153))

(declare-fun m!57155 () Bool)

(assert (=> b!37612 m!57155))

(declare-fun m!57157 () Bool)

(assert (=> b!37612 m!57157))

(assert (=> b!37612 m!56473))

(declare-fun m!57159 () Bool)

(assert (=> b!37612 m!57159))

(declare-fun m!57161 () Bool)

(assert (=> b!37612 m!57161))

(assert (=> b!37612 m!57147))

(declare-fun m!57163 () Bool)

(assert (=> b!37612 m!57163))

(declare-fun m!57165 () Bool)

(assert (=> b!37612 m!57165))

(declare-fun m!57167 () Bool)

(assert (=> b!37612 m!57167))

(declare-fun m!57169 () Bool)

(assert (=> b!37612 m!57169))

(declare-fun m!57171 () Bool)

(assert (=> b!37612 m!57171))

(declare-fun m!57173 () Bool)

(assert (=> b!37612 m!57173))

(declare-fun m!57175 () Bool)

(assert (=> b!37612 m!57175))

(declare-fun m!57177 () Bool)

(assert (=> b!37612 m!57177))

(declare-fun m!57179 () Bool)

(assert (=> b!37612 m!57179))

(assert (=> b!37612 m!57127))

(assert (=> b!37612 m!57159))

(declare-fun m!57181 () Bool)

(assert (=> b!37613 m!57181))

(declare-fun m!57183 () Bool)

(assert (=> b!37613 m!57183))

(assert (=> b!37256 d!11156))

(declare-fun d!11276 () Bool)

(assert (=> d!11276 (isPrefixOf!0 thiss!1379 (_2!1910 lt!56214))))

(declare-fun lt!57139 () Unit!2709)

(declare-fun choose!30 (BitStream!1496 BitStream!1496 BitStream!1496) Unit!2709)

(assert (=> d!11276 (= lt!57139 (choose!30 thiss!1379 (_2!1910 lt!56195) (_2!1910 lt!56214)))))

(assert (=> d!11276 (isPrefixOf!0 thiss!1379 (_2!1910 lt!56195))))

(assert (=> d!11276 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1910 lt!56195) (_2!1910 lt!56214)) lt!57139)))

(declare-fun bs!3003 () Bool)

(assert (= bs!3003 d!11276))

(assert (=> bs!3003 m!56405))

(declare-fun m!57185 () Bool)

(assert (=> bs!3003 m!57185))

(assert (=> bs!3003 m!56449))

(assert (=> b!37256 d!11276))

(declare-fun d!11278 () Bool)

(declare-fun res!31937 () Bool)

(declare-fun e!24715 () Bool)

(assert (=> d!11278 (=> (not res!31937) (not e!24715))))

(assert (=> d!11278 (= res!31937 (= (size!867 (buf!1195 (_2!1910 lt!56195))) (size!867 (buf!1195 (_2!1910 lt!56214)))))))

(assert (=> d!11278 (= (isPrefixOf!0 (_2!1910 lt!56195) (_2!1910 lt!56214)) e!24715)))

(declare-fun b!37617 () Bool)

(declare-fun res!31939 () Bool)

(assert (=> b!37617 (=> (not res!31939) (not e!24715))))

(assert (=> b!37617 (= res!31939 (bvsle (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195))) (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56214))) (currentByte!2595 (_2!1910 lt!56214)) (currentBit!2590 (_2!1910 lt!56214)))))))

(declare-fun b!37618 () Bool)

(declare-fun e!24714 () Bool)

(assert (=> b!37618 (= e!24715 e!24714)))

(declare-fun res!31938 () Bool)

(assert (=> b!37618 (=> res!31938 e!24714)))

(assert (=> b!37618 (= res!31938 (= (size!867 (buf!1195 (_2!1910 lt!56195))) #b00000000000000000000000000000000))))

(declare-fun b!37619 () Bool)

(assert (=> b!37619 (= e!24714 (arrayBitRangesEq!0 (buf!1195 (_2!1910 lt!56195)) (buf!1195 (_2!1910 lt!56214)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!867 (buf!1195 (_2!1910 lt!56195))) (currentByte!2595 (_2!1910 lt!56195)) (currentBit!2590 (_2!1910 lt!56195)))))))

(assert (= (and d!11278 res!31937) b!37617))

(assert (= (and b!37617 res!31939) b!37618))

(assert (= (and b!37618 (not res!31938)) b!37619))

(assert (=> b!37617 m!56473))

(assert (=> b!37617 m!56419))

(assert (=> b!37619 m!56473))

(assert (=> b!37619 m!56473))

(declare-fun m!57187 () Bool)

(assert (=> b!37619 m!57187))

(assert (=> b!37256 d!11278))

(declare-fun d!11280 () Bool)

(assert (=> d!11280 (validate_offset_bits!1 ((_ sign_extend 32) (size!867 (buf!1195 (_2!1910 lt!56195)))) ((_ sign_extend 32) (currentByte!2595 thiss!1379)) ((_ sign_extend 32) (currentBit!2590 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57142 () Unit!2709)

(declare-fun choose!9 (BitStream!1496 array!1935 (_ BitVec 64) BitStream!1496) Unit!2709)

(assert (=> d!11280 (= lt!57142 (choose!9 thiss!1379 (buf!1195 (_2!1910 lt!56195)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1497 (buf!1195 (_2!1910 lt!56195)) (currentByte!2595 thiss!1379) (currentBit!2590 thiss!1379))))))

(assert (=> d!11280 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1195 (_2!1910 lt!56195)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!57142)))

(declare-fun bs!3004 () Bool)

(assert (= bs!3004 d!11280))

(assert (=> bs!3004 m!56395))

(declare-fun m!57189 () Bool)

(assert (=> bs!3004 m!57189))

(assert (=> b!37256 d!11280))

(declare-fun d!11282 () Bool)

(assert (=> d!11282 (= (invariant!0 (currentBit!2590 (_2!1910 lt!56214)) (currentByte!2595 (_2!1910 lt!56214)) (size!867 (buf!1195 (_2!1910 lt!56214)))) (and (bvsge (currentBit!2590 (_2!1910 lt!56214)) #b00000000000000000000000000000000) (bvslt (currentBit!2590 (_2!1910 lt!56214)) #b00000000000000000000000000001000) (bvsge (currentByte!2595 (_2!1910 lt!56214)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2595 (_2!1910 lt!56214)) (size!867 (buf!1195 (_2!1910 lt!56214)))) (and (= (currentBit!2590 (_2!1910 lt!56214)) #b00000000000000000000000000000000) (= (currentByte!2595 (_2!1910 lt!56214)) (size!867 (buf!1195 (_2!1910 lt!56214))))))))))

