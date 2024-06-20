; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9156 () Bool)

(assert start!9156)

(declare-fun b!45325 () Bool)

(declare-fun e!30166 () Bool)

(declare-fun e!30164 () Bool)

(assert (=> b!45325 (= e!30166 e!30164)))

(declare-fun res!38327 () Bool)

(assert (=> b!45325 (=> res!38327 e!30164)))

(declare-datatypes ((array!2261 0))(
  ( (array!2262 (arr!1534 (Array (_ BitVec 32) (_ BitVec 8))) (size!1017 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1778 0))(
  ( (BitStream!1779 (buf!1366 array!2261) (currentByte!2859 (_ BitVec 32)) (currentBit!2854 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3224 0))(
  ( (Unit!3225) )
))
(declare-datatypes ((tuple2!4424 0))(
  ( (tuple2!4425 (_1!2305 Unit!3224) (_2!2305 BitStream!1778)) )
))
(declare-fun lt!69626 () tuple2!4424)

(declare-fun lt!69634 () tuple2!4424)

(declare-fun isPrefixOf!0 (BitStream!1778 BitStream!1778) Bool)

(assert (=> b!45325 (= res!38327 (not (isPrefixOf!0 (_2!2305 lt!69626) (_2!2305 lt!69634))))))

(declare-fun thiss!1379 () BitStream!1778)

(assert (=> b!45325 (isPrefixOf!0 thiss!1379 (_2!2305 lt!69634))))

(declare-fun lt!69632 () Unit!3224)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1778 BitStream!1778 BitStream!1778) Unit!3224)

(assert (=> b!45325 (= lt!69632 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2305 lt!69626) (_2!2305 lt!69634)))))

(declare-fun srcBuffer!2 () array!2261)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1778 array!2261 (_ BitVec 64) (_ BitVec 64)) tuple2!4424)

