; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11850 () Bool)

(assert start!11850)

(declare-fun b!59454 () Bool)

(declare-fun e!39557 () Bool)

(declare-fun e!39563 () Bool)

(assert (=> b!59454 (= e!39557 e!39563)))

(declare-fun res!49487 () Bool)

(assert (=> b!59454 (=> res!49487 e!39563)))

(declare-fun lt!93256 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!93262 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!59454 (= res!49487 (not (= lt!93256 (bvsub (bvadd lt!93262 to!314) i!635))))))

(declare-datatypes ((array!2707 0))(
  ( (array!2708 (arr!1793 (Array (_ BitVec 32) (_ BitVec 8))) (size!1229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2146 0))(
  ( (BitStream!2147 (buf!1610 array!2707) (currentByte!3228 (_ BitVec 32)) (currentBit!3223 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4081 0))(
  ( (Unit!4082) )
))
(declare-datatypes ((tuple2!5414 0))(
  ( (tuple2!5415 (_1!2818 Unit!4081) (_2!2818 BitStream!2146)) )
))
(declare-fun lt!93249 () tuple2!5414)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59454 (= lt!93256 (bitIndex!0 (size!1229 (buf!1610 (_2!2818 lt!93249))) (currentByte!3228 (_2!2818 lt!93249)) (currentBit!3223 (_2!2818 lt!93249))))))

(declare-fun b!59455 () Bool)

(declare-fun res!49491 () Bool)

(declare-fun e!39559 () Bool)

(assert (=> b!59455 (=> res!49491 e!39559)))

(declare-fun lt!93251 () tuple2!5414)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59455 (= res!49491 (not (invariant!0 (currentBit!3223 (_2!2818 lt!93251)) (currentByte!3228 (_2!2818 lt!93251)) (size!1229 (buf!1610 (_2!2818 lt!93251))))))))

(declare-fun b!59456 () Bool)

(declare-fun res!49488 () Bool)

(assert (=> b!59456 (=> res!49488 e!39559)))

(assert (=> b!59456 (= res!49488 (not (invariant!0 (currentBit!3223 (_2!2818 lt!93251)) (currentByte!3228 (_2!2818 lt!93251)) (size!1229 (buf!1610 (_2!2818 lt!93249))))))))

(declare-fun b!59457 () Bool)

(declare-fun e!39565 () Bool)

(declare-fun thiss!1379 () BitStream!2146)

(declare-fun array_inv!1132 (array!2707) Bool)

(assert (=> b!59457 (= e!39565 (array_inv!1132 (buf!1610 thiss!1379)))))

(declare-fun b!59458 () Bool)

(assert (=> b!59458 (= e!39559 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93253 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1229 (buf!1610 (_2!2818 lt!93249)))) ((_ sign_extend 32) (currentByte!3228 (_2!2818 lt!93251))) ((_ sign_extend 32) (currentBit!3223 (_2!2818 lt!93251))) lt!93253)))

(declare-fun lt!93255 () Unit!4081)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2146 array!2707 (_ BitVec 64)) Unit!4081)

(assert (=> b!59458 (= lt!93255 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2818 lt!93251) (buf!1610 (_2!2818 lt!93249)) lt!93253))))

(declare-datatypes ((tuple2!5416 0))(
  ( (tuple2!5417 (_1!2819 BitStream!2146) (_2!2819 BitStream!2146)) )
))
(declare-fun lt!93261 () tuple2!5416)

(declare-fun reader!0 (BitStream!2146 BitStream!2146) tuple2!5416)

(assert (=> b!59458 (= lt!93261 (reader!0 (_2!2818 lt!93251) (_2!2818 lt!93249)))))

(assert (=> b!59458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1229 (buf!1610 (_2!2818 lt!93249)))) ((_ sign_extend 32) (currentByte!3228 thiss!1379)) ((_ sign_extend 32) (currentBit!3223 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93252 () Unit!4081)

(assert (=> b!59458 (= lt!93252 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1610 (_2!2818 lt!93249)) (bvsub to!314 i!635)))))

