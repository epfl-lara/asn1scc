; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8642 () Bool)

(assert start!8642)

(declare-datatypes ((array!2206 0))(
  ( (array!2207 (arr!1499 (Array (_ BitVec 32) (_ BitVec 8))) (size!997 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2206)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!1738 0))(
  ( (BitStream!1739 (buf!1331 array!2206) (currentByte!2797 (_ BitVec 32)) (currentBit!2792 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3064 0))(
  ( (Unit!3065) )
))
(declare-datatypes ((tuple2!4226 0))(
  ( (tuple2!4227 (_1!2206 Unit!3064) (_2!2206 BitStream!1738)) )
))
(declare-fun lt!64984 () tuple2!4226)

(declare-fun b!43072 () Bool)

(declare-fun e!28782 () Bool)

(declare-datatypes ((tuple2!4228 0))(
  ( (tuple2!4229 (_1!2207 BitStream!1738) (_2!2207 BitStream!1738)) )
))
(declare-fun lt!64985 () tuple2!4228)

(declare-datatypes ((List!510 0))(
  ( (Nil!507) (Cons!506 (h!625 Bool) (t!1260 List!510)) )
))
(declare-fun head!329 (List!510) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1738 array!2206 (_ BitVec 64) (_ BitVec 64)) List!510)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1738 BitStream!1738 (_ BitVec 64)) List!510)

(assert (=> b!43072 (= e!28782 (= (head!329 (byteArrayBitContentToList!0 (_2!2206 lt!64984) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!329 (bitStreamReadBitsIntoList!0 (_2!2206 lt!64984) (_1!2207 lt!64985) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43073 () Bool)

(declare-fun e!28784 () Bool)

(declare-fun e!28780 () Bool)

(assert (=> b!43073 (= e!28784 (not e!28780))))

(declare-fun res!36596 () Bool)

(assert (=> b!43073 (=> res!36596 e!28780)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!43073 (= res!36596 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1738)

(declare-fun isPrefixOf!0 (BitStream!1738 BitStream!1738) Bool)

(assert (=> b!43073 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64980 () Unit!3064)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1738) Unit!3064)

(assert (=> b!43073 (= lt!64980 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64983 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43073 (= lt!64983 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)))))

(declare-fun res!36600 () Bool)

(assert (=> start!8642 (=> (not res!36600) (not e!28784))))

(assert (=> start!8642 (= res!36600 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!997 srcBuffer!2))))))))

(assert (=> start!8642 e!28784))

(assert (=> start!8642 true))

(declare-fun array_inv!922 (array!2206) Bool)

(assert (=> start!8642 (array_inv!922 srcBuffer!2)))

(declare-fun e!28779 () Bool)

(declare-fun inv!12 (BitStream!1738) Bool)

(assert (=> start!8642 (and (inv!12 thiss!1379) e!28779)))

(declare-fun b!43074 () Bool)

(assert (=> b!43074 (= e!28779 (array_inv!922 (buf!1331 thiss!1379)))))

(declare-fun b!43075 () Bool)

(declare-fun res!36595 () Bool)

(assert (=> b!43075 (=> (not res!36595) (not e!28784))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43075 (= res!36595 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 thiss!1379))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43076 () Bool)

(declare-fun e!28781 () Bool)

(declare-fun e!28783 () Bool)

(assert (=> b!43076 (= e!28781 e!28783)))

(declare-fun res!36597 () Bool)

(assert (=> b!43076 (=> res!36597 e!28783)))

(declare-fun lt!64986 () tuple2!4226)

(assert (=> b!43076 (= res!36597 (not (isPrefixOf!0 (_2!2206 lt!64984) (_2!2206 lt!64986))))))

(assert (=> b!43076 (isPrefixOf!0 thiss!1379 (_2!2206 lt!64986))))

(declare-fun lt!64982 () Unit!3064)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1738 BitStream!1738 BitStream!1738) Unit!3064)

(assert (=> b!43076 (= lt!64982 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2206 lt!64984) (_2!2206 lt!64986)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1738 array!2206 (_ BitVec 64) (_ BitVec 64)) tuple2!4226)

(assert (=> b!43076 (= lt!64986 (appendBitsMSBFirstLoop!0 (_2!2206 lt!64984) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!43076 e!28782))

(declare-fun res!36598 () Bool)

(assert (=> b!43076 (=> (not res!36598) (not e!28782))))

(assert (=> b!43076 (= res!36598 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64981 () Unit!3064)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1738 array!2206 (_ BitVec 64)) Unit!3064)

(assert (=> b!43076 (= lt!64981 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1331 (_2!2206 lt!64984)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1738 BitStream!1738) tuple2!4228)

(assert (=> b!43076 (= lt!64985 (reader!0 thiss!1379 (_2!2206 lt!64984)))))

(declare-fun b!43077 () Bool)

(assert (=> b!43077 (= e!28780 e!28781)))

(declare-fun res!36599 () Bool)

(assert (=> b!43077 (=> res!36599 e!28781)))

(assert (=> b!43077 (= res!36599 (not (isPrefixOf!0 thiss!1379 (_2!2206 lt!64984))))))

(assert (=> b!43077 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64987 () Unit!3064)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1738 BitStream!1738 (_ BitVec 64) (_ BitVec 64)) Unit!3064)

(assert (=> b!43077 (= lt!64987 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2206 lt!64984) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1738 (_ BitVec 8) (_ BitVec 32)) tuple2!4226)

(assert (=> b!43077 (= lt!64984 (appendBitFromByte!0 thiss!1379 (select (arr!1499 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43078 () Bool)

(assert (=> b!43078 (= e!28783 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64986))) (currentByte!2797 (_2!2206 lt!64986)) (currentBit!2792 (_2!2206 lt!64986))) (bvsub (bvadd lt!64983 to!314) i!635)))))

(assert (= (and start!8642 res!36600) b!43075))

(assert (= (and b!43075 res!36595) b!43073))

(assert (= (and b!43073 (not res!36596)) b!43077))

(assert (= (and b!43077 (not res!36599)) b!43076))

(assert (= (and b!43076 res!36598) b!43072))

(assert (= (and b!43076 (not res!36597)) b!43078))

(assert (= start!8642 b!43074))

(declare-fun m!65455 () Bool)

(assert (=> b!43075 m!65455))

(declare-fun m!65457 () Bool)

(assert (=> b!43074 m!65457))

(declare-fun m!65459 () Bool)

(assert (=> start!8642 m!65459))

(declare-fun m!65461 () Bool)

(assert (=> start!8642 m!65461))

(declare-fun m!65463 () Bool)

(assert (=> b!43077 m!65463))

(declare-fun m!65465 () Bool)

(assert (=> b!43077 m!65465))

(declare-fun m!65467 () Bool)

(assert (=> b!43077 m!65467))

(declare-fun m!65469 () Bool)

(assert (=> b!43077 m!65469))

(assert (=> b!43077 m!65465))

(declare-fun m!65471 () Bool)

(assert (=> b!43077 m!65471))

(declare-fun m!65473 () Bool)

(assert (=> b!43076 m!65473))

(declare-fun m!65475 () Bool)

(assert (=> b!43076 m!65475))

(declare-fun m!65477 () Bool)

(assert (=> b!43076 m!65477))

(declare-fun m!65479 () Bool)

(assert (=> b!43076 m!65479))

(declare-fun m!65481 () Bool)

(assert (=> b!43076 m!65481))

(declare-fun m!65483 () Bool)

(assert (=> b!43076 m!65483))

(declare-fun m!65485 () Bool)

(assert (=> b!43076 m!65485))

(declare-fun m!65487 () Bool)

(assert (=> b!43078 m!65487))

(declare-fun m!65489 () Bool)

(assert (=> b!43073 m!65489))

(declare-fun m!65491 () Bool)

(assert (=> b!43073 m!65491))

(declare-fun m!65493 () Bool)

(assert (=> b!43073 m!65493))

(declare-fun m!65495 () Bool)

(assert (=> b!43072 m!65495))

(assert (=> b!43072 m!65495))

(declare-fun m!65497 () Bool)

(assert (=> b!43072 m!65497))

(declare-fun m!65499 () Bool)

(assert (=> b!43072 m!65499))

(assert (=> b!43072 m!65499))

(declare-fun m!65501 () Bool)

(assert (=> b!43072 m!65501))

(push 1)

(assert (not b!43073))

(assert (not b!43077))

(assert (not b!43075))

(assert (not b!43078))

(assert (not b!43076))

(assert (not start!8642))

(assert (not b!43074))

(assert (not b!43072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12474 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12474 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 thiss!1379))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!997 (buf!1331 thiss!1379))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3365 () Bool)

