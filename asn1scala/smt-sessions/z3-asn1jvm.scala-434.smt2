; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11798 () Bool)

(assert start!11798)

(declare-datatypes ((array!2655 0))(
  ( (array!2656 (arr!1767 (Array (_ BitVec 32) (_ BitVec 8))) (size!1203 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2655)

(declare-datatypes ((BitStream!2094 0))(
  ( (BitStream!2095 (buf!1584 array!2655) (currentByte!3202 (_ BitVec 32)) (currentBit!3197 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4029 0))(
  ( (Unit!4030) )
))
(declare-datatypes ((tuple2!5310 0))(
  ( (tuple2!5311 (_1!2766 Unit!4029) (_2!2766 BitStream!2094)) )
))
(declare-fun lt!92285 () tuple2!5310)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!38699 () Bool)

(declare-datatypes ((tuple2!5312 0))(
  ( (tuple2!5313 (_1!2767 BitStream!2094) (_2!2767 BitStream!2094)) )
))
(declare-fun lt!92281 () tuple2!5312)

(declare-fun b!58362 () Bool)

(declare-datatypes ((List!622 0))(
  ( (Nil!619) (Cons!618 (h!737 Bool) (t!1372 List!622)) )
))
(declare-fun head!441 (List!622) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2094 array!2655 (_ BitVec 64) (_ BitVec 64)) List!622)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2094 BitStream!2094 (_ BitVec 64)) List!622)

(assert (=> b!58362 (= e!38699 (= (head!441 (byteArrayBitContentToList!0 (_2!2766 lt!92285) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!441 (bitStreamReadBitsIntoList!0 (_2!2766 lt!92285) (_1!2767 lt!92281) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58363 () Bool)

(declare-fun res!48466 () Bool)

(declare-fun e!38704 () Bool)

(assert (=> b!58363 (=> res!48466 e!38704)))

(declare-fun lt!92284 () tuple2!5310)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58363 (= res!48466 (not (invariant!0 (currentBit!3197 (_2!2766 lt!92285)) (currentByte!3202 (_2!2766 lt!92285)) (size!1203 (buf!1584 (_2!2766 lt!92284))))))))

(declare-fun b!58364 () Bool)

(declare-fun e!38705 () Bool)

(declare-fun thiss!1379 () BitStream!2094)

(declare-fun array_inv!1106 (array!2655) Bool)

(assert (=> b!58364 (= e!38705 (array_inv!1106 (buf!1584 thiss!1379)))))

(declare-fun b!58365 () Bool)

(assert (=> b!58365 (= e!38704 true)))

(declare-fun lt!92289 () tuple2!5312)

(declare-fun reader!0 (BitStream!2094 BitStream!2094) tuple2!5312)

(assert (=> b!58365 (= lt!92289 (reader!0 thiss!1379 (_2!2766 lt!92284)))))

(declare-fun lt!92286 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!38703 () Bool)

(declare-fun b!58366 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58366 (= e!38703 (= lt!92286 (bvsub (bvsub (bvadd (bitIndex!0 (size!1203 (buf!1584 (_2!2766 lt!92285))) (currentByte!3202 (_2!2766 lt!92285)) (currentBit!3197 (_2!2766 lt!92285))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58367 () Bool)

(declare-fun res!48468 () Bool)

(declare-fun e!38702 () Bool)

(assert (=> b!58367 (=> (not res!48468) (not e!38702))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58367 (= res!48468 (validate_offset_bits!1 ((_ sign_extend 32) (size!1203 (buf!1584 thiss!1379))) ((_ sign_extend 32) (currentByte!3202 thiss!1379)) ((_ sign_extend 32) (currentBit!3197 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58368 () Bool)

(declare-fun res!48473 () Bool)

(assert (=> b!58368 (=> res!48473 e!38704)))

(assert (=> b!58368 (= res!48473 (not (invariant!0 (currentBit!3197 (_2!2766 lt!92285)) (currentByte!3202 (_2!2766 lt!92285)) (size!1203 (buf!1584 (_2!2766 lt!92285))))))))

(declare-fun b!58369 () Bool)

(declare-fun e!38701 () Bool)

(declare-fun e!38708 () Bool)

(assert (=> b!58369 (= e!38701 e!38708)))

(declare-fun res!48472 () Bool)

(assert (=> b!58369 (=> res!48472 e!38708)))

(declare-fun lt!92290 () (_ BitVec 64))

(assert (=> b!58369 (= res!48472 (not (= lt!92286 (bvsub (bvadd lt!92290 to!314) i!635))))))

(assert (=> b!58369 (= lt!92286 (bitIndex!0 (size!1203 (buf!1584 (_2!2766 lt!92284))) (currentByte!3202 (_2!2766 lt!92284)) (currentBit!3197 (_2!2766 lt!92284))))))

(declare-fun b!58370 () Bool)

(declare-fun e!38700 () Bool)

(assert (=> b!58370 (= e!38700 e!38701)))

(declare-fun res!48465 () Bool)

(assert (=> b!58370 (=> res!48465 e!38701)))

(declare-fun isPrefixOf!0 (BitStream!2094 BitStream!2094) Bool)

(assert (=> b!58370 (= res!48465 (not (isPrefixOf!0 (_2!2766 lt!92285) (_2!2766 lt!92284))))))

(assert (=> b!58370 (isPrefixOf!0 thiss!1379 (_2!2766 lt!92284))))

(declare-fun lt!92282 () Unit!4029)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2094 BitStream!2094 BitStream!2094) Unit!4029)

(assert (=> b!58370 (= lt!92282 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2766 lt!92285) (_2!2766 lt!92284)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2094 array!2655 (_ BitVec 64) (_ BitVec 64)) tuple2!5310)

(assert (=> b!58370 (= lt!92284 (appendBitsMSBFirstLoop!0 (_2!2766 lt!92285) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58370 e!38699))

(declare-fun res!48470 () Bool)

(assert (=> b!58370 (=> (not res!48470) (not e!38699))))

(assert (=> b!58370 (= res!48470 (validate_offset_bits!1 ((_ sign_extend 32) (size!1203 (buf!1584 (_2!2766 lt!92285)))) ((_ sign_extend 32) (currentByte!3202 thiss!1379)) ((_ sign_extend 32) (currentBit!3197 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92283 () Unit!4029)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2094 array!2655 (_ BitVec 64)) Unit!4029)

(assert (=> b!58370 (= lt!92283 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1584 (_2!2766 lt!92285)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58370 (= lt!92281 (reader!0 thiss!1379 (_2!2766 lt!92285)))))

(declare-fun b!58371 () Bool)

(assert (=> b!58371 (= e!38708 e!38704)))

(declare-fun res!48475 () Bool)

(assert (=> b!58371 (=> res!48475 e!38704)))

(assert (=> b!58371 (= res!48475 (not (= (size!1203 (buf!1584 (_2!2766 lt!92285))) (size!1203 (buf!1584 (_2!2766 lt!92284))))))))

(assert (=> b!58371 e!38703))

(declare-fun res!48477 () Bool)

(assert (=> b!58371 (=> (not res!48477) (not e!38703))))

(assert (=> b!58371 (= res!48477 (= (size!1203 (buf!1584 (_2!2766 lt!92284))) (size!1203 (buf!1584 thiss!1379))))))

(declare-fun b!58372 () Bool)

(declare-fun res!48471 () Bool)

(assert (=> b!58372 (=> res!48471 e!38708)))

(assert (=> b!58372 (= res!48471 (not (= (size!1203 (buf!1584 thiss!1379)) (size!1203 (buf!1584 (_2!2766 lt!92284))))))))

(declare-fun b!58373 () Bool)

(declare-fun e!38698 () Bool)

(assert (=> b!58373 (= e!38702 (not e!38698))))

(declare-fun res!48476 () Bool)

(assert (=> b!58373 (=> res!48476 e!38698)))

(assert (=> b!58373 (= res!48476 (bvsge i!635 to!314))))

(assert (=> b!58373 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92287 () Unit!4029)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2094) Unit!4029)

(assert (=> b!58373 (= lt!92287 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58373 (= lt!92290 (bitIndex!0 (size!1203 (buf!1584 thiss!1379)) (currentByte!3202 thiss!1379) (currentBit!3197 thiss!1379)))))

(declare-fun res!48474 () Bool)

(assert (=> start!11798 (=> (not res!48474) (not e!38702))))

(assert (=> start!11798 (= res!48474 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1203 srcBuffer!2))))))))

(assert (=> start!11798 e!38702))

(assert (=> start!11798 true))

(assert (=> start!11798 (array_inv!1106 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2094) Bool)

(assert (=> start!11798 (and (inv!12 thiss!1379) e!38705)))

(declare-fun b!58374 () Bool)

(declare-fun res!48469 () Bool)

(assert (=> b!58374 (=> res!48469 e!38708)))

(assert (=> b!58374 (= res!48469 (not (invariant!0 (currentBit!3197 (_2!2766 lt!92284)) (currentByte!3202 (_2!2766 lt!92284)) (size!1203 (buf!1584 (_2!2766 lt!92284))))))))

(declare-fun b!58375 () Bool)

(assert (=> b!58375 (= e!38698 e!38700)))

(declare-fun res!48467 () Bool)

(assert (=> b!58375 (=> res!48467 e!38700)))

(assert (=> b!58375 (= res!48467 (not (isPrefixOf!0 thiss!1379 (_2!2766 lt!92285))))))

(assert (=> b!58375 (validate_offset_bits!1 ((_ sign_extend 32) (size!1203 (buf!1584 (_2!2766 lt!92285)))) ((_ sign_extend 32) (currentByte!3202 (_2!2766 lt!92285))) ((_ sign_extend 32) (currentBit!3197 (_2!2766 lt!92285))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92288 () Unit!4029)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2094 BitStream!2094 (_ BitVec 64) (_ BitVec 64)) Unit!4029)

(assert (=> b!58375 (= lt!92288 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2766 lt!92285) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2094 (_ BitVec 8) (_ BitVec 32)) tuple2!5310)

(assert (=> b!58375 (= lt!92285 (appendBitFromByte!0 thiss!1379 (select (arr!1767 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11798 res!48474) b!58367))

(assert (= (and b!58367 res!48468) b!58373))

(assert (= (and b!58373 (not res!48476)) b!58375))

(assert (= (and b!58375 (not res!48467)) b!58370))

(assert (= (and b!58370 res!48470) b!58362))

(assert (= (and b!58370 (not res!48465)) b!58369))

(assert (= (and b!58369 (not res!48472)) b!58374))

(assert (= (and b!58374 (not res!48469)) b!58372))

(assert (= (and b!58372 (not res!48471)) b!58371))

(assert (= (and b!58371 res!48477) b!58366))

(assert (= (and b!58371 (not res!48475)) b!58368))

(assert (= (and b!58368 (not res!48473)) b!58363))

(assert (= (and b!58363 (not res!48466)) b!58365))

(assert (= start!11798 b!58364))

(declare-fun m!91967 () Bool)

(assert (=> b!58370 m!91967))

(declare-fun m!91969 () Bool)

(assert (=> b!58370 m!91969))

(declare-fun m!91971 () Bool)

(assert (=> b!58370 m!91971))

(declare-fun m!91973 () Bool)

(assert (=> b!58370 m!91973))

(declare-fun m!91975 () Bool)

(assert (=> b!58370 m!91975))

(declare-fun m!91977 () Bool)

(assert (=> b!58370 m!91977))

(declare-fun m!91979 () Bool)

(assert (=> b!58370 m!91979))

(declare-fun m!91981 () Bool)

(assert (=> b!58369 m!91981))

(declare-fun m!91983 () Bool)

(assert (=> b!58365 m!91983))

(declare-fun m!91985 () Bool)

(assert (=> b!58366 m!91985))

(declare-fun m!91987 () Bool)

(assert (=> b!58368 m!91987))

(declare-fun m!91989 () Bool)

(assert (=> start!11798 m!91989))

(declare-fun m!91991 () Bool)

(assert (=> start!11798 m!91991))

(declare-fun m!91993 () Bool)

(assert (=> b!58373 m!91993))

(declare-fun m!91995 () Bool)

(assert (=> b!58373 m!91995))

(declare-fun m!91997 () Bool)

(assert (=> b!58373 m!91997))

(declare-fun m!91999 () Bool)

(assert (=> b!58362 m!91999))

(assert (=> b!58362 m!91999))

(declare-fun m!92001 () Bool)

(assert (=> b!58362 m!92001))

(declare-fun m!92003 () Bool)

(assert (=> b!58362 m!92003))

(assert (=> b!58362 m!92003))

(declare-fun m!92005 () Bool)

(assert (=> b!58362 m!92005))

(declare-fun m!92007 () Bool)

(assert (=> b!58374 m!92007))

(declare-fun m!92009 () Bool)

(assert (=> b!58375 m!92009))

(declare-fun m!92011 () Bool)

(assert (=> b!58375 m!92011))

(declare-fun m!92013 () Bool)

(assert (=> b!58375 m!92013))

(declare-fun m!92015 () Bool)

(assert (=> b!58375 m!92015))

(assert (=> b!58375 m!92013))

(declare-fun m!92017 () Bool)

(assert (=> b!58375 m!92017))

(declare-fun m!92019 () Bool)

(assert (=> b!58364 m!92019))

(declare-fun m!92021 () Bool)

(assert (=> b!58363 m!92021))

(declare-fun m!92023 () Bool)

(assert (=> b!58367 m!92023))

(check-sat (not start!11798) (not b!58375) (not b!58370) (not b!58365) (not b!58363) (not b!58373) (not b!58366) (not b!58367) (not b!58369) (not b!58374) (not b!58368) (not b!58364) (not b!58362))
