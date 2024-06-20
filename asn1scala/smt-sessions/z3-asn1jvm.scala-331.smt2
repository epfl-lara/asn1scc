; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7624 () Bool)

(assert start!7624)

(declare-fun b!37177 () Bool)

(declare-fun res!31632 () Bool)

(declare-fun e!24485 () Bool)

(assert (=> b!37177 (=> res!31632 e!24485)))

(declare-datatypes ((List!448 0))(
  ( (Nil!445) (Cons!444 (h!563 Bool) (t!1198 List!448)) )
))
(declare-fun lt!56123 () List!448)

(declare-fun lt!56136 () Bool)

(declare-fun head!285 (List!448) Bool)

(assert (=> b!37177 (= res!31632 (not (= (head!285 lt!56123) lt!56136)))))

(declare-fun b!37178 () Bool)

(declare-fun e!24481 () Bool)

(declare-fun e!24479 () Bool)

(assert (=> b!37178 (= e!24481 e!24479)))

(declare-fun res!31638 () Bool)

(assert (=> b!37178 (=> res!31638 e!24479)))

(declare-datatypes ((array!1933 0))(
  ( (array!1934 (arr!1356 (Array (_ BitVec 32) (_ BitVec 8))) (size!866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1494 0))(
  ( (BitStream!1495 (buf!1194 array!1933) (currentByte!2594 (_ BitVec 32)) (currentBit!2589 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1494)

(declare-datatypes ((Unit!2707 0))(
  ( (Unit!2708) )
))
(declare-datatypes ((tuple2!3640 0))(
  ( (tuple2!3641 (_1!1907 Unit!2707) (_2!1907 BitStream!1494)) )
))
(declare-fun lt!56143 () tuple2!3640)

(declare-fun isPrefixOf!0 (BitStream!1494 BitStream!1494) Bool)

(assert (=> b!37178 (= res!31638 (not (isPrefixOf!0 thiss!1379 (_2!1907 lt!56143))))))

(declare-fun lt!56122 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37178 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56122)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!37178 (= lt!56122 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56127 () Unit!2707)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1494 BitStream!1494 (_ BitVec 64) (_ BitVec 64)) Unit!2707)

(assert (=> b!37178 (= lt!56127 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1907 lt!56143) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1933)

(declare-fun appendBitFromByte!0 (BitStream!1494 (_ BitVec 8) (_ BitVec 32)) tuple2!3640)

(assert (=> b!37178 (= lt!56143 (appendBitFromByte!0 thiss!1379 (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!37179 () Bool)

(declare-fun res!31635 () Bool)

(declare-fun e!24487 () Bool)

(assert (=> b!37179 (=> res!31635 e!24487)))

(declare-fun lt!56121 () tuple2!3640)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!37179 (= res!31635 (not (invariant!0 (currentBit!2589 (_2!1907 lt!56121)) (currentByte!2594 (_2!1907 lt!56121)) (size!866 (buf!1194 (_2!1907 lt!56121))))))))

(declare-fun b!37180 () Bool)

(declare-fun e!24477 () Bool)

(assert (=> b!37180 (= e!24477 (not e!24481))))

(declare-fun res!31622 () Bool)

(assert (=> b!37180 (=> res!31622 e!24481)))

(assert (=> b!37180 (= res!31622 (bvsge i!635 to!314))))

(assert (=> b!37180 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!56125 () Unit!2707)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1494) Unit!2707)

(assert (=> b!37180 (= lt!56125 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!56134 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!37180 (= lt!56134 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(declare-fun b!37181 () Bool)

(declare-fun e!24484 () Bool)

(assert (=> b!37181 (= e!24484 e!24487)))

(declare-fun res!31625 () Bool)

(assert (=> b!37181 (=> res!31625 e!24487)))

(declare-fun lt!56140 () (_ BitVec 64))

(assert (=> b!37181 (= res!31625 (not (= lt!56140 (bvsub (bvadd lt!56134 to!314) i!635))))))

(assert (=> b!37181 (= lt!56140 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56121))) (currentByte!2594 (_2!1907 lt!56121)) (currentBit!2589 (_2!1907 lt!56121))))))

(declare-fun b!37182 () Bool)

(declare-fun e!24483 () Bool)

(declare-fun e!24489 () Bool)

(assert (=> b!37182 (= e!24483 e!24489)))

(declare-fun res!31641 () Bool)

(assert (=> b!37182 (=> res!31641 e!24489)))

(assert (=> b!37182 (= res!31641 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3642 0))(
  ( (tuple2!3643 (_1!1908 BitStream!1494) (_2!1908 BitStream!1494)) )
))
(declare-fun lt!56124 () tuple2!3642)

(declare-fun lt!56142 () List!448)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1494 BitStream!1494 (_ BitVec 64)) List!448)

(assert (=> b!37182 (= lt!56142 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_1!1908 lt!56124) lt!56122))))

(declare-fun lt!56120 () tuple2!3642)

(assert (=> b!37182 (= lt!56123 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_1!1908 lt!56120) (bvsub to!314 i!635)))))

(declare-fun lt!56128 () List!448)

(declare-fun byteArrayBitContentToList!0 (BitStream!1494 array!1933 (_ BitVec 64) (_ BitVec 64)) List!448)

(assert (=> b!37182 (= lt!56128 (byteArrayBitContentToList!0 (_2!1907 lt!56121) srcBuffer!2 i!635 (bvsub to!314 i!635)))))

(assert (=> b!37182 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56122)))

(declare-fun lt!56138 () Unit!2707)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1494 array!1933 (_ BitVec 64)) Unit!2707)

(assert (=> b!37182 (= lt!56138 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1907 lt!56143) (buf!1194 (_2!1907 lt!56121)) lt!56122))))

(declare-fun reader!0 (BitStream!1494 BitStream!1494) tuple2!3642)

(assert (=> b!37182 (= lt!56124 (reader!0 (_2!1907 lt!56143) (_2!1907 lt!56121)))))

(assert (=> b!37182 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!56135 () Unit!2707)

(assert (=> b!37182 (= lt!56135 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1194 (_2!1907 lt!56121)) (bvsub to!314 i!635)))))

(assert (=> b!37182 (= lt!56120 (reader!0 thiss!1379 (_2!1907 lt!56121)))))

(declare-fun b!37183 () Bool)

(declare-fun res!31640 () Bool)

(assert (=> b!37183 (=> res!31640 e!24487)))

(assert (=> b!37183 (= res!31640 (not (= (size!866 (buf!1194 thiss!1379)) (size!866 (buf!1194 (_2!1907 lt!56121))))))))

(declare-fun b!37184 () Bool)

(assert (=> b!37184 (= e!24479 e!24484)))

(declare-fun res!31624 () Bool)

(assert (=> b!37184 (=> res!31624 e!24484)))

(assert (=> b!37184 (= res!31624 (not (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56121))))))

(assert (=> b!37184 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56121))))

(declare-fun lt!56119 () Unit!2707)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1494 BitStream!1494 BitStream!1494) Unit!2707)

(assert (=> b!37184 (= lt!56119 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1907 lt!56143) (_2!1907 lt!56121)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1494 array!1933 (_ BitVec 64) (_ BitVec 64)) tuple2!3640)