(assert (= bs!3365 d!12474))

(declare-fun m!65607 () Bool)

(assert (=> bs!3365 m!65607))

(assert (=> b!43075 d!12474))

(declare-fun b!43146 () Bool)

(declare-fun res!36653 () Bool)

(declare-fun e!28843 () Bool)

(assert (=> b!43146 (=> (not res!36653) (not e!28843))))

(declare-fun lt!65159 () tuple2!4228)

(assert (=> b!43146 (= res!36653 (isPrefixOf!0 (_1!2207 lt!65159) thiss!1379))))

(declare-fun b!43147 () Bool)

(declare-fun res!36652 () Bool)

(assert (=> b!43147 (=> (not res!36652) (not e!28843))))

(assert (=> b!43147 (= res!36652 (isPrefixOf!0 (_2!2207 lt!65159) (_2!2206 lt!64984)))))

(declare-fun d!12476 () Bool)

(assert (=> d!12476 e!28843))

(declare-fun res!36654 () Bool)

(assert (=> d!12476 (=> (not res!36654) (not e!28843))))

(assert (=> d!12476 (= res!36654 (isPrefixOf!0 (_1!2207 lt!65159) (_2!2207 lt!65159)))))

(declare-fun lt!65146 () BitStream!1738)

(assert (=> d!12476 (= lt!65159 (tuple2!4229 lt!65146 (_2!2206 lt!64984)))))

(declare-fun lt!65153 () Unit!3064)

(declare-fun lt!65148 () Unit!3064)

(assert (=> d!12476 (= lt!65153 lt!65148)))

(assert (=> d!12476 (isPrefixOf!0 lt!65146 (_2!2206 lt!64984))))

(assert (=> d!12476 (= lt!65148 (lemmaIsPrefixTransitive!0 lt!65146 (_2!2206 lt!64984) (_2!2206 lt!64984)))))

(declare-fun lt!65152 () Unit!3064)

(declare-fun lt!65147 () Unit!3064)

(assert (=> d!12476 (= lt!65152 lt!65147)))

(assert (=> d!12476 (isPrefixOf!0 lt!65146 (_2!2206 lt!64984))))

(assert (=> d!12476 (= lt!65147 (lemmaIsPrefixTransitive!0 lt!65146 thiss!1379 (_2!2206 lt!64984)))))

(declare-fun lt!65144 () Unit!3064)

(declare-fun e!28844 () Unit!3064)

(assert (=> d!12476 (= lt!65144 e!28844)))

(declare-fun c!2829 () Bool)

