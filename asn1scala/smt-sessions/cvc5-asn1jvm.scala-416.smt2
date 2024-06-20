; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10620 () Bool)

(assert start!10620)

(declare-fun b!53148 () Bool)

(declare-fun e!35411 () Bool)

(declare-datatypes ((array!2512 0))(
  ( (array!2513 (arr!1682 (Array (_ BitVec 32) (_ BitVec 8))) (size!1146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1984 0))(
  ( (BitStream!1985 (buf!1496 array!2512) (currentByte!3057 (_ BitVec 32)) (currentBit!3052 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1984)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53148 (= e!35411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!53149 () Bool)

(declare-fun res!44398 () Bool)

(declare-fun e!35416 () Bool)

(assert (=> b!53149 (=> (not res!44398) (not e!35416))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!53149 (= res!44398 (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!53150 () Bool)

(declare-fun e!35417 () Bool)

(declare-fun e!35415 () Bool)

(assert (=> b!53150 (= e!35417 e!35415)))

(declare-fun res!44397 () Bool)

(assert (=> b!53150 (=> res!44397 e!35415)))

(declare-datatypes ((Unit!3699 0))(
  ( (Unit!3700) )
))
(declare-datatypes ((tuple2!4842 0))(
  ( (tuple2!4843 (_1!2526 Unit!3699) (_2!2526 BitStream!1984)) )
))
(declare-fun lt!82369 () tuple2!4842)

(declare-fun isPrefixOf!0 (BitStream!1984 BitStream!1984) Bool)

(assert (=> b!53150 (= res!44397 (not (isPrefixOf!0 thiss!1379 (_2!2526 lt!82369))))))

(assert (=> b!53150 (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 (_2!2526 lt!82369)))) ((_ sign_extend 32) (currentByte!3057 (_2!2526 lt!82369))) ((_ sign_extend 32) (currentBit!3052 (_2!2526 lt!82369))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82365 () Unit!3699)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1984 BitStream!1984 (_ BitVec 64) (_ BitVec 64)) Unit!3699)

(assert (=> b!53150 (= lt!82365 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2526 lt!82369) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2512)

(declare-fun appendBitFromByte!0 (BitStream!1984 (_ BitVec 8) (_ BitVec 32)) tuple2!4842)

(assert (=> b!53150 (= lt!82369 (appendBitFromByte!0 thiss!1379 (select (arr!1682 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53151 () Bool)

(assert (=> b!53151 (= e!35415 e!35411)))

(declare-fun res!44399 () Bool)

(assert (=> b!53151 (=> res!44399 e!35411)))

(assert (=> b!53151 (= res!44399 (not (= (size!1146 (buf!1496 thiss!1379)) (size!1146 (buf!1496 (_2!2526 lt!82369))))))))

(declare-datatypes ((tuple2!4844 0))(
  ( (tuple2!4845 (_1!2527 BitStream!1984) (_2!2527 BitStream!1984)) )
))
(declare-fun lt!82368 () tuple2!4844)

(declare-fun reader!0 (BitStream!1984 BitStream!1984) tuple2!4844)

(assert (=> b!53151 (= lt!82368 (reader!0 thiss!1379 (_2!2526 lt!82369)))))

(declare-fun b!53152 () Bool)

(assert (=> b!53152 (= e!35416 (not e!35417))))

(declare-fun res!44396 () Bool)

(assert (=> b!53152 (=> res!44396 e!35417)))

(assert (=> b!53152 (= res!44396 (bvsge i!635 to!314))))

(assert (=> b!53152 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82366 () Unit!3699)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1984) Unit!3699)

(assert (=> b!53152 (= lt!82366 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82367 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53152 (= lt!82367 (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)))))

(declare-fun b!53147 () Bool)

(declare-fun e!35414 () Bool)

(declare-fun array_inv!1051 (array!2512) Bool)

(assert (=> b!53147 (= e!35414 (array_inv!1051 (buf!1496 thiss!1379)))))

(declare-fun res!44400 () Bool)

(assert (=> start!10620 (=> (not res!44400) (not e!35416))))

(assert (=> start!10620 (= res!44400 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1146 srcBuffer!2))))))))

(assert (=> start!10620 e!35416))

(assert (=> start!10620 true))

(assert (=> start!10620 (array_inv!1051 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1984) Bool)

(assert (=> start!10620 (and (inv!12 thiss!1379) e!35414)))

(assert (= (and start!10620 res!44400) b!53149))

(assert (= (and b!53149 res!44398) b!53152))

(assert (= (and b!53152 (not res!44396)) b!53150))

(assert (= (and b!53150 (not res!44397)) b!53151))

(assert (= (and b!53151 (not res!44399)) b!53148))

(assert (= start!10620 b!53147))

(declare-fun m!83647 () Bool)

(assert (=> b!53147 m!83647))

(declare-fun m!83649 () Bool)

(assert (=> b!53151 m!83649))

(declare-fun m!83651 () Bool)

(assert (=> b!53150 m!83651))

(declare-fun m!83653 () Bool)

(assert (=> b!53150 m!83653))

(declare-fun m!83655 () Bool)

(assert (=> b!53150 m!83655))

(assert (=> b!53150 m!83653))

(declare-fun m!83657 () Bool)

(assert (=> b!53150 m!83657))

(declare-fun m!83659 () Bool)

(assert (=> b!53150 m!83659))

(declare-fun m!83661 () Bool)

(assert (=> b!53152 m!83661))

(declare-fun m!83663 () Bool)

(assert (=> b!53152 m!83663))

(declare-fun m!83665 () Bool)

(assert (=> b!53152 m!83665))

(declare-fun m!83667 () Bool)

(assert (=> start!10620 m!83667))

(declare-fun m!83669 () Bool)

(assert (=> start!10620 m!83669))

(declare-fun m!83671 () Bool)

(assert (=> b!53149 m!83671))

(declare-fun m!83673 () Bool)

(assert (=> b!53148 m!83673))

(push 1)

(assert (not start!10620))

(assert (not b!53149))

(assert (not b!53148))

(assert (not b!53147))

(assert (not b!53151))

(assert (not b!53152))

(assert (not b!53150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16830 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4270 () Bool)

(assert (= bs!4270 d!16830))

(declare-fun m!83739 () Bool)

(assert (=> bs!4270 m!83739))

(assert (=> b!53148 d!16830))

(declare-fun d!16832 () Bool)

(assert (=> d!16832 (= (array_inv!1051 (buf!1496 thiss!1379)) (bvsge (size!1146 (buf!1496 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!53147 d!16832))

(declare-fun d!16834 () Bool)

(assert (=> d!16834 (= (array_inv!1051 srcBuffer!2) (bvsge (size!1146 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10620 d!16834))

(declare-fun d!16836 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16836 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3052 thiss!1379) (currentByte!3057 thiss!1379) (size!1146 (buf!1496 thiss!1379))))))

(declare-fun bs!4271 () Bool)

(assert (= bs!4271 d!16836))

(declare-fun m!83741 () Bool)

(assert (=> bs!4271 m!83741))

(assert (=> start!10620 d!16836))

(declare-fun d!16838 () Bool)

(declare-fun res!44449 () Bool)

(declare-fun e!35473 () Bool)

(assert (=> d!16838 (=> (not res!44449) (not e!35473))))

(assert (=> d!16838 (= res!44449 (= (size!1146 (buf!1496 thiss!1379)) (size!1146 (buf!1496 thiss!1379))))))

(assert (=> d!16838 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35473)))

(declare-fun b!53207 () Bool)

(declare-fun res!44450 () Bool)

(assert (=> b!53207 (=> (not res!44450) (not e!35473))))

(assert (=> b!53207 (= res!44450 (bvsle (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)) (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379))))))

(declare-fun b!53208 () Bool)

(declare-fun e!35474 () Bool)

(assert (=> b!53208 (= e!35473 e!35474)))

(declare-fun res!44451 () Bool)

(assert (=> b!53208 (=> res!44451 e!35474)))

(assert (=> b!53208 (= res!44451 (= (size!1146 (buf!1496 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53209 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2512 array!2512 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53209 (= e!35474 (arrayBitRangesEq!0 (buf!1496 thiss!1379) (buf!1496 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379))))))

(assert (= (and d!16838 res!44449) b!53207))

(assert (= (and b!53207 res!44450) b!53208))

(assert (= (and b!53208 (not res!44451)) b!53209))

(assert (=> b!53207 m!83665))

(assert (=> b!53207 m!83665))

(assert (=> b!53209 m!83665))

(assert (=> b!53209 m!83665))

(declare-fun m!83743 () Bool)

(assert (=> b!53209 m!83743))

(assert (=> b!53152 d!16838))

(declare-fun d!16840 () Bool)

(assert (=> d!16840 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82405 () Unit!3699)

(declare-fun choose!11 (BitStream!1984) Unit!3699)

(assert (=> d!16840 (= lt!82405 (choose!11 thiss!1379))))

(assert (=> d!16840 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82405)))

(declare-fun bs!4273 () Bool)

(assert (= bs!4273 d!16840))

(assert (=> bs!4273 m!83661))

(declare-fun m!83745 () Bool)

(assert (=> bs!4273 m!83745))

(assert (=> b!53152 d!16840))

(declare-fun d!16842 () Bool)

(declare-fun e!35477 () Bool)

(assert (=> d!16842 e!35477))

(declare-fun res!44456 () Bool)

(assert (=> d!16842 (=> (not res!44456) (not e!35477))))

(declare-fun lt!82418 () (_ BitVec 64))

(declare-fun lt!82419 () (_ BitVec 64))

(declare-fun lt!82423 () (_ BitVec 64))

(assert (=> d!16842 (= res!44456 (= lt!82418 (bvsub lt!82423 lt!82419)))))

(assert (=> d!16842 (or (= (bvand lt!82423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82419 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82423 lt!82419) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16842 (= lt!82419 (remainingBits!0 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379))))))

(declare-fun lt!82421 () (_ BitVec 64))

(declare-fun lt!82422 () (_ BitVec 64))

(assert (=> d!16842 (= lt!82423 (bvmul lt!82421 lt!82422))))

(assert (=> d!16842 (or (= lt!82421 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!82422 (bvsdiv (bvmul lt!82421 lt!82422) lt!82421)))))

(assert (=> d!16842 (= lt!82422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16842 (= lt!82421 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))))))

(assert (=> d!16842 (= lt!82418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3057 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3052 thiss!1379))))))

(assert (=> d!16842 (invariant!0 (currentBit!3052 thiss!1379) (currentByte!3057 thiss!1379) (size!1146 (buf!1496 thiss!1379)))))

(assert (=> d!16842 (= (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)) lt!82418)))

(declare-fun b!53214 () Bool)

(declare-fun res!44457 () Bool)

(assert (=> b!53214 (=> (not res!44457) (not e!35477))))

(assert (=> b!53214 (= res!44457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82418))))

(declare-fun b!53215 () Bool)

(declare-fun lt!82420 () (_ BitVec 64))

(assert (=> b!53215 (= e!35477 (bvsle lt!82418 (bvmul lt!82420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53215 (or (= lt!82420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!82420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!82420)))))

(assert (=> b!53215 (= lt!82420 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))))))

(assert (= (and d!16842 res!44456) b!53214))

(assert (= (and b!53214 res!44457) b!53215))

(assert (=> d!16842 m!83739))

(assert (=> d!16842 m!83741))

(assert (=> b!53152 d!16842))

(declare-fun d!16844 () Bool)

(declare-fun res!44458 () Bool)

(declare-fun e!35478 () Bool)

(assert (=> d!16844 (=> (not res!44458) (not e!35478))))

(assert (=> d!16844 (= res!44458 (= (size!1146 (buf!1496 thiss!1379)) (size!1146 (buf!1496 (_2!2526 lt!82369)))))))

(assert (=> d!16844 (= (isPrefixOf!0 thiss!1379 (_2!2526 lt!82369)) e!35478)))

(declare-fun b!53216 () Bool)

(declare-fun res!44459 () Bool)

(assert (=> b!53216 (=> (not res!44459) (not e!35478))))

(assert (=> b!53216 (= res!44459 (bvsle (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)) (bitIndex!0 (size!1146 (buf!1496 (_2!2526 lt!82369))) (currentByte!3057 (_2!2526 lt!82369)) (currentBit!3052 (_2!2526 lt!82369)))))))

(declare-fun b!53217 () Bool)

(declare-fun e!35479 () Bool)

(assert (=> b!53217 (= e!35478 e!35479)))

(declare-fun res!44460 () Bool)

(assert (=> b!53217 (=> res!44460 e!35479)))

(assert (=> b!53217 (= res!44460 (= (size!1146 (buf!1496 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53218 () Bool)

(assert (=> b!53218 (= e!35479 (arrayBitRangesEq!0 (buf!1496 thiss!1379) (buf!1496 (_2!2526 lt!82369)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379))))))

(assert (= (and d!16844 res!44458) b!53216))

(assert (= (and b!53216 res!44459) b!53217))

(assert (= (and b!53217 (not res!44460)) b!53218))

(assert (=> b!53216 m!83665))

(declare-fun m!83747 () Bool)

(assert (=> b!53216 m!83747))

(assert (=> b!53218 m!83665))

(assert (=> b!53218 m!83665))

(declare-fun m!83749 () Bool)

(assert (=> b!53218 m!83749))

(assert (=> b!53150 d!16844))

(declare-fun d!16846 () Bool)

(assert (=> d!16846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 (_2!2526 lt!82369)))) ((_ sign_extend 32) (currentByte!3057 (_2!2526 lt!82369))) ((_ sign_extend 32) (currentBit!3052 (_2!2526 lt!82369))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1146 (buf!1496 (_2!2526 lt!82369)))) ((_ sign_extend 32) (currentByte!3057 (_2!2526 lt!82369))) ((_ sign_extend 32) (currentBit!3052 (_2!2526 lt!82369)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4274 () Bool)

(assert (= bs!4274 d!16846))

(declare-fun m!83751 () Bool)

(assert (=> bs!4274 m!83751))

(assert (=> b!53150 d!16846))

(declare-fun d!16848 () Bool)

(declare-fun e!35482 () Bool)

(assert (=> d!16848 e!35482))

(declare-fun res!44463 () Bool)

(assert (=> d!16848 (=> (not res!44463) (not e!35482))))

(assert (=> d!16848 (= res!44463 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!82426 () Unit!3699)

(declare-fun choose!27 (BitStream!1984 BitStream!1984 (_ BitVec 64) (_ BitVec 64)) Unit!3699)

(assert (=> d!16848 (= lt!82426 (choose!27 thiss!1379 (_2!2526 lt!82369) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16848 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16848 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2526 lt!82369) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82426)))

(declare-fun b!53221 () Bool)

(assert (=> b!53221 (= e!35482 (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 (_2!2526 lt!82369)))) ((_ sign_extend 32) (currentByte!3057 (_2!2526 lt!82369))) ((_ sign_extend 32) (currentBit!3052 (_2!2526 lt!82369))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16848 res!44463) b!53221))

(declare-fun m!83753 () Bool)

(assert (=> d!16848 m!83753))

(assert (=> b!53221 m!83655))

(assert (=> b!53150 d!16848))

(declare-fun b!53279 () Bool)

(declare-fun e!35511 () Bool)

(declare-datatypes ((tuple2!4858 0))(
  ( (tuple2!4859 (_1!2534 BitStream!1984) (_2!2534 Bool)) )
))
(declare-fun lt!82560 () tuple2!4858)

(declare-fun lt!82556 () tuple2!4842)

(assert (=> b!53279 (= e!35511 (= (bitIndex!0 (size!1146 (buf!1496 (_1!2534 lt!82560))) (currentByte!3057 (_1!2534 lt!82560)) (currentBit!3052 (_1!2534 lt!82560))) (bitIndex!0 (size!1146 (buf!1496 (_2!2526 lt!82556))) (currentByte!3057 (_2!2526 lt!82556)) (currentBit!3052 (_2!2526 lt!82556)))))))

(declare-fun b!53280 () Bool)

(declare-fun e!35512 () Bool)

(declare-fun lt!82552 () tuple2!4858)

(declare-fun lt!82557 () tuple2!4842)

(assert (=> b!53280 (= e!35512 (= (bitIndex!0 (size!1146 (buf!1496 (_1!2534 lt!82552))) (currentByte!3057 (_1!2534 lt!82552)) (currentBit!3052 (_1!2534 lt!82552))) (bitIndex!0 (size!1146 (buf!1496 (_2!2526 lt!82557))) (currentByte!3057 (_2!2526 lt!82557)) (currentBit!3052 (_2!2526 lt!82557)))))))

(declare-fun b!53281 () Bool)

(declare-fun e!35509 () Bool)

(assert (=> b!53281 (= e!35509 e!35512)))

(declare-fun res!44518 () Bool)

(assert (=> b!53281 (=> (not res!44518) (not e!35512))))

(declare-fun lt!82558 () (_ BitVec 8))

(assert (=> b!53281 (= res!44518 (and (= (_2!2534 lt!82552) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1682 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!82558)) #b00000000000000000000000000000000))) (= (_1!2534 lt!82552) (_2!2526 lt!82557))))))

(declare-datatypes ((tuple2!4860 0))(
  ( (tuple2!4861 (_1!2535 array!2512) (_2!2535 BitStream!1984)) )
))
(declare-fun lt!82562 () tuple2!4860)

(declare-fun lt!82554 () BitStream!1984)

(declare-fun readBits!0 (BitStream!1984 (_ BitVec 64)) tuple2!4860)

(assert (=> b!53281 (= lt!82562 (readBits!0 lt!82554 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1984) tuple2!4858)

(assert (=> b!53281 (= lt!82552 (readBitPure!0 lt!82554))))

(declare-fun readerFrom!0 (BitStream!1984 (_ BitVec 32) (_ BitVec 32)) BitStream!1984)

(assert (=> b!53281 (= lt!82554 (readerFrom!0 (_2!2526 lt!82557) (currentBit!3052 thiss!1379) (currentByte!3057 thiss!1379)))))

(declare-fun b!53282 () Bool)

(declare-fun res!44520 () Bool)

(declare-fun e!35510 () Bool)

(assert (=> b!53282 (=> (not res!44520) (not e!35510))))

(assert (=> b!53282 (= res!44520 (= (bitIndex!0 (size!1146 (buf!1496 (_2!2526 lt!82556))) (currentByte!3057 (_2!2526 lt!82556)) (currentBit!3052 (_2!2526 lt!82556))) (bvadd (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53283 () Bool)

(assert (=> b!53283 (= e!35510 e!35511)))

(declare-fun res!44519 () Bool)

(assert (=> b!53283 (=> (not res!44519) (not e!35511))))

(declare-fun lt!82551 () Bool)

(assert (=> b!53283 (= res!44519 (and (= (_2!2534 lt!82560) lt!82551) (= (_1!2534 lt!82560) (_2!2526 lt!82556))))))

(assert (=> b!53283 (= lt!82560 (readBitPure!0 (readerFrom!0 (_2!2526 lt!82556) (currentBit!3052 thiss!1379) (currentByte!3057 thiss!1379))))))

(declare-fun d!16850 () Bool)

(assert (=> d!16850 e!35509))

(declare-fun res!44514 () Bool)

(assert (=> d!16850 (=> (not res!44514) (not e!35509))))

(assert (=> d!16850 (= res!44514 (= (size!1146 (buf!1496 (_2!2526 lt!82557))) (size!1146 (buf!1496 thiss!1379))))))

(declare-fun lt!82555 () array!2512)

(assert (=> d!16850 (= lt!82558 (select (arr!1682 lt!82555) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16850 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1146 lt!82555)))))

(assert (=> d!16850 (= lt!82555 (array!2513 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!82553 () tuple2!4842)

(assert (=> d!16850 (= lt!82557 (tuple2!4843 (_1!2526 lt!82553) (_2!2526 lt!82553)))))

(assert (=> d!16850 (= lt!82553 lt!82556)))

(assert (=> d!16850 e!35510))

(declare-fun res!44515 () Bool)

(assert (=> d!16850 (=> (not res!44515) (not e!35510))))

(assert (=> d!16850 (= res!44515 (= (size!1146 (buf!1496 thiss!1379)) (size!1146 (buf!1496 (_2!2526 lt!82556)))))))

(declare-fun appendBit!0 (BitStream!1984 Bool) tuple2!4842)

(assert (=> d!16850 (= lt!82556 (appendBit!0 thiss!1379 lt!82551))))

(assert (=> d!16850 (= lt!82551 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1682 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16850 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16850 (= (appendBitFromByte!0 thiss!1379 (select (arr!1682 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!82557)))

(declare-fun b!53284 () Bool)

(declare-fun res!44516 () Bool)

(assert (=> b!53284 (=> (not res!44516) (not e!35510))))

(assert (=> b!53284 (= res!44516 (isPrefixOf!0 thiss!1379 (_2!2526 lt!82556)))))

(declare-fun b!53285 () Bool)

(declare-fun res!44517 () Bool)

(assert (=> b!53285 (=> (not res!44517) (not e!35509))))

(assert (=> b!53285 (= res!44517 (isPrefixOf!0 thiss!1379 (_2!2526 lt!82557)))))

(declare-fun b!53286 () Bool)

(declare-fun res!44513 () Bool)

(assert (=> b!53286 (=> (not res!44513) (not e!35509))))

(declare-fun lt!82559 () (_ BitVec 64))

(declare-fun lt!82561 () (_ BitVec 64))

(assert (=> b!53286 (= res!44513 (= (bitIndex!0 (size!1146 (buf!1496 (_2!2526 lt!82557))) (currentByte!3057 (_2!2526 lt!82557)) (currentBit!3052 (_2!2526 lt!82557))) (bvadd lt!82559 lt!82561)))))

(assert (=> b!53286 (or (not (= (bvand lt!82559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82561 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!82559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!82559 lt!82561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53286 (= lt!82561 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53286 (= lt!82559 (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)))))

(assert (= (and d!16850 res!44515) b!53282))

(assert (= (and b!53282 res!44520) b!53284))

(assert (= (and b!53284 res!44516) b!53283))

(assert (= (and b!53283 res!44519) b!53279))

(assert (= (and d!16850 res!44514) b!53286))

(assert (= (and b!53286 res!44513) b!53285))

(assert (= (and b!53285 res!44517) b!53281))

(assert (= (and b!53281 res!44518) b!53280))

(declare-fun m!83813 () Bool)

(assert (=> b!53285 m!83813))

(declare-fun m!83815 () Bool)

(assert (=> b!53286 m!83815))

(assert (=> b!53286 m!83665))

(declare-fun m!83817 () Bool)

(assert (=> b!53283 m!83817))

(assert (=> b!53283 m!83817))

(declare-fun m!83819 () Bool)

(assert (=> b!53283 m!83819))

(declare-fun m!83823 () Bool)

(assert (=> b!53279 m!83823))

(declare-fun m!83825 () Bool)

(assert (=> b!53279 m!83825))

(declare-fun m!83827 () Bool)

(assert (=> b!53284 m!83827))

(declare-fun m!83829 () Bool)

(assert (=> b!53280 m!83829))

(assert (=> b!53280 m!83815))

(declare-fun m!83831 () Bool)

(assert (=> d!16850 m!83831))

(declare-fun m!83833 () Bool)

(assert (=> d!16850 m!83833))

(declare-fun m!83835 () Bool)

(assert (=> d!16850 m!83835))

(declare-fun m!83837 () Bool)

(assert (=> b!53281 m!83837))

(declare-fun m!83839 () Bool)

(assert (=> b!53281 m!83839))

(declare-fun m!83841 () Bool)

(assert (=> b!53281 m!83841))

(assert (=> b!53282 m!83825))

(assert (=> b!53282 m!83665))

(assert (=> b!53150 d!16850))

(declare-fun b!53339 () Bool)

(declare-fun res!44564 () Bool)

(declare-fun e!35539 () Bool)

(assert (=> b!53339 (=> (not res!44564) (not e!35539))))

(declare-fun lt!82708 () tuple2!4844)

(assert (=> b!53339 (= res!44564 (isPrefixOf!0 (_2!2527 lt!82708) (_2!2526 lt!82369)))))

(declare-fun b!53340 () Bool)

(declare-fun e!35540 () Unit!3699)

(declare-fun lt!82705 () Unit!3699)

(assert (=> b!53340 (= e!35540 lt!82705)))

(declare-fun lt!82711 () (_ BitVec 64))

(assert (=> b!53340 (= lt!82711 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82720 () (_ BitVec 64))

(assert (=> b!53340 (= lt!82720 (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2512 array!2512 (_ BitVec 64) (_ BitVec 64)) Unit!3699)

(assert (=> b!53340 (= lt!82705 (arrayBitRangesEqSymmetric!0 (buf!1496 thiss!1379) (buf!1496 (_2!2526 lt!82369)) lt!82711 lt!82720))))

(assert (=> b!53340 (arrayBitRangesEq!0 (buf!1496 (_2!2526 lt!82369)) (buf!1496 thiss!1379) lt!82711 lt!82720)))

(declare-fun b!53341 () Bool)

(declare-fun Unit!3706 () Unit!3699)

(assert (=> b!53341 (= e!35540 Unit!3706)))

(declare-fun lt!82706 () (_ BitVec 64))

(declare-fun lt!82703 () (_ BitVec 64))

(declare-fun b!53342 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1984 (_ BitVec 64)) BitStream!1984)

(assert (=> b!53342 (= e!35539 (= (_1!2527 lt!82708) (withMovedBitIndex!0 (_2!2527 lt!82708) (bvsub lt!82706 lt!82703))))))

(assert (=> b!53342 (or (= (bvand lt!82706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82706 lt!82703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53342 (= lt!82703 (bitIndex!0 (size!1146 (buf!1496 (_2!2526 lt!82369))) (currentByte!3057 (_2!2526 lt!82369)) (currentBit!3052 (_2!2526 lt!82369))))))

(assert (=> b!53342 (= lt!82706 (bitIndex!0 (size!1146 (buf!1496 thiss!1379)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)))))

(declare-fun d!16872 () Bool)

(assert (=> d!16872 e!35539))

(declare-fun res!44565 () Bool)

(assert (=> d!16872 (=> (not res!44565) (not e!35539))))

(assert (=> d!16872 (= res!44565 (isPrefixOf!0 (_1!2527 lt!82708) (_2!2527 lt!82708)))))

(declare-fun lt!82707 () BitStream!1984)

(assert (=> d!16872 (= lt!82708 (tuple2!4845 lt!82707 (_2!2526 lt!82369)))))

(declare-fun lt!82712 () Unit!3699)

(declare-fun lt!82717 () Unit!3699)

(assert (=> d!16872 (= lt!82712 lt!82717)))

(assert (=> d!16872 (isPrefixOf!0 lt!82707 (_2!2526 lt!82369))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1984 BitStream!1984 BitStream!1984) Unit!3699)

(assert (=> d!16872 (= lt!82717 (lemmaIsPrefixTransitive!0 lt!82707 (_2!2526 lt!82369) (_2!2526 lt!82369)))))

(declare-fun lt!82701 () Unit!3699)

(declare-fun lt!82714 () Unit!3699)

(assert (=> d!16872 (= lt!82701 lt!82714)))

(assert (=> d!16872 (isPrefixOf!0 lt!82707 (_2!2526 lt!82369))))

(assert (=> d!16872 (= lt!82714 (lemmaIsPrefixTransitive!0 lt!82707 thiss!1379 (_2!2526 lt!82369)))))

(declare-fun lt!82709 () Unit!3699)

(assert (=> d!16872 (= lt!82709 e!35540)))

(declare-fun c!3762 () Bool)

(assert (=> d!16872 (= c!3762 (not (= (size!1146 (buf!1496 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82718 () Unit!3699)

(declare-fun lt!82702 () Unit!3699)

(assert (=> d!16872 (= lt!82718 lt!82702)))

(assert (=> d!16872 (isPrefixOf!0 (_2!2526 lt!82369) (_2!2526 lt!82369))))

(assert (=> d!16872 (= lt!82702 (lemmaIsPrefixRefl!0 (_2!2526 lt!82369)))))

(declare-fun lt!82713 () Unit!3699)

(declare-fun lt!82719 () Unit!3699)

(assert (=> d!16872 (= lt!82713 lt!82719)))

(assert (=> d!16872 (= lt!82719 (lemmaIsPrefixRefl!0 (_2!2526 lt!82369)))))

(declare-fun lt!82710 () Unit!3699)

(declare-fun lt!82704 () Unit!3699)

(assert (=> d!16872 (= lt!82710 lt!82704)))

(assert (=> d!16872 (isPrefixOf!0 lt!82707 lt!82707)))

(assert (=> d!16872 (= lt!82704 (lemmaIsPrefixRefl!0 lt!82707))))

(declare-fun lt!82716 () Unit!3699)

(declare-fun lt!82715 () Unit!3699)

(assert (=> d!16872 (= lt!82716 lt!82715)))

(assert (=> d!16872 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16872 (= lt!82715 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16872 (= lt!82707 (BitStream!1985 (buf!1496 (_2!2526 lt!82369)) (currentByte!3057 thiss!1379) (currentBit!3052 thiss!1379)))))

(assert (=> d!16872 (isPrefixOf!0 thiss!1379 (_2!2526 lt!82369))))

(assert (=> d!16872 (= (reader!0 thiss!1379 (_2!2526 lt!82369)) lt!82708)))

(declare-fun b!53343 () Bool)

(declare-fun res!44563 () Bool)

(assert (=> b!53343 (=> (not res!44563) (not e!35539))))

(assert (=> b!53343 (= res!44563 (isPrefixOf!0 (_1!2527 lt!82708) thiss!1379))))

(assert (= (and d!16872 c!3762) b!53340))

(assert (= (and d!16872 (not c!3762)) b!53341))

(assert (= (and d!16872 res!44565) b!53343))

(assert (= (and b!53343 res!44563) b!53339))

(assert (= (and b!53339 res!44564) b!53342))

(declare-fun m!83885 () Bool)

(assert (=> b!53339 m!83885))

(assert (=> b!53340 m!83665))

(declare-fun m!83887 () Bool)

(assert (=> b!53340 m!83887))

(declare-fun m!83889 () Bool)

(assert (=> b!53340 m!83889))

(declare-fun m!83891 () Bool)

(assert (=> b!53343 m!83891))

(declare-fun m!83893 () Bool)

(assert (=> b!53342 m!83893))

(assert (=> b!53342 m!83747))

(assert (=> b!53342 m!83665))

(assert (=> d!16872 m!83661))

(declare-fun m!83895 () Bool)

(assert (=> d!16872 m!83895))

(declare-fun m!83897 () Bool)

(assert (=> d!16872 m!83897))

(declare-fun m!83899 () Bool)

(assert (=> d!16872 m!83899))

(declare-fun m!83901 () Bool)

(assert (=> d!16872 m!83901))

(declare-fun m!83903 () Bool)

(assert (=> d!16872 m!83903))

(assert (=> d!16872 m!83663))

(declare-fun m!83905 () Bool)

(assert (=> d!16872 m!83905))

(assert (=> d!16872 m!83651))

(declare-fun m!83907 () Bool)

(assert (=> d!16872 m!83907))

(declare-fun m!83909 () Bool)

(assert (=> d!16872 m!83909))

(assert (=> b!53151 d!16872))

(declare-fun d!16896 () Bool)

(assert (=> d!16896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1146 (buf!1496 thiss!1379))) ((_ sign_extend 32) (currentByte!3057 thiss!1379)) ((_ sign_extend 32) (currentBit!3052 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4286 () Bool)

(assert (= bs!4286 d!16896))

(assert (=> bs!4286 m!83739))

(assert (=> b!53149 d!16896))

(push 1)

(assert (not d!16840))

(assert (not d!16846))

(assert (not d!16842))

(assert (not d!16836))

(assert (not d!16896))

(assert (not b!53207))

(assert (not b!53280))

(assert (not b!53209))

(assert (not b!53281))

(assert (not b!53340))

(assert (not b!53339))

(assert (not d!16848))

(assert (not b!53216))

(assert (not b!53285))

(assert (not d!16830))

(assert (not d!16850))

(assert (not b!53218))

(assert (not b!53221))

(assert (not b!53343))

(assert (not b!53284))

(assert (not b!53282))

(assert (not b!53342))

(assert (not d!16872))

(assert (not b!53279))

(assert (not b!53283))

(assert (not b!53286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