(declare-fun lt!93257 () tuple2!5416)

(assert (=> b!59458 (= lt!93257 (reader!0 thiss!1379 (_2!2818 lt!93249)))))

(declare-fun res!49489 () Bool)

(declare-fun e!39556 () Bool)

(assert (=> start!11850 (=> (not res!49489) (not e!39556))))

(declare-fun srcBuffer!2 () array!2707)

(assert (=> start!11850 (= res!49489 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1229 srcBuffer!2))))))))

(assert (=> start!11850 e!39556))

(assert (=> start!11850 true))

(assert (=> start!11850 (array_inv!1132 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2146) Bool)

(assert (=> start!11850 (and (inv!12 thiss!1379) e!39565)))

(declare-fun b!59459 () Bool)

(declare-fun e!39562 () Bool)

(assert (=> b!59459 (= e!39562 e!39557)))

(declare-fun res!49490 () Bool)

(assert (=> b!59459 (=> res!49490 e!39557)))

(declare-fun isPrefixOf!0 (BitStream!2146 BitStream!2146) Bool)

(assert (=> b!59459 (= res!49490 (not (isPrefixOf!0 (_2!2818 lt!93251) (_2!2818 lt!93249))))))

(assert (=> b!59459 (isPrefixOf!0 thiss!1379 (_2!2818 lt!93249))))

(declare-fun lt!93250 () Unit!4081)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2146 BitStream!2146 BitStream!2146) Unit!4081)

(assert (=> b!59459 (= lt!93250 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2818 lt!93251) (_2!2818 lt!93249)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2146 array!2707 (_ BitVec 64) (_ BitVec 64)) tuple2!5414)