(assert (=> d!12476 (= c!2829 (not (= (size!997 (buf!1331 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!65158 () Unit!3064)

(declare-fun lt!65142 () Unit!3064)

(assert (=> d!12476 (= lt!65158 lt!65142)))

(assert (=> d!12476 (isPrefixOf!0 (_2!2206 lt!64984) (_2!2206 lt!64984))))

(assert (=> d!12476 (= lt!65142 (lemmaIsPrefixRefl!0 (_2!2206 lt!64984)))))

(declare-fun lt!65150 () Unit!3064)

(declare-fun lt!65155 () Unit!3064)

(assert (=> d!12476 (= lt!65150 lt!65155)))

(assert (=> d!12476 (= lt!65155 (lemmaIsPrefixRefl!0 (_2!2206 lt!64984)))))

(declare-fun lt!65160 () Unit!3064)

(declare-fun lt!65157 () Unit!3064)

(assert (=> d!12476 (= lt!65160 lt!65157)))

(assert (=> d!12476 (isPrefixOf!0 lt!65146 lt!65146)))

(assert (=> d!12476 (= lt!65157 (lemmaIsPrefixRefl!0 lt!65146))))

(declare-fun lt!65154 () Unit!3064)

(declare-fun lt!65161 () Unit!3064)

(assert (=> d!12476 (= lt!65154 lt!65161)))

(assert (=> d!12476 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12476 (= lt!65161 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12476 (= lt!65146 (BitStream!1739 (buf!1331 (_2!2206 lt!64984)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)))))

(assert (=> d!12476 (isPrefixOf!0 thiss!1379 (_2!2206 lt!64984))))

(assert (=> d!12476 (= (reader!0 thiss!1379 (_2!2206 lt!64984)) lt!65159)))

(declare-fun b!43148 () Bool)

(declare-fun Unit!3078 () Unit!3064)

(assert (=> b!43148 (= e!28844 Unit!3078)))

(declare-fun b!43149 () Bool)

(declare-fun lt!65145 () Unit!3064)

(assert (=> b!43149 (= e!28844 lt!65145)))

(declare-fun lt!65143 () (_ BitVec 64))

(assert (=> b!43149 (= lt!65143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65151 () (_ BitVec 64))

(assert (=> b!43149 (= lt!65151 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2206 array!2206 (_ BitVec 64) (_ BitVec 64)) Unit!3064)

(assert (=> b!43149 (= lt!65145 (arrayBitRangesEqSymmetric!0 (buf!1331 thiss!1379) (buf!1331 (_2!2206 lt!64984)) lt!65143 lt!65151))))

(declare-fun arrayBitRangesEq!0 (array!2206 array!2206 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43149 (arrayBitRangesEq!0 (buf!1331 (_2!2206 lt!64984)) (buf!1331 thiss!1379) lt!65143 lt!65151)))

(declare-fun lt!65149 () (_ BitVec 64))

(declare-fun lt!65156 () (_ BitVec 64))

(declare-fun b!43150 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1738 (_ BitVec 64)) BitStream!1738)

(assert (=> b!43150 (= e!28843 (= (_1!2207 lt!65159) (withMovedBitIndex!0 (_2!2207 lt!65159) (bvsub lt!65156 lt!65149))))))

(assert (=> b!43150 (or (= (bvand lt!65156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65149 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65156 lt!65149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43150 (= lt!65149 (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984))))))

(assert (=> b!43150 (= lt!65156 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)))))

(assert (= (and d!12476 c!2829) b!43149))

(assert (= (and d!12476 (not c!2829)) b!43148))

(assert (= (and d!12476 res!36654) b!43146))

(assert (= (and b!43146 res!36653) b!43147))

(assert (= (and b!43147 res!36652) b!43150))

(declare-fun m!65637 () Bool)

(assert (=> d!12476 m!65637))

(declare-fun m!65639 () Bool)

(assert (=> d!12476 m!65639))

(declare-fun m!65641 () Bool)

(assert (=> d!12476 m!65641))

(assert (=> d!12476 m!65491))

(declare-fun m!65643 () Bool)

(assert (=> d!12476 m!65643))

(declare-fun m!65645 () Bool)

(assert (=> d!12476 m!65645))

(declare-fun m!65647 () Bool)

(assert (=> d!12476 m!65647))

(assert (=> d!12476 m!65489))

(declare-fun m!65649 () Bool)

(assert (=> d!12476 m!65649))

(declare-fun m!65651 () Bool)

(assert (=> d!12476 m!65651))

(assert (=> d!12476 m!65467))

(assert (=> b!43149 m!65493))

(declare-fun m!65653 () Bool)

(assert (=> b!43149 m!65653))

(declare-fun m!65655 () Bool)

(assert (=> b!43149 m!65655))

(declare-fun m!65657 () Bool)

(assert (=> b!43146 m!65657))

(declare-fun m!65659 () Bool)

(assert (=> b!43150 m!65659))

(declare-fun m!65661 () Bool)

(assert (=> b!43150 m!65661))

(assert (=> b!43150 m!65493))

(declare-fun m!65663 () Bool)

(assert (=> b!43147 m!65663))

(assert (=> b!43076 d!12476))

(declare-fun d!12480 () Bool)

(declare-fun res!36663 () Bool)

(declare-fun e!28850 () Bool)

(assert (=> d!12480 (=> (not res!36663) (not e!28850))))

(assert (=> d!12480 (= res!36663 (= (size!997 (buf!1331 (_2!2206 lt!64984))) (size!997 (buf!1331 (_2!2206 lt!64986)))))))

(assert (=> d!12480 (= (isPrefixOf!0 (_2!2206 lt!64984) (_2!2206 lt!64986)) e!28850)))

(declare-fun b!43157 () Bool)

(declare-fun res!36662 () Bool)

(assert (=> b!43157 (=> (not res!36662) (not e!28850))))

(assert (=> b!43157 (= res!36662 (bvsle (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984))) (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64986))) (currentByte!2797 (_2!2206 lt!64986)) (currentBit!2792 (_2!2206 lt!64986)))))))

(declare-fun b!43158 () Bool)

(declare-fun e!28849 () Bool)

(assert (=> b!43158 (= e!28850 e!28849)))

(declare-fun res!36661 () Bool)

(assert (=> b!43158 (=> res!36661 e!28849)))

(assert (=> b!43158 (= res!36661 (= (size!997 (buf!1331 (_2!2206 lt!64984))) #b00000000000000000000000000000000))))

(declare-fun b!43159 () Bool)

(assert (=> b!43159 (= e!28849 (arrayBitRangesEq!0 (buf!1331 (_2!2206 lt!64984)) (buf!1331 (_2!2206 lt!64986)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984)))))))

(assert (= (and d!12480 res!36663) b!43157))

(assert (= (and b!43157 res!36662) b!43158))

(assert (= (and b!43158 (not res!36661)) b!43159))

(assert (=> b!43157 m!65661))

(assert (=> b!43157 m!65487))

(assert (=> b!43159 m!65661))

(assert (=> b!43159 m!65661))

(declare-fun m!65665 () Bool)

(assert (=> b!43159 m!65665))

(assert (=> b!43076 d!12480))

(declare-fun d!12482 () Bool)

(assert (=> d!12482 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65164 () Unit!3064)

(declare-fun choose!9 (BitStream!1738 array!2206 (_ BitVec 64) BitStream!1738) Unit!3064)

(assert (=> d!12482 (= lt!65164 (choose!9 thiss!1379 (buf!1331 (_2!2206 lt!64984)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1739 (buf!1331 (_2!2206 lt!64984)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379))))))

(assert (=> d!12482 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1331 (_2!2206 lt!64984)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65164)))

(declare-fun bs!3366 () Bool)

(assert (= bs!3366 d!12482))

(assert (=> bs!3366 m!65483))

(declare-fun m!65667 () Bool)

(assert (=> bs!3366 m!65667))

(assert (=> b!43076 d!12482))

(declare-fun d!12484 () Bool)

(declare-fun res!36666 () Bool)

(declare-fun e!28852 () Bool)

(assert (=> d!12484 (=> (not res!36666) (not e!28852))))

(assert (=> d!12484 (= res!36666 (= (size!997 (buf!1331 thiss!1379)) (size!997 (buf!1331 (_2!2206 lt!64986)))))))

(assert (=> d!12484 (= (isPrefixOf!0 thiss!1379 (_2!2206 lt!64986)) e!28852)))

(declare-fun b!43160 () Bool)

(declare-fun res!36665 () Bool)

(assert (=> b!43160 (=> (not res!36665) (not e!28852))))

(assert (=> b!43160 (= res!36665 (bvsle (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)) (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64986))) (currentByte!2797 (_2!2206 lt!64986)) (currentBit!2792 (_2!2206 lt!64986)))))))

(declare-fun b!43161 () Bool)

(declare-fun e!28851 () Bool)

(assert (=> b!43161 (= e!28852 e!28851)))

(declare-fun res!36664 () Bool)

(assert (=> b!43161 (=> res!36664 e!28851)))

(assert (=> b!43161 (= res!36664 (= (size!997 (buf!1331 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43162 () Bool)

(assert (=> b!43162 (= e!28851 (arrayBitRangesEq!0 (buf!1331 thiss!1379) (buf!1331 (_2!2206 lt!64986)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379))))))

(assert (= (and d!12484 res!36666) b!43160))

(assert (= (and b!43160 res!36665) b!43161))

(assert (= (and b!43161 (not res!36664)) b!43162))

(assert (=> b!43160 m!65493))

(assert (=> b!43160 m!65487))

(assert (=> b!43162 m!65493))

(assert (=> b!43162 m!65493))

(declare-fun m!65669 () Bool)

(assert (=> b!43162 m!65669))

(assert (=> b!43076 d!12484))

(declare-fun d!12486 () Bool)

(assert (=> d!12486 (isPrefixOf!0 thiss!1379 (_2!2206 lt!64986))))

(declare-fun lt!65167 () Unit!3064)

(declare-fun choose!30 (BitStream!1738 BitStream!1738 BitStream!1738) Unit!3064)

(assert (=> d!12486 (= lt!65167 (choose!30 thiss!1379 (_2!2206 lt!64984) (_2!2206 lt!64986)))))

(assert (=> d!12486 (isPrefixOf!0 thiss!1379 (_2!2206 lt!64984))))

(assert (=> d!12486 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2206 lt!64984) (_2!2206 lt!64986)) lt!65167)))

(declare-fun bs!3367 () Bool)

(assert (= bs!3367 d!12486))

(assert (=> bs!3367 m!65481))

(declare-fun m!65671 () Bool)

(assert (=> bs!3367 m!65671))

(assert (=> bs!3367 m!65467))

(assert (=> b!43076 d!12486))

(declare-fun d!12488 () Bool)

(assert (=> d!12488 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3368 () Bool)

(assert (= bs!3368 d!12488))

(declare-fun m!65673 () Bool)

(assert (=> bs!3368 m!65673))

(assert (=> b!43076 d!12488))

(declare-fun b!43314 () Bool)

(declare-fun res!36773 () Bool)

(declare-fun e!28932 () Bool)

(assert (=> b!43314 (=> (not res!36773) (not e!28932))))

(declare-fun lt!65501 () tuple2!4226)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43314 (= res!36773 (invariant!0 (currentBit!2792 (_2!2206 lt!65501)) (currentByte!2797 (_2!2206 lt!65501)) (size!997 (buf!1331 (_2!2206 lt!65501)))))))

(declare-fun b!43315 () Bool)

(declare-fun e!28930 () Bool)

(declare-fun lt!65502 () (_ BitVec 64))

(assert (=> b!43315 (= e!28930 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) lt!65502))))

(declare-fun b!43316 () Bool)

(declare-fun res!36772 () Bool)

(assert (=> b!43316 (=> (not res!36772) (not e!28932))))

(assert (=> b!43316 (= res!36772 (= (size!997 (buf!1331 (_2!2206 lt!65501))) (size!997 (buf!1331 (_2!2206 lt!64984)))))))

(declare-fun b!43317 () Bool)

(declare-fun res!36771 () Bool)

(assert (=> b!43317 (=> (not res!36771) (not e!28932))))

(assert (=> b!43317 (= res!36771 (= (size!997 (buf!1331 (_2!2206 lt!64984))) (size!997 (buf!1331 (_2!2206 lt!65501)))))))

(declare-fun b!43318 () Bool)

(declare-fun e!28931 () tuple2!4226)

(declare-fun lt!65492 () tuple2!4226)

(declare-fun Unit!3079 () Unit!3064)

(assert (=> b!43318 (= e!28931 (tuple2!4227 Unit!3079 (_2!2206 lt!65492)))))

(declare-fun lt!65498 () tuple2!4226)