(assert (=> b!37184 (= lt!56121 (appendBitsMSBFirstLoop!0 (_2!1907 lt!56143) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24486 () Bool)

(assert (=> b!37184 e!24486))

(declare-fun res!31623 () Bool)

(assert (=> b!37184 (=> (not res!31623) (not e!24486))))

(assert (=> b!37184 (= res!31623 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56130 () Unit!2707)

(assert (=> b!37184 (= lt!56130 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1194 (_2!1907 lt!56143)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56126 () tuple2!3642)

(assert (=> b!37184 (= lt!56126 (reader!0 thiss!1379 (_2!1907 lt!56143)))))

(declare-fun b!37185 () Bool)

(declare-fun res!31631 () Bool)

(assert (=> b!37185 (=> res!31631 e!24489)))

(declare-fun length!174 (List!448) Int)

(assert (=> b!37185 (= res!31631 (<= (length!174 lt!56123) 0))))

(declare-fun b!37186 () Bool)

(declare-fun res!31633 () Bool)

(assert (=> b!37186 (=> res!31633 e!24483)))

(assert (=> b!37186 (= res!31633 (not (invariant!0 (currentBit!2589 (_2!1907 lt!56143)) (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56121))))))))

(declare-fun b!37187 () Bool)

(declare-fun res!31634 () Bool)

(declare-fun e!24475 () Bool)

(assert (=> b!37187 (=> res!31634 e!24475)))

(declare-fun lt!56141 () Bool)

(declare-datatypes ((tuple2!3644 0))(
  ( (tuple2!3645 (_1!1909 BitStream!1494) (_2!1909 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1494) tuple2!3644)

(assert (=> b!37187 (= res!31634 (not (= (_2!1909 (readBitPure!0 (_1!1908 lt!56120))) lt!56141)))))

(declare-fun b!37188 () Bool)

(assert (=> b!37188 (= e!24475 (not (= lt!56128 Nil!445)))))

(declare-fun b!37189 () Bool)

(declare-fun e!24490 () Bool)

(assert (=> b!37189 (= e!24489 e!24490)))

(declare-fun res!31636 () Bool)

(assert (=> b!37189 (=> res!31636 e!24490)))

(declare-fun lt!56131 () List!448)

(assert (=> b!37189 (= res!31636 (not (= lt!56131 lt!56142)))))

(assert (=> b!37189 (= lt!56142 lt!56131)))

(declare-fun tail!165 (List!448) List!448)

(assert (=> b!37189 (= lt!56131 (tail!165 lt!56123))))

(declare-fun lt!56133 () Unit!2707)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1494 BitStream!1494 BitStream!1494 BitStream!1494 (_ BitVec 64) List!448) Unit!2707)

(assert (=> b!37189 (= lt!56133 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1907 lt!56121) (_2!1907 lt!56121) (_1!1908 lt!56120) (_1!1908 lt!56124) (bvsub to!314 i!635) lt!56123))))

(declare-fun b!37190 () Bool)

(declare-fun e!24478 () Bool)

(assert (=> b!37190 (= e!24485 e!24478)))

(declare-fun res!31621 () Bool)

(assert (=> b!37190 (=> res!31621 e!24478)))

(assert (=> b!37190 (= res!31621 (not (= (head!285 lt!56128) lt!56141)))))

(declare-fun bitAt!0 (array!1933 (_ BitVec 64)) Bool)

(assert (=> b!37190 (= lt!56141 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!37191 () Bool)

(assert (=> b!37191 (= e!24486 (= (head!285 (byteArrayBitContentToList!0 (_2!1907 lt!56143) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!285 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56143) (_1!1908 lt!56126) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!37192 () Bool)

(declare-fun res!31639 () Bool)

(assert (=> b!37192 (=> res!31639 e!24483)))

(assert (=> b!37192 (= res!31639 (not (invariant!0 (currentBit!2589 (_2!1907 lt!56143)) (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56143))))))))

(declare-fun res!31626 () Bool)

(assert (=> start!7624 (=> (not res!31626) (not e!24477))))

(assert (=> start!7624 (= res!31626 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!866 srcBuffer!2))))))))

(assert (=> start!7624 e!24477))

(assert (=> start!7624 true))

(declare-fun array_inv!800 (array!1933) Bool)

(assert (=> start!7624 (array_inv!800 srcBuffer!2)))

(declare-fun e!24488 () Bool)

(declare-fun inv!12 (BitStream!1494) Bool)

(assert (=> start!7624 (and (inv!12 thiss!1379) e!24488)))

(declare-fun b!37193 () Bool)

(assert (=> b!37193 (= e!24487 e!24483)))

(declare-fun res!31628 () Bool)

(assert (=> b!37193 (=> res!31628 e!24483)))

(assert (=> b!37193 (= res!31628 (not (= (size!866 (buf!1194 (_2!1907 lt!56143))) (size!866 (buf!1194 (_2!1907 lt!56121))))))))

(declare-fun lt!56137 () (_ BitVec 64))

(assert (=> b!37193 (= lt!56140 (bvsub (bvsub (bvadd lt!56137 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37193 (= lt!56137 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(assert (=> b!37193 (= (size!866 (buf!1194 (_2!1907 lt!56121))) (size!866 (buf!1194 thiss!1379)))))

(declare-fun b!37194 () Bool)

(declare-fun res!31630 () Bool)

(assert (=> b!37194 (=> (not res!31630) (not e!24477))))

(assert (=> b!37194 (= res!31630 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 thiss!1379))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!37195 () Bool)

(assert (=> b!37195 (= e!24488 (array_inv!800 (buf!1194 thiss!1379)))))

(declare-fun b!37196 () Bool)

(declare-fun e!24480 () Bool)

(assert (=> b!37196 (= e!24478 e!24480)))

(declare-fun res!31629 () Bool)

(assert (=> b!37196 (=> res!31629 e!24480)))

(declare-fun lt!56132 () Bool)

(assert (=> b!37196 (= res!31629 (not (= lt!56132 lt!56141)))))

(assert (=> b!37196 (= lt!56132 (bitAt!0 (buf!1194 (_2!1907 lt!56143)) lt!56134))))

(declare-fun b!37197 () Bool)

(assert (=> b!37197 (= e!24490 e!24485)))

(declare-fun res!31637 () Bool)

(assert (=> b!37197 (=> res!31637 e!24485)))

(assert (=> b!37197 (= res!31637 (not (= lt!56136 (bitAt!0 (buf!1194 (_1!1908 lt!56124)) lt!56134))))))

(assert (=> b!37197 (= lt!56136 (bitAt!0 (buf!1194 (_1!1908 lt!56120)) lt!56134))))

(declare-fun b!37198 () Bool)

(assert (=> b!37198 (= e!24480 e!24475)))

(declare-fun res!31627 () Bool)

(assert (=> b!37198 (=> res!31627 e!24475)))

(declare-fun lt!56139 () Bool)

(assert (=> b!37198 (= res!31627 (not (= lt!56139 lt!56141)))))

(assert (=> b!37198 (= lt!56132 lt!56139)))

(assert (=> b!37198 (= lt!56139 (bitAt!0 (buf!1194 (_2!1907 lt!56121)) lt!56134))))

(declare-fun lt!56129 () Unit!2707)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1933 array!1933 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2707)

(assert (=> b!37198 (= lt!56129 (arrayBitRangesEqImpliesEq!0 (buf!1194 (_2!1907 lt!56143)) (buf!1194 (_2!1907 lt!56121)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56134 lt!56137))))

(assert (= (and start!7624 res!31626) b!37194))

(assert (= (and b!37194 res!31630) b!37180))

(assert (= (and b!37180 (not res!31622)) b!37178))

(assert (= (and b!37178 (not res!31638)) b!37184))

(assert (= (and b!37184 res!31623) b!37191))

(assert (= (and b!37184 (not res!31624)) b!37181))

(assert (= (and b!37181 (not res!31625)) b!37179))

(assert (= (and b!37179 (not res!31635)) b!37183))

(assert (= (and b!37183 (not res!31640)) b!37193))

(assert (= (and b!37193 (not res!31628)) b!37192))

(assert (= (and b!37192 (not res!31639)) b!37186))

(assert (= (and b!37186 (not res!31633)) b!37182))

(assert (= (and b!37182 (not res!31641)) b!37185))

(assert (= (and b!37185 (not res!31631)) b!37189))

(assert (= (and b!37189 (not res!31636)) b!37197))

(assert (= (and b!37197 (not res!31637)) b!37177))

(assert (= (and b!37177 (not res!31632)) b!37190))

(assert (= (and b!37190 (not res!31621)) b!37196))

(assert (= (and b!37196 (not res!31629)) b!37198))

(assert (= (and b!37198 (not res!31627)) b!37187))

(assert (= (and b!37187 (not res!31634)) b!37188))

(assert (= start!7624 b!37195))

(declare-fun m!56291 () Bool)

(assert (=> b!37195 m!56291))

(declare-fun m!56293 () Bool)

(assert (=> b!37184 m!56293))

(declare-fun m!56295 () Bool)

(assert (=> b!37184 m!56295))

(declare-fun m!56297 () Bool)

(assert (=> b!37184 m!56297))

(declare-fun m!56299 () Bool)

(assert (=> b!37184 m!56299))

(declare-fun m!56301 () Bool)

(assert (=> b!37184 m!56301))

(declare-fun m!56303 () Bool)

(assert (=> b!37184 m!56303))

(declare-fun m!56305 () Bool)

(assert (=> b!37184 m!56305))

(declare-fun m!56307 () Bool)

(assert (=> b!37182 m!56307))

(declare-fun m!56309 () Bool)

(assert (=> b!37182 m!56309))

(declare-fun m!56311 () Bool)

(assert (=> b!37182 m!56311))

(declare-fun m!56313 () Bool)

(assert (=> b!37182 m!56313))

(declare-fun m!56315 () Bool)

(assert (=> b!37182 m!56315))

(declare-fun m!56317 () Bool)

(assert (=> b!37182 m!56317))

(declare-fun m!56319 () Bool)

(assert (=> b!37182 m!56319))

(declare-fun m!56321 () Bool)

(assert (=> b!37182 m!56321))

(declare-fun m!56323 () Bool)

(assert (=> b!37182 m!56323))

(declare-fun m!56325 () Bool)

(assert (=> b!37197 m!56325))

(declare-fun m!56327 () Bool)

(assert (=> b!37197 m!56327))

(declare-fun m!56329 () Bool)

(assert (=> b!37178 m!56329))

(declare-fun m!56331 () Bool)

(assert (=> b!37178 m!56331))

(assert (=> b!37178 m!56329))

(declare-fun m!56333 () Bool)

(assert (=> b!37178 m!56333))

(declare-fun m!56335 () Bool)

(assert (=> b!37178 m!56335))

(declare-fun m!56337 () Bool)

(assert (=> b!37178 m!56337))

(declare-fun m!56339 () Bool)

(assert (=> b!37196 m!56339))

(declare-fun m!56341 () Bool)

(assert (=> b!37193 m!56341))

(declare-fun m!56343 () Bool)

(assert (=> b!37179 m!56343))

(declare-fun m!56345 () Bool)

(assert (=> b!37194 m!56345))

(declare-fun m!56347 () Bool)

(assert (=> b!37181 m!56347))

(declare-fun m!56349 () Bool)

(assert (=> b!37190 m!56349))

(declare-fun m!56351 () Bool)

(assert (=> b!37190 m!56351))

(declare-fun m!56353 () Bool)

(assert (=> b!37180 m!56353))

(declare-fun m!56355 () Bool)

(assert (=> b!37180 m!56355))

(declare-fun m!56357 () Bool)

(assert (=> b!37180 m!56357))

(declare-fun m!56359 () Bool)

(assert (=> b!37187 m!56359))

(declare-fun m!56361 () Bool)

(assert (=> start!7624 m!56361))

(declare-fun m!56363 () Bool)

(assert (=> start!7624 m!56363))

(declare-fun m!56365 () Bool)

(assert (=> b!37186 m!56365))

(declare-fun m!56367 () Bool)

(assert (=> b!37185 m!56367))

(declare-fun m!56369 () Bool)

(assert (=> b!37191 m!56369))

(assert (=> b!37191 m!56369))

(declare-fun m!56371 () Bool)

(assert (=> b!37191 m!56371))

(declare-fun m!56373 () Bool)

(assert (=> b!37191 m!56373))

(assert (=> b!37191 m!56373))

(declare-fun m!56375 () Bool)

(assert (=> b!37191 m!56375))

(declare-fun m!56377 () Bool)

(assert (=> b!37189 m!56377))

(declare-fun m!56379 () Bool)

(assert (=> b!37189 m!56379))

(declare-fun m!56381 () Bool)

(assert (=> b!37198 m!56381))

(declare-fun m!56383 () Bool)

(assert (=> b!37198 m!56383))

(declare-fun m!56385 () Bool)

(assert (=> b!37177 m!56385))

(declare-fun m!56387 () Bool)

(assert (=> b!37192 m!56387))

(check-sat (not b!37190) (not b!37198) (not b!37179) (not b!37191) (not b!37196) (not b!37184) (not b!37192) (not b!37177) (not start!7624) (not b!37181) (not b!37194) (not b!37187) (not b!37180) (not b!37189) (not b!37185) (not b!37195) (not b!37193) (not b!37197) (not b!37186) (not b!37182) (not b!37178))
(check-sat)
(get-model)

(declare-fun d!11030 () Bool)

(assert (=> d!11030 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56221 () Unit!2707)

(declare-fun choose!9 (BitStream!1494 array!1933 (_ BitVec 64) BitStream!1494) Unit!2707)

(assert (=> d!11030 (= lt!56221 (choose!9 thiss!1379 (buf!1194 (_2!1907 lt!56143)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1495 (buf!1194 (_2!1907 lt!56143)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379))))))

(assert (=> d!11030 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1194 (_2!1907 lt!56143)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56221)))

(declare-fun bs!2951 () Bool)

(assert (= bs!2951 d!11030))

(assert (=> bs!2951 m!56297))

(declare-fun m!56487 () Bool)

(assert (=> bs!2951 m!56487))

(assert (=> b!37184 d!11030))

(declare-fun b!37275 () Bool)

(declare-fun e!24544 () Unit!2707)

(declare-fun lt!56275 () Unit!2707)

(assert (=> b!37275 (= e!24544 lt!56275)))

(declare-fun lt!56281 () (_ BitVec 64))

(assert (=> b!37275 (= lt!56281 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56279 () (_ BitVec 64))

(assert (=> b!37275 (= lt!56279 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1933 array!1933 (_ BitVec 64) (_ BitVec 64)) Unit!2707)

(assert (=> b!37275 (= lt!56275 (arrayBitRangesEqSymmetric!0 (buf!1194 thiss!1379) (buf!1194 (_2!1907 lt!56143)) lt!56281 lt!56279))))

(declare-fun arrayBitRangesEq!0 (array!1933 array!1933 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37275 (arrayBitRangesEq!0 (buf!1194 (_2!1907 lt!56143)) (buf!1194 thiss!1379) lt!56281 lt!56279)))

(declare-fun d!11032 () Bool)

(declare-fun e!24543 () Bool)

(assert (=> d!11032 e!24543))

(declare-fun res!31711 () Bool)

(assert (=> d!11032 (=> (not res!31711) (not e!24543))))

(declare-fun lt!56263 () tuple2!3642)

(assert (=> d!11032 (= res!31711 (isPrefixOf!0 (_1!1908 lt!56263) (_2!1908 lt!56263)))))

(declare-fun lt!56270 () BitStream!1494)

(assert (=> d!11032 (= lt!56263 (tuple2!3643 lt!56270 (_2!1907 lt!56143)))))

(declare-fun lt!56268 () Unit!2707)

(declare-fun lt!56277 () Unit!2707)

(assert (=> d!11032 (= lt!56268 lt!56277)))

(assert (=> d!11032 (isPrefixOf!0 lt!56270 (_2!1907 lt!56143))))

(assert (=> d!11032 (= lt!56277 (lemmaIsPrefixTransitive!0 lt!56270 (_2!1907 lt!56143) (_2!1907 lt!56143)))))

(declare-fun lt!56273 () Unit!2707)

(declare-fun lt!56274 () Unit!2707)

(assert (=> d!11032 (= lt!56273 lt!56274)))

(assert (=> d!11032 (isPrefixOf!0 lt!56270 (_2!1907 lt!56143))))

(assert (=> d!11032 (= lt!56274 (lemmaIsPrefixTransitive!0 lt!56270 thiss!1379 (_2!1907 lt!56143)))))

(declare-fun lt!56262 () Unit!2707)

(assert (=> d!11032 (= lt!56262 e!24544)))

(declare-fun c!2556 () Bool)

(assert (=> d!11032 (= c!2556 (not (= (size!866 (buf!1194 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!56276 () Unit!2707)

(declare-fun lt!56269 () Unit!2707)

(assert (=> d!11032 (= lt!56276 lt!56269)))

(assert (=> d!11032 (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56143))))

(assert (=> d!11032 (= lt!56269 (lemmaIsPrefixRefl!0 (_2!1907 lt!56143)))))

(declare-fun lt!56272 () Unit!2707)

(declare-fun lt!56267 () Unit!2707)

(assert (=> d!11032 (= lt!56272 lt!56267)))

(assert (=> d!11032 (= lt!56267 (lemmaIsPrefixRefl!0 (_2!1907 lt!56143)))))

(declare-fun lt!56264 () Unit!2707)

(declare-fun lt!56265 () Unit!2707)

(assert (=> d!11032 (= lt!56264 lt!56265)))

(assert (=> d!11032 (isPrefixOf!0 lt!56270 lt!56270)))

(assert (=> d!11032 (= lt!56265 (lemmaIsPrefixRefl!0 lt!56270))))

(declare-fun lt!56278 () Unit!2707)

(declare-fun lt!56271 () Unit!2707)

(assert (=> d!11032 (= lt!56278 lt!56271)))

(assert (=> d!11032 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11032 (= lt!56271 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11032 (= lt!56270 (BitStream!1495 (buf!1194 (_2!1907 lt!56143)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(assert (=> d!11032 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56143))))

(assert (=> d!11032 (= (reader!0 thiss!1379 (_2!1907 lt!56143)) lt!56263)))

(declare-fun lt!56266 () (_ BitVec 64))

(declare-fun b!37276 () Bool)

(declare-fun lt!56280 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1494 (_ BitVec 64)) BitStream!1494)

(assert (=> b!37276 (= e!24543 (= (_1!1908 lt!56263) (withMovedBitIndex!0 (_2!1908 lt!56263) (bvsub lt!56266 lt!56280))))))

(assert (=> b!37276 (or (= (bvand lt!56266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56266 lt!56280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37276 (= lt!56280 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(assert (=> b!37276 (= lt!56266 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(declare-fun b!37277 () Bool)

(declare-fun Unit!2711 () Unit!2707)

(assert (=> b!37277 (= e!24544 Unit!2711)))

(declare-fun b!37278 () Bool)

(declare-fun res!31713 () Bool)

(assert (=> b!37278 (=> (not res!31713) (not e!24543))))

(assert (=> b!37278 (= res!31713 (isPrefixOf!0 (_2!1908 lt!56263) (_2!1907 lt!56143)))))

(declare-fun b!37279 () Bool)

(declare-fun res!31712 () Bool)

(assert (=> b!37279 (=> (not res!31712) (not e!24543))))

(assert (=> b!37279 (= res!31712 (isPrefixOf!0 (_1!1908 lt!56263) thiss!1379))))

(assert (= (and d!11032 c!2556) b!37275))

(assert (= (and d!11032 (not c!2556)) b!37277))

(assert (= (and d!11032 res!31711) b!37279))

(assert (= (and b!37279 res!31712) b!37278))

(assert (= (and b!37278 res!31713) b!37276))

(assert (=> d!11032 m!56353))

(declare-fun m!56489 () Bool)

(assert (=> d!11032 m!56489))

(declare-fun m!56491 () Bool)

(assert (=> d!11032 m!56491))

(declare-fun m!56493 () Bool)

(assert (=> d!11032 m!56493))

(declare-fun m!56495 () Bool)

(assert (=> d!11032 m!56495))

(declare-fun m!56497 () Bool)

(assert (=> d!11032 m!56497))

(declare-fun m!56499 () Bool)

(assert (=> d!11032 m!56499))

(declare-fun m!56501 () Bool)

(assert (=> d!11032 m!56501))

(assert (=> d!11032 m!56337))

(assert (=> d!11032 m!56355))

(declare-fun m!56503 () Bool)

(assert (=> d!11032 m!56503))

(declare-fun m!56505 () Bool)

(assert (=> b!37278 m!56505))

(assert (=> b!37275 m!56357))

(declare-fun m!56507 () Bool)

(assert (=> b!37275 m!56507))

(declare-fun m!56509 () Bool)

(assert (=> b!37275 m!56509))

(declare-fun m!56511 () Bool)

(assert (=> b!37276 m!56511))

(assert (=> b!37276 m!56341))

(assert (=> b!37276 m!56357))

(declare-fun m!56513 () Bool)

(assert (=> b!37279 m!56513))

(assert (=> b!37184 d!11032))

(declare-fun d!11034 () Bool)

(declare-fun res!31720 () Bool)

(declare-fun e!24549 () Bool)

(assert (=> d!11034 (=> (not res!31720) (not e!24549))))

(assert (=> d!11034 (= res!31720 (= (size!866 (buf!1194 thiss!1379)) (size!866 (buf!1194 (_2!1907 lt!56121)))))))

(assert (=> d!11034 (= (isPrefixOf!0 thiss!1379 (_2!1907 lt!56121)) e!24549)))

(declare-fun b!37286 () Bool)

(declare-fun res!31721 () Bool)

(assert (=> b!37286 (=> (not res!31721) (not e!24549))))

(assert (=> b!37286 (= res!31721 (bvsle (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)) (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56121))) (currentByte!2594 (_2!1907 lt!56121)) (currentBit!2589 (_2!1907 lt!56121)))))))

(declare-fun b!37287 () Bool)

(declare-fun e!24550 () Bool)

(assert (=> b!37287 (= e!24549 e!24550)))

(declare-fun res!31722 () Bool)

(assert (=> b!37287 (=> res!31722 e!24550)))

(assert (=> b!37287 (= res!31722 (= (size!866 (buf!1194 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37288 () Bool)

(assert (=> b!37288 (= e!24550 (arrayBitRangesEq!0 (buf!1194 thiss!1379) (buf!1194 (_2!1907 lt!56121)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379))))))

(assert (= (and d!11034 res!31720) b!37286))

(assert (= (and b!37286 res!31721) b!37287))

(assert (= (and b!37287 (not res!31722)) b!37288))

(assert (=> b!37286 m!56357))

(assert (=> b!37286 m!56347))

(assert (=> b!37288 m!56357))

(assert (=> b!37288 m!56357))

(declare-fun m!56515 () Bool)

(assert (=> b!37288 m!56515))

(assert (=> b!37184 d!11034))

(declare-fun d!11036 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11036 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2952 () Bool)

(assert (= bs!2952 d!11036))

(declare-fun m!56517 () Bool)

(assert (=> bs!2952 m!56517))

(assert (=> b!37184 d!11036))

(declare-fun d!11038 () Bool)

(declare-fun res!31723 () Bool)

(declare-fun e!24551 () Bool)

(assert (=> d!11038 (=> (not res!31723) (not e!24551))))

(assert (=> d!11038 (= res!31723 (= (size!866 (buf!1194 (_2!1907 lt!56143))) (size!866 (buf!1194 (_2!1907 lt!56121)))))))

(assert (=> d!11038 (= (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56121)) e!24551)))

(declare-fun b!37289 () Bool)

(declare-fun res!31724 () Bool)

(assert (=> b!37289 (=> (not res!31724) (not e!24551))))

(assert (=> b!37289 (= res!31724 (bvsle (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))) (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56121))) (currentByte!2594 (_2!1907 lt!56121)) (currentBit!2589 (_2!1907 lt!56121)))))))

(declare-fun b!37290 () Bool)

(declare-fun e!24552 () Bool)

(assert (=> b!37290 (= e!24551 e!24552)))

(declare-fun res!31725 () Bool)

(assert (=> b!37290 (=> res!31725 e!24552)))

(assert (=> b!37290 (= res!31725 (= (size!866 (buf!1194 (_2!1907 lt!56143))) #b00000000000000000000000000000000))))

(declare-fun b!37291 () Bool)

(assert (=> b!37291 (= e!24552 (arrayBitRangesEq!0 (buf!1194 (_2!1907 lt!56143)) (buf!1194 (_2!1907 lt!56121)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143)))))))

(assert (= (and d!11038 res!31723) b!37289))

(assert (= (and b!37289 res!31724) b!37290))

(assert (= (and b!37290 (not res!31725)) b!37291))

(assert (=> b!37289 m!56341))

(assert (=> b!37289 m!56347))

(assert (=> b!37291 m!56341))

(assert (=> b!37291 m!56341))

(declare-fun m!56519 () Bool)

(assert (=> b!37291 m!56519))

(assert (=> b!37184 d!11038))

(declare-fun d!11040 () Bool)

(assert (=> d!11040 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56121))))

(declare-fun lt!56284 () Unit!2707)

(declare-fun choose!30 (BitStream!1494 BitStream!1494 BitStream!1494) Unit!2707)

(assert (=> d!11040 (= lt!56284 (choose!30 thiss!1379 (_2!1907 lt!56143) (_2!1907 lt!56121)))))

(assert (=> d!11040 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56143))))

(assert (=> d!11040 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1907 lt!56143) (_2!1907 lt!56121)) lt!56284)))

(declare-fun bs!2953 () Bool)

(assert (= bs!2953 d!11040))

(assert (=> bs!2953 m!56293))

(declare-fun m!56521 () Bool)

(assert (=> bs!2953 m!56521))

(assert (=> bs!2953 m!56337))

(assert (=> b!37184 d!11040))

(declare-fun b!37432 () Bool)

(declare-fun e!24624 () tuple2!3640)

(declare-fun lt!56638 () tuple2!3640)

(declare-fun Unit!2712 () Unit!2707)

(assert (=> b!37432 (= e!24624 (tuple2!3641 Unit!2712 (_2!1907 lt!56638)))))

(declare-fun lt!56673 () tuple2!3640)

(assert (=> b!37432 (= lt!56673 (appendBitFromByte!0 (_2!1907 lt!56143) (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!56670 () (_ BitVec 64))

(assert (=> b!37432 (= lt!56670 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56661 () (_ BitVec 64))

(assert (=> b!37432 (= lt!56661 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56659 () Unit!2707)

(assert (=> b!37432 (= lt!56659 (validateOffsetBitsIneqLemma!0 (_2!1907 lt!56143) (_2!1907 lt!56673) lt!56670 lt!56661))))

(assert (=> b!37432 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56673)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56673))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56673))) (bvsub lt!56670 lt!56661))))

(declare-fun lt!56664 () Unit!2707)

(assert (=> b!37432 (= lt!56664 lt!56659)))

(declare-fun lt!56653 () tuple2!3642)

(assert (=> b!37432 (= lt!56653 (reader!0 (_2!1907 lt!56143) (_2!1907 lt!56673)))))

(declare-fun lt!56660 () (_ BitVec 64))

(assert (=> b!37432 (= lt!56660 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56641 () Unit!2707)

(assert (=> b!37432 (= lt!56641 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1907 lt!56143) (buf!1194 (_2!1907 lt!56673)) lt!56660))))

(assert (=> b!37432 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56673)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56660)))

(declare-fun lt!56650 () Unit!2707)

(assert (=> b!37432 (= lt!56650 lt!56641)))

(assert (=> b!37432 (= (head!285 (byteArrayBitContentToList!0 (_2!1907 lt!56673) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!285 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56673) (_1!1908 lt!56653) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!56674 () Unit!2707)

(declare-fun Unit!2713 () Unit!2707)

(assert (=> b!37432 (= lt!56674 Unit!2713)))

(assert (=> b!37432 (= lt!56638 (appendBitsMSBFirstLoop!0 (_2!1907 lt!56673) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!56666 () Unit!2707)

(assert (=> b!37432 (= lt!56666 (lemmaIsPrefixTransitive!0 (_2!1907 lt!56143) (_2!1907 lt!56673) (_2!1907 lt!56638)))))

(assert (=> b!37432 (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56638))))

(declare-fun lt!56631 () Unit!2707)

(assert (=> b!37432 (= lt!56631 lt!56666)))

(assert (=> b!37432 (= (size!866 (buf!1194 (_2!1907 lt!56638))) (size!866 (buf!1194 (_2!1907 lt!56143))))))

(declare-fun lt!56669 () Unit!2707)

(declare-fun Unit!2714 () Unit!2707)

(assert (=> b!37432 (= lt!56669 Unit!2714)))

(assert (=> b!37432 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56638))) (currentByte!2594 (_2!1907 lt!56638)) (currentBit!2589 (_2!1907 lt!56638))) (bvsub (bvadd (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56654 () Unit!2707)

(declare-fun Unit!2715 () Unit!2707)

(assert (=> b!37432 (= lt!56654 Unit!2715)))

(assert (=> b!37432 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56638))) (currentByte!2594 (_2!1907 lt!56638)) (currentBit!2589 (_2!1907 lt!56638))) (bvsub (bvsub (bvadd (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56673))) (currentByte!2594 (_2!1907 lt!56673)) (currentBit!2589 (_2!1907 lt!56673))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56637 () Unit!2707)

(declare-fun Unit!2716 () Unit!2707)

(assert (=> b!37432 (= lt!56637 Unit!2716)))

(declare-fun lt!56668 () tuple2!3642)

(assert (=> b!37432 (= lt!56668 (reader!0 (_2!1907 lt!56143) (_2!1907 lt!56638)))))

(declare-fun lt!56636 () (_ BitVec 64))

(assert (=> b!37432 (= lt!56636 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56648 () Unit!2707)

(assert (=> b!37432 (= lt!56648 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1907 lt!56143) (buf!1194 (_2!1907 lt!56638)) lt!56636))))

(assert (=> b!37432 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56638)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56636)))

(declare-fun lt!56642 () Unit!2707)

(assert (=> b!37432 (= lt!56642 lt!56648)))

(declare-fun lt!56644 () tuple2!3642)

(declare-fun call!466 () tuple2!3642)

(assert (=> b!37432 (= lt!56644 call!466)))

(declare-fun lt!56647 () (_ BitVec 64))

(assert (=> b!37432 (= lt!56647 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56665 () Unit!2707)

(assert (=> b!37432 (= lt!56665 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1907 lt!56673) (buf!1194 (_2!1907 lt!56638)) lt!56647))))

(assert (=> b!37432 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56638)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56673))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56673))) lt!56647)))

(declare-fun lt!56640 () Unit!2707)

(assert (=> b!37432 (= lt!56640 lt!56665)))

(declare-fun lt!56656 () List!448)

(assert (=> b!37432 (= lt!56656 (byteArrayBitContentToList!0 (_2!1907 lt!56638) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!56657 () List!448)

(assert (=> b!37432 (= lt!56657 (byteArrayBitContentToList!0 (_2!1907 lt!56638) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!56645 () List!448)

(assert (=> b!37432 (= lt!56645 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56638) (_1!1908 lt!56668) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!56651 () List!448)

(assert (=> b!37432 (= lt!56651 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56638) (_1!1908 lt!56644) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!56633 () (_ BitVec 64))

(assert (=> b!37432 (= lt!56633 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56652 () Unit!2707)

(assert (=> b!37432 (= lt!56652 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1907 lt!56638) (_2!1907 lt!56638) (_1!1908 lt!56668) (_1!1908 lt!56644) lt!56633 lt!56645))))

(assert (=> b!37432 (= (bitStreamReadBitsIntoList!0 (_2!1907 lt!56638) (_1!1908 lt!56644) (bvsub lt!56633 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!165 lt!56645))))

(declare-fun lt!56632 () Unit!2707)

(assert (=> b!37432 (= lt!56632 lt!56652)))

(declare-fun lt!56646 () (_ BitVec 64))

(declare-fun lt!56663 () Unit!2707)

(assert (=> b!37432 (= lt!56663 (arrayBitRangesEqImpliesEq!0 (buf!1194 (_2!1907 lt!56673)) (buf!1194 (_2!1907 lt!56638)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56646 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56673))) (currentByte!2594 (_2!1907 lt!56673)) (currentBit!2589 (_2!1907 lt!56673)))))))

(assert (=> b!37432 (= (bitAt!0 (buf!1194 (_2!1907 lt!56673)) lt!56646) (bitAt!0 (buf!1194 (_2!1907 lt!56638)) lt!56646))))

(declare-fun lt!56639 () Unit!2707)

(assert (=> b!37432 (= lt!56639 lt!56663)))

(declare-fun b!37433 () Bool)

(declare-fun e!24625 () Bool)

(declare-fun lt!56658 () (_ BitVec 64))

(assert (=> b!37433 (= e!24625 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56658))))

(declare-fun b!37434 () Bool)

(declare-fun Unit!2717 () Unit!2707)

(assert (=> b!37434 (= e!24624 (tuple2!3641 Unit!2717 (_2!1907 lt!56143)))))

(assert (=> b!37434 (= (size!866 (buf!1194 (_2!1907 lt!56143))) (size!866 (buf!1194 (_2!1907 lt!56143))))))

(declare-fun lt!56672 () Unit!2707)

(declare-fun Unit!2718 () Unit!2707)

(assert (=> b!37434 (= lt!56672 Unit!2718)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1494 array!1933 array!1933 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3652 0))(
  ( (tuple2!3653 (_1!1913 array!1933) (_2!1913 BitStream!1494)) )
))
(declare-fun readBits!0 (BitStream!1494 (_ BitVec 64)) tuple2!3652)

(assert (=> b!37434 (checkByteArrayBitContent!0 (_2!1907 lt!56143) srcBuffer!2 (_1!1913 (readBits!0 (_1!1908 call!466) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!37435 () Bool)

(declare-fun res!31808 () Bool)

(declare-fun e!24626 () Bool)

(assert (=> b!37435 (=> (not res!31808) (not e!24626))))

(declare-fun lt!56662 () tuple2!3640)

(assert (=> b!37435 (= res!31808 (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56662)))))

(declare-fun bm!463 () Bool)

(declare-fun c!2587 () Bool)

(assert (=> bm!463 (= call!466 (reader!0 (ite c!2587 (_2!1907 lt!56673) (_2!1907 lt!56143)) (ite c!2587 (_2!1907 lt!56638) (_2!1907 lt!56143))))))

(declare-fun b!37436 () Bool)

(declare-fun lt!56634 () tuple2!3642)

(assert (=> b!37436 (= e!24626 (= (bitStreamReadBitsIntoList!0 (_2!1907 lt!56662) (_1!1908 lt!56634) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1907 lt!56662) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!37436 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37436 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!56655 () Unit!2707)

(declare-fun lt!56667 () Unit!2707)

(assert (=> b!37436 (= lt!56655 lt!56667)))

(assert (=> b!37436 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56662)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56658)))

(assert (=> b!37436 (= lt!56667 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1907 lt!56143) (buf!1194 (_2!1907 lt!56662)) lt!56658))))

(assert (=> b!37436 e!24625))

(declare-fun res!31811 () Bool)

(assert (=> b!37436 (=> (not res!31811) (not e!24625))))

(assert (=> b!37436 (= res!31811 (and (= (size!866 (buf!1194 (_2!1907 lt!56143))) (size!866 (buf!1194 (_2!1907 lt!56662)))) (bvsge lt!56658 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37436 (= lt!56658 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!37436 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37436 (= lt!56634 (reader!0 (_2!1907 lt!56143) (_2!1907 lt!56662)))))

(declare-fun d!11042 () Bool)

(assert (=> d!11042 e!24626))

(declare-fun res!31810 () Bool)

(assert (=> d!11042 (=> (not res!31810) (not e!24626))))

(declare-fun lt!56649 () (_ BitVec 64))

(assert (=> d!11042 (= res!31810 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56662))) (currentByte!2594 (_2!1907 lt!56662)) (currentBit!2589 (_2!1907 lt!56662))) (bvsub lt!56649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11042 (or (= (bvand lt!56649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!56671 () (_ BitVec 64))

(assert (=> d!11042 (= lt!56649 (bvadd lt!56671 to!314))))

(assert (=> d!11042 (or (not (= (bvand lt!56671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!56671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!56671 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11042 (= lt!56671 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(assert (=> d!11042 (= lt!56662 e!24624)))

(assert (=> d!11042 (= c!2587 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!56635 () Unit!2707)

(declare-fun lt!56643 () Unit!2707)

(assert (=> d!11042 (= lt!56635 lt!56643)))

(assert (=> d!11042 (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56143))))

(assert (=> d!11042 (= lt!56643 (lemmaIsPrefixRefl!0 (_2!1907 lt!56143)))))

(assert (=> d!11042 (= lt!56646 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(assert (=> d!11042 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11042 (= (appendBitsMSBFirstLoop!0 (_2!1907 lt!56143) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!56662)))

(declare-fun b!37437 () Bool)

(declare-fun res!31809 () Bool)

(assert (=> b!37437 (=> (not res!31809) (not e!24626))))

(assert (=> b!37437 (= res!31809 (invariant!0 (currentBit!2589 (_2!1907 lt!56662)) (currentByte!2594 (_2!1907 lt!56662)) (size!866 (buf!1194 (_2!1907 lt!56662)))))))

(declare-fun b!37438 () Bool)

(declare-fun res!31807 () Bool)

(assert (=> b!37438 (=> (not res!31807) (not e!24626))))

(assert (=> b!37438 (= res!31807 (= (size!866 (buf!1194 (_2!1907 lt!56143))) (size!866 (buf!1194 (_2!1907 lt!56662)))))))

(declare-fun b!37439 () Bool)

(declare-fun res!31806 () Bool)

(assert (=> b!37439 (=> (not res!31806) (not e!24626))))

(assert (=> b!37439 (= res!31806 (= (size!866 (buf!1194 (_2!1907 lt!56662))) (size!866 (buf!1194 (_2!1907 lt!56143)))))))

(assert (= (and d!11042 c!2587) b!37432))

(assert (= (and d!11042 (not c!2587)) b!37434))

(assert (= (or b!37432 b!37434) bm!463))

(assert (= (and d!11042 res!31810) b!37437))

(assert (= (and b!37437 res!31809) b!37438))

(assert (= (and b!37438 res!31807) b!37435))

(assert (= (and b!37435 res!31808) b!37439))

(assert (= (and b!37439 res!31806) b!37436))

(assert (= (and b!37436 res!31811) b!37433))

(declare-fun m!56725 () Bool)

(assert (=> b!37432 m!56725))

(declare-fun m!56727 () Bool)

(assert (=> b!37432 m!56727))

(declare-fun m!56729 () Bool)

(assert (=> b!37432 m!56729))

(assert (=> b!37432 m!56725))

(declare-fun m!56731 () Bool)

(assert (=> b!37432 m!56731))

(declare-fun m!56733 () Bool)

(assert (=> b!37432 m!56733))

(declare-fun m!56735 () Bool)

(assert (=> b!37432 m!56735))

(declare-fun m!56737 () Bool)

(assert (=> b!37432 m!56737))

(declare-fun m!56739 () Bool)

(assert (=> b!37432 m!56739))

(declare-fun m!56741 () Bool)

(assert (=> b!37432 m!56741))

(declare-fun m!56743 () Bool)

(assert (=> b!37432 m!56743))

(declare-fun m!56745 () Bool)

(assert (=> b!37432 m!56745))

(declare-fun m!56747 () Bool)

(assert (=> b!37432 m!56747))

(declare-fun m!56749 () Bool)

(assert (=> b!37432 m!56749))

(declare-fun m!56751 () Bool)

(assert (=> b!37432 m!56751))

(declare-fun m!56753 () Bool)

(assert (=> b!37432 m!56753))

(declare-fun m!56755 () Bool)

(assert (=> b!37432 m!56755))

(assert (=> b!37432 m!56749))

(declare-fun m!56757 () Bool)

(assert (=> b!37432 m!56757))

(declare-fun m!56759 () Bool)

(assert (=> b!37432 m!56759))

(declare-fun m!56761 () Bool)

(assert (=> b!37432 m!56761))

(declare-fun m!56763 () Bool)

(assert (=> b!37432 m!56763))

(assert (=> b!37432 m!56341))

(declare-fun m!56765 () Bool)

(assert (=> b!37432 m!56765))

(assert (=> b!37432 m!56737))

(declare-fun m!56767 () Bool)

(assert (=> b!37432 m!56767))

(declare-fun m!56769 () Bool)

(assert (=> b!37432 m!56769))

(declare-fun m!56771 () Bool)

(assert (=> b!37432 m!56771))

(declare-fun m!56773 () Bool)

(assert (=> b!37432 m!56773))

(assert (=> b!37432 m!56755))

(declare-fun m!56775 () Bool)

(assert (=> b!37432 m!56775))

(declare-fun m!56777 () Bool)

(assert (=> b!37432 m!56777))

(declare-fun m!56779 () Bool)

(assert (=> b!37432 m!56779))

(declare-fun m!56781 () Bool)

(assert (=> b!37432 m!56781))

(declare-fun m!56783 () Bool)

(assert (=> b!37432 m!56783))

(declare-fun m!56785 () Bool)

(assert (=> b!37432 m!56785))

(declare-fun m!56787 () Bool)

(assert (=> b!37434 m!56787))

(declare-fun m!56789 () Bool)

(assert (=> b!37434 m!56789))

(declare-fun m!56791 () Bool)

(assert (=> d!11042 m!56791))

(assert (=> d!11042 m!56341))

(assert (=> d!11042 m!56497))

(assert (=> d!11042 m!56503))

(declare-fun m!56793 () Bool)

(assert (=> bm!463 m!56793))

(declare-fun m!56795 () Bool)

(assert (=> b!37436 m!56795))

(declare-fun m!56797 () Bool)

(assert (=> b!37436 m!56797))

(declare-fun m!56799 () Bool)

(assert (=> b!37436 m!56799))

(declare-fun m!56801 () Bool)

(assert (=> b!37436 m!56801))

(declare-fun m!56803 () Bool)

(assert (=> b!37436 m!56803))

(declare-fun m!56805 () Bool)

(assert (=> b!37437 m!56805))

(declare-fun m!56807 () Bool)

(assert (=> b!37433 m!56807))

(declare-fun m!56809 () Bool)

(assert (=> b!37435 m!56809))

(assert (=> b!37184 d!11042))

(declare-fun d!11158 () Bool)

(assert (=> d!11158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 thiss!1379))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 thiss!1379))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2980 () Bool)

(assert (= bs!2980 d!11158))

(declare-fun m!56811 () Bool)

(assert (=> bs!2980 m!56811))

(assert (=> b!37194 d!11158))

(declare-fun d!11160 () Bool)

(assert (=> d!11160 (= (bitAt!0 (buf!1194 (_2!1907 lt!56143)) lt!56134) (not (= (bvand ((_ sign_extend 24) (select (arr!1356 (buf!1194 (_2!1907 lt!56143))) ((_ extract 31 0) (bvsdiv lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2981 () Bool)

(assert (= bs!2981 d!11160))

(declare-fun m!56813 () Bool)

(assert (=> bs!2981 m!56813))

(declare-fun m!56815 () Bool)

(assert (=> bs!2981 m!56815))

(assert (=> b!37196 d!11160))

(declare-fun d!11162 () Bool)

(declare-fun size!868 (List!448) Int)

(assert (=> d!11162 (= (length!174 lt!56123) (size!868 lt!56123))))

(declare-fun bs!2982 () Bool)

(assert (= bs!2982 d!11162))

(declare-fun m!56817 () Bool)

(assert (=> bs!2982 m!56817))

(assert (=> b!37185 d!11162))

(declare-fun d!11164 () Bool)

(assert (=> d!11164 (= (array_inv!800 (buf!1194 thiss!1379)) (bvsge (size!866 (buf!1194 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!37195 d!11164))

(declare-fun d!11166 () Bool)

(assert (=> d!11166 (= (bitAt!0 (buf!1194 (_1!1908 lt!56124)) lt!56134) (not (= (bvand ((_ sign_extend 24) (select (arr!1356 (buf!1194 (_1!1908 lt!56124))) ((_ extract 31 0) (bvsdiv lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2983 () Bool)

(assert (= bs!2983 d!11166))

(declare-fun m!56819 () Bool)

(assert (=> bs!2983 m!56819))

(assert (=> bs!2983 m!56815))

(assert (=> b!37197 d!11166))

(declare-fun d!11168 () Bool)

(assert (=> d!11168 (= (bitAt!0 (buf!1194 (_1!1908 lt!56120)) lt!56134) (not (= (bvand ((_ sign_extend 24) (select (arr!1356 (buf!1194 (_1!1908 lt!56120))) ((_ extract 31 0) (bvsdiv lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2984 () Bool)

(assert (= bs!2984 d!11168))

(declare-fun m!56821 () Bool)

(assert (=> bs!2984 m!56821))

(assert (=> bs!2984 m!56815))

(assert (=> b!37197 d!11168))

(declare-fun d!11170 () Bool)

(assert (=> d!11170 (= (invariant!0 (currentBit!2589 (_2!1907 lt!56143)) (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56121)))) (and (bvsge (currentBit!2589 (_2!1907 lt!56143)) #b00000000000000000000000000000000) (bvslt (currentBit!2589 (_2!1907 lt!56143)) #b00000000000000000000000000001000) (bvsge (currentByte!2594 (_2!1907 lt!56143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56121)))) (and (= (currentBit!2589 (_2!1907 lt!56143)) #b00000000000000000000000000000000) (= (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56121))))))))))

(assert (=> b!37186 d!11170))

(declare-fun d!11172 () Bool)

(assert (=> d!11172 (= (head!285 lt!56123) (h!563 lt!56123))))

(assert (=> b!37177 d!11172))

(declare-fun d!11174 () Bool)

(assert (=> d!11174 (= (bitAt!0 (buf!1194 (_2!1907 lt!56121)) lt!56134) (not (= (bvand ((_ sign_extend 24) (select (arr!1356 (buf!1194 (_2!1907 lt!56121))) ((_ extract 31 0) (bvsdiv lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56134 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2985 () Bool)

(assert (= bs!2985 d!11174))

(declare-fun m!56823 () Bool)

(assert (=> bs!2985 m!56823))

(assert (=> bs!2985 m!56815))

(assert (=> b!37198 d!11174))

(declare-fun d!11176 () Bool)

(assert (=> d!11176 (= (bitAt!0 (buf!1194 (_2!1907 lt!56143)) lt!56134) (bitAt!0 (buf!1194 (_2!1907 lt!56121)) lt!56134))))

(declare-fun lt!56677 () Unit!2707)

(declare-fun choose!31 (array!1933 array!1933 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2707)

(assert (=> d!11176 (= lt!56677 (choose!31 (buf!1194 (_2!1907 lt!56143)) (buf!1194 (_2!1907 lt!56121)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56134 lt!56137))))

(assert (=> d!11176 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56137))))

(assert (=> d!11176 (= (arrayBitRangesEqImpliesEq!0 (buf!1194 (_2!1907 lt!56143)) (buf!1194 (_2!1907 lt!56121)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56134 lt!56137) lt!56677)))

(declare-fun bs!2986 () Bool)

(assert (= bs!2986 d!11176))

(assert (=> bs!2986 m!56339))

(assert (=> bs!2986 m!56381))

(declare-fun m!56825 () Bool)

(assert (=> bs!2986 m!56825))

(assert (=> b!37198 d!11176))

(declare-fun d!11178 () Bool)

(declare-datatypes ((tuple2!3654 0))(
  ( (tuple2!3655 (_1!1914 Bool) (_2!1914 BitStream!1494)) )
))
(declare-fun lt!56680 () tuple2!3654)

(declare-fun readBit!0 (BitStream!1494) tuple2!3654)

(assert (=> d!11178 (= lt!56680 (readBit!0 (_1!1908 lt!56120)))))

(assert (=> d!11178 (= (readBitPure!0 (_1!1908 lt!56120)) (tuple2!3645 (_2!1914 lt!56680) (_1!1914 lt!56680)))))

(declare-fun bs!2987 () Bool)

(assert (= bs!2987 d!11178))

(declare-fun m!56827 () Bool)

(assert (=> bs!2987 m!56827))

(assert (=> b!37187 d!11178))

(declare-fun d!11180 () Bool)

(assert (=> d!11180 (= (tail!165 lt!56123) (t!1198 lt!56123))))

(assert (=> b!37189 d!11180))

(declare-fun d!11182 () Bool)

(declare-fun e!24629 () Bool)

(assert (=> d!11182 e!24629))

(declare-fun res!31814 () Bool)

(assert (=> d!11182 (=> (not res!31814) (not e!24629))))

(declare-fun lt!56686 () (_ BitVec 64))

(assert (=> d!11182 (= res!31814 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!56686) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11182 (= lt!56686 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56685 () Unit!2707)

(declare-fun choose!42 (BitStream!1494 BitStream!1494 BitStream!1494 BitStream!1494 (_ BitVec 64) List!448) Unit!2707)

(assert (=> d!11182 (= lt!56685 (choose!42 (_2!1907 lt!56121) (_2!1907 lt!56121) (_1!1908 lt!56120) (_1!1908 lt!56124) (bvsub to!314 i!635) lt!56123))))

(assert (=> d!11182 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11182 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1907 lt!56121) (_2!1907 lt!56121) (_1!1908 lt!56120) (_1!1908 lt!56124) (bvsub to!314 i!635) lt!56123) lt!56685)))

(declare-fun b!37442 () Bool)

(assert (=> b!37442 (= e!24629 (= (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_1!1908 lt!56124) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!165 lt!56123)))))

(assert (= (and d!11182 res!31814) b!37442))

(declare-fun m!56829 () Bool)

(assert (=> d!11182 m!56829))

(declare-fun m!56831 () Bool)

(assert (=> b!37442 m!56831))

(assert (=> b!37442 m!56377))

(assert (=> b!37189 d!11182))

(declare-fun d!11184 () Bool)

(declare-fun res!31815 () Bool)

(declare-fun e!24630 () Bool)

(assert (=> d!11184 (=> (not res!31815) (not e!24630))))

(assert (=> d!11184 (= res!31815 (= (size!866 (buf!1194 thiss!1379)) (size!866 (buf!1194 (_2!1907 lt!56143)))))))

(assert (=> d!11184 (= (isPrefixOf!0 thiss!1379 (_2!1907 lt!56143)) e!24630)))

(declare-fun b!37443 () Bool)

(declare-fun res!31816 () Bool)

(assert (=> b!37443 (=> (not res!31816) (not e!24630))))

(assert (=> b!37443 (= res!31816 (bvsle (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)) (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143)))))))

(declare-fun b!37444 () Bool)

(declare-fun e!24631 () Bool)

(assert (=> b!37444 (= e!24630 e!24631)))

(declare-fun res!31817 () Bool)

(assert (=> b!37444 (=> res!31817 e!24631)))

(assert (=> b!37444 (= res!31817 (= (size!866 (buf!1194 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37445 () Bool)

(assert (=> b!37445 (= e!24631 (arrayBitRangesEq!0 (buf!1194 thiss!1379) (buf!1194 (_2!1907 lt!56143)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379))))))

(assert (= (and d!11184 res!31815) b!37443))

(assert (= (and b!37443 res!31816) b!37444))

(assert (= (and b!37444 (not res!31817)) b!37445))

(assert (=> b!37443 m!56357))

(assert (=> b!37443 m!56341))

(assert (=> b!37445 m!56357))

(assert (=> b!37445 m!56357))

(declare-fun m!56833 () Bool)

(assert (=> b!37445 m!56833))

(assert (=> b!37178 d!11184))

(declare-fun d!11186 () Bool)

(assert (=> d!11186 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56122) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143)))) lt!56122))))

(declare-fun bs!2988 () Bool)

(assert (= bs!2988 d!11186))

(declare-fun m!56835 () Bool)

(assert (=> bs!2988 m!56835))

(assert (=> b!37178 d!11186))

(declare-fun d!11188 () Bool)

(declare-fun e!24634 () Bool)

(assert (=> d!11188 e!24634))

(declare-fun res!31820 () Bool)

(assert (=> d!11188 (=> (not res!31820) (not e!24634))))

(assert (=> d!11188 (= res!31820 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!56689 () Unit!2707)

(declare-fun choose!27 (BitStream!1494 BitStream!1494 (_ BitVec 64) (_ BitVec 64)) Unit!2707)

(assert (=> d!11188 (= lt!56689 (choose!27 thiss!1379 (_2!1907 lt!56143) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11188 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11188 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1907 lt!56143) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56689)))

(declare-fun b!37448 () Bool)

(assert (=> b!37448 (= e!24634 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11188 res!31820) b!37448))

(declare-fun m!56837 () Bool)

(assert (=> d!11188 m!56837))

(declare-fun m!56839 () Bool)

(assert (=> b!37448 m!56839))

(assert (=> b!37178 d!11188))

(declare-fun b!37466 () Bool)

(declare-fun res!31837 () Bool)

(declare-fun e!24643 () Bool)

(assert (=> b!37466 (=> (not res!31837) (not e!24643))))

(declare-fun lt!56723 () tuple2!3640)

(assert (=> b!37466 (= res!31837 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56723)))))

(declare-fun b!37467 () Bool)

(declare-fun e!24644 () Bool)

(assert (=> b!37467 (= e!24643 e!24644)))

(declare-fun res!31844 () Bool)

(assert (=> b!37467 (=> (not res!31844) (not e!24644))))

(declare-fun lt!56721 () tuple2!3644)

(declare-fun lt!56720 () (_ BitVec 8))

(assert (=> b!37467 (= res!31844 (and (= (_2!1909 lt!56721) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!56720)) #b00000000000000000000000000000000))) (= (_1!1909 lt!56721) (_2!1907 lt!56723))))))

(declare-fun lt!56719 () tuple2!3652)

(declare-fun lt!56725 () BitStream!1494)

(assert (=> b!37467 (= lt!56719 (readBits!0 lt!56725 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37467 (= lt!56721 (readBitPure!0 lt!56725))))

(declare-fun readerFrom!0 (BitStream!1494 (_ BitVec 32) (_ BitVec 32)) BitStream!1494)

(assert (=> b!37467 (= lt!56725 (readerFrom!0 (_2!1907 lt!56723) (currentBit!2589 thiss!1379) (currentByte!2594 thiss!1379)))))

(declare-fun b!37468 () Bool)

(declare-fun e!24645 () Bool)

(declare-fun e!24646 () Bool)

(assert (=> b!37468 (= e!24645 e!24646)))

(declare-fun res!31843 () Bool)

(assert (=> b!37468 (=> (not res!31843) (not e!24646))))

(declare-fun lt!56715 () tuple2!3640)

(declare-fun lt!56717 () tuple2!3644)

(declare-fun lt!56716 () Bool)

(assert (=> b!37468 (= res!31843 (and (= (_2!1909 lt!56717) lt!56716) (= (_1!1909 lt!56717) (_2!1907 lt!56715))))))

(assert (=> b!37468 (= lt!56717 (readBitPure!0 (readerFrom!0 (_2!1907 lt!56715) (currentBit!2589 thiss!1379) (currentByte!2594 thiss!1379))))))

(declare-fun b!37469 () Bool)

(declare-fun res!31838 () Bool)

(assert (=> b!37469 (=> (not res!31838) (not e!24645))))

(assert (=> b!37469 (= res!31838 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56715)))))

(declare-fun d!11190 () Bool)

(assert (=> d!11190 e!24643))

(declare-fun res!31842 () Bool)

(assert (=> d!11190 (=> (not res!31842) (not e!24643))))

(assert (=> d!11190 (= res!31842 (= (size!866 (buf!1194 (_2!1907 lt!56723))) (size!866 (buf!1194 thiss!1379))))))

(declare-fun lt!56722 () array!1933)

(assert (=> d!11190 (= lt!56720 (select (arr!1356 lt!56722) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11190 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!866 lt!56722)))))

(assert (=> d!11190 (= lt!56722 (array!1934 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!56714 () tuple2!3640)

(assert (=> d!11190 (= lt!56723 (tuple2!3641 (_1!1907 lt!56714) (_2!1907 lt!56714)))))

(assert (=> d!11190 (= lt!56714 lt!56715)))

(assert (=> d!11190 e!24645))

(declare-fun res!31839 () Bool)

(assert (=> d!11190 (=> (not res!31839) (not e!24645))))

(assert (=> d!11190 (= res!31839 (= (size!866 (buf!1194 thiss!1379)) (size!866 (buf!1194 (_2!1907 lt!56715)))))))

(declare-fun appendBit!0 (BitStream!1494 Bool) tuple2!3640)

(assert (=> d!11190 (= lt!56715 (appendBit!0 thiss!1379 lt!56716))))

(assert (=> d!11190 (= lt!56716 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11190 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11190 (= (appendBitFromByte!0 thiss!1379 (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!56723)))

(declare-fun b!37470 () Bool)

(assert (=> b!37470 (= e!24646 (= (bitIndex!0 (size!866 (buf!1194 (_1!1909 lt!56717))) (currentByte!2594 (_1!1909 lt!56717)) (currentBit!2589 (_1!1909 lt!56717))) (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56715))) (currentByte!2594 (_2!1907 lt!56715)) (currentBit!2589 (_2!1907 lt!56715)))))))

(declare-fun b!37471 () Bool)

(declare-fun res!31841 () Bool)

(assert (=> b!37471 (=> (not res!31841) (not e!24643))))

(declare-fun lt!56718 () (_ BitVec 64))

(declare-fun lt!56724 () (_ BitVec 64))

(assert (=> b!37471 (= res!31841 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56723))) (currentByte!2594 (_2!1907 lt!56723)) (currentBit!2589 (_2!1907 lt!56723))) (bvadd lt!56718 lt!56724)))))

(assert (=> b!37471 (or (not (= (bvand lt!56718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56724 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!56718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!56718 lt!56724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37471 (= lt!56724 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!37471 (= lt!56718 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(declare-fun b!37472 () Bool)

(assert (=> b!37472 (= e!24644 (= (bitIndex!0 (size!866 (buf!1194 (_1!1909 lt!56721))) (currentByte!2594 (_1!1909 lt!56721)) (currentBit!2589 (_1!1909 lt!56721))) (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56723))) (currentByte!2594 (_2!1907 lt!56723)) (currentBit!2589 (_2!1907 lt!56723)))))))

(declare-fun b!37473 () Bool)

(declare-fun res!31840 () Bool)

(assert (=> b!37473 (=> (not res!31840) (not e!24645))))

(assert (=> b!37473 (= res!31840 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56715))) (currentByte!2594 (_2!1907 lt!56715)) (currentBit!2589 (_2!1907 lt!56715))) (bvadd (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11190 res!31839) b!37473))

(assert (= (and b!37473 res!31840) b!37469))

(assert (= (and b!37469 res!31838) b!37468))

(assert (= (and b!37468 res!31843) b!37470))

(assert (= (and d!11190 res!31842) b!37471))

(assert (= (and b!37471 res!31841) b!37466))

(assert (= (and b!37466 res!31837) b!37467))

(assert (= (and b!37467 res!31844) b!37472))

(declare-fun m!56841 () Bool)

(assert (=> d!11190 m!56841))

(declare-fun m!56843 () Bool)

(assert (=> d!11190 m!56843))

(declare-fun m!56845 () Bool)

(assert (=> d!11190 m!56845))

(declare-fun m!56847 () Bool)

(assert (=> b!37467 m!56847))

(declare-fun m!56849 () Bool)

(assert (=> b!37467 m!56849))

(declare-fun m!56851 () Bool)

(assert (=> b!37467 m!56851))

(declare-fun m!56853 () Bool)

(assert (=> b!37469 m!56853))

(declare-fun m!56855 () Bool)

(assert (=> b!37471 m!56855))

(assert (=> b!37471 m!56357))

(declare-fun m!56857 () Bool)

(assert (=> b!37470 m!56857))

(declare-fun m!56859 () Bool)

(assert (=> b!37470 m!56859))

(declare-fun m!56861 () Bool)

(assert (=> b!37466 m!56861))

(assert (=> b!37473 m!56859))

(assert (=> b!37473 m!56357))

(declare-fun m!56863 () Bool)

(assert (=> b!37468 m!56863))

(assert (=> b!37468 m!56863))

(declare-fun m!56865 () Bool)

(assert (=> b!37468 m!56865))

(declare-fun m!56867 () Bool)

(assert (=> b!37472 m!56867))

(assert (=> b!37472 m!56855))

(assert (=> b!37178 d!11190))

(declare-fun d!11192 () Bool)

(declare-fun res!31845 () Bool)

(declare-fun e!24647 () Bool)

(assert (=> d!11192 (=> (not res!31845) (not e!24647))))

(assert (=> d!11192 (= res!31845 (= (size!866 (buf!1194 thiss!1379)) (size!866 (buf!1194 thiss!1379))))))

(assert (=> d!11192 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!24647)))

(declare-fun b!37474 () Bool)

(declare-fun res!31846 () Bool)

(assert (=> b!37474 (=> (not res!31846) (not e!24647))))

(assert (=> b!37474 (= res!31846 (bvsle (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)) (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379))))))

(declare-fun b!37475 () Bool)

(declare-fun e!24648 () Bool)

(assert (=> b!37475 (= e!24647 e!24648)))

(declare-fun res!31847 () Bool)

(assert (=> b!37475 (=> res!31847 e!24648)))

(assert (=> b!37475 (= res!31847 (= (size!866 (buf!1194 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37476 () Bool)

(assert (=> b!37476 (= e!24648 (arrayBitRangesEq!0 (buf!1194 thiss!1379) (buf!1194 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379))))))

(assert (= (and d!11192 res!31845) b!37474))

(assert (= (and b!37474 res!31846) b!37475))

(assert (= (and b!37475 (not res!31847)) b!37476))

(assert (=> b!37474 m!56357))

(assert (=> b!37474 m!56357))

(assert (=> b!37476 m!56357))

(assert (=> b!37476 m!56357))

(declare-fun m!56869 () Bool)

(assert (=> b!37476 m!56869))

(assert (=> b!37180 d!11192))

(declare-fun d!11194 () Bool)

(assert (=> d!11194 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!56728 () Unit!2707)

(declare-fun choose!11 (BitStream!1494) Unit!2707)

(assert (=> d!11194 (= lt!56728 (choose!11 thiss!1379))))

(assert (=> d!11194 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!56728)))

(declare-fun bs!2990 () Bool)

(assert (= bs!2990 d!11194))

(assert (=> bs!2990 m!56353))

(declare-fun m!56871 () Bool)

(assert (=> bs!2990 m!56871))

(assert (=> b!37180 d!11194))

(declare-fun d!11196 () Bool)

(declare-fun e!24651 () Bool)

(assert (=> d!11196 e!24651))

(declare-fun res!31852 () Bool)

(assert (=> d!11196 (=> (not res!31852) (not e!24651))))

(declare-fun lt!56745 () (_ BitVec 64))

(declare-fun lt!56741 () (_ BitVec 64))

(declare-fun lt!56743 () (_ BitVec 64))

(assert (=> d!11196 (= res!31852 (= lt!56745 (bvsub lt!56743 lt!56741)))))

(assert (=> d!11196 (or (= (bvand lt!56743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56743 lt!56741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11196 (= lt!56741 (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 thiss!1379))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379))))))

(declare-fun lt!56742 () (_ BitVec 64))

(declare-fun lt!56746 () (_ BitVec 64))

(assert (=> d!11196 (= lt!56743 (bvmul lt!56742 lt!56746))))

(assert (=> d!11196 (or (= lt!56742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56746 (bvsdiv (bvmul lt!56742 lt!56746) lt!56742)))))

(assert (=> d!11196 (= lt!56746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11196 (= lt!56742 ((_ sign_extend 32) (size!866 (buf!1194 thiss!1379))))))

(assert (=> d!11196 (= lt!56745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2594 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2589 thiss!1379))))))

(assert (=> d!11196 (invariant!0 (currentBit!2589 thiss!1379) (currentByte!2594 thiss!1379) (size!866 (buf!1194 thiss!1379)))))

(assert (=> d!11196 (= (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)) lt!56745)))

(declare-fun b!37481 () Bool)

(declare-fun res!31853 () Bool)

(assert (=> b!37481 (=> (not res!31853) (not e!24651))))

(assert (=> b!37481 (= res!31853 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56745))))

(declare-fun b!37482 () Bool)

(declare-fun lt!56744 () (_ BitVec 64))

(assert (=> b!37482 (= e!24651 (bvsle lt!56745 (bvmul lt!56744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37482 (or (= lt!56744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56744)))))

(assert (=> b!37482 (= lt!56744 ((_ sign_extend 32) (size!866 (buf!1194 thiss!1379))))))

(assert (= (and d!11196 res!31852) b!37481))

(assert (= (and b!37481 res!31853) b!37482))

(assert (=> d!11196 m!56811))

(declare-fun m!56873 () Bool)

(assert (=> d!11196 m!56873))

(assert (=> b!37180 d!11196))

(declare-fun d!11198 () Bool)

(assert (=> d!11198 (= (head!285 lt!56128) (h!563 lt!56128))))

(assert (=> b!37190 d!11198))

(declare-fun d!11200 () Bool)

(assert (=> d!11200 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2991 () Bool)

(assert (= bs!2991 d!11200))

(assert (=> bs!2991 m!56329))

(assert (=> bs!2991 m!56845))

(assert (=> b!37190 d!11200))

(declare-fun d!11202 () Bool)

(assert (=> d!11202 (= (invariant!0 (currentBit!2589 (_2!1907 lt!56121)) (currentByte!2594 (_2!1907 lt!56121)) (size!866 (buf!1194 (_2!1907 lt!56121)))) (and (bvsge (currentBit!2589 (_2!1907 lt!56121)) #b00000000000000000000000000000000) (bvslt (currentBit!2589 (_2!1907 lt!56121)) #b00000000000000000000000000001000) (bvsge (currentByte!2594 (_2!1907 lt!56121)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2594 (_2!1907 lt!56121)) (size!866 (buf!1194 (_2!1907 lt!56121)))) (and (= (currentBit!2589 (_2!1907 lt!56121)) #b00000000000000000000000000000000) (= (currentByte!2594 (_2!1907 lt!56121)) (size!866 (buf!1194 (_2!1907 lt!56121))))))))))

(assert (=> b!37179 d!11202))

(declare-fun d!11204 () Bool)

(assert (=> d!11204 (= (invariant!0 (currentBit!2589 (_2!1907 lt!56143)) (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56143)))) (and (bvsge (currentBit!2589 (_2!1907 lt!56143)) #b00000000000000000000000000000000) (bvslt (currentBit!2589 (_2!1907 lt!56143)) #b00000000000000000000000000001000) (bvsge (currentByte!2594 (_2!1907 lt!56143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56143)))) (and (= (currentBit!2589 (_2!1907 lt!56143)) #b00000000000000000000000000000000) (= (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56143))))))))))

(assert (=> b!37192 d!11204))

(declare-fun d!11206 () Bool)

(declare-fun e!24652 () Bool)

(assert (=> d!11206 e!24652))

(declare-fun res!31854 () Bool)

(assert (=> d!11206 (=> (not res!31854) (not e!24652))))

(declare-fun lt!56749 () (_ BitVec 64))

(declare-fun lt!56751 () (_ BitVec 64))

(declare-fun lt!56747 () (_ BitVec 64))

(assert (=> d!11206 (= res!31854 (= lt!56751 (bvsub lt!56749 lt!56747)))))

(assert (=> d!11206 (or (= (bvand lt!56749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56749 lt!56747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11206 (= lt!56747 (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56121))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56121)))))))

(declare-fun lt!56748 () (_ BitVec 64))

(declare-fun lt!56752 () (_ BitVec 64))

(assert (=> d!11206 (= lt!56749 (bvmul lt!56748 lt!56752))))

(assert (=> d!11206 (or (= lt!56748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56752 (bvsdiv (bvmul lt!56748 lt!56752) lt!56748)))))

(assert (=> d!11206 (= lt!56752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11206 (= lt!56748 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))))))

(assert (=> d!11206 (= lt!56751 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56121))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56121)))))))

(assert (=> d!11206 (invariant!0 (currentBit!2589 (_2!1907 lt!56121)) (currentByte!2594 (_2!1907 lt!56121)) (size!866 (buf!1194 (_2!1907 lt!56121))))))

(assert (=> d!11206 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56121))) (currentByte!2594 (_2!1907 lt!56121)) (currentBit!2589 (_2!1907 lt!56121))) lt!56751)))

(declare-fun b!37483 () Bool)

(declare-fun res!31855 () Bool)

(assert (=> b!37483 (=> (not res!31855) (not e!24652))))

(assert (=> b!37483 (= res!31855 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56751))))

(declare-fun b!37484 () Bool)

(declare-fun lt!56750 () (_ BitVec 64))

(assert (=> b!37484 (= e!24652 (bvsle lt!56751 (bvmul lt!56750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37484 (or (= lt!56750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56750)))))

(assert (=> b!37484 (= lt!56750 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))))))

(assert (= (and d!11206 res!31854) b!37483))

(assert (= (and b!37483 res!31855) b!37484))

(declare-fun m!56875 () Bool)

(assert (=> d!11206 m!56875))

(assert (=> d!11206 m!56343))

(assert (=> b!37181 d!11206))

(declare-fun d!11208 () Bool)

(assert (=> d!11208 (= (head!285 (byteArrayBitContentToList!0 (_2!1907 lt!56143) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!563 (byteArrayBitContentToList!0 (_2!1907 lt!56143) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37191 d!11208))

(declare-fun d!11210 () Bool)

(declare-fun c!2590 () Bool)

(assert (=> d!11210 (= c!2590 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24655 () List!448)

(assert (=> d!11210 (= (byteArrayBitContentToList!0 (_2!1907 lt!56143) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!24655)))

(declare-fun b!37489 () Bool)

(assert (=> b!37489 (= e!24655 Nil!445)))

(declare-fun b!37490 () Bool)

(assert (=> b!37490 (= e!24655 (Cons!444 (not (= (bvand ((_ sign_extend 24) (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1907 lt!56143) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11210 c!2590) b!37489))

(assert (= (and d!11210 (not c!2590)) b!37490))

(assert (=> b!37490 m!56329))

(assert (=> b!37490 m!56845))

(declare-fun m!56877 () Bool)

(assert (=> b!37490 m!56877))

(assert (=> b!37191 d!11210))

(declare-fun d!11212 () Bool)

(assert (=> d!11212 (= (head!285 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56143) (_1!1908 lt!56126) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!563 (bitStreamReadBitsIntoList!0 (_2!1907 lt!56143) (_1!1908 lt!56126) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37191 d!11212))

(declare-fun b!37501 () Bool)

(declare-fun e!24660 () Bool)

(declare-fun lt!56760 () List!448)

(declare-fun isEmpty!105 (List!448) Bool)

(assert (=> b!37501 (= e!24660 (isEmpty!105 lt!56760))))

(declare-fun b!37499 () Bool)

(declare-datatypes ((tuple2!3656 0))(
  ( (tuple2!3657 (_1!1915 List!448) (_2!1915 BitStream!1494)) )
))
(declare-fun e!24661 () tuple2!3656)

(assert (=> b!37499 (= e!24661 (tuple2!3657 Nil!445 (_1!1908 lt!56126)))))

(declare-fun d!11214 () Bool)

(assert (=> d!11214 e!24660))

(declare-fun c!2596 () Bool)

(assert (=> d!11214 (= c!2596 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11214 (= lt!56760 (_1!1915 e!24661))))

(declare-fun c!2595 () Bool)

(assert (=> d!11214 (= c!2595 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11214 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11214 (= (bitStreamReadBitsIntoList!0 (_2!1907 lt!56143) (_1!1908 lt!56126) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56760)))

(declare-fun lt!56759 () tuple2!3654)

(declare-fun b!37500 () Bool)

(declare-fun lt!56761 () (_ BitVec 64))

(assert (=> b!37500 (= e!24661 (tuple2!3657 (Cons!444 (_1!1914 lt!56759) (bitStreamReadBitsIntoList!0 (_2!1907 lt!56143) (_2!1914 lt!56759) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!56761))) (_2!1914 lt!56759)))))

(assert (=> b!37500 (= lt!56759 (readBit!0 (_1!1908 lt!56126)))))

(assert (=> b!37500 (= lt!56761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!37502 () Bool)

(assert (=> b!37502 (= e!24660 (> (length!174 lt!56760) 0))))

(assert (= (and d!11214 c!2595) b!37499))

(assert (= (and d!11214 (not c!2595)) b!37500))

(assert (= (and d!11214 c!2596) b!37501))

(assert (= (and d!11214 (not c!2596)) b!37502))

(declare-fun m!56879 () Bool)

(assert (=> b!37501 m!56879))

(declare-fun m!56881 () Bool)

(assert (=> b!37500 m!56881))

(declare-fun m!56883 () Bool)

(assert (=> b!37500 m!56883))

(declare-fun m!56885 () Bool)

(assert (=> b!37502 m!56885))

(assert (=> b!37191 d!11214))

(declare-fun d!11216 () Bool)

(assert (=> d!11216 (= (array_inv!800 srcBuffer!2) (bvsge (size!866 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7624 d!11216))

(declare-fun d!11218 () Bool)

(assert (=> d!11218 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2589 thiss!1379) (currentByte!2594 thiss!1379) (size!866 (buf!1194 thiss!1379))))))

(declare-fun bs!2992 () Bool)

(assert (= bs!2992 d!11218))

(assert (=> bs!2992 m!56873))

(assert (=> start!7624 d!11218))

(declare-fun d!11220 () Bool)

(declare-fun e!24662 () Bool)

(assert (=> d!11220 e!24662))

(declare-fun res!31856 () Bool)

(assert (=> d!11220 (=> (not res!31856) (not e!24662))))

(declare-fun lt!56764 () (_ BitVec 64))

(declare-fun lt!56762 () (_ BitVec 64))

(declare-fun lt!56766 () (_ BitVec 64))

(assert (=> d!11220 (= res!31856 (= lt!56766 (bvsub lt!56764 lt!56762)))))

(assert (=> d!11220 (or (= (bvand lt!56764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56764 lt!56762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11220 (= lt!56762 (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143)))))))

(declare-fun lt!56763 () (_ BitVec 64))

(declare-fun lt!56767 () (_ BitVec 64))

(assert (=> d!11220 (= lt!56764 (bvmul lt!56763 lt!56767))))

(assert (=> d!11220 (or (= lt!56763 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56767 (bvsdiv (bvmul lt!56763 lt!56767) lt!56763)))))

(assert (=> d!11220 (= lt!56767 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11220 (= lt!56763 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))))))

(assert (=> d!11220 (= lt!56766 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143)))))))

(assert (=> d!11220 (invariant!0 (currentBit!2589 (_2!1907 lt!56143)) (currentByte!2594 (_2!1907 lt!56143)) (size!866 (buf!1194 (_2!1907 lt!56143))))))

(assert (=> d!11220 (= (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))) lt!56766)))

(declare-fun b!37503 () Bool)

(declare-fun res!31857 () Bool)

(assert (=> b!37503 (=> (not res!31857) (not e!24662))))

(assert (=> b!37503 (= res!31857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56766))))

(declare-fun b!37504 () Bool)

(declare-fun lt!56765 () (_ BitVec 64))

(assert (=> b!37504 (= e!24662 (bvsle lt!56766 (bvmul lt!56765 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37504 (or (= lt!56765 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56765 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56765)))))

(assert (=> b!37504 (= lt!56765 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56143)))))))

(assert (= (and d!11220 res!31856) b!37503))

(assert (= (and b!37503 res!31857) b!37504))

(assert (=> d!11220 m!56835))

(assert (=> d!11220 m!56387))

(assert (=> b!37193 d!11220))

(declare-fun d!11222 () Bool)

(assert (=> d!11222 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56122) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143)))) lt!56122))))

(declare-fun bs!2993 () Bool)

(assert (= bs!2993 d!11222))

(declare-fun m!56887 () Bool)

(assert (=> bs!2993 m!56887))

(assert (=> b!37182 d!11222))

(declare-fun d!11224 () Bool)

(assert (=> d!11224 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!56768 () Unit!2707)

(assert (=> d!11224 (= lt!56768 (choose!9 thiss!1379 (buf!1194 (_2!1907 lt!56121)) (bvsub to!314 i!635) (BitStream!1495 (buf!1194 (_2!1907 lt!56121)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379))))))

(assert (=> d!11224 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1194 (_2!1907 lt!56121)) (bvsub to!314 i!635)) lt!56768)))

(declare-fun bs!2994 () Bool)

(assert (= bs!2994 d!11224))

(assert (=> bs!2994 m!56307))

(declare-fun m!56889 () Bool)

(assert (=> bs!2994 m!56889))

(assert (=> b!37182 d!11224))

(declare-fun b!37505 () Bool)

(declare-fun e!24664 () Unit!2707)

(declare-fun lt!56782 () Unit!2707)

(assert (=> b!37505 (= e!24664 lt!56782)))

(declare-fun lt!56788 () (_ BitVec 64))

(assert (=> b!37505 (= lt!56788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56786 () (_ BitVec 64))

(assert (=> b!37505 (= lt!56786 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(assert (=> b!37505 (= lt!56782 (arrayBitRangesEqSymmetric!0 (buf!1194 (_2!1907 lt!56143)) (buf!1194 (_2!1907 lt!56121)) lt!56788 lt!56786))))

(assert (=> b!37505 (arrayBitRangesEq!0 (buf!1194 (_2!1907 lt!56121)) (buf!1194 (_2!1907 lt!56143)) lt!56788 lt!56786)))

(declare-fun d!11226 () Bool)

(declare-fun e!24663 () Bool)

(assert (=> d!11226 e!24663))

(declare-fun res!31858 () Bool)

(assert (=> d!11226 (=> (not res!31858) (not e!24663))))

(declare-fun lt!56770 () tuple2!3642)

(assert (=> d!11226 (= res!31858 (isPrefixOf!0 (_1!1908 lt!56770) (_2!1908 lt!56770)))))

(declare-fun lt!56777 () BitStream!1494)

(assert (=> d!11226 (= lt!56770 (tuple2!3643 lt!56777 (_2!1907 lt!56121)))))

(declare-fun lt!56775 () Unit!2707)

(declare-fun lt!56784 () Unit!2707)

(assert (=> d!11226 (= lt!56775 lt!56784)))

(assert (=> d!11226 (isPrefixOf!0 lt!56777 (_2!1907 lt!56121))))

(assert (=> d!11226 (= lt!56784 (lemmaIsPrefixTransitive!0 lt!56777 (_2!1907 lt!56121) (_2!1907 lt!56121)))))

(declare-fun lt!56780 () Unit!2707)

(declare-fun lt!56781 () Unit!2707)

(assert (=> d!11226 (= lt!56780 lt!56781)))

(assert (=> d!11226 (isPrefixOf!0 lt!56777 (_2!1907 lt!56121))))

(assert (=> d!11226 (= lt!56781 (lemmaIsPrefixTransitive!0 lt!56777 (_2!1907 lt!56143) (_2!1907 lt!56121)))))

(declare-fun lt!56769 () Unit!2707)

(assert (=> d!11226 (= lt!56769 e!24664)))

(declare-fun c!2597 () Bool)

(assert (=> d!11226 (= c!2597 (not (= (size!866 (buf!1194 (_2!1907 lt!56143))) #b00000000000000000000000000000000)))))

(declare-fun lt!56783 () Unit!2707)

(declare-fun lt!56776 () Unit!2707)

(assert (=> d!11226 (= lt!56783 lt!56776)))

(assert (=> d!11226 (isPrefixOf!0 (_2!1907 lt!56121) (_2!1907 lt!56121))))

(assert (=> d!11226 (= lt!56776 (lemmaIsPrefixRefl!0 (_2!1907 lt!56121)))))

(declare-fun lt!56779 () Unit!2707)

(declare-fun lt!56774 () Unit!2707)

(assert (=> d!11226 (= lt!56779 lt!56774)))

(assert (=> d!11226 (= lt!56774 (lemmaIsPrefixRefl!0 (_2!1907 lt!56121)))))

(declare-fun lt!56771 () Unit!2707)

(declare-fun lt!56772 () Unit!2707)

(assert (=> d!11226 (= lt!56771 lt!56772)))

(assert (=> d!11226 (isPrefixOf!0 lt!56777 lt!56777)))

(assert (=> d!11226 (= lt!56772 (lemmaIsPrefixRefl!0 lt!56777))))

(declare-fun lt!56785 () Unit!2707)

(declare-fun lt!56778 () Unit!2707)

(assert (=> d!11226 (= lt!56785 lt!56778)))

(assert (=> d!11226 (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56143))))

(assert (=> d!11226 (= lt!56778 (lemmaIsPrefixRefl!0 (_2!1907 lt!56143)))))

(assert (=> d!11226 (= lt!56777 (BitStream!1495 (buf!1194 (_2!1907 lt!56121)) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(assert (=> d!11226 (isPrefixOf!0 (_2!1907 lt!56143) (_2!1907 lt!56121))))

(assert (=> d!11226 (= (reader!0 (_2!1907 lt!56143) (_2!1907 lt!56121)) lt!56770)))

(declare-fun lt!56787 () (_ BitVec 64))

(declare-fun lt!56773 () (_ BitVec 64))

(declare-fun b!37506 () Bool)

(assert (=> b!37506 (= e!24663 (= (_1!1908 lt!56770) (withMovedBitIndex!0 (_2!1908 lt!56770) (bvsub lt!56773 lt!56787))))))

(assert (=> b!37506 (or (= (bvand lt!56773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56773 lt!56787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37506 (= lt!56787 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56121))) (currentByte!2594 (_2!1907 lt!56121)) (currentBit!2589 (_2!1907 lt!56121))))))

(assert (=> b!37506 (= lt!56773 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56143))) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143))))))

(declare-fun b!37507 () Bool)

(declare-fun Unit!2719 () Unit!2707)

(assert (=> b!37507 (= e!24664 Unit!2719)))

(declare-fun b!37508 () Bool)

(declare-fun res!31860 () Bool)

(assert (=> b!37508 (=> (not res!31860) (not e!24663))))

(assert (=> b!37508 (= res!31860 (isPrefixOf!0 (_2!1908 lt!56770) (_2!1907 lt!56121)))))

(declare-fun b!37509 () Bool)

(declare-fun res!31859 () Bool)

(assert (=> b!37509 (=> (not res!31859) (not e!24663))))

(assert (=> b!37509 (= res!31859 (isPrefixOf!0 (_1!1908 lt!56770) (_2!1907 lt!56143)))))

(assert (= (and d!11226 c!2597) b!37505))

(assert (= (and d!11226 (not c!2597)) b!37507))

(assert (= (and d!11226 res!31858) b!37509))

(assert (= (and b!37509 res!31859) b!37508))

(assert (= (and b!37508 res!31860) b!37506))

(assert (=> d!11226 m!56497))

(declare-fun m!56891 () Bool)

(assert (=> d!11226 m!56891))

(declare-fun m!56893 () Bool)

(assert (=> d!11226 m!56893))

(declare-fun m!56895 () Bool)

(assert (=> d!11226 m!56895))

(declare-fun m!56897 () Bool)

(assert (=> d!11226 m!56897))

(declare-fun m!56899 () Bool)

(assert (=> d!11226 m!56899))

(declare-fun m!56901 () Bool)

(assert (=> d!11226 m!56901))

(declare-fun m!56903 () Bool)

(assert (=> d!11226 m!56903))

(assert (=> d!11226 m!56301))

(assert (=> d!11226 m!56503))

(declare-fun m!56905 () Bool)

(assert (=> d!11226 m!56905))

(declare-fun m!56907 () Bool)

(assert (=> b!37508 m!56907))

(assert (=> b!37505 m!56341))

(declare-fun m!56909 () Bool)

(assert (=> b!37505 m!56909))

(declare-fun m!56911 () Bool)

(assert (=> b!37505 m!56911))

(declare-fun m!56913 () Bool)

(assert (=> b!37506 m!56913))

(assert (=> b!37506 m!56347))

(assert (=> b!37506 m!56341))

(declare-fun m!56915 () Bool)

(assert (=> b!37509 m!56915))

(assert (=> b!37182 d!11226))

(declare-fun d!11228 () Bool)

(assert (=> d!11228 (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 (_2!1907 lt!56143))) ((_ sign_extend 32) (currentBit!2589 (_2!1907 lt!56143))) lt!56122)))

(declare-fun lt!56789 () Unit!2707)

(assert (=> d!11228 (= lt!56789 (choose!9 (_2!1907 lt!56143) (buf!1194 (_2!1907 lt!56121)) lt!56122 (BitStream!1495 (buf!1194 (_2!1907 lt!56121)) (currentByte!2594 (_2!1907 lt!56143)) (currentBit!2589 (_2!1907 lt!56143)))))))

(assert (=> d!11228 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1907 lt!56143) (buf!1194 (_2!1907 lt!56121)) lt!56122) lt!56789)))

(declare-fun bs!2995 () Bool)

(assert (= bs!2995 d!11228))

(assert (=> bs!2995 m!56319))

(declare-fun m!56917 () Bool)

(assert (=> bs!2995 m!56917))

(assert (=> b!37182 d!11228))

(declare-fun d!11230 () Bool)

(declare-fun c!2598 () Bool)

(assert (=> d!11230 (= c!2598 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24665 () List!448)

(assert (=> d!11230 (= (byteArrayBitContentToList!0 (_2!1907 lt!56121) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!24665)))

(declare-fun b!37510 () Bool)

(assert (=> b!37510 (= e!24665 Nil!445)))

(declare-fun b!37511 () Bool)

(assert (=> b!37511 (= e!24665 (Cons!444 (not (= (bvand ((_ sign_extend 24) (select (arr!1356 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1907 lt!56121) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11230 c!2598) b!37510))

(assert (= (and d!11230 (not c!2598)) b!37511))

(assert (=> b!37511 m!56329))

(assert (=> b!37511 m!56845))

(declare-fun m!56919 () Bool)

(assert (=> b!37511 m!56919))

(assert (=> b!37182 d!11230))

(declare-fun b!37514 () Bool)

(declare-fun e!24666 () Bool)

(declare-fun lt!56791 () List!448)

(assert (=> b!37514 (= e!24666 (isEmpty!105 lt!56791))))

(declare-fun b!37512 () Bool)

(declare-fun e!24667 () tuple2!3656)

(assert (=> b!37512 (= e!24667 (tuple2!3657 Nil!445 (_1!1908 lt!56120)))))

(declare-fun d!11232 () Bool)

(assert (=> d!11232 e!24666))

(declare-fun c!2600 () Bool)

(assert (=> d!11232 (= c!2600 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11232 (= lt!56791 (_1!1915 e!24667))))

(declare-fun c!2599 () Bool)

(assert (=> d!11232 (= c!2599 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11232 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11232 (= (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_1!1908 lt!56120) (bvsub to!314 i!635)) lt!56791)))

(declare-fun lt!56792 () (_ BitVec 64))

(declare-fun lt!56790 () tuple2!3654)

(declare-fun b!37513 () Bool)

(assert (=> b!37513 (= e!24667 (tuple2!3657 (Cons!444 (_1!1914 lt!56790) (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_2!1914 lt!56790) (bvsub (bvsub to!314 i!635) lt!56792))) (_2!1914 lt!56790)))))

(assert (=> b!37513 (= lt!56790 (readBit!0 (_1!1908 lt!56120)))))

(assert (=> b!37513 (= lt!56792 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!37515 () Bool)

(assert (=> b!37515 (= e!24666 (> (length!174 lt!56791) 0))))

(assert (= (and d!11232 c!2599) b!37512))

(assert (= (and d!11232 (not c!2599)) b!37513))

(assert (= (and d!11232 c!2600) b!37514))

(assert (= (and d!11232 (not c!2600)) b!37515))

(declare-fun m!56921 () Bool)

(assert (=> b!37514 m!56921))

(declare-fun m!56923 () Bool)

(assert (=> b!37513 m!56923))

(assert (=> b!37513 m!56827))

(declare-fun m!56925 () Bool)

(assert (=> b!37515 m!56925))

(assert (=> b!37182 d!11232))

(declare-fun d!11234 () Bool)

(assert (=> d!11234 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!866 (buf!1194 (_2!1907 lt!56121)))) ((_ sign_extend 32) (currentByte!2594 thiss!1379)) ((_ sign_extend 32) (currentBit!2589 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2996 () Bool)

(assert (= bs!2996 d!11234))

(declare-fun m!56927 () Bool)

(assert (=> bs!2996 m!56927))

(assert (=> b!37182 d!11234))

(declare-fun b!37518 () Bool)

(declare-fun e!24668 () Bool)

(declare-fun lt!56794 () List!448)

(assert (=> b!37518 (= e!24668 (isEmpty!105 lt!56794))))

(declare-fun b!37516 () Bool)

(declare-fun e!24669 () tuple2!3656)

(assert (=> b!37516 (= e!24669 (tuple2!3657 Nil!445 (_1!1908 lt!56124)))))

(declare-fun d!11236 () Bool)

(assert (=> d!11236 e!24668))

(declare-fun c!2602 () Bool)

(assert (=> d!11236 (= c!2602 (= lt!56122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11236 (= lt!56794 (_1!1915 e!24669))))

(declare-fun c!2601 () Bool)

(assert (=> d!11236 (= c!2601 (= lt!56122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11236 (bvsge lt!56122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11236 (= (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_1!1908 lt!56124) lt!56122) lt!56794)))

(declare-fun b!37517 () Bool)

(declare-fun lt!56793 () tuple2!3654)

(declare-fun lt!56795 () (_ BitVec 64))

(assert (=> b!37517 (= e!24669 (tuple2!3657 (Cons!444 (_1!1914 lt!56793) (bitStreamReadBitsIntoList!0 (_2!1907 lt!56121) (_2!1914 lt!56793) (bvsub lt!56122 lt!56795))) (_2!1914 lt!56793)))))

(assert (=> b!37517 (= lt!56793 (readBit!0 (_1!1908 lt!56124)))))

(assert (=> b!37517 (= lt!56795 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!37519 () Bool)

(assert (=> b!37519 (= e!24668 (> (length!174 lt!56794) 0))))

(assert (= (and d!11236 c!2601) b!37516))

(assert (= (and d!11236 (not c!2601)) b!37517))

(assert (= (and d!11236 c!2602) b!37518))

(assert (= (and d!11236 (not c!2602)) b!37519))

(declare-fun m!56929 () Bool)

(assert (=> b!37518 m!56929))

(declare-fun m!56931 () Bool)

(assert (=> b!37517 m!56931))

(declare-fun m!56933 () Bool)

(assert (=> b!37517 m!56933))

(declare-fun m!56935 () Bool)

(assert (=> b!37519 m!56935))

(assert (=> b!37182 d!11236))

(declare-fun b!37520 () Bool)

(declare-fun e!24671 () Unit!2707)

(declare-fun lt!56809 () Unit!2707)

(assert (=> b!37520 (= e!24671 lt!56809)))

(declare-fun lt!56815 () (_ BitVec 64))

(assert (=> b!37520 (= lt!56815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56813 () (_ BitVec 64))

(assert (=> b!37520 (= lt!56813 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(assert (=> b!37520 (= lt!56809 (arrayBitRangesEqSymmetric!0 (buf!1194 thiss!1379) (buf!1194 (_2!1907 lt!56121)) lt!56815 lt!56813))))

(assert (=> b!37520 (arrayBitRangesEq!0 (buf!1194 (_2!1907 lt!56121)) (buf!1194 thiss!1379) lt!56815 lt!56813)))

(declare-fun d!11238 () Bool)

(declare-fun e!24670 () Bool)

(assert (=> d!11238 e!24670))

(declare-fun res!31861 () Bool)

(assert (=> d!11238 (=> (not res!31861) (not e!24670))))

(declare-fun lt!56797 () tuple2!3642)

(assert (=> d!11238 (= res!31861 (isPrefixOf!0 (_1!1908 lt!56797) (_2!1908 lt!56797)))))

(declare-fun lt!56804 () BitStream!1494)

(assert (=> d!11238 (= lt!56797 (tuple2!3643 lt!56804 (_2!1907 lt!56121)))))

(declare-fun lt!56802 () Unit!2707)

(declare-fun lt!56811 () Unit!2707)

(assert (=> d!11238 (= lt!56802 lt!56811)))

(assert (=> d!11238 (isPrefixOf!0 lt!56804 (_2!1907 lt!56121))))

(assert (=> d!11238 (= lt!56811 (lemmaIsPrefixTransitive!0 lt!56804 (_2!1907 lt!56121) (_2!1907 lt!56121)))))

(declare-fun lt!56807 () Unit!2707)

(declare-fun lt!56808 () Unit!2707)

(assert (=> d!11238 (= lt!56807 lt!56808)))

(assert (=> d!11238 (isPrefixOf!0 lt!56804 (_2!1907 lt!56121))))

(assert (=> d!11238 (= lt!56808 (lemmaIsPrefixTransitive!0 lt!56804 thiss!1379 (_2!1907 lt!56121)))))

(declare-fun lt!56796 () Unit!2707)

(assert (=> d!11238 (= lt!56796 e!24671)))

(declare-fun c!2603 () Bool)

(assert (=> d!11238 (= c!2603 (not (= (size!866 (buf!1194 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!56810 () Unit!2707)

(declare-fun lt!56803 () Unit!2707)

(assert (=> d!11238 (= lt!56810 lt!56803)))

(assert (=> d!11238 (isPrefixOf!0 (_2!1907 lt!56121) (_2!1907 lt!56121))))

(assert (=> d!11238 (= lt!56803 (lemmaIsPrefixRefl!0 (_2!1907 lt!56121)))))

(declare-fun lt!56806 () Unit!2707)

(declare-fun lt!56801 () Unit!2707)

(assert (=> d!11238 (= lt!56806 lt!56801)))

(assert (=> d!11238 (= lt!56801 (lemmaIsPrefixRefl!0 (_2!1907 lt!56121)))))

(declare-fun lt!56798 () Unit!2707)

(declare-fun lt!56799 () Unit!2707)

(assert (=> d!11238 (= lt!56798 lt!56799)))

(assert (=> d!11238 (isPrefixOf!0 lt!56804 lt!56804)))

(assert (=> d!11238 (= lt!56799 (lemmaIsPrefixRefl!0 lt!56804))))

(declare-fun lt!56812 () Unit!2707)

(declare-fun lt!56805 () Unit!2707)

(assert (=> d!11238 (= lt!56812 lt!56805)))

(assert (=> d!11238 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11238 (= lt!56805 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11238 (= lt!56804 (BitStream!1495 (buf!1194 (_2!1907 lt!56121)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(assert (=> d!11238 (isPrefixOf!0 thiss!1379 (_2!1907 lt!56121))))

(assert (=> d!11238 (= (reader!0 thiss!1379 (_2!1907 lt!56121)) lt!56797)))

(declare-fun lt!56800 () (_ BitVec 64))

(declare-fun lt!56814 () (_ BitVec 64))

(declare-fun b!37521 () Bool)

(assert (=> b!37521 (= e!24670 (= (_1!1908 lt!56797) (withMovedBitIndex!0 (_2!1908 lt!56797) (bvsub lt!56800 lt!56814))))))

(assert (=> b!37521 (or (= (bvand lt!56800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56800 lt!56814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37521 (= lt!56814 (bitIndex!0 (size!866 (buf!1194 (_2!1907 lt!56121))) (currentByte!2594 (_2!1907 lt!56121)) (currentBit!2589 (_2!1907 lt!56121))))))

(assert (=> b!37521 (= lt!56800 (bitIndex!0 (size!866 (buf!1194 thiss!1379)) (currentByte!2594 thiss!1379) (currentBit!2589 thiss!1379)))))

(declare-fun b!37522 () Bool)

(declare-fun Unit!2720 () Unit!2707)

(assert (=> b!37522 (= e!24671 Unit!2720)))

(declare-fun b!37523 () Bool)

(declare-fun res!31863 () Bool)

(assert (=> b!37523 (=> (not res!31863) (not e!24670))))

(assert (=> b!37523 (= res!31863 (isPrefixOf!0 (_2!1908 lt!56797) (_2!1907 lt!56121)))))

(declare-fun b!37524 () Bool)

(declare-fun res!31862 () Bool)

(assert (=> b!37524 (=> (not res!31862) (not e!24670))))

(assert (=> b!37524 (= res!31862 (isPrefixOf!0 (_1!1908 lt!56797) thiss!1379))))

(assert (= (and d!11238 c!2603) b!37520))

(assert (= (and d!11238 (not c!2603)) b!37522))

(assert (= (and d!11238 res!31861) b!37524))

(assert (= (and b!37524 res!31862) b!37523))

(assert (= (and b!37523 res!31863) b!37521))

(assert (=> d!11238 m!56353))

(declare-fun m!56937 () Bool)

(assert (=> d!11238 m!56937))

(declare-fun m!56939 () Bool)

(assert (=> d!11238 m!56939))

(declare-fun m!56941 () Bool)

(assert (=> d!11238 m!56941))

(declare-fun m!56943 () Bool)

(assert (=> d!11238 m!56943))

(assert (=> d!11238 m!56899))

(declare-fun m!56945 () Bool)

(assert (=> d!11238 m!56945))

(declare-fun m!56947 () Bool)

(assert (=> d!11238 m!56947))

(assert (=> d!11238 m!56293))

(assert (=> d!11238 m!56355))

(assert (=> d!11238 m!56905))

(declare-fun m!56949 () Bool)

(assert (=> b!37523 m!56949))

(assert (=> b!37520 m!56357))

(declare-fun m!56951 () Bool)

(assert (=> b!37520 m!56951))

(declare-fun m!56953 () Bool)

(assert (=> b!37520 m!56953))

(declare-fun m!56955 () Bool)

(assert (=> b!37521 m!56955))

(assert (=> b!37521 m!56347))

(assert (=> b!37521 m!56357))

(declare-fun m!56957 () Bool)

(assert (=> b!37524 m!56957))

(assert (=> b!37182 d!11238))

(check-sat (not b!37471) (not bm!463) (not d!11220) (not b!37466) (not b!37467) (not b!37289) (not b!37442) (not b!37474) (not d!11030) (not b!37468) (not b!37291) (not d!11206) (not b!37521) (not d!11182) (not d!11228) (not b!37518) (not b!37500) (not b!37469) (not d!11224) (not b!37448) (not b!37511) (not d!11194) (not d!11040) (not d!11218) (not d!11222) (not b!37434) (not b!37432) (not b!37433) (not b!37515) (not b!37490) (not d!11238) (not b!37505) (not b!37524) (not b!37502) (not d!11158) (not b!37279) (not d!11032) (not b!37508) (not b!37276) (not b!37517) (not d!11178) (not d!11036) (not d!11162) (not d!11226) (not d!11190) (not b!37472) (not b!37523) (not b!37519) (not b!37520) (not b!37275) (not b!37501) (not d!11176) (not b!37436) (not d!11188) (not b!37514) (not b!37476) (not d!11196) (not b!37509) (not b!37473) (not b!37506) (not b!37288) (not b!37445) (not d!11186) (not b!37286) (not b!37435) (not d!11042) (not b!37470) (not b!37437) (not b!37443) (not b!37513) (not b!37278) (not d!11234))