(assert (=> b!59459 (= lt!93249 (appendBitsMSBFirstLoop!0 (_2!2818 lt!93251) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39564 () Bool)

(assert (=> b!59459 e!39564))

(declare-fun res!49482 () Bool)

(assert (=> b!59459 (=> (not res!49482) (not e!39564))))

(assert (=> b!59459 (= res!49482 (validate_offset_bits!1 ((_ sign_extend 32) (size!1229 (buf!1610 (_2!2818 lt!93251)))) ((_ sign_extend 32) (currentByte!3228 thiss!1379)) ((_ sign_extend 32) (currentBit!3223 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93254 () Unit!4081)

(assert (=> b!59459 (= lt!93254 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1610 (_2!2818 lt!93251)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93258 () tuple2!5416)

(assert (=> b!59459 (= lt!93258 (reader!0 thiss!1379 (_2!2818 lt!93251)))))

(declare-fun b!59460 () Bool)

(declare-fun e!39560 () Bool)

(assert (=> b!59460 (= e!39560 e!39562)))

(declare-fun res!49479 () Bool)

(assert (=> b!59460 (=> res!49479 e!39562)))

(assert (=> b!59460 (= res!49479 (not (isPrefixOf!0 thiss!1379 (_2!2818 lt!93251))))))

(assert (=> b!59460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1229 (buf!1610 (_2!2818 lt!93251)))) ((_ sign_extend 32) (currentByte!3228 (_2!2818 lt!93251))) ((_ sign_extend 32) (currentBit!3223 (_2!2818 lt!93251))) lt!93253)))

(assert (=> b!59460 (= lt!93253 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93260 () Unit!4081)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2146 BitStream!2146 (_ BitVec 64) (_ BitVec 64)) Unit!4081)

(assert (=> b!59460 (= lt!93260 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2818 lt!93251) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2146 (_ BitVec 8) (_ BitVec 32)) tuple2!5414)

(assert (=> b!59460 (= lt!93251 (appendBitFromByte!0 thiss!1379 (select (arr!1793 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59461 () Bool)

(declare-fun res!49486 () Bool)

(assert (=> b!59461 (=> (not res!49486) (not e!39556))))

(assert (=> b!59461 (= res!49486 (validate_offset_bits!1 ((_ sign_extend 32) (size!1229 (buf!1610 thiss!1379))) ((_ sign_extend 32) (currentByte!3228 thiss!1379)) ((_ sign_extend 32) (currentBit!3223 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59462 () Bool)

(declare-fun res!49481 () Bool)

(assert (=> b!59462 (=> res!49481 e!39563)))

(assert (=> b!59462 (= res!49481 (not (invariant!0 (currentBit!3223 (_2!2818 lt!93249)) (currentByte!3228 (_2!2818 lt!93249)) (size!1229 (buf!1610 (_2!2818 lt!93249))))))))

(declare-fun b!59463 () Bool)

(declare-fun e!39566 () Bool)

(assert (=> b!59463 (= e!39566 (= lt!93256 (bvsub (bvsub (bvadd (bitIndex!0 (size!1229 (buf!1610 (_2!2818 lt!93251))) (currentByte!3228 (_2!2818 lt!93251)) (currentBit!3223 (_2!2818 lt!93251))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59464 () Bool)

(assert (=> b!59464 (= e!39556 (not e!39560))))

(declare-fun res!49484 () Bool)

(assert (=> b!59464 (=> res!49484 e!39560)))

(assert (=> b!59464 (= res!49484 (bvsge i!635 to!314))))

(assert (=> b!59464 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93259 () Unit!4081)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2146) Unit!4081)

(assert (=> b!59464 (= lt!93259 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59464 (= lt!93262 (bitIndex!0 (size!1229 (buf!1610 thiss!1379)) (currentByte!3228 thiss!1379) (currentBit!3223 thiss!1379)))))

(declare-fun b!59465 () Bool)

(assert (=> b!59465 (= e!39563 e!39559)))

(declare-fun res!49483 () Bool)

(assert (=> b!59465 (=> res!49483 e!39559)))

(assert (=> b!59465 (= res!49483 (not (= (size!1229 (buf!1610 (_2!2818 lt!93251))) (size!1229 (buf!1610 (_2!2818 lt!93249))))))))

(assert (=> b!59465 e!39566))

(declare-fun res!49485 () Bool)

(assert (=> b!59465 (=> (not res!49485) (not e!39566))))

(assert (=> b!59465 (= res!49485 (= (size!1229 (buf!1610 (_2!2818 lt!93249))) (size!1229 (buf!1610 thiss!1379))))))

(declare-fun b!59466 () Bool)

(declare-datatypes ((List!648 0))(
  ( (Nil!645) (Cons!644 (h!763 Bool) (t!1398 List!648)) )
))
(declare-fun head!467 (List!648) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2146 array!2707 (_ BitVec 64) (_ BitVec 64)) List!648)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2146 BitStream!2146 (_ BitVec 64)) List!648)

(assert (=> b!59466 (= e!39564 (= (head!467 (byteArrayBitContentToList!0 (_2!2818 lt!93251) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!467 (bitStreamReadBitsIntoList!0 (_2!2818 lt!93251) (_1!2819 lt!93258) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59467 () Bool)

(declare-fun res!49480 () Bool)

(assert (=> b!59467 (=> res!49480 e!39563)))

(assert (=> b!59467 (= res!49480 (not (= (size!1229 (buf!1610 thiss!1379)) (size!1229 (buf!1610 (_2!2818 lt!93249))))))))

(assert (= (and start!11850 res!49489) b!59461))

(assert (= (and b!59461 res!49486) b!59464))

(assert (= (and b!59464 (not res!49484)) b!59460))

(assert (= (and b!59460 (not res!49479)) b!59459))

(assert (= (and b!59459 res!49482) b!59466))

(assert (= (and b!59459 (not res!49490)) b!59454))

(assert (= (and b!59454 (not res!49487)) b!59462))

(assert (= (and b!59462 (not res!49481)) b!59467))

(assert (= (and b!59467 (not res!49480)) b!59465))

(assert (= (and b!59465 res!49485) b!59463))

(assert (= (and b!59465 (not res!49483)) b!59455))

(assert (= (and b!59455 (not res!49491)) b!59456))

(assert (= (and b!59456 (not res!49488)) b!59458))

(assert (= start!11850 b!59457))

(declare-fun m!93625 () Bool)

(assert (=> b!59461 m!93625))

(declare-fun m!93627 () Bool)

(assert (=> b!59460 m!93627))

(declare-fun m!93629 () Bool)

(assert (=> b!59460 m!93629))

(assert (=> b!59460 m!93627))

(declare-fun m!93631 () Bool)

(assert (=> b!59460 m!93631))

(declare-fun m!93633 () Bool)

(assert (=> b!59460 m!93633))

(declare-fun m!93635 () Bool)

(assert (=> b!59460 m!93635))

(declare-fun m!93637 () Bool)

(assert (=> b!59455 m!93637))

(declare-fun m!93639 () Bool)

(assert (=> start!11850 m!93639))

(declare-fun m!93641 () Bool)

(assert (=> start!11850 m!93641))

(declare-fun m!93643 () Bool)

(assert (=> b!59459 m!93643))

(declare-fun m!93645 () Bool)

(assert (=> b!59459 m!93645))

(declare-fun m!93647 () Bool)

(assert (=> b!59459 m!93647))

(declare-fun m!93649 () Bool)

(assert (=> b!59459 m!93649))

(declare-fun m!93651 () Bool)

(assert (=> b!59459 m!93651))

(declare-fun m!93653 () Bool)

(assert (=> b!59459 m!93653))

(declare-fun m!93655 () Bool)

(assert (=> b!59459 m!93655))

(declare-fun m!93657 () Bool)

(assert (=> b!59463 m!93657))

(declare-fun m!93659 () Bool)

(assert (=> b!59454 m!93659))

(declare-fun m!93661 () Bool)

(assert (=> b!59457 m!93661))

(declare-fun m!93663 () Bool)

(assert (=> b!59466 m!93663))

(assert (=> b!59466 m!93663))

(declare-fun m!93665 () Bool)

(assert (=> b!59466 m!93665))

(declare-fun m!93667 () Bool)

(assert (=> b!59466 m!93667))

(assert (=> b!59466 m!93667))

(declare-fun m!93669 () Bool)

(assert (=> b!59466 m!93669))

(declare-fun m!93671 () Bool)

(assert (=> b!59462 m!93671))

(declare-fun m!93673 () Bool)

(assert (=> b!59456 m!93673))

(declare-fun m!93675 () Bool)

(assert (=> b!59464 m!93675))

(declare-fun m!93677 () Bool)

(assert (=> b!59464 m!93677))

(declare-fun m!93679 () Bool)

(assert (=> b!59464 m!93679))

(declare-fun m!93681 () Bool)

(assert (=> b!59458 m!93681))

(declare-fun m!93683 () Bool)

(assert (=> b!59458 m!93683))

(declare-fun m!93685 () Bool)

(assert (=> b!59458 m!93685))

(declare-fun m!93687 () Bool)

(assert (=> b!59458 m!93687))

(declare-fun m!93689 () Bool)

(assert (=> b!59458 m!93689))

(declare-fun m!93691 () Bool)

(assert (=> b!59458 m!93691))

(push 1)

(assert (not start!11850))

(assert (not b!59458))

(assert (not b!59462))

(assert (not b!59457))

(assert (not b!59454))

(assert (not b!59463))

(assert (not b!59466))

(assert (not b!59456))

(assert (not b!59455))

(assert (not b!59460))

(assert (not b!59464))

(assert (not b!59459))

(assert (not b!59461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