(assert (=> b!43318 (= lt!65498 (appendBitFromByte!0 (_2!2206 lt!64984) (select (arr!1499 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!65524 () (_ BitVec 64))

(assert (=> b!43318 (= lt!65524 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65499 () (_ BitVec 64))

(assert (=> b!43318 (= lt!65499 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65494 () Unit!3064)

(assert (=> b!43318 (= lt!65494 (validateOffsetBitsIneqLemma!0 (_2!2206 lt!64984) (_2!2206 lt!65498) lt!65524 lt!65499))))

(assert (=> b!43318 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!65498)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!65498))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!65498))) (bvsub lt!65524 lt!65499))))

(declare-fun lt!65493 () Unit!3064)

(assert (=> b!43318 (= lt!65493 lt!65494)))

(declare-fun lt!65534 () tuple2!4228)

(assert (=> b!43318 (= lt!65534 (reader!0 (_2!2206 lt!64984) (_2!2206 lt!65498)))))

(declare-fun lt!65528 () (_ BitVec 64))

(assert (=> b!43318 (= lt!65528 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65530 () Unit!3064)

(assert (=> b!43318 (= lt!65530 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2206 lt!64984) (buf!1331 (_2!2206 lt!65498)) lt!65528))))

(assert (=> b!43318 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!65498)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) lt!65528)))

(declare-fun lt!65525 () Unit!3064)

(assert (=> b!43318 (= lt!65525 lt!65530)))

(assert (=> b!43318 (= (head!329 (byteArrayBitContentToList!0 (_2!2206 lt!65498) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!329 (bitStreamReadBitsIntoList!0 (_2!2206 lt!65498) (_1!2207 lt!65534) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65519 () Unit!3064)

(declare-fun Unit!3080 () Unit!3064)

(assert (=> b!43318 (= lt!65519 Unit!3080)))

(assert (=> b!43318 (= lt!65492 (appendBitsMSBFirstLoop!0 (_2!2206 lt!65498) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!65507 () Unit!3064)

(assert (=> b!43318 (= lt!65507 (lemmaIsPrefixTransitive!0 (_2!2206 lt!64984) (_2!2206 lt!65498) (_2!2206 lt!65492)))))

(assert (=> b!43318 (isPrefixOf!0 (_2!2206 lt!64984) (_2!2206 lt!65492))))

(declare-fun lt!65529 () Unit!3064)

(assert (=> b!43318 (= lt!65529 lt!65507)))

(assert (=> b!43318 (= (size!997 (buf!1331 (_2!2206 lt!65492))) (size!997 (buf!1331 (_2!2206 lt!64984))))))

(declare-fun lt!65513 () Unit!3064)

(declare-fun Unit!3081 () Unit!3064)

(assert (=> b!43318 (= lt!65513 Unit!3081)))

(assert (=> b!43318 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65492))) (currentByte!2797 (_2!2206 lt!65492)) (currentBit!2792 (_2!2206 lt!65492))) (bvsub (bvadd (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65495 () Unit!3064)

(declare-fun Unit!3082 () Unit!3064)

(assert (=> b!43318 (= lt!65495 Unit!3082)))

(assert (=> b!43318 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65492))) (currentByte!2797 (_2!2206 lt!65492)) (currentBit!2792 (_2!2206 lt!65492))) (bvsub (bvsub (bvadd (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65498))) (currentByte!2797 (_2!2206 lt!65498)) (currentBit!2792 (_2!2206 lt!65498))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65533 () Unit!3064)

(declare-fun Unit!3083 () Unit!3064)

(assert (=> b!43318 (= lt!65533 Unit!3083)))

(declare-fun lt!65520 () tuple2!4228)

(declare-fun call!505 () tuple2!4228)

(assert (=> b!43318 (= lt!65520 call!505)))

(declare-fun lt!65517 () (_ BitVec 64))

(assert (=> b!43318 (= lt!65517 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65509 () Unit!3064)

(assert (=> b!43318 (= lt!65509 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2206 lt!64984) (buf!1331 (_2!2206 lt!65492)) lt!65517))))

(assert (=> b!43318 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!65492)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) lt!65517)))

(declare-fun lt!65511 () Unit!3064)

(assert (=> b!43318 (= lt!65511 lt!65509)))

(declare-fun lt!65526 () tuple2!4228)

(assert (=> b!43318 (= lt!65526 (reader!0 (_2!2206 lt!65498) (_2!2206 lt!65492)))))

(declare-fun lt!65535 () (_ BitVec 64))

(assert (=> b!43318 (= lt!65535 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65532 () Unit!3064)

(assert (=> b!43318 (= lt!65532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2206 lt!65498) (buf!1331 (_2!2206 lt!65492)) lt!65535))))

(assert (=> b!43318 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!65492)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!65498))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!65498))) lt!65535)))

(declare-fun lt!65500 () Unit!3064)

(assert (=> b!43318 (= lt!65500 lt!65532)))

(declare-fun lt!65515 () List!510)