(assert (=> b!45325 (= lt!69634 (appendBitsMSBFirstLoop!0 (_2!2305 lt!69626) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!30160 () Bool)

(assert (=> b!45325 e!30160))

(declare-fun res!38333 () Bool)

(assert (=> b!45325 (=> (not res!38333) (not e!30160))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45325 (= res!38333 (validate_offset_bits!1 ((_ sign_extend 32) (size!1017 (buf!1366 (_2!2305 lt!69626)))) ((_ sign_extend 32) (currentByte!2859 thiss!1379)) ((_ sign_extend 32) (currentBit!2854 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69633 () Unit!3224)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1778 array!2261 (_ BitVec 64)) Unit!3224)

(assert (=> b!45325 (= lt!69633 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1366 (_2!2305 lt!69626)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4426 0))(
  ( (tuple2!4427 (_1!2306 BitStream!1778) (_2!2306 BitStream!1778)) )
))
(declare-fun lt!69628 () tuple2!4426)

(declare-fun reader!0 (BitStream!1778 BitStream!1778) tuple2!4426)

(assert (=> b!45325 (= lt!69628 (reader!0 thiss!1379 (_2!2305 lt!69626)))))

(declare-fun b!45326 () Bool)

(declare-fun e!30165 () Bool)

(declare-fun e!30157 () Bool)

(assert (=> b!45326 (= e!30165 e!30157)))

(declare-fun res!38323 () Bool)

(assert (=> b!45326 (=> res!38323 e!30157)))

(assert (=> b!45326 (= res!38323 (not (= (size!1017 (buf!1366 (_2!2305 lt!69626))) (size!1017 (buf!1366 (_2!2305 lt!69634))))))))

(declare-fun e!30159 () Bool)

(assert (=> b!45326 e!30159))

(declare-fun res!38332 () Bool)

(assert (=> b!45326 (=> (not res!38332) (not e!30159))))

(assert (=> b!45326 (= res!38332 (= (size!1017 (buf!1366 (_2!2305 lt!69634))) (size!1017 (buf!1366 thiss!1379))))))

(declare-fun b!45327 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45327 (= e!30157 (invariant!0 (currentBit!2854 (_2!2305 lt!69626)) (currentByte!2859 (_2!2305 lt!69626)) (size!1017 (buf!1366 (_2!2305 lt!69634)))))))

(declare-fun b!45328 () Bool)

(declare-fun res!38326 () Bool)

(assert (=> b!45328 (=> res!38326 e!30157)))

(assert (=> b!45328 (= res!38326 (not (invariant!0 (currentBit!2854 (_2!2305 lt!69626)) (currentByte!2859 (_2!2305 lt!69626)) (size!1017 (buf!1366 (_2!2305 lt!69626))))))))

(declare-fun b!45329 () Bool)

(declare-fun e!30167 () Bool)

(assert (=> b!45329 (= e!30167 e!30166)))

(declare-fun res!38329 () Bool)

(assert (=> b!45329 (=> res!38329 e!30166)))

(assert (=> b!45329 (= res!38329 (not (isPrefixOf!0 thiss!1379 (_2!2305 lt!69626))))))

(assert (=> b!45329 (validate_offset_bits!1 ((_ sign_extend 32) (size!1017 (buf!1366 (_2!2305 lt!69626)))) ((_ sign_extend 32) (currentByte!2859 (_2!2305 lt!69626))) ((_ sign_extend 32) (currentBit!2854 (_2!2305 lt!69626))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69627 () Unit!3224)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1778 BitStream!1778 (_ BitVec 64) (_ BitVec 64)) Unit!3224)

(assert (=> b!45329 (= lt!69627 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2305 lt!69626) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1778 (_ BitVec 8) (_ BitVec 32)) tuple2!4424)

(assert (=> b!45329 (= lt!69626 (appendBitFromByte!0 thiss!1379 (select (arr!1534 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45330 () Bool)

(assert (=> b!45330 (= e!30164 e!30165)))

(declare-fun res!38328 () Bool)

(assert (=> b!45330 (=> res!38328 e!30165)))

(declare-fun lt!69630 () (_ BitVec 64))

(declare-fun lt!69631 () (_ BitVec 64))

(assert (=> b!45330 (= res!38328 (not (= lt!69631 (bvsub (bvadd lt!69630 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45330 (= lt!69631 (bitIndex!0 (size!1017 (buf!1366 (_2!2305 lt!69634))) (currentByte!2859 (_2!2305 lt!69634)) (currentBit!2854 (_2!2305 lt!69634))))))

(declare-fun b!45331 () Bool)

(declare-datatypes ((List!530 0))(
  ( (Nil!527) (Cons!526 (h!645 Bool) (t!1280 List!530)) )
))
(declare-fun head!349 (List!530) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1778 array!2261 (_ BitVec 64) (_ BitVec 64)) List!530)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1778 BitStream!1778 (_ BitVec 64)) List!530)

(assert (=> b!45331 (= e!30160 (= (head!349 (byteArrayBitContentToList!0 (_2!2305 lt!69626) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!349 (bitStreamReadBitsIntoList!0 (_2!2305 lt!69626) (_1!2306 lt!69628) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45332 () Bool)

(declare-fun e!30163 () Bool)

(assert (=> b!45332 (= e!30163 (not e!30167))))

(declare-fun res!38324 () Bool)

(assert (=> b!45332 (=> res!38324 e!30167)))

(assert (=> b!45332 (= res!38324 (bvsge i!635 to!314))))

(assert (=> b!45332 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69629 () Unit!3224)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1778) Unit!3224)

(assert (=> b!45332 (= lt!69629 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!45332 (= lt!69630 (bitIndex!0 (size!1017 (buf!1366 thiss!1379)) (currentByte!2859 thiss!1379) (currentBit!2854 thiss!1379)))))

(declare-fun res!38325 () Bool)

(assert (=> start!9156 (=> (not res!38325) (not e!30163))))

(assert (=> start!9156 (= res!38325 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1017 srcBuffer!2))))))))

(assert (=> start!9156 e!30163))

(assert (=> start!9156 true))

(declare-fun array_inv!942 (array!2261) Bool)

(assert (=> start!9156 (array_inv!942 srcBuffer!2)))

(declare-fun e!30162 () Bool)

(declare-fun inv!12 (BitStream!1778) Bool)

(assert (=> start!9156 (and (inv!12 thiss!1379) e!30162)))

(declare-fun b!45333 () Bool)

(declare-fun res!38331 () Bool)

(assert (=> b!45333 (=> res!38331 e!30165)))

(assert (=> b!45333 (= res!38331 (not (invariant!0 (currentBit!2854 (_2!2305 lt!69634)) (currentByte!2859 (_2!2305 lt!69634)) (size!1017 (buf!1366 (_2!2305 lt!69634))))))))

(declare-fun b!45334 () Bool)

(assert (=> b!45334 (= e!30159 (= lt!69631 (bvsub (bvsub (bvadd (bitIndex!0 (size!1017 (buf!1366 (_2!2305 lt!69626))) (currentByte!2859 (_2!2305 lt!69626)) (currentBit!2854 (_2!2305 lt!69626))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45335 () Bool)

(assert (=> b!45335 (= e!30162 (array_inv!942 (buf!1366 thiss!1379)))))

(declare-fun b!45336 () Bool)

(declare-fun res!38334 () Bool)

(assert (=> b!45336 (=> res!38334 e!30165)))

(assert (=> b!45336 (= res!38334 (not (= (size!1017 (buf!1366 thiss!1379)) (size!1017 (buf!1366 (_2!2305 lt!69634))))))))

(declare-fun b!45337 () Bool)

(declare-fun res!38330 () Bool)

(assert (=> b!45337 (=> (not res!38330) (not e!30163))))

(assert (=> b!45337 (= res!38330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1017 (buf!1366 thiss!1379))) ((_ sign_extend 32) (currentByte!2859 thiss!1379)) ((_ sign_extend 32) (currentBit!2854 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!9156 res!38325) b!45337))

(assert (= (and b!45337 res!38330) b!45332))

(assert (= (and b!45332 (not res!38324)) b!45329))

(assert (= (and b!45329 (not res!38329)) b!45325))

(assert (= (and b!45325 res!38333) b!45331))

(assert (= (and b!45325 (not res!38327)) b!45330))

(assert (= (and b!45330 (not res!38328)) b!45333))

(assert (= (and b!45333 (not res!38331)) b!45336))

(assert (= (and b!45336 (not res!38334)) b!45326))

(assert (= (and b!45326 res!38332) b!45334))

(assert (= (and b!45326 (not res!38323)) b!45328))

(assert (= (and b!45328 (not res!38326)) b!45327))

(assert (= start!9156 b!45335))

(declare-fun m!69143 () Bool)

(assert (=> b!45331 m!69143))

(assert (=> b!45331 m!69143))

(declare-fun m!69145 () Bool)

(assert (=> b!45331 m!69145))

(declare-fun m!69147 () Bool)

(assert (=> b!45331 m!69147))

(assert (=> b!45331 m!69147))

(declare-fun m!69149 () Bool)

(assert (=> b!45331 m!69149))

(declare-fun m!69151 () Bool)

(assert (=> b!45328 m!69151))

(declare-fun m!69153 () Bool)

(assert (=> b!45327 m!69153))

(declare-fun m!69155 () Bool)

(assert (=> b!45332 m!69155))

(declare-fun m!69157 () Bool)

(assert (=> b!45332 m!69157))

(declare-fun m!69159 () Bool)

(assert (=> b!45332 m!69159))

(declare-fun m!69161 () Bool)

(assert (=> b!45329 m!69161))

(declare-fun m!69163 () Bool)

(assert (=> b!45329 m!69163))

(declare-fun m!69165 () Bool)

(assert (=> b!45329 m!69165))

(declare-fun m!69167 () Bool)

(assert (=> b!45329 m!69167))

(assert (=> b!45329 m!69161))

(declare-fun m!69169 () Bool)

(assert (=> b!45329 m!69169))

(declare-fun m!69171 () Bool)

(assert (=> b!45337 m!69171))

(declare-fun m!69173 () Bool)

(assert (=> b!45334 m!69173))

(declare-fun m!69175 () Bool)

(assert (=> start!9156 m!69175))

(declare-fun m!69177 () Bool)

(assert (=> start!9156 m!69177))

(declare-fun m!69179 () Bool)

(assert (=> b!45330 m!69179))

(declare-fun m!69181 () Bool)

(assert (=> b!45333 m!69181))

(declare-fun m!69183 () Bool)

(assert (=> b!45325 m!69183))

(declare-fun m!69185 () Bool)

(assert (=> b!45325 m!69185))

(declare-fun m!69187 () Bool)

(assert (=> b!45325 m!69187))

(declare-fun m!69189 () Bool)

(assert (=> b!45325 m!69189))

(declare-fun m!69191 () Bool)

(assert (=> b!45325 m!69191))

(declare-fun m!69193 () Bool)

(assert (=> b!45325 m!69193))

(declare-fun m!69195 () Bool)

(assert (=> b!45325 m!69195))

(declare-fun m!69197 () Bool)

(assert (=> b!45335 m!69197))

(push 1)

(assert (not b!45325))

(assert (not b!45328))

(assert (not b!45327))

(assert (not b!45335))

(assert (not b!45337))

(assert (not b!45333))

(assert (not b!45331))

(assert (not b!45332))

(assert (not start!9156))

(assert (not b!45330))

(assert (not b!45329))

(assert (not b!45334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