(assert (=> b!43318 (= lt!65515 (byteArrayBitContentToList!0 (_2!2206 lt!65492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!65518 () List!510)

(assert (=> b!43318 (= lt!65518 (byteArrayBitContentToList!0 (_2!2206 lt!65492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65516 () List!510)

(assert (=> b!43318 (= lt!65516 (bitStreamReadBitsIntoList!0 (_2!2206 lt!65492) (_1!2207 lt!65520) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!65497 () List!510)

(assert (=> b!43318 (= lt!65497 (bitStreamReadBitsIntoList!0 (_2!2206 lt!65492) (_1!2207 lt!65526) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65504 () (_ BitVec 64))

(assert (=> b!43318 (= lt!65504 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65508 () Unit!3064)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1738 BitStream!1738 BitStream!1738 BitStream!1738 (_ BitVec 64) List!510) Unit!3064)

(assert (=> b!43318 (= lt!65508 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2206 lt!65492) (_2!2206 lt!65492) (_1!2207 lt!65520) (_1!2207 lt!65526) lt!65504 lt!65516))))

(declare-fun tail!206 (List!510) List!510)

(assert (=> b!43318 (= (bitStreamReadBitsIntoList!0 (_2!2206 lt!65492) (_1!2207 lt!65526) (bvsub lt!65504 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!206 lt!65516))))

(declare-fun lt!65523 () Unit!3064)

(assert (=> b!43318 (= lt!65523 lt!65508)))

(declare-fun lt!65531 () Unit!3064)

(declare-fun lt!65503 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2206 array!2206 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3064)

(assert (=> b!43318 (= lt!65531 (arrayBitRangesEqImpliesEq!0 (buf!1331 (_2!2206 lt!65498)) (buf!1331 (_2!2206 lt!65492)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!65503 (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65498))) (currentByte!2797 (_2!2206 lt!65498)) (currentBit!2792 (_2!2206 lt!65498)))))))

(declare-fun bitAt!0 (array!2206 (_ BitVec 64)) Bool)

(assert (=> b!43318 (= (bitAt!0 (buf!1331 (_2!2206 lt!65498)) lt!65503) (bitAt!0 (buf!1331 (_2!2206 lt!65492)) lt!65503))))

(declare-fun lt!65496 () Unit!3064)

(assert (=> b!43318 (= lt!65496 lt!65531)))

(declare-fun b!43319 () Bool)

(declare-fun lt!65510 () tuple2!4228)

(assert (=> b!43319 (= e!28932 (= (bitStreamReadBitsIntoList!0 (_2!2206 lt!65501) (_1!2207 lt!65510) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2206 lt!65501) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!43319 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43319 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!65522 () Unit!3064)

(declare-fun lt!65527 () Unit!3064)

(assert (=> b!43319 (= lt!65522 lt!65527)))

(assert (=> b!43319 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!65501)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) lt!65502)))

(assert (=> b!43319 (= lt!65527 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2206 lt!64984) (buf!1331 (_2!2206 lt!65501)) lt!65502))))

(assert (=> b!43319 e!28930))

(declare-fun res!36774 () Bool)

(assert (=> b!43319 (=> (not res!36774) (not e!28930))))

(assert (=> b!43319 (= res!36774 (and (= (size!997 (buf!1331 (_2!2206 lt!64984))) (size!997 (buf!1331 (_2!2206 lt!65501)))) (bvsge lt!65502 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43319 (= lt!65502 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!43319 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43319 (= lt!65510 (reader!0 (_2!2206 lt!64984) (_2!2206 lt!65501)))))

(declare-fun c!2853 () Bool)

(declare-fun bm!502 () Bool)

(assert (=> bm!502 (= call!505 (reader!0 (_2!2206 lt!64984) (ite c!2853 (_2!2206 lt!65492) (_2!2206 lt!64984))))))

(declare-fun d!12490 () Bool)

(assert (=> d!12490 e!28932))

(declare-fun res!36776 () Bool)

(assert (=> d!12490 (=> (not res!36776) (not e!28932))))

(declare-fun lt!65506 () (_ BitVec 64))

(assert (=> d!12490 (= res!36776 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65501))) (currentByte!2797 (_2!2206 lt!65501)) (currentBit!2792 (_2!2206 lt!65501))) (bvsub lt!65506 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12490 (or (= (bvand lt!65506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65506 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!65505 () (_ BitVec 64))

(assert (=> d!12490 (= lt!65506 (bvadd lt!65505 to!314))))

(assert (=> d!12490 (or (not (= (bvand lt!65505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!65505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!65505 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12490 (= lt!65505 (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984))))))

(assert (=> d!12490 (= lt!65501 e!28931)))

(assert (=> d!12490 (= c!2853 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!65521 () Unit!3064)

(declare-fun lt!65512 () Unit!3064)

(assert (=> d!12490 (= lt!65521 lt!65512)))

(assert (=> d!12490 (isPrefixOf!0 (_2!2206 lt!64984) (_2!2206 lt!64984))))

(assert (=> d!12490 (= lt!65512 (lemmaIsPrefixRefl!0 (_2!2206 lt!64984)))))

(assert (=> d!12490 (= lt!65503 (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984))))))

(assert (=> d!12490 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12490 (= (appendBitsMSBFirstLoop!0 (_2!2206 lt!64984) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!65501)))

(declare-fun b!43320 () Bool)

(declare-fun Unit!3084 () Unit!3064)

(assert (=> b!43320 (= e!28931 (tuple2!4227 Unit!3084 (_2!2206 lt!64984)))))

(assert (=> b!43320 (= (size!997 (buf!1331 (_2!2206 lt!64984))) (size!997 (buf!1331 (_2!2206 lt!64984))))))

(declare-fun lt!65514 () Unit!3064)

(declare-fun Unit!3085 () Unit!3064)

(assert (=> b!43320 (= lt!65514 Unit!3085)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1738 array!2206 array!2206 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4244 0))(
  ( (tuple2!4245 (_1!2215 array!2206) (_2!2215 BitStream!1738)) )
))
(declare-fun readBits!0 (BitStream!1738 (_ BitVec 64)) tuple2!4244)

(assert (=> b!43320 (checkByteArrayBitContent!0 (_2!2206 lt!64984) srcBuffer!2 (_1!2215 (readBits!0 (_1!2207 call!505) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!43321 () Bool)

(declare-fun res!36775 () Bool)

(assert (=> b!43321 (=> (not res!36775) (not e!28932))))

(assert (=> b!43321 (= res!36775 (isPrefixOf!0 (_2!2206 lt!64984) (_2!2206 lt!65501)))))

(assert (= (and d!12490 c!2853) b!43318))

(assert (= (and d!12490 (not c!2853)) b!43320))

(assert (= (or b!43318 b!43320) bm!502))

(assert (= (and d!12490 res!36776) b!43314))

(assert (= (and b!43314 res!36773) b!43317))

(assert (= (and b!43317 res!36771) b!43321))

(assert (= (and b!43321 res!36775) b!43316))

(assert (= (and b!43316 res!36772) b!43319))

(assert (= (and b!43319 res!36774) b!43315))

(declare-fun m!65851 () Bool)

(assert (=> b!43321 m!65851))

(declare-fun m!65853 () Bool)

(assert (=> bm!502 m!65853))

(declare-fun m!65855 () Bool)

(assert (=> b!43315 m!65855))

(declare-fun m!65859 () Bool)

(assert (=> b!43314 m!65859))

(declare-fun m!65861 () Bool)

(assert (=> b!43320 m!65861))

(declare-fun m!65863 () Bool)

(assert (=> b!43320 m!65863))

(declare-fun m!65865 () Bool)

(assert (=> d!12490 m!65865))

(assert (=> d!12490 m!65661))

(assert (=> d!12490 m!65643))

(assert (=> d!12490 m!65641))

(declare-fun m!65867 () Bool)

(assert (=> b!43319 m!65867))

(declare-fun m!65869 () Bool)

(assert (=> b!43319 m!65869))

(declare-fun m!65871 () Bool)

(assert (=> b!43319 m!65871))

(declare-fun m!65873 () Bool)

(assert (=> b!43319 m!65873))

(declare-fun m!65875 () Bool)

(assert (=> b!43319 m!65875))

(declare-fun m!65877 () Bool)

(assert (=> b!43318 m!65877))

(declare-fun m!65879 () Bool)

(assert (=> b!43318 m!65879))

(declare-fun m!65881 () Bool)

(assert (=> b!43318 m!65881))

(declare-fun m!65883 () Bool)

(assert (=> b!43318 m!65883))

(declare-fun m!65885 () Bool)

(assert (=> b!43318 m!65885))

(assert (=> b!43318 m!65661))

(declare-fun m!65887 () Bool)

(assert (=> b!43318 m!65887))

(assert (=> b!43318 m!65877))

(declare-fun m!65889 () Bool)

(assert (=> b!43318 m!65889))

(declare-fun m!65891 () Bool)

(assert (=> b!43318 m!65891))

(assert (=> b!43318 m!65887))

(declare-fun m!65893 () Bool)

(assert (=> b!43318 m!65893))

(declare-fun m!65895 () Bool)

(assert (=> b!43318 m!65895))

(declare-fun m!65897 () Bool)

(assert (=> b!43318 m!65897))

(declare-fun m!65899 () Bool)

(assert (=> b!43318 m!65899))

(declare-fun m!65901 () Bool)

(assert (=> b!43318 m!65901))

(declare-fun m!65903 () Bool)

(assert (=> b!43318 m!65903))

(declare-fun m!65905 () Bool)

(assert (=> b!43318 m!65905))

(declare-fun m!65907 () Bool)

(assert (=> b!43318 m!65907))

(declare-fun m!65909 () Bool)

(assert (=> b!43318 m!65909))

(declare-fun m!65911 () Bool)

(assert (=> b!43318 m!65911))

(declare-fun m!65913 () Bool)

(assert (=> b!43318 m!65913))

(declare-fun m!65915 () Bool)

(assert (=> b!43318 m!65915))

(declare-fun m!65917 () Bool)

(assert (=> b!43318 m!65917))

(assert (=> b!43318 m!65883))

(declare-fun m!65919 () Bool)

(assert (=> b!43318 m!65919))

(declare-fun m!65921 () Bool)

(assert (=> b!43318 m!65921))

(declare-fun m!65923 () Bool)

(assert (=> b!43318 m!65923))

(declare-fun m!65925 () Bool)

(assert (=> b!43318 m!65925))

(declare-fun m!65927 () Bool)

(assert (=> b!43318 m!65927))

(declare-fun m!65929 () Bool)

(assert (=> b!43318 m!65929))

(declare-fun m!65931 () Bool)

(assert (=> b!43318 m!65931))

(declare-fun m!65933 () Bool)

(assert (=> b!43318 m!65933))

(declare-fun m!65935 () Bool)

(assert (=> b!43318 m!65935))

(assert (=> b!43318 m!65921))

(declare-fun m!65937 () Bool)

(assert (=> b!43318 m!65937))

(assert (=> b!43076 d!12490))

(declare-fun d!12562 () Bool)

(assert (=> d!12562 (= (array_inv!922 srcBuffer!2) (bvsge (size!997 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8642 d!12562))

(declare-fun d!12564 () Bool)

(assert (=> d!12564 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2792 thiss!1379) (currentByte!2797 thiss!1379) (size!997 (buf!1331 thiss!1379))))))

(declare-fun bs!3378 () Bool)

(assert (= bs!3378 d!12564))

(declare-fun m!65939 () Bool)

(assert (=> bs!3378 m!65939))

(assert (=> start!8642 d!12564))

(declare-fun d!12566 () Bool)

(declare-fun res!36786 () Bool)

(declare-fun e!28939 () Bool)

(assert (=> d!12566 (=> (not res!36786) (not e!28939))))

(assert (=> d!12566 (= res!36786 (= (size!997 (buf!1331 thiss!1379)) (size!997 (buf!1331 (_2!2206 lt!64984)))))))

(assert (=> d!12566 (= (isPrefixOf!0 thiss!1379 (_2!2206 lt!64984)) e!28939)))

(declare-fun b!43329 () Bool)

(declare-fun res!36785 () Bool)

(assert (=> b!43329 (=> (not res!36785) (not e!28939))))

(assert (=> b!43329 (= res!36785 (bvsle (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)) (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64984))) (currentByte!2797 (_2!2206 lt!64984)) (currentBit!2792 (_2!2206 lt!64984)))))))

(declare-fun b!43330 () Bool)

(declare-fun e!28938 () Bool)

(assert (=> b!43330 (= e!28939 e!28938)))

(declare-fun res!36784 () Bool)

(assert (=> b!43330 (=> res!36784 e!28938)))

(assert (=> b!43330 (= res!36784 (= (size!997 (buf!1331 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43331 () Bool)

(assert (=> b!43331 (= e!28938 (arrayBitRangesEq!0 (buf!1331 thiss!1379) (buf!1331 (_2!2206 lt!64984)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379))))))

(assert (= (and d!12566 res!36786) b!43329))

(assert (= (and b!43329 res!36785) b!43330))

(assert (= (and b!43330 (not res!36784)) b!43331))

(assert (=> b!43329 m!65493))

(assert (=> b!43329 m!65661))

(assert (=> b!43331 m!65493))

(assert (=> b!43331 m!65493))

(declare-fun m!65941 () Bool)

(assert (=> b!43331 m!65941))

(assert (=> b!43077 d!12566))

(declare-fun d!12568 () Bool)

(assert (=> d!12568 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3379 () Bool)

(assert (= bs!3379 d!12568))

(declare-fun m!65945 () Bool)

(assert (=> bs!3379 m!65945))

(assert (=> b!43077 d!12568))

(declare-fun d!12572 () Bool)

(declare-fun e!28943 () Bool)

(assert (=> d!12572 e!28943))

(declare-fun res!36790 () Bool)

(assert (=> d!12572 (=> (not res!36790) (not e!28943))))

(assert (=> d!12572 (= res!36790 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!65548 () Unit!3064)

(declare-fun choose!27 (BitStream!1738 BitStream!1738 (_ BitVec 64) (_ BitVec 64)) Unit!3064)

(assert (=> d!12572 (= lt!65548 (choose!27 thiss!1379 (_2!2206 lt!64984) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12572 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12572 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2206 lt!64984) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65548)))

(declare-fun b!43335 () Bool)

(assert (=> b!43335 (= e!28943 (validate_offset_bits!1 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64984)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64984))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64984))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12572 res!36790) b!43335))

(declare-fun m!65947 () Bool)

(assert (=> d!12572 m!65947))

(assert (=> b!43335 m!65463))

(assert (=> b!43077 d!12572))

(declare-fun b!43378 () Bool)

(declare-fun e!28967 () Bool)

(declare-fun e!28965 () Bool)

(assert (=> b!43378 (= e!28967 e!28965)))

(declare-fun res!36837 () Bool)

(assert (=> b!43378 (=> (not res!36837) (not e!28965))))

(declare-datatypes ((tuple2!4248 0))(
  ( (tuple2!4249 (_1!2217 BitStream!1738) (_2!2217 Bool)) )
))
(declare-fun lt!65619 () tuple2!4248)

(declare-fun lt!65620 () Bool)

(declare-fun lt!65615 () tuple2!4226)

(assert (=> b!43378 (= res!36837 (and (= (_2!2217 lt!65619) lt!65620) (= (_1!2217 lt!65619) (_2!2206 lt!65615))))))

(declare-fun readBitPure!0 (BitStream!1738) tuple2!4248)

(declare-fun readerFrom!0 (BitStream!1738 (_ BitVec 32) (_ BitVec 32)) BitStream!1738)

(assert (=> b!43378 (= lt!65619 (readBitPure!0 (readerFrom!0 (_2!2206 lt!65615) (currentBit!2792 thiss!1379) (currentByte!2797 thiss!1379))))))

(declare-fun b!43379 () Bool)

(declare-fun res!36836 () Bool)

(assert (=> b!43379 (=> (not res!36836) (not e!28967))))

(assert (=> b!43379 (= res!36836 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65615))) (currentByte!2797 (_2!2206 lt!65615)) (currentBit!2792 (_2!2206 lt!65615))) (bvadd (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!43380 () Bool)

(assert (=> b!43380 (= e!28965 (= (bitIndex!0 (size!997 (buf!1331 (_1!2217 lt!65619))) (currentByte!2797 (_1!2217 lt!65619)) (currentBit!2792 (_1!2217 lt!65619))) (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65615))) (currentByte!2797 (_2!2206 lt!65615)) (currentBit!2792 (_2!2206 lt!65615)))))))

(declare-fun b!43382 () Bool)

(declare-fun e!28966 () Bool)

(declare-fun lt!65610 () tuple2!4248)

(declare-fun lt!65609 () tuple2!4226)

(assert (=> b!43382 (= e!28966 (= (bitIndex!0 (size!997 (buf!1331 (_1!2217 lt!65610))) (currentByte!2797 (_1!2217 lt!65610)) (currentBit!2792 (_1!2217 lt!65610))) (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65609))) (currentByte!2797 (_2!2206 lt!65609)) (currentBit!2792 (_2!2206 lt!65609)))))))

(declare-fun b!43383 () Bool)

(declare-fun res!36833 () Bool)

(declare-fun e!28964 () Bool)

(assert (=> b!43383 (=> (not res!36833) (not e!28964))))

(declare-fun lt!65611 () (_ BitVec 64))

(declare-fun lt!65614 () (_ BitVec 64))

(assert (=> b!43383 (= res!36833 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!65609))) (currentByte!2797 (_2!2206 lt!65609)) (currentBit!2792 (_2!2206 lt!65609))) (bvadd lt!65611 lt!65614)))))

(assert (=> b!43383 (or (not (= (bvand lt!65611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65614 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!65611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!65611 lt!65614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43383 (= lt!65614 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!43383 (= lt!65611 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)))))

(declare-fun b!43384 () Bool)

(declare-fun res!36838 () Bool)

(assert (=> b!43384 (=> (not res!36838) (not e!28964))))

(assert (=> b!43384 (= res!36838 (isPrefixOf!0 thiss!1379 (_2!2206 lt!65609)))))

(declare-fun b!43385 () Bool)

(assert (=> b!43385 (= e!28964 e!28966)))

(declare-fun res!36832 () Bool)

(assert (=> b!43385 (=> (not res!36832) (not e!28966))))

(declare-fun lt!65618 () (_ BitVec 8))

(assert (=> b!43385 (= res!36832 (and (= (_2!2217 lt!65610) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1499 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!65618)) #b00000000000000000000000000000000))) (= (_1!2217 lt!65610) (_2!2206 lt!65609))))))

(declare-fun lt!65612 () tuple2!4244)

(declare-fun lt!65616 () BitStream!1738)

(assert (=> b!43385 (= lt!65612 (readBits!0 lt!65616 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!43385 (= lt!65610 (readBitPure!0 lt!65616))))

(assert (=> b!43385 (= lt!65616 (readerFrom!0 (_2!2206 lt!65609) (currentBit!2792 thiss!1379) (currentByte!2797 thiss!1379)))))

(declare-fun b!43381 () Bool)

(declare-fun res!36831 () Bool)

(assert (=> b!43381 (=> (not res!36831) (not e!28967))))

(assert (=> b!43381 (= res!36831 (isPrefixOf!0 thiss!1379 (_2!2206 lt!65615)))))

(declare-fun d!12574 () Bool)

(assert (=> d!12574 e!28964))

(declare-fun res!36835 () Bool)

(assert (=> d!12574 (=> (not res!36835) (not e!28964))))

(assert (=> d!12574 (= res!36835 (= (size!997 (buf!1331 (_2!2206 lt!65609))) (size!997 (buf!1331 thiss!1379))))))

(declare-fun lt!65613 () array!2206)

(assert (=> d!12574 (= lt!65618 (select (arr!1499 lt!65613) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12574 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!997 lt!65613)))))

(assert (=> d!12574 (= lt!65613 (array!2207 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!65617 () tuple2!4226)

(assert (=> d!12574 (= lt!65609 (tuple2!4227 (_1!2206 lt!65617) (_2!2206 lt!65617)))))

(assert (=> d!12574 (= lt!65617 lt!65615)))

(assert (=> d!12574 e!28967))

(declare-fun res!36834 () Bool)

(assert (=> d!12574 (=> (not res!36834) (not e!28967))))

(assert (=> d!12574 (= res!36834 (= (size!997 (buf!1331 thiss!1379)) (size!997 (buf!1331 (_2!2206 lt!65615)))))))

(declare-fun appendBit!0 (BitStream!1738 Bool) tuple2!4226)

(assert (=> d!12574 (= lt!65615 (appendBit!0 thiss!1379 lt!65620))))

(assert (=> d!12574 (= lt!65620 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1499 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12574 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12574 (= (appendBitFromByte!0 thiss!1379 (select (arr!1499 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!65609)))

(assert (= (and d!12574 res!36834) b!43379))

(assert (= (and b!43379 res!36836) b!43381))

(assert (= (and b!43381 res!36831) b!43378))

(assert (= (and b!43378 res!36837) b!43380))

(assert (= (and d!12574 res!36835) b!43383))

(assert (= (and b!43383 res!36833) b!43384))

(assert (= (and b!43384 res!36838) b!43385))

(assert (= (and b!43385 res!36832) b!43382))

(declare-fun m!65975 () Bool)

(assert (=> b!43382 m!65975))

(declare-fun m!65977 () Bool)

(assert (=> b!43382 m!65977))

(declare-fun m!65979 () Bool)

(assert (=> d!12574 m!65979))

(declare-fun m!65981 () Bool)

(assert (=> d!12574 m!65981))

(declare-fun m!65983 () Bool)

(assert (=> d!12574 m!65983))

(declare-fun m!65985 () Bool)

(assert (=> b!43385 m!65985))

(declare-fun m!65987 () Bool)

(assert (=> b!43385 m!65987))

(declare-fun m!65989 () Bool)

(assert (=> b!43385 m!65989))

(assert (=> b!43383 m!65977))

(assert (=> b!43383 m!65493))

(declare-fun m!65991 () Bool)

(assert (=> b!43384 m!65991))

(declare-fun m!65993 () Bool)

(assert (=> b!43379 m!65993))

(assert (=> b!43379 m!65493))

(declare-fun m!65995 () Bool)

(assert (=> b!43380 m!65995))

(assert (=> b!43380 m!65993))

(declare-fun m!65997 () Bool)

(assert (=> b!43381 m!65997))

(declare-fun m!65999 () Bool)

(assert (=> b!43378 m!65999))

(assert (=> b!43378 m!65999))

(declare-fun m!66001 () Bool)

(assert (=> b!43378 m!66001))

(assert (=> b!43077 d!12574))

(declare-fun d!12576 () Bool)

(assert (=> d!12576 (= (head!329 (byteArrayBitContentToList!0 (_2!2206 lt!64984) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!625 (byteArrayBitContentToList!0 (_2!2206 lt!64984) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43072 d!12576))

(declare-fun d!12578 () Bool)

(declare-fun c!2856 () Bool)

(assert (=> d!12578 (= c!2856 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28970 () List!510)

(assert (=> d!12578 (= (byteArrayBitContentToList!0 (_2!2206 lt!64984) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!28970)))

(declare-fun b!43390 () Bool)

(assert (=> b!43390 (= e!28970 Nil!507)))

(declare-fun b!43391 () Bool)

(assert (=> b!43391 (= e!28970 (Cons!506 (not (= (bvand ((_ sign_extend 24) (select (arr!1499 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2206 lt!64984) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12578 c!2856) b!43390))

(assert (= (and d!12578 (not c!2856)) b!43391))

(assert (=> b!43391 m!65465))

(assert (=> b!43391 m!65983))

(declare-fun m!66003 () Bool)

(assert (=> b!43391 m!66003))

(assert (=> b!43072 d!12578))

(declare-fun d!12580 () Bool)

(assert (=> d!12580 (= (head!329 (bitStreamReadBitsIntoList!0 (_2!2206 lt!64984) (_1!2207 lt!64985) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!625 (bitStreamReadBitsIntoList!0 (_2!2206 lt!64984) (_1!2207 lt!64985) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43072 d!12580))

(declare-datatypes ((tuple2!4250 0))(
  ( (tuple2!4251 (_1!2218 List!510) (_2!2218 BitStream!1738)) )
))
(declare-fun e!28976 () tuple2!4250)

(declare-fun b!43401 () Bool)

(declare-fun lt!65627 () (_ BitVec 64))

(declare-datatypes ((tuple2!4252 0))(
  ( (tuple2!4253 (_1!2219 Bool) (_2!2219 BitStream!1738)) )
))
(declare-fun lt!65629 () tuple2!4252)

(assert (=> b!43401 (= e!28976 (tuple2!4251 (Cons!506 (_1!2219 lt!65629) (bitStreamReadBitsIntoList!0 (_2!2206 lt!64984) (_2!2219 lt!65629) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!65627))) (_2!2219 lt!65629)))))

(declare-fun readBit!0 (BitStream!1738) tuple2!4252)

(assert (=> b!43401 (= lt!65629 (readBit!0 (_1!2207 lt!64985)))))

(assert (=> b!43401 (= lt!65627 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!43402 () Bool)

(declare-fun e!28975 () Bool)

(declare-fun lt!65628 () List!510)

(declare-fun isEmpty!117 (List!510) Bool)

(assert (=> b!43402 (= e!28975 (isEmpty!117 lt!65628))))

(declare-fun b!43400 () Bool)

(assert (=> b!43400 (= e!28976 (tuple2!4251 Nil!507 (_1!2207 lt!64985)))))

(declare-fun d!12582 () Bool)

(assert (=> d!12582 e!28975))

(declare-fun c!2861 () Bool)

(assert (=> d!12582 (= c!2861 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12582 (= lt!65628 (_1!2218 e!28976))))

(declare-fun c!2862 () Bool)

(assert (=> d!12582 (= c!2862 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12582 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12582 (= (bitStreamReadBitsIntoList!0 (_2!2206 lt!64984) (_1!2207 lt!64985) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65628)))

(declare-fun b!43403 () Bool)

(declare-fun length!215 (List!510) Int)

(assert (=> b!43403 (= e!28975 (> (length!215 lt!65628) 0))))

(assert (= (and d!12582 c!2862) b!43400))

(assert (= (and d!12582 (not c!2862)) b!43401))

(assert (= (and d!12582 c!2861) b!43402))

(assert (= (and d!12582 (not c!2861)) b!43403))

(declare-fun m!66005 () Bool)

(assert (=> b!43401 m!66005))

(declare-fun m!66007 () Bool)

(assert (=> b!43401 m!66007))

(declare-fun m!66009 () Bool)

(assert (=> b!43402 m!66009))

(declare-fun m!66011 () Bool)

(assert (=> b!43403 m!66011))

(assert (=> b!43072 d!12582))

(declare-fun d!12584 () Bool)

(declare-fun e!28979 () Bool)

(assert (=> d!12584 e!28979))

(declare-fun res!36843 () Bool)

(assert (=> d!12584 (=> (not res!36843) (not e!28979))))

(declare-fun lt!65644 () (_ BitVec 64))

(declare-fun lt!65645 () (_ BitVec 64))

(declare-fun lt!65643 () (_ BitVec 64))

(assert (=> d!12584 (= res!36843 (= lt!65645 (bvsub lt!65643 lt!65644)))))

(assert (=> d!12584 (or (= (bvand lt!65643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65643 lt!65644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12584 (= lt!65644 (remainingBits!0 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64986)))) ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64986))) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64986)))))))

(declare-fun lt!65646 () (_ BitVec 64))

(declare-fun lt!65647 () (_ BitVec 64))

(assert (=> d!12584 (= lt!65643 (bvmul lt!65646 lt!65647))))

(assert (=> d!12584 (or (= lt!65646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65647 (bvsdiv (bvmul lt!65646 lt!65647) lt!65646)))))

(assert (=> d!12584 (= lt!65647 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12584 (= lt!65646 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64986)))))))

(assert (=> d!12584 (= lt!65645 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2797 (_2!2206 lt!64986))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2792 (_2!2206 lt!64986)))))))

(assert (=> d!12584 (invariant!0 (currentBit!2792 (_2!2206 lt!64986)) (currentByte!2797 (_2!2206 lt!64986)) (size!997 (buf!1331 (_2!2206 lt!64986))))))

(assert (=> d!12584 (= (bitIndex!0 (size!997 (buf!1331 (_2!2206 lt!64986))) (currentByte!2797 (_2!2206 lt!64986)) (currentBit!2792 (_2!2206 lt!64986))) lt!65645)))

(declare-fun b!43408 () Bool)

(declare-fun res!36844 () Bool)

(assert (=> b!43408 (=> (not res!36844) (not e!28979))))

(assert (=> b!43408 (= res!36844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65645))))

(declare-fun b!43409 () Bool)

(declare-fun lt!65642 () (_ BitVec 64))

(assert (=> b!43409 (= e!28979 (bvsle lt!65645 (bvmul lt!65642 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43409 (or (= lt!65642 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65642 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65642)))))

(assert (=> b!43409 (= lt!65642 ((_ sign_extend 32) (size!997 (buf!1331 (_2!2206 lt!64986)))))))

(assert (= (and d!12584 res!36843) b!43408))

(assert (= (and b!43408 res!36844) b!43409))

(declare-fun m!66013 () Bool)

(assert (=> d!12584 m!66013))

(declare-fun m!66015 () Bool)

(assert (=> d!12584 m!66015))

(assert (=> b!43078 d!12584))

(declare-fun d!12586 () Bool)

(declare-fun res!36847 () Bool)

(declare-fun e!28981 () Bool)

(assert (=> d!12586 (=> (not res!36847) (not e!28981))))

(assert (=> d!12586 (= res!36847 (= (size!997 (buf!1331 thiss!1379)) (size!997 (buf!1331 thiss!1379))))))

(assert (=> d!12586 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28981)))

(declare-fun b!43410 () Bool)

(declare-fun res!36846 () Bool)

(assert (=> b!43410 (=> (not res!36846) (not e!28981))))

(assert (=> b!43410 (= res!36846 (bvsle (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)) (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379))))))

(declare-fun b!43411 () Bool)

(declare-fun e!28980 () Bool)

(assert (=> b!43411 (= e!28981 e!28980)))

(declare-fun res!36845 () Bool)

(assert (=> b!43411 (=> res!36845 e!28980)))

(assert (=> b!43411 (= res!36845 (= (size!997 (buf!1331 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43412 () Bool)

(assert (=> b!43412 (= e!28980 (arrayBitRangesEq!0 (buf!1331 thiss!1379) (buf!1331 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379))))))

(assert (= (and d!12586 res!36847) b!43410))

(assert (= (and b!43410 res!36846) b!43411))

(assert (= (and b!43411 (not res!36845)) b!43412))

(assert (=> b!43410 m!65493))

(assert (=> b!43410 m!65493))

(assert (=> b!43412 m!65493))

(assert (=> b!43412 m!65493))

(declare-fun m!66017 () Bool)

(assert (=> b!43412 m!66017))

(assert (=> b!43073 d!12586))

(declare-fun d!12588 () Bool)

(assert (=> d!12588 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65650 () Unit!3064)

(declare-fun choose!11 (BitStream!1738) Unit!3064)

(assert (=> d!12588 (= lt!65650 (choose!11 thiss!1379))))

(assert (=> d!12588 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!65650)))

(declare-fun bs!3381 () Bool)

(assert (= bs!3381 d!12588))

(assert (=> bs!3381 m!65489))

(declare-fun m!66019 () Bool)

(assert (=> bs!3381 m!66019))

(assert (=> b!43073 d!12588))

(declare-fun d!12590 () Bool)

(declare-fun e!28982 () Bool)

(assert (=> d!12590 e!28982))

(declare-fun res!36848 () Bool)

(assert (=> d!12590 (=> (not res!36848) (not e!28982))))

(declare-fun lt!65653 () (_ BitVec 64))

(declare-fun lt!65652 () (_ BitVec 64))

(declare-fun lt!65654 () (_ BitVec 64))

(assert (=> d!12590 (= res!36848 (= lt!65654 (bvsub lt!65652 lt!65653)))))

(assert (=> d!12590 (or (= (bvand lt!65652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65652 lt!65653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12590 (= lt!65653 (remainingBits!0 ((_ sign_extend 32) (size!997 (buf!1331 thiss!1379))) ((_ sign_extend 32) (currentByte!2797 thiss!1379)) ((_ sign_extend 32) (currentBit!2792 thiss!1379))))))

(declare-fun lt!65655 () (_ BitVec 64))

(declare-fun lt!65656 () (_ BitVec 64))

(assert (=> d!12590 (= lt!65652 (bvmul lt!65655 lt!65656))))

(assert (=> d!12590 (or (= lt!65655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65656 (bvsdiv (bvmul lt!65655 lt!65656) lt!65655)))))

(assert (=> d!12590 (= lt!65656 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12590 (= lt!65655 ((_ sign_extend 32) (size!997 (buf!1331 thiss!1379))))))

(assert (=> d!12590 (= lt!65654 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2797 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2792 thiss!1379))))))

(assert (=> d!12590 (invariant!0 (currentBit!2792 thiss!1379) (currentByte!2797 thiss!1379) (size!997 (buf!1331 thiss!1379)))))

(assert (=> d!12590 (= (bitIndex!0 (size!997 (buf!1331 thiss!1379)) (currentByte!2797 thiss!1379) (currentBit!2792 thiss!1379)) lt!65654)))

(declare-fun b!43413 () Bool)

(declare-fun res!36849 () Bool)

(assert (=> b!43413 (=> (not res!36849) (not e!28982))))

(assert (=> b!43413 (= res!36849 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65654))))

(declare-fun b!43414 () Bool)

(declare-fun lt!65651 () (_ BitVec 64))

(assert (=> b!43414 (= e!28982 (bvsle lt!65654 (bvmul lt!65651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43414 (or (= lt!65651 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65651 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65651)))))

(assert (=> b!43414 (= lt!65651 ((_ sign_extend 32) (size!997 (buf!1331 thiss!1379))))))

(assert (= (and d!12590 res!36848) b!43413))

(assert (= (and b!43413 res!36849) b!43414))

(assert (=> d!12590 m!65607))

(assert (=> d!12590 m!65939))

(assert (=> b!43073 d!12590))

(declare-fun d!12592 () Bool)

(assert (=> d!12592 (= (array_inv!922 (buf!1331 thiss!1379)) (bvsge (size!997 (buf!1331 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43074 d!12592))

(push 1)

(assert (not b!43320))

(assert (not b!43412))

(assert (not b!43146))

(assert (not b!43318))

(assert (not d!12476))

(assert (not b!43402))

(assert (not b!43157))

(assert (not b!43314))

(assert (not b!43391))

(assert (not b!43383))

(assert (not d!12482))

(assert (not b!43403))

(assert (not d!12590))

(assert (not b!43162))

(assert (not b!43382))

(assert (not d!12488))

(assert (not d!12588))

(assert (not bm!502))

(assert (not b!43159))

(assert (not d!12574))

(assert (not b!43381))

(assert (not d!12572))

(assert (not d!12486))

(assert (not b!43147))

(assert (not b!43384))

(assert (not b!43160))

(assert (not d!12584))

(assert (not d!12490))

(assert (not b!43331))

(assert (not b!43385))

(assert (not b!43321))

(assert (not b!43315))

(assert (not d!12568))

(assert (not b!43150))

(assert (not d!12564))

(assert (not b!43335))

(assert (not d!12474))

(assert (not b!43149))

(assert (not b!43380))

(assert (not b!43378))

(assert (not b!43401))

(assert (not b!43410))

(assert (not b!43329))

(assert (not b!43319))

(assert (not b!43379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

