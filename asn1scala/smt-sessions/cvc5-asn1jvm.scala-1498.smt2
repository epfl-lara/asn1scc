; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41426 () Bool)

(assert start!41426)

(declare-fun b!194245 () Bool)

(declare-fun e!133661 () Bool)

(declare-datatypes ((array!9995 0))(
  ( (array!9996 (arr!5338 (Array (_ BitVec 32) (_ BitVec 8))) (size!4408 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7924 0))(
  ( (BitStream!7925 (buf!4891 array!9995) (currentByte!9181 (_ BitVec 32)) (currentBit!9176 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16808 0))(
  ( (tuple2!16809 (_1!9049 BitStream!7924) (_2!9049 (_ BitVec 64))) )
))
(declare-fun lt!301945 () tuple2!16808)

(declare-datatypes ((tuple2!16810 0))(
  ( (tuple2!16811 (_1!9050 BitStream!7924) (_2!9050 BitStream!7924)) )
))
(declare-fun lt!301932 () tuple2!16810)

(assert (=> b!194245 (= e!133661 (= (_1!9049 lt!301945) (_2!9050 lt!301932)))))

(declare-fun b!194246 () Bool)

(declare-fun res!162403 () Bool)

(declare-fun e!133667 () Bool)

(assert (=> b!194246 (=> (not res!162403) (not e!133667))))

(declare-fun lt!301951 () (_ BitVec 64))

(declare-fun lt!301958 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7924 (_ BitVec 64)) BitStream!7924)

(assert (=> b!194246 (= res!162403 (= (_1!9050 lt!301932) (withMovedBitIndex!0 (_2!9050 lt!301932) (bvsub lt!301951 lt!301958))))))

(declare-fun b!194248 () Bool)

(declare-fun res!162420 () Bool)

(declare-fun e!133669 () Bool)

(assert (=> b!194248 (=> res!162420 e!133669)))

(declare-datatypes ((Unit!13732 0))(
  ( (Unit!13733) )
))
(declare-datatypes ((tuple2!16812 0))(
  ( (tuple2!16813 (_1!9051 Unit!13732) (_2!9051 BitStream!7924)) )
))
(declare-fun lt!301940 () tuple2!16812)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!194248 (= res!162420 (not (invariant!0 (currentBit!9176 (_2!9051 lt!301940)) (currentByte!9181 (_2!9051 lt!301940)) (size!4408 (buf!4891 (_2!9051 lt!301940))))))))

(declare-fun b!194249 () Bool)

(declare-fun e!133664 () Bool)

(declare-fun e!133666 () Bool)

(assert (=> b!194249 (= e!133664 e!133666)))

(declare-fun res!162424 () Bool)

(assert (=> b!194249 (=> (not res!162424) (not e!133666))))

(declare-fun thiss!1204 () BitStream!7924)

(declare-fun lt!301949 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194249 (= res!162424 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204)) lt!301949))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!194249 (= lt!301949 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!194250 () Bool)

(declare-fun e!133662 () Bool)

(assert (=> b!194250 (= e!133666 (not e!133662))))

(declare-fun res!162405 () Bool)

(assert (=> b!194250 (=> res!162405 e!133662)))

(declare-fun lt!301954 () (_ BitVec 64))

(assert (=> b!194250 (= res!162405 (not (= lt!301954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!301951))))))

(declare-fun lt!301936 () tuple2!16812)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194250 (= lt!301954 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(assert (=> b!194250 (= lt!301951 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun e!133663 () Bool)

(assert (=> b!194250 e!133663))

(declare-fun res!162407 () Bool)

(assert (=> b!194250 (=> (not res!162407) (not e!133663))))

(assert (=> b!194250 (= res!162407 (= (size!4408 (buf!4891 thiss!1204)) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(declare-fun lt!301943 () Bool)

(declare-fun appendBit!0 (BitStream!7924 Bool) tuple2!16812)

(assert (=> b!194250 (= lt!301936 (appendBit!0 thiss!1204 lt!301943))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!301956 () (_ BitVec 64))

(assert (=> b!194250 (= lt!301943 (not (= (bvand v!189 lt!301956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194250 (= lt!301956 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!194251 () Bool)

(assert (=> b!194251 (= e!133662 e!133669)))

(declare-fun res!162425 () Bool)

(assert (=> b!194251 (=> res!162425 e!133669)))

(assert (=> b!194251 (= res!162425 (not (= lt!301958 (bvsub (bvsub (bvadd lt!301954 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!194251 (= lt!301958 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301940))) (currentByte!9181 (_2!9051 lt!301940)) (currentBit!9176 (_2!9051 lt!301940))))))

(declare-fun isPrefixOf!0 (BitStream!7924 BitStream!7924) Bool)

(assert (=> b!194251 (isPrefixOf!0 thiss!1204 (_2!9051 lt!301940))))

(declare-fun lt!301946 () Unit!13732)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7924 BitStream!7924 BitStream!7924) Unit!13732)

(assert (=> b!194251 (= lt!301946 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9051 lt!301936) (_2!9051 lt!301940)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7924 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16812)

(assert (=> b!194251 (= lt!301940 (appendBitsLSBFirstLoopTR!0 (_2!9051 lt!301936) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!194252 () Bool)

(declare-fun res!162421 () Bool)

(assert (=> b!194252 (=> (not res!162421) (not e!133661))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194252 (= res!162421 (= (_2!9049 lt!301945) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!194253 () Bool)

(declare-fun res!162412 () Bool)

(assert (=> b!194253 (=> (not res!162412) (not e!133667))))

(declare-fun lt!301947 () tuple2!16810)

(assert (=> b!194253 (= res!162412 (= (_1!9050 lt!301947) (withMovedBitIndex!0 (_2!9050 lt!301947) (bvsub lt!301954 lt!301958))))))

(declare-fun b!194254 () Bool)

(declare-fun e!133670 () Bool)

(declare-datatypes ((tuple2!16814 0))(
  ( (tuple2!16815 (_1!9052 BitStream!7924) (_2!9052 Bool)) )
))
(declare-fun lt!301934 () tuple2!16814)

(declare-fun lt!301957 () tuple2!16814)

(assert (=> b!194254 (= e!133670 (= (_2!9052 lt!301934) (_2!9052 lt!301957)))))

(declare-fun b!194255 () Bool)

(declare-fun res!162423 () Bool)

(assert (=> b!194255 (=> res!162423 e!133669)))

(assert (=> b!194255 (= res!162423 (not (isPrefixOf!0 thiss!1204 (_2!9051 lt!301936))))))

(declare-fun b!194256 () Bool)

(declare-fun e!133657 () Bool)

(declare-fun lt!301941 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194256 (= e!133657 (= (bvand lt!301941 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194257 () Bool)

(declare-fun res!162416 () Bool)

(assert (=> b!194257 (=> res!162416 e!133669)))

(assert (=> b!194257 (= res!162416 (not (isPrefixOf!0 (_2!9051 lt!301936) (_2!9051 lt!301940))))))

(declare-fun res!162419 () Bool)

(assert (=> start!41426 (=> (not res!162419) (not e!133664))))

(assert (=> start!41426 (= res!162419 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41426 e!133664))

(assert (=> start!41426 true))

(declare-fun e!133656 () Bool)

(declare-fun inv!12 (BitStream!7924) Bool)

(assert (=> start!41426 (and (inv!12 thiss!1204) e!133656)))

(declare-fun b!194247 () Bool)

(declare-fun e!133655 () Bool)

(assert (=> b!194247 (= e!133669 e!133655)))

(declare-fun res!162402 () Bool)

(assert (=> b!194247 (=> res!162402 e!133655)))

(declare-fun lt!301938 () tuple2!16808)

(assert (=> b!194247 (= res!162402 (not (= (_1!9049 lt!301938) (_2!9050 lt!301947))))))

(declare-fun lt!301950 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16808)

(assert (=> b!194247 (= lt!301938 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!301947) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301950))))

(declare-fun lt!301937 () (_ BitVec 64))

(assert (=> b!194247 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!301937)))

(declare-fun lt!301939 () Unit!13732)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7924 array!9995 (_ BitVec 64)) Unit!13732)

(assert (=> b!194247 (= lt!301939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9051 lt!301936) (buf!4891 (_2!9051 lt!301940)) lt!301937))))

(assert (=> b!194247 (= lt!301937 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!301953 () tuple2!16814)

(assert (=> b!194247 (= lt!301950 (bvor lt!301941 (ite (_2!9052 lt!301953) lt!301956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194247 (= lt!301945 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!301932) nBits!348 i!590 lt!301941))))

(assert (=> b!194247 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204)) lt!301949)))

(declare-fun lt!301948 () Unit!13732)

(assert (=> b!194247 (= lt!301948 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4891 (_2!9051 lt!301940)) lt!301949))))

(assert (=> b!194247 (= lt!301941 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!194247 (= (_2!9052 lt!301953) lt!301943)))

(declare-fun readBitPure!0 (BitStream!7924) tuple2!16814)

(assert (=> b!194247 (= lt!301953 (readBitPure!0 (_1!9050 lt!301932)))))

(declare-fun reader!0 (BitStream!7924 BitStream!7924) tuple2!16810)

(assert (=> b!194247 (= lt!301947 (reader!0 (_2!9051 lt!301936) (_2!9051 lt!301940)))))

(assert (=> b!194247 (= lt!301932 (reader!0 thiss!1204 (_2!9051 lt!301940)))))

(assert (=> b!194247 e!133670))

(declare-fun res!162413 () Bool)

(assert (=> b!194247 (=> (not res!162413) (not e!133670))))

(assert (=> b!194247 (= res!162413 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!301934))) (currentByte!9181 (_1!9052 lt!301934)) (currentBit!9176 (_1!9052 lt!301934))) (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!301957))) (currentByte!9181 (_1!9052 lt!301957)) (currentBit!9176 (_1!9052 lt!301957)))))))

(declare-fun lt!301933 () Unit!13732)

(declare-fun lt!301960 () BitStream!7924)

(declare-fun readBitPrefixLemma!0 (BitStream!7924 BitStream!7924) Unit!13732)

(assert (=> b!194247 (= lt!301933 (readBitPrefixLemma!0 lt!301960 (_2!9051 lt!301940)))))

(assert (=> b!194247 (= lt!301957 (readBitPure!0 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204))))))

(assert (=> b!194247 (= lt!301934 (readBitPure!0 lt!301960))))

(declare-fun e!133659 () Bool)

(assert (=> b!194247 e!133659))

(declare-fun res!162417 () Bool)

(assert (=> b!194247 (=> (not res!162417) (not e!133659))))

(assert (=> b!194247 (= res!162417 (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(assert (=> b!194247 (= lt!301960 (BitStream!7925 (buf!4891 (_2!9051 lt!301936)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun b!194258 () Bool)

(declare-fun e!133658 () Bool)

(assert (=> b!194258 (= e!133655 e!133658)))

(declare-fun res!162414 () Bool)

(assert (=> b!194258 (=> res!162414 e!133658)))

(declare-fun lt!301935 () BitStream!7924)

(assert (=> b!194258 (= res!162414 (not (= (_1!9050 lt!301947) lt!301935)))))

(assert (=> b!194258 e!133667))

(declare-fun res!162415 () Bool)

(assert (=> b!194258 (=> (not res!162415) (not e!133667))))

(declare-fun lt!301955 () tuple2!16808)

(assert (=> b!194258 (= res!162415 (and (= (_2!9049 lt!301945) (_2!9049 lt!301955)) (= (_1!9049 lt!301945) (_1!9049 lt!301955))))))

(declare-fun lt!301959 () Unit!13732)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13732)

(assert (=> b!194258 (= lt!301959 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9050 lt!301932) nBits!348 i!590 lt!301941))))

(assert (=> b!194258 (= lt!301955 (readNBitsLSBFirstsLoopPure!0 lt!301935 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301950))))

(assert (=> b!194258 (= lt!301935 (withMovedBitIndex!0 (_1!9050 lt!301932) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!194259 () Bool)

(assert (=> b!194259 (= e!133659 (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301940)))))))

(declare-fun b!194260 () Bool)

(declare-fun e!133660 () Bool)

(declare-fun lt!301944 () tuple2!16814)

(declare-fun lt!301952 () (_ BitVec 64))

(assert (=> b!194260 (= e!133660 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!301944))) (currentByte!9181 (_1!9052 lt!301944)) (currentBit!9176 (_1!9052 lt!301944))) lt!301952))))

(declare-fun b!194261 () Bool)

(declare-fun array_inv!4149 (array!9995) Bool)

(assert (=> b!194261 (= e!133656 (array_inv!4149 (buf!4891 thiss!1204)))))

(declare-fun b!194262 () Bool)

(declare-fun res!162408 () Bool)

(assert (=> b!194262 (=> (not res!162408) (not e!133666))))

(assert (=> b!194262 (= res!162408 (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 thiss!1204))))))

(declare-fun b!194263 () Bool)

(declare-fun res!162426 () Bool)

(assert (=> b!194263 (=> res!162426 e!133669)))

(assert (=> b!194263 (= res!162426 (or (not (= (size!4408 (buf!4891 (_2!9051 lt!301940))) (size!4408 (buf!4891 thiss!1204)))) (not (= lt!301958 (bvsub (bvadd lt!301951 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!194264 () Bool)

(assert (=> b!194264 (= e!133667 (and (= lt!301951 (bvsub lt!301954 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9050 lt!301947) lt!301935)) (= (_2!9049 lt!301945) (_2!9049 lt!301938)))))))

(declare-fun b!194265 () Bool)

(declare-fun e!133665 () Bool)

(assert (=> b!194265 (= e!133665 e!133660)))

(declare-fun res!162406 () Bool)

(assert (=> b!194265 (=> (not res!162406) (not e!133660))))

(assert (=> b!194265 (= res!162406 (and (= (_2!9052 lt!301944) lt!301943) (= (_1!9052 lt!301944) (_2!9051 lt!301936))))))

(declare-fun readerFrom!0 (BitStream!7924 (_ BitVec 32) (_ BitVec 32)) BitStream!7924)

(assert (=> b!194265 (= lt!301944 (readBitPure!0 (readerFrom!0 (_2!9051 lt!301936) (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204))))))

(declare-fun b!194266 () Bool)

(assert (=> b!194266 (= e!133663 e!133665)))

(declare-fun res!162418 () Bool)

(assert (=> b!194266 (=> (not res!162418) (not e!133665))))

(declare-fun lt!301942 () (_ BitVec 64))

(assert (=> b!194266 (= res!162418 (= lt!301952 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!301942)))))

(assert (=> b!194266 (= lt!301952 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(assert (=> b!194266 (= lt!301942 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun b!194267 () Bool)

(declare-fun res!162410 () Bool)

(assert (=> b!194267 (=> res!162410 e!133658)))

(assert (=> b!194267 (= res!162410 (not (= (bitIndex!0 (size!4408 (buf!4891 (_1!9049 lt!301945))) (currentByte!9181 (_1!9049 lt!301945)) (currentBit!9176 (_1!9049 lt!301945))) (bitIndex!0 (size!4408 (buf!4891 (_2!9050 lt!301932))) (currentByte!9181 (_2!9050 lt!301932)) (currentBit!9176 (_2!9050 lt!301932))))))))

(declare-fun b!194268 () Bool)

(declare-fun res!162411 () Bool)

(assert (=> b!194268 (=> (not res!162411) (not e!133665))))

(assert (=> b!194268 (= res!162411 (isPrefixOf!0 thiss!1204 (_2!9051 lt!301936)))))

(declare-fun b!194269 () Bool)

(assert (=> b!194269 (= e!133658 e!133657)))

(declare-fun res!162422 () Bool)

(assert (=> b!194269 (=> res!162422 e!133657)))

(assert (=> b!194269 (= res!162422 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9050 lt!301932)))) ((_ sign_extend 32) (currentByte!9181 (_1!9050 lt!301932))) ((_ sign_extend 32) (currentBit!9176 (_1!9050 lt!301932))) lt!301949)))))

(assert (=> b!194269 e!133661))

(declare-fun res!162404 () Bool)

(assert (=> b!194269 (=> (not res!162404) (not e!133661))))

(assert (=> b!194269 (= res!162404 (= (size!4408 (buf!4891 thiss!1204)) (size!4408 (buf!4891 (_2!9051 lt!301940)))))))

(declare-fun b!194270 () Bool)

(declare-fun res!162409 () Bool)

(assert (=> b!194270 (=> (not res!162409) (not e!133666))))

(assert (=> b!194270 (= res!162409 (not (= i!590 nBits!348)))))

(assert (= (and start!41426 res!162419) b!194249))

(assert (= (and b!194249 res!162424) b!194262))

(assert (= (and b!194262 res!162408) b!194270))

(assert (= (and b!194270 res!162409) b!194250))

(assert (= (and b!194250 res!162407) b!194266))

(assert (= (and b!194266 res!162418) b!194268))

(assert (= (and b!194268 res!162411) b!194265))

(assert (= (and b!194265 res!162406) b!194260))

(assert (= (and b!194250 (not res!162405)) b!194251))

(assert (= (and b!194251 (not res!162425)) b!194248))

(assert (= (and b!194248 (not res!162420)) b!194263))

(assert (= (and b!194263 (not res!162426)) b!194257))

(assert (= (and b!194257 (not res!162416)) b!194255))

(assert (= (and b!194255 (not res!162423)) b!194247))

(assert (= (and b!194247 res!162417) b!194259))

(assert (= (and b!194247 res!162413) b!194254))

(assert (= (and b!194247 (not res!162402)) b!194258))

(assert (= (and b!194258 res!162415) b!194246))

(assert (= (and b!194246 res!162403) b!194253))

(assert (= (and b!194253 res!162412) b!194264))

(assert (= (and b!194258 (not res!162414)) b!194267))

(assert (= (and b!194267 (not res!162410)) b!194269))

(assert (= (and b!194269 res!162404) b!194252))

(assert (= (and b!194252 res!162421) b!194245))

(assert (= (and b!194269 (not res!162422)) b!194256))

(assert (= start!41426 b!194261))

(declare-fun m!300977 () Bool)

(assert (=> b!194266 m!300977))

(declare-fun m!300979 () Bool)

(assert (=> b!194266 m!300979))

(declare-fun m!300981 () Bool)

(assert (=> b!194258 m!300981))

(declare-fun m!300983 () Bool)

(assert (=> b!194258 m!300983))

(declare-fun m!300985 () Bool)

(assert (=> b!194258 m!300985))

(declare-fun m!300987 () Bool)

(assert (=> b!194267 m!300987))

(declare-fun m!300989 () Bool)

(assert (=> b!194267 m!300989))

(declare-fun m!300991 () Bool)

(assert (=> b!194259 m!300991))

(declare-fun m!300993 () Bool)

(assert (=> b!194247 m!300993))

(declare-fun m!300995 () Bool)

(assert (=> b!194247 m!300995))

(declare-fun m!300997 () Bool)

(assert (=> b!194247 m!300997))

(declare-fun m!300999 () Bool)

(assert (=> b!194247 m!300999))

(declare-fun m!301001 () Bool)

(assert (=> b!194247 m!301001))

(declare-fun m!301003 () Bool)

(assert (=> b!194247 m!301003))

(declare-fun m!301005 () Bool)

(assert (=> b!194247 m!301005))

(declare-fun m!301007 () Bool)

(assert (=> b!194247 m!301007))

(declare-fun m!301009 () Bool)

(assert (=> b!194247 m!301009))

(declare-fun m!301011 () Bool)

(assert (=> b!194247 m!301011))

(declare-fun m!301013 () Bool)

(assert (=> b!194247 m!301013))

(declare-fun m!301015 () Bool)

(assert (=> b!194247 m!301015))

(declare-fun m!301017 () Bool)

(assert (=> b!194247 m!301017))

(declare-fun m!301019 () Bool)

(assert (=> b!194247 m!301019))

(declare-fun m!301021 () Bool)

(assert (=> b!194247 m!301021))

(declare-fun m!301023 () Bool)

(assert (=> b!194247 m!301023))

(declare-fun m!301025 () Bool)

(assert (=> b!194260 m!301025))

(declare-fun m!301027 () Bool)

(assert (=> b!194262 m!301027))

(declare-fun m!301029 () Bool)

(assert (=> b!194251 m!301029))

(declare-fun m!301031 () Bool)

(assert (=> b!194251 m!301031))

(declare-fun m!301033 () Bool)

(assert (=> b!194251 m!301033))

(declare-fun m!301035 () Bool)

(assert (=> b!194251 m!301035))

(declare-fun m!301037 () Bool)

(assert (=> b!194268 m!301037))

(declare-fun m!301039 () Bool)

(assert (=> b!194249 m!301039))

(declare-fun m!301041 () Bool)

(assert (=> b!194246 m!301041))

(declare-fun m!301043 () Bool)

(assert (=> b!194269 m!301043))

(assert (=> b!194255 m!301037))

(declare-fun m!301045 () Bool)

(assert (=> b!194256 m!301045))

(declare-fun m!301047 () Bool)

(assert (=> b!194257 m!301047))

(declare-fun m!301049 () Bool)

(assert (=> b!194253 m!301049))

(declare-fun m!301051 () Bool)

(assert (=> start!41426 m!301051))

(declare-fun m!301053 () Bool)

(assert (=> b!194261 m!301053))

(declare-fun m!301055 () Bool)

(assert (=> b!194248 m!301055))

(declare-fun m!301057 () Bool)

(assert (=> b!194252 m!301057))

(assert (=> b!194250 m!300977))

(assert (=> b!194250 m!300979))

(declare-fun m!301059 () Bool)

(assert (=> b!194250 m!301059))

(declare-fun m!301061 () Bool)

(assert (=> b!194265 m!301061))

(assert (=> b!194265 m!301061))

(declare-fun m!301063 () Bool)

(assert (=> b!194265 m!301063))

(push 1)

(assert (not b!194255))

(assert (not b!194267))

(assert (not b!194269))

(assert (not b!194253))

(assert (not b!194266))

(assert (not b!194261))

(assert (not b!194251))

(assert (not b!194265))

(assert (not b!194258))

(assert (not b!194250))

(assert (not b!194260))

(assert (not b!194262))

(assert (not b!194257))

(assert (not b!194248))

(assert (not b!194252))

(assert (not b!194259))

(assert (not b!194268))

(assert (not b!194249))

(assert (not b!194247))

(assert (not start!41426))

(assert (not b!194246))

(assert (not b!194256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65963 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65963 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204)) lt!301949) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204))) lt!301949))))

(declare-fun bs!16400 () Bool)

(assert (= bs!16400 d!65963))

(declare-fun m!301251 () Bool)

(assert (=> bs!16400 m!301251))

(assert (=> b!194249 d!65963))

(declare-fun d!65965 () Bool)

(assert (=> d!65965 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 thiss!1204))))))

(declare-fun bs!16401 () Bool)

(assert (= bs!16401 d!65965))

(assert (=> bs!16401 m!301027))

(assert (=> start!41426 d!65965))

(declare-fun d!65967 () Bool)

(assert (=> d!65967 (= (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301940)))) (and (bvsge (currentBit!9176 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9176 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9181 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301940)))) (and (= (currentBit!9176 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301940))))))))))

(assert (=> b!194259 d!65967))

(declare-fun d!65969 () Bool)

(assert (=> d!65969 (= (invariant!0 (currentBit!9176 (_2!9051 lt!301940)) (currentByte!9181 (_2!9051 lt!301940)) (size!4408 (buf!4891 (_2!9051 lt!301940)))) (and (bvsge (currentBit!9176 (_2!9051 lt!301940)) #b00000000000000000000000000000000) (bvslt (currentBit!9176 (_2!9051 lt!301940)) #b00000000000000000000000000001000) (bvsge (currentByte!9181 (_2!9051 lt!301940)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9181 (_2!9051 lt!301940)) (size!4408 (buf!4891 (_2!9051 lt!301940)))) (and (= (currentBit!9176 (_2!9051 lt!301940)) #b00000000000000000000000000000000) (= (currentByte!9181 (_2!9051 lt!301940)) (size!4408 (buf!4891 (_2!9051 lt!301940))))))))))

(assert (=> b!194248 d!65969))

(declare-fun d!65971 () Bool)

(assert (=> d!65971 (= (array_inv!4149 (buf!4891 thiss!1204)) (bvsge (size!4408 (buf!4891 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!194261 d!65971))

(declare-fun d!65973 () Bool)

(declare-fun e!133780 () Bool)

(assert (=> d!65973 e!133780))

(declare-fun res!162599 () Bool)

(assert (=> d!65973 (=> (not res!162599) (not e!133780))))

(declare-fun lt!302171 () (_ BitVec 64))

(declare-fun lt!302168 () (_ BitVec 64))

(declare-fun lt!302173 () (_ BitVec 64))

(assert (=> d!65973 (= res!162599 (= lt!302173 (bvsub lt!302171 lt!302168)))))

(assert (=> d!65973 (or (= (bvand lt!302171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302171 lt!302168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65973 (= lt!302168 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301936)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936)))))))

(declare-fun lt!302170 () (_ BitVec 64))

(declare-fun lt!302169 () (_ BitVec 64))

(assert (=> d!65973 (= lt!302171 (bvmul lt!302170 lt!302169))))

(assert (=> d!65973 (or (= lt!302170 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302169 (bvsdiv (bvmul lt!302170 lt!302169) lt!302170)))))

(assert (=> d!65973 (= lt!302169 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65973 (= lt!302170 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(assert (=> d!65973 (= lt!302173 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936)))))))

(assert (=> d!65973 (invariant!0 (currentBit!9176 (_2!9051 lt!301936)) (currentByte!9181 (_2!9051 lt!301936)) (size!4408 (buf!4891 (_2!9051 lt!301936))))))

(assert (=> d!65973 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))) lt!302173)))

(declare-fun b!194449 () Bool)

(declare-fun res!162600 () Bool)

(assert (=> b!194449 (=> (not res!162600) (not e!133780))))

(assert (=> b!194449 (= res!162600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302173))))

(declare-fun b!194450 () Bool)

(declare-fun lt!302172 () (_ BitVec 64))

(assert (=> b!194450 (= e!133780 (bvsle lt!302173 (bvmul lt!302172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194450 (or (= lt!302172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302172)))))

(assert (=> b!194450 (= lt!302172 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(assert (= (and d!65973 res!162599) b!194449))

(assert (= (and b!194449 res!162600) b!194450))

(declare-fun m!301253 () Bool)

(assert (=> d!65973 m!301253))

(declare-fun m!301255 () Bool)

(assert (=> d!65973 m!301255))

(assert (=> b!194250 d!65973))

(declare-fun d!65975 () Bool)

(declare-fun e!133781 () Bool)

(assert (=> d!65975 e!133781))

(declare-fun res!162601 () Bool)

(assert (=> d!65975 (=> (not res!162601) (not e!133781))))

(declare-fun lt!302177 () (_ BitVec 64))

(declare-fun lt!302174 () (_ BitVec 64))

(declare-fun lt!302179 () (_ BitVec 64))

(assert (=> d!65975 (= res!162601 (= lt!302179 (bvsub lt!302177 lt!302174)))))

(assert (=> d!65975 (or (= (bvand lt!302177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302177 lt!302174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65975 (= lt!302174 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204))))))

(declare-fun lt!302176 () (_ BitVec 64))

(declare-fun lt!302175 () (_ BitVec 64))

(assert (=> d!65975 (= lt!302177 (bvmul lt!302176 lt!302175))))

(assert (=> d!65975 (or (= lt!302176 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302175 (bvsdiv (bvmul lt!302176 lt!302175) lt!302176)))))

(assert (=> d!65975 (= lt!302175 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65975 (= lt!302176 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))))))

(assert (=> d!65975 (= lt!302179 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 thiss!1204))))))

(assert (=> d!65975 (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 thiss!1204)))))

(assert (=> d!65975 (= (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)) lt!302179)))

(declare-fun b!194451 () Bool)

(declare-fun res!162602 () Bool)

(assert (=> b!194451 (=> (not res!162602) (not e!133781))))

(assert (=> b!194451 (= res!162602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302179))))

(declare-fun b!194452 () Bool)

(declare-fun lt!302178 () (_ BitVec 64))

(assert (=> b!194452 (= e!133781 (bvsle lt!302179 (bvmul lt!302178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194452 (or (= lt!302178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302178)))))

(assert (=> b!194452 (= lt!302178 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))))))

(assert (= (and d!65975 res!162601) b!194451))

(assert (= (and b!194451 res!162602) b!194452))

(assert (=> d!65975 m!301251))

(assert (=> d!65975 m!301027))

(assert (=> b!194250 d!65975))

(declare-fun b!194462 () Bool)

(declare-fun res!162612 () Bool)

(declare-fun e!133787 () Bool)

(assert (=> b!194462 (=> (not res!162612) (not e!133787))))

(declare-fun lt!302188 () tuple2!16812)

(declare-fun lt!302191 () (_ BitVec 64))

(declare-fun lt!302190 () (_ BitVec 64))

(assert (=> b!194462 (= res!162612 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302188))) (currentByte!9181 (_2!9051 lt!302188)) (currentBit!9176 (_2!9051 lt!302188))) (bvadd lt!302191 lt!302190)))))

(assert (=> b!194462 (or (not (= (bvand lt!302191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302190 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302191 lt!302190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194462 (= lt!302190 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!194462 (= lt!302191 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun b!194464 () Bool)

(declare-fun e!133786 () Bool)

(assert (=> b!194464 (= e!133787 e!133786)))

(declare-fun res!162614 () Bool)

(assert (=> b!194464 (=> (not res!162614) (not e!133786))))

(declare-fun lt!302189 () tuple2!16814)

(assert (=> b!194464 (= res!162614 (and (= (_2!9052 lt!302189) lt!301943) (= (_1!9052 lt!302189) (_2!9051 lt!302188))))))

(assert (=> b!194464 (= lt!302189 (readBitPure!0 (readerFrom!0 (_2!9051 lt!302188) (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204))))))

(declare-fun b!194465 () Bool)

(assert (=> b!194465 (= e!133786 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!302189))) (currentByte!9181 (_1!9052 lt!302189)) (currentBit!9176 (_1!9052 lt!302189))) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302188))) (currentByte!9181 (_2!9051 lt!302188)) (currentBit!9176 (_2!9051 lt!302188)))))))

(declare-fun b!194463 () Bool)

(declare-fun res!162611 () Bool)

(assert (=> b!194463 (=> (not res!162611) (not e!133787))))

(assert (=> b!194463 (= res!162611 (isPrefixOf!0 thiss!1204 (_2!9051 lt!302188)))))

(declare-fun d!65977 () Bool)

(assert (=> d!65977 e!133787))

(declare-fun res!162613 () Bool)

(assert (=> d!65977 (=> (not res!162613) (not e!133787))))

(assert (=> d!65977 (= res!162613 (= (size!4408 (buf!4891 thiss!1204)) (size!4408 (buf!4891 (_2!9051 lt!302188)))))))

(declare-fun choose!16 (BitStream!7924 Bool) tuple2!16812)

(assert (=> d!65977 (= lt!302188 (choose!16 thiss!1204 lt!301943))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65977 (validate_offset_bit!0 ((_ sign_extend 32) (size!4408 (buf!4891 thiss!1204))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204)))))

(assert (=> d!65977 (= (appendBit!0 thiss!1204 lt!301943) lt!302188)))

(assert (= (and d!65977 res!162613) b!194462))

(assert (= (and b!194462 res!162612) b!194463))

(assert (= (and b!194463 res!162611) b!194464))

(assert (= (and b!194464 res!162614) b!194465))

(declare-fun m!301257 () Bool)

(assert (=> b!194464 m!301257))

(assert (=> b!194464 m!301257))

(declare-fun m!301259 () Bool)

(assert (=> b!194464 m!301259))

(declare-fun m!301261 () Bool)

(assert (=> b!194463 m!301261))

(declare-fun m!301263 () Bool)

(assert (=> b!194465 m!301263))

(declare-fun m!301265 () Bool)

(assert (=> b!194465 m!301265))

(declare-fun m!301267 () Bool)

(assert (=> d!65977 m!301267))

(declare-fun m!301269 () Bool)

(assert (=> d!65977 m!301269))

(assert (=> b!194462 m!301265))

(assert (=> b!194462 m!300979))

(assert (=> b!194250 d!65977))

(declare-fun d!65981 () Bool)

(declare-fun e!133788 () Bool)

(assert (=> d!65981 e!133788))

(declare-fun res!162615 () Bool)

(assert (=> d!65981 (=> (not res!162615) (not e!133788))))

(declare-fun lt!302197 () (_ BitVec 64))

(declare-fun lt!302192 () (_ BitVec 64))

(declare-fun lt!302195 () (_ BitVec 64))

(assert (=> d!65981 (= res!162615 (= lt!302197 (bvsub lt!302195 lt!302192)))))

(assert (=> d!65981 (or (= (bvand lt!302195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302195 lt!302192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65981 (= lt!302192 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301944)))) ((_ sign_extend 32) (currentByte!9181 (_1!9052 lt!301944))) ((_ sign_extend 32) (currentBit!9176 (_1!9052 lt!301944)))))))

(declare-fun lt!302194 () (_ BitVec 64))

(declare-fun lt!302193 () (_ BitVec 64))

(assert (=> d!65981 (= lt!302195 (bvmul lt!302194 lt!302193))))

(assert (=> d!65981 (or (= lt!302194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302193 (bvsdiv (bvmul lt!302194 lt!302193) lt!302194)))))

(assert (=> d!65981 (= lt!302193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65981 (= lt!302194 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301944)))))))

(assert (=> d!65981 (= lt!302197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_1!9052 lt!301944))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_1!9052 lt!301944)))))))

(assert (=> d!65981 (invariant!0 (currentBit!9176 (_1!9052 lt!301944)) (currentByte!9181 (_1!9052 lt!301944)) (size!4408 (buf!4891 (_1!9052 lt!301944))))))

(assert (=> d!65981 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!301944))) (currentByte!9181 (_1!9052 lt!301944)) (currentBit!9176 (_1!9052 lt!301944))) lt!302197)))

(declare-fun b!194466 () Bool)

(declare-fun res!162616 () Bool)

(assert (=> b!194466 (=> (not res!162616) (not e!133788))))

(assert (=> b!194466 (= res!162616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302197))))

(declare-fun b!194467 () Bool)

(declare-fun lt!302196 () (_ BitVec 64))

(assert (=> b!194467 (= e!133788 (bvsle lt!302197 (bvmul lt!302196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194467 (or (= lt!302196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302196)))))

(assert (=> b!194467 (= lt!302196 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301944)))))))

(assert (= (and d!65981 res!162615) b!194466))

(assert (= (and b!194466 res!162616) b!194467))

(declare-fun m!301271 () Bool)

(assert (=> d!65981 m!301271))

(declare-fun m!301273 () Bool)

(assert (=> d!65981 m!301273))

(assert (=> b!194260 d!65981))

(declare-fun d!65983 () Bool)

(assert (=> d!65983 (= (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 thiss!1204))) (and (bvsge (currentBit!9176 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9176 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9181 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9181 thiss!1204) (size!4408 (buf!4891 thiss!1204))) (and (= (currentBit!9176 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9181 thiss!1204) (size!4408 (buf!4891 thiss!1204)))))))))

(assert (=> b!194262 d!65983))

(declare-fun d!65985 () Bool)

(declare-fun e!133789 () Bool)

(assert (=> d!65985 e!133789))

(declare-fun res!162617 () Bool)

(assert (=> d!65985 (=> (not res!162617) (not e!133789))))

(declare-fun lt!302203 () (_ BitVec 64))

(declare-fun lt!302198 () (_ BitVec 64))

(declare-fun lt!302201 () (_ BitVec 64))

(assert (=> d!65985 (= res!162617 (= lt!302203 (bvsub lt!302201 lt!302198)))))

(assert (=> d!65985 (or (= (bvand lt!302201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302201 lt!302198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65985 (= lt!302198 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301940))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301940)))))))

(declare-fun lt!302200 () (_ BitVec 64))

(declare-fun lt!302199 () (_ BitVec 64))

(assert (=> d!65985 (= lt!302201 (bvmul lt!302200 lt!302199))))

(assert (=> d!65985 (or (= lt!302200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302199 (bvsdiv (bvmul lt!302200 lt!302199) lt!302200)))))

(assert (=> d!65985 (= lt!302199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65985 (= lt!302200 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))))))

(assert (=> d!65985 (= lt!302203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301940))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301940)))))))

(assert (=> d!65985 (invariant!0 (currentBit!9176 (_2!9051 lt!301940)) (currentByte!9181 (_2!9051 lt!301940)) (size!4408 (buf!4891 (_2!9051 lt!301940))))))

(assert (=> d!65985 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301940))) (currentByte!9181 (_2!9051 lt!301940)) (currentBit!9176 (_2!9051 lt!301940))) lt!302203)))

(declare-fun b!194468 () Bool)

(declare-fun res!162618 () Bool)

(assert (=> b!194468 (=> (not res!162618) (not e!133789))))

(assert (=> b!194468 (= res!162618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302203))))

(declare-fun b!194469 () Bool)

(declare-fun lt!302202 () (_ BitVec 64))

(assert (=> b!194469 (= e!133789 (bvsle lt!302203 (bvmul lt!302202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194469 (or (= lt!302202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302202)))))

(assert (=> b!194469 (= lt!302202 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))))))

(assert (= (and d!65985 res!162617) b!194468))

(assert (= (and b!194468 res!162618) b!194469))

(declare-fun m!301275 () Bool)

(assert (=> d!65985 m!301275))

(assert (=> d!65985 m!301055))

(assert (=> b!194251 d!65985))

(declare-fun d!65987 () Bool)

(declare-fun res!162627 () Bool)

(declare-fun e!133795 () Bool)

(assert (=> d!65987 (=> (not res!162627) (not e!133795))))

(assert (=> d!65987 (= res!162627 (= (size!4408 (buf!4891 thiss!1204)) (size!4408 (buf!4891 (_2!9051 lt!301940)))))))

(assert (=> d!65987 (= (isPrefixOf!0 thiss!1204 (_2!9051 lt!301940)) e!133795)))

(declare-fun b!194476 () Bool)

(declare-fun res!162625 () Bool)

(assert (=> b!194476 (=> (not res!162625) (not e!133795))))

(assert (=> b!194476 (= res!162625 (bvsle (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301940))) (currentByte!9181 (_2!9051 lt!301940)) (currentBit!9176 (_2!9051 lt!301940)))))))

(declare-fun b!194477 () Bool)

(declare-fun e!133794 () Bool)

(assert (=> b!194477 (= e!133795 e!133794)))

(declare-fun res!162626 () Bool)

(assert (=> b!194477 (=> res!162626 e!133794)))

(assert (=> b!194477 (= res!162626 (= (size!4408 (buf!4891 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194478 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9995 array!9995 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194478 (= e!133794 (arrayBitRangesEq!0 (buf!4891 thiss!1204) (buf!4891 (_2!9051 lt!301940)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204))))))

(assert (= (and d!65987 res!162627) b!194476))

(assert (= (and b!194476 res!162625) b!194477))

(assert (= (and b!194477 (not res!162626)) b!194478))

(assert (=> b!194476 m!300979))

(assert (=> b!194476 m!301029))

(assert (=> b!194478 m!300979))

(assert (=> b!194478 m!300979))

(declare-fun m!301277 () Bool)

(assert (=> b!194478 m!301277))

(assert (=> b!194251 d!65987))

(declare-fun d!65989 () Bool)

(assert (=> d!65989 (isPrefixOf!0 thiss!1204 (_2!9051 lt!301940))))

(declare-fun lt!302218 () Unit!13732)

(declare-fun choose!30 (BitStream!7924 BitStream!7924 BitStream!7924) Unit!13732)

(assert (=> d!65989 (= lt!302218 (choose!30 thiss!1204 (_2!9051 lt!301936) (_2!9051 lt!301940)))))

(assert (=> d!65989 (isPrefixOf!0 thiss!1204 (_2!9051 lt!301936))))

(assert (=> d!65989 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9051 lt!301936) (_2!9051 lt!301940)) lt!302218)))

(declare-fun bs!16402 () Bool)

(assert (= bs!16402 d!65989))

(assert (=> bs!16402 m!301031))

(declare-fun m!301279 () Bool)

(assert (=> bs!16402 m!301279))

(assert (=> bs!16402 m!301037))

(assert (=> b!194251 d!65989))

(declare-fun b!194561 () Bool)

(declare-fun e!133845 () Bool)

(declare-fun lt!302476 () tuple2!16814)

(declare-fun lt!302512 () tuple2!16814)

(assert (=> b!194561 (= e!133845 (= (_2!9052 lt!302476) (_2!9052 lt!302512)))))

(declare-fun b!194562 () Bool)

(declare-fun lt!302474 () tuple2!16814)

(declare-fun lt!302483 () tuple2!16812)

(assert (=> b!194562 (= lt!302474 (readBitPure!0 (readerFrom!0 (_2!9051 lt!302483) (currentBit!9176 (_2!9051 lt!301936)) (currentByte!9181 (_2!9051 lt!301936)))))))

(declare-fun lt!302486 () Bool)

(declare-fun res!162703 () Bool)

(assert (=> b!194562 (= res!162703 (and (= (_2!9052 lt!302474) lt!302486) (= (_1!9052 lt!302474) (_2!9051 lt!302483))))))

(declare-fun e!133848 () Bool)

(assert (=> b!194562 (=> (not res!162703) (not e!133848))))

(declare-fun e!133843 () Bool)

(assert (=> b!194562 (= e!133843 e!133848)))

(declare-fun b!194563 () Bool)

(assert (=> b!194563 (= e!133848 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!302474))) (currentByte!9181 (_1!9052 lt!302474)) (currentBit!9176 (_1!9052 lt!302474))) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302483))) (currentByte!9181 (_2!9051 lt!302483)) (currentBit!9176 (_2!9051 lt!302483)))))))

(declare-fun b!194564 () Bool)

(declare-fun res!162695 () Bool)

(declare-fun e!133849 () Bool)

(assert (=> b!194564 (=> (not res!162695) (not e!133849))))

(declare-fun lt!302467 () (_ BitVec 64))

(declare-fun lt!302472 () tuple2!16812)

(declare-fun lt!302459 () (_ BitVec 64))

(assert (=> b!194564 (= res!162695 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302472))) (currentByte!9181 (_2!9051 lt!302472)) (currentBit!9176 (_2!9051 lt!302472))) (bvsub lt!302459 lt!302467)))))

(assert (=> b!194564 (or (= (bvand lt!302459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302459 lt!302467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194564 (= lt!302467 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!302495 () (_ BitVec 64))

(declare-fun lt!302464 () (_ BitVec 64))

(assert (=> b!194564 (= lt!302459 (bvadd lt!302495 lt!302464))))

(assert (=> b!194564 (or (not (= (bvand lt!302495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302464 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302495 lt!302464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194564 (= lt!302464 ((_ sign_extend 32) nBits!348))))

(assert (=> b!194564 (= lt!302495 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(declare-fun b!194565 () Bool)

(declare-fun e!133846 () Bool)

(declare-fun lt!302458 () tuple2!16808)

(declare-fun lt!302498 () tuple2!16810)

(assert (=> b!194565 (= e!133846 (= (_1!9049 lt!302458) (_2!9050 lt!302498)))))

(declare-fun b!194566 () Bool)

(declare-fun e!133847 () Bool)

(declare-fun lt!302487 () tuple2!16808)

(declare-fun lt!302478 () tuple2!16810)

(assert (=> b!194566 (= e!133847 (= (_1!9049 lt!302487) (_2!9050 lt!302478)))))

(declare-fun b!194567 () Bool)

(declare-fun e!133850 () tuple2!16812)

(declare-fun Unit!13738 () Unit!13732)

(assert (=> b!194567 (= e!133850 (tuple2!16813 Unit!13738 (_2!9051 lt!301936)))))

(declare-fun lt!302497 () Unit!13732)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7924) Unit!13732)

(assert (=> b!194567 (= lt!302497 (lemmaIsPrefixRefl!0 (_2!9051 lt!301936)))))

(declare-fun call!3061 () Bool)

(assert (=> b!194567 call!3061))

(declare-fun lt!302505 () Unit!13732)

(assert (=> b!194567 (= lt!302505 lt!302497)))

(declare-fun b!194568 () Bool)

(assert (=> b!194568 (= e!133849 e!133846)))

(declare-fun res!162702 () Bool)

(assert (=> b!194568 (=> (not res!162702) (not e!133846))))

(assert (=> b!194568 (= res!162702 (= (_2!9049 lt!302458) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194568 (= lt!302458 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!302498) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!302462 () Unit!13732)

(declare-fun lt!302507 () Unit!13732)

(assert (=> b!194568 (= lt!302462 lt!302507)))

(declare-fun lt!302501 () (_ BitVec 64))

(assert (=> b!194568 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!302472)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!302501)))

(assert (=> b!194568 (= lt!302507 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9051 lt!301936) (buf!4891 (_2!9051 lt!302472)) lt!302501))))

(declare-fun e!133844 () Bool)

(assert (=> b!194568 e!133844))

(declare-fun res!162693 () Bool)

(assert (=> b!194568 (=> (not res!162693) (not e!133844))))

(assert (=> b!194568 (= res!162693 (and (= (size!4408 (buf!4891 (_2!9051 lt!301936))) (size!4408 (buf!4891 (_2!9051 lt!302472)))) (bvsge lt!302501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194568 (= lt!302501 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!194568 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!194568 (= lt!302498 (reader!0 (_2!9051 lt!301936) (_2!9051 lt!302472)))))

(declare-fun b!194569 () Bool)

(declare-fun res!162699 () Bool)

(assert (=> b!194569 (= res!162699 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302483))) (currentByte!9181 (_2!9051 lt!302483)) (currentBit!9176 (_2!9051 lt!302483))) (bvadd (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!194569 (=> (not res!162699) (not e!133843))))

(declare-fun b!194570 () Bool)

(declare-fun e!133842 () (_ BitVec 64))

(assert (=> b!194570 (= e!133842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!194571 () Bool)

(assert (=> b!194571 (= e!133844 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301936)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!302501))))

(declare-fun bm!3058 () Bool)

(declare-fun c!9718 () Bool)

(assert (=> bm!3058 (= call!3061 (isPrefixOf!0 (_2!9051 lt!301936) (ite c!9718 (_2!9051 lt!301936) (_2!9051 lt!302483))))))

(declare-fun d!65991 () Bool)

(assert (=> d!65991 e!133849))

(declare-fun res!162701 () Bool)

(assert (=> d!65991 (=> (not res!162701) (not e!133849))))

(assert (=> d!65991 (= res!162701 (invariant!0 (currentBit!9176 (_2!9051 lt!302472)) (currentByte!9181 (_2!9051 lt!302472)) (size!4408 (buf!4891 (_2!9051 lt!302472)))))))

(assert (=> d!65991 (= lt!302472 e!133850)))

(assert (=> d!65991 (= c!9718 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65991 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65991 (= (appendBitsLSBFirstLoopTR!0 (_2!9051 lt!301936) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!302472)))

(declare-fun b!194560 () Bool)

(declare-fun res!162697 () Bool)

(assert (=> b!194560 (=> (not res!162697) (not e!133849))))

(assert (=> b!194560 (= res!162697 (= (size!4408 (buf!4891 (_2!9051 lt!301936))) (size!4408 (buf!4891 (_2!9051 lt!302472)))))))

(declare-fun b!194572 () Bool)

(assert (=> b!194572 (= e!133842 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!194573 () Bool)

(declare-fun lt!302479 () tuple2!16812)

(assert (=> b!194573 (= e!133850 (tuple2!16813 (_1!9051 lt!302479) (_2!9051 lt!302479)))))

(assert (=> b!194573 (= lt!302486 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194573 (= lt!302483 (appendBit!0 (_2!9051 lt!301936) lt!302486))))

(declare-fun res!162694 () Bool)

(assert (=> b!194573 (= res!162694 (= (size!4408 (buf!4891 (_2!9051 lt!301936))) (size!4408 (buf!4891 (_2!9051 lt!302483)))))))

(assert (=> b!194573 (=> (not res!162694) (not e!133843))))

(assert (=> b!194573 e!133843))

(declare-fun lt!302466 () tuple2!16812)

(assert (=> b!194573 (= lt!302466 lt!302483)))

(assert (=> b!194573 (= lt!302479 (appendBitsLSBFirstLoopTR!0 (_2!9051 lt!302466) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!302510 () Unit!13732)

(assert (=> b!194573 (= lt!302510 (lemmaIsPrefixTransitive!0 (_2!9051 lt!301936) (_2!9051 lt!302466) (_2!9051 lt!302479)))))

(assert (=> b!194573 (isPrefixOf!0 (_2!9051 lt!301936) (_2!9051 lt!302479))))

(declare-fun lt!302488 () Unit!13732)

(assert (=> b!194573 (= lt!302488 lt!302510)))

(assert (=> b!194573 (invariant!0 (currentBit!9176 (_2!9051 lt!301936)) (currentByte!9181 (_2!9051 lt!301936)) (size!4408 (buf!4891 (_2!9051 lt!302466))))))

(declare-fun lt!302473 () BitStream!7924)

(assert (=> b!194573 (= lt!302473 (BitStream!7925 (buf!4891 (_2!9051 lt!302466)) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(assert (=> b!194573 (invariant!0 (currentBit!9176 lt!302473) (currentByte!9181 lt!302473) (size!4408 (buf!4891 (_2!9051 lt!302479))))))

(declare-fun lt!302461 () BitStream!7924)

(assert (=> b!194573 (= lt!302461 (BitStream!7925 (buf!4891 (_2!9051 lt!302479)) (currentByte!9181 lt!302473) (currentBit!9176 lt!302473)))))

(assert (=> b!194573 (= lt!302476 (readBitPure!0 lt!302473))))

(assert (=> b!194573 (= lt!302512 (readBitPure!0 lt!302461))))

(declare-fun lt!302463 () Unit!13732)

(assert (=> b!194573 (= lt!302463 (readBitPrefixLemma!0 lt!302473 (_2!9051 lt!302479)))))

(declare-fun res!162698 () Bool)

(assert (=> b!194573 (= res!162698 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!302476))) (currentByte!9181 (_1!9052 lt!302476)) (currentBit!9176 (_1!9052 lt!302476))) (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!302512))) (currentByte!9181 (_1!9052 lt!302512)) (currentBit!9176 (_1!9052 lt!302512)))))))

(assert (=> b!194573 (=> (not res!162698) (not e!133845))))

(assert (=> b!194573 e!133845))

(declare-fun lt!302480 () Unit!13732)

(assert (=> b!194573 (= lt!302480 lt!302463)))

(declare-fun lt!302460 () tuple2!16810)

(assert (=> b!194573 (= lt!302460 (reader!0 (_2!9051 lt!301936) (_2!9051 lt!302479)))))

(declare-fun lt!302493 () tuple2!16810)

(assert (=> b!194573 (= lt!302493 (reader!0 (_2!9051 lt!302466) (_2!9051 lt!302479)))))

(declare-fun lt!302465 () tuple2!16814)

(assert (=> b!194573 (= lt!302465 (readBitPure!0 (_1!9050 lt!302460)))))

(assert (=> b!194573 (= (_2!9052 lt!302465) lt!302486)))

(declare-fun lt!302482 () Unit!13732)

(declare-fun Unit!13739 () Unit!13732)

(assert (=> b!194573 (= lt!302482 Unit!13739)))

(declare-fun lt!302491 () (_ BitVec 64))

(assert (=> b!194573 (= lt!302491 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302471 () (_ BitVec 64))

(assert (=> b!194573 (= lt!302471 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302509 () Unit!13732)

(assert (=> b!194573 (= lt!302509 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9051 lt!301936) (buf!4891 (_2!9051 lt!302479)) lt!302471))))

(assert (=> b!194573 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!302479)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!302471)))

(declare-fun lt!302481 () Unit!13732)

(assert (=> b!194573 (= lt!302481 lt!302509)))

(declare-fun lt!302499 () tuple2!16808)

(assert (=> b!194573 (= lt!302499 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!302460) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302491))))

(declare-fun lt!302500 () (_ BitVec 64))

(assert (=> b!194573 (= lt!302500 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!302477 () Unit!13732)

(assert (=> b!194573 (= lt!302477 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9051 lt!302466) (buf!4891 (_2!9051 lt!302479)) lt!302500))))

(assert (=> b!194573 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!302479)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!302466))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!302466))) lt!302500)))

(declare-fun lt!302489 () Unit!13732)

(assert (=> b!194573 (= lt!302489 lt!302477)))

(declare-fun lt!302504 () tuple2!16808)

(assert (=> b!194573 (= lt!302504 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!302493) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!302491 (ite (_2!9052 lt!302465) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!302469 () tuple2!16808)

(assert (=> b!194573 (= lt!302469 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!302460) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302491))))

(declare-fun c!9719 () Bool)

(assert (=> b!194573 (= c!9719 (_2!9052 (readBitPure!0 (_1!9050 lt!302460))))))

(declare-fun lt!302490 () tuple2!16808)

(assert (=> b!194573 (= lt!302490 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9050 lt!302460) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!302491 e!133842)))))

(declare-fun lt!302503 () Unit!13732)

(assert (=> b!194573 (= lt!302503 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9050 lt!302460) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302491))))

(assert (=> b!194573 (and (= (_2!9049 lt!302469) (_2!9049 lt!302490)) (= (_1!9049 lt!302469) (_1!9049 lt!302490)))))

(declare-fun lt!302494 () Unit!13732)

(assert (=> b!194573 (= lt!302494 lt!302503)))

(assert (=> b!194573 (= (_1!9050 lt!302460) (withMovedBitIndex!0 (_2!9050 lt!302460) (bvsub (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302479))) (currentByte!9181 (_2!9051 lt!302479)) (currentBit!9176 (_2!9051 lt!302479))))))))

(declare-fun lt!302513 () Unit!13732)

(declare-fun Unit!13741 () Unit!13732)

(assert (=> b!194573 (= lt!302513 Unit!13741)))

(assert (=> b!194573 (= (_1!9050 lt!302493) (withMovedBitIndex!0 (_2!9050 lt!302493) (bvsub (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302466))) (currentByte!9181 (_2!9051 lt!302466)) (currentBit!9176 (_2!9051 lt!302466))) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302479))) (currentByte!9181 (_2!9051 lt!302479)) (currentBit!9176 (_2!9051 lt!302479))))))))

(declare-fun lt!302492 () Unit!13732)

(declare-fun Unit!13742 () Unit!13732)

(assert (=> b!194573 (= lt!302492 Unit!13742)))

(assert (=> b!194573 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))) (bvsub (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302466))) (currentByte!9181 (_2!9051 lt!302466)) (currentBit!9176 (_2!9051 lt!302466))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!302496 () Unit!13732)

(declare-fun Unit!13743 () Unit!13732)

(assert (=> b!194573 (= lt!302496 Unit!13743)))

(assert (=> b!194573 (= (_2!9049 lt!302499) (_2!9049 lt!302504))))

(declare-fun lt!302468 () Unit!13732)

(declare-fun Unit!13744 () Unit!13732)

(assert (=> b!194573 (= lt!302468 Unit!13744)))

(assert (=> b!194573 (invariant!0 (currentBit!9176 (_2!9051 lt!302479)) (currentByte!9181 (_2!9051 lt!302479)) (size!4408 (buf!4891 (_2!9051 lt!302479))))))

(declare-fun lt!302506 () Unit!13732)

(declare-fun Unit!13745 () Unit!13732)

(assert (=> b!194573 (= lt!302506 Unit!13745)))

(assert (=> b!194573 (= (size!4408 (buf!4891 (_2!9051 lt!301936))) (size!4408 (buf!4891 (_2!9051 lt!302479))))))

(declare-fun lt!302475 () Unit!13732)

(declare-fun Unit!13746 () Unit!13732)

(assert (=> b!194573 (= lt!302475 Unit!13746)))

(assert (=> b!194573 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!302479))) (currentByte!9181 (_2!9051 lt!302479)) (currentBit!9176 (_2!9051 lt!302479))) (bvsub (bvadd (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302508 () Unit!13732)

(declare-fun Unit!13747 () Unit!13732)

(assert (=> b!194573 (= lt!302508 Unit!13747)))

(declare-fun lt!302511 () Unit!13732)

(declare-fun Unit!13748 () Unit!13732)

(assert (=> b!194573 (= lt!302511 Unit!13748)))

(assert (=> b!194573 (= lt!302478 (reader!0 (_2!9051 lt!301936) (_2!9051 lt!302479)))))

(declare-fun lt!302484 () (_ BitVec 64))

(assert (=> b!194573 (= lt!302484 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302470 () Unit!13732)

(assert (=> b!194573 (= lt!302470 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9051 lt!301936) (buf!4891 (_2!9051 lt!302479)) lt!302484))))

(assert (=> b!194573 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!302479)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!302484)))

(declare-fun lt!302502 () Unit!13732)

(assert (=> b!194573 (= lt!302502 lt!302470)))

(assert (=> b!194573 (= lt!302487 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!302478) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!162700 () Bool)

(assert (=> b!194573 (= res!162700 (= (_2!9049 lt!302487) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194573 (=> (not res!162700) (not e!133847))))

(assert (=> b!194573 e!133847))

(declare-fun lt!302485 () Unit!13732)

(declare-fun Unit!13749 () Unit!13732)

(assert (=> b!194573 (= lt!302485 Unit!13749)))

(declare-fun b!194574 () Bool)

(declare-fun res!162696 () Bool)

(assert (=> b!194574 (=> (not res!162696) (not e!133849))))

(assert (=> b!194574 (= res!162696 (isPrefixOf!0 (_2!9051 lt!301936) (_2!9051 lt!302472)))))

(declare-fun b!194575 () Bool)

(declare-fun res!162704 () Bool)

(assert (=> b!194575 (= res!162704 call!3061)))

(assert (=> b!194575 (=> (not res!162704) (not e!133843))))

(assert (= (and d!65991 c!9718) b!194567))

(assert (= (and d!65991 (not c!9718)) b!194573))

(assert (= (and b!194573 res!162694) b!194569))

(assert (= (and b!194569 res!162699) b!194575))

(assert (= (and b!194575 res!162704) b!194562))

(assert (= (and b!194562 res!162703) b!194563))

(assert (= (and b!194573 res!162698) b!194561))

(assert (= (and b!194573 c!9719) b!194572))

(assert (= (and b!194573 (not c!9719)) b!194570))

(assert (= (and b!194573 res!162700) b!194566))

(assert (= (or b!194567 b!194575) bm!3058))

(assert (= (and d!65991 res!162701) b!194560))

(assert (= (and b!194560 res!162697) b!194564))

(assert (= (and b!194564 res!162695) b!194574))

(assert (= (and b!194574 res!162696) b!194568))

(assert (= (and b!194568 res!162693) b!194571))

(assert (= (and b!194568 res!162702) b!194565))

(declare-fun m!301291 () Bool)

(assert (=> b!194569 m!301291))

(assert (=> b!194569 m!300977))

(declare-fun m!301293 () Bool)

(assert (=> d!65991 m!301293))

(declare-fun m!301295 () Bool)

(assert (=> b!194567 m!301295))

(declare-fun m!301297 () Bool)

(assert (=> b!194563 m!301297))

(assert (=> b!194563 m!301291))

(declare-fun m!301299 () Bool)

(assert (=> b!194564 m!301299))

(assert (=> b!194564 m!300977))

(declare-fun m!301301 () Bool)

(assert (=> b!194568 m!301301))

(declare-fun m!301303 () Bool)

(assert (=> b!194568 m!301303))

(declare-fun m!301305 () Bool)

(assert (=> b!194568 m!301305))

(declare-fun m!301307 () Bool)

(assert (=> b!194568 m!301307))

(declare-fun m!301309 () Bool)

(assert (=> b!194568 m!301309))

(assert (=> b!194568 m!301057))

(declare-fun m!301311 () Bool)

(assert (=> b!194573 m!301311))

(declare-fun m!301313 () Bool)

(assert (=> b!194573 m!301313))

(declare-fun m!301315 () Bool)

(assert (=> b!194573 m!301315))

(declare-fun m!301317 () Bool)

(assert (=> b!194573 m!301317))

(declare-fun m!301319 () Bool)

(assert (=> b!194573 m!301319))

(declare-fun m!301321 () Bool)

(assert (=> b!194573 m!301321))

(declare-fun m!301323 () Bool)

(assert (=> b!194573 m!301323))

(declare-fun m!301325 () Bool)

(assert (=> b!194573 m!301325))

(declare-fun m!301327 () Bool)

(assert (=> b!194573 m!301327))

(declare-fun m!301329 () Bool)

(assert (=> b!194573 m!301329))

(declare-fun m!301331 () Bool)

(assert (=> b!194573 m!301331))

(declare-fun m!301333 () Bool)

(assert (=> b!194573 m!301333))

(declare-fun m!301335 () Bool)

(assert (=> b!194573 m!301335))

(declare-fun m!301337 () Bool)

(assert (=> b!194573 m!301337))

(declare-fun m!301339 () Bool)

(assert (=> b!194573 m!301339))

(declare-fun m!301341 () Bool)

(assert (=> b!194573 m!301341))

(assert (=> b!194573 m!301301))

(declare-fun m!301343 () Bool)

(assert (=> b!194573 m!301343))

(declare-fun m!301345 () Bool)

(assert (=> b!194573 m!301345))

(assert (=> b!194573 m!300977))

(declare-fun m!301347 () Bool)

(assert (=> b!194573 m!301347))

(declare-fun m!301349 () Bool)

(assert (=> b!194573 m!301349))

(declare-fun m!301351 () Bool)

(assert (=> b!194573 m!301351))

(declare-fun m!301353 () Bool)

(assert (=> b!194573 m!301353))

(declare-fun m!301355 () Bool)

(assert (=> b!194573 m!301355))

(declare-fun m!301357 () Bool)

(assert (=> b!194573 m!301357))

(declare-fun m!301359 () Bool)

(assert (=> b!194573 m!301359))

(declare-fun m!301361 () Bool)

(assert (=> b!194573 m!301361))

(declare-fun m!301363 () Bool)

(assert (=> b!194573 m!301363))

(declare-fun m!301365 () Bool)

(assert (=> b!194573 m!301365))

(declare-fun m!301367 () Bool)

(assert (=> b!194573 m!301367))

(assert (=> b!194573 m!301057))

(assert (=> b!194573 m!301341))

(declare-fun m!301369 () Bool)

(assert (=> b!194573 m!301369))

(declare-fun m!301371 () Bool)

(assert (=> b!194573 m!301371))

(declare-fun m!301373 () Bool)

(assert (=> b!194571 m!301373))

(declare-fun m!301375 () Bool)

(assert (=> bm!3058 m!301375))

(declare-fun m!301377 () Bool)

(assert (=> b!194574 m!301377))

(declare-fun m!301379 () Bool)

(assert (=> b!194562 m!301379))

(assert (=> b!194562 m!301379))

(declare-fun m!301381 () Bool)

(assert (=> b!194562 m!301381))

(assert (=> b!194251 d!65991))

(declare-fun d!66001 () Bool)

(declare-fun e!133862 () Bool)

(assert (=> d!66001 e!133862))

(declare-fun res!162719 () Bool)

(assert (=> d!66001 (=> (not res!162719) (not e!133862))))

(declare-fun lt!302575 () (_ BitVec 64))

(declare-fun lt!302574 () BitStream!7924)

(assert (=> d!66001 (= res!162719 (= (bvadd lt!302575 (bvsub lt!301954 lt!301958)) (bitIndex!0 (size!4408 (buf!4891 lt!302574)) (currentByte!9181 lt!302574) (currentBit!9176 lt!302574))))))

(assert (=> d!66001 (or (not (= (bvand lt!302575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301954 lt!301958) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302575 (bvsub lt!301954 lt!301958)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66001 (= lt!302575 (bitIndex!0 (size!4408 (buf!4891 (_2!9050 lt!301947))) (currentByte!9181 (_2!9050 lt!301947)) (currentBit!9176 (_2!9050 lt!301947))))))

(declare-fun moveBitIndex!0 (BitStream!7924 (_ BitVec 64)) tuple2!16812)

(assert (=> d!66001 (= lt!302574 (_2!9051 (moveBitIndex!0 (_2!9050 lt!301947) (bvsub lt!301954 lt!301958))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7924 (_ BitVec 64)) Bool)

(assert (=> d!66001 (moveBitIndexPrecond!0 (_2!9050 lt!301947) (bvsub lt!301954 lt!301958))))

(assert (=> d!66001 (= (withMovedBitIndex!0 (_2!9050 lt!301947) (bvsub lt!301954 lt!301958)) lt!302574)))

(declare-fun b!194594 () Bool)

(assert (=> b!194594 (= e!133862 (= (size!4408 (buf!4891 (_2!9050 lt!301947))) (size!4408 (buf!4891 lt!302574))))))

(assert (= (and d!66001 res!162719) b!194594))

(declare-fun m!301475 () Bool)

(assert (=> d!66001 m!301475))

(declare-fun m!301477 () Bool)

(assert (=> d!66001 m!301477))

(declare-fun m!301479 () Bool)

(assert (=> d!66001 m!301479))

(declare-fun m!301481 () Bool)

(assert (=> d!66001 m!301481))

(assert (=> b!194253 d!66001))

(declare-fun d!66007 () Bool)

(assert (=> d!66007 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!194252 d!66007))

(declare-fun d!66009 () Bool)

(declare-datatypes ((tuple2!16832 0))(
  ( (tuple2!16833 (_1!9061 Bool) (_2!9061 BitStream!7924)) )
))
(declare-fun lt!302578 () tuple2!16832)

(declare-fun readBit!0 (BitStream!7924) tuple2!16832)

(assert (=> d!66009 (= lt!302578 (readBit!0 (readerFrom!0 (_2!9051 lt!301936) (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204))))))

(assert (=> d!66009 (= (readBitPure!0 (readerFrom!0 (_2!9051 lt!301936) (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204))) (tuple2!16815 (_2!9061 lt!302578) (_1!9061 lt!302578)))))

(declare-fun bs!16405 () Bool)

(assert (= bs!16405 d!66009))

(assert (=> bs!16405 m!301061))

(declare-fun m!301483 () Bool)

(assert (=> bs!16405 m!301483))

(assert (=> b!194265 d!66009))

(declare-fun d!66011 () Bool)

(declare-fun e!133865 () Bool)

(assert (=> d!66011 e!133865))

(declare-fun res!162723 () Bool)

(assert (=> d!66011 (=> (not res!162723) (not e!133865))))

(assert (=> d!66011 (= res!162723 (invariant!0 (currentBit!9176 (_2!9051 lt!301936)) (currentByte!9181 (_2!9051 lt!301936)) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(assert (=> d!66011 (= (readerFrom!0 (_2!9051 lt!301936) (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204)) (BitStream!7925 (buf!4891 (_2!9051 lt!301936)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun b!194597 () Bool)

(assert (=> b!194597 (= e!133865 (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(assert (= (and d!66011 res!162723) b!194597))

(assert (=> d!66011 m!301255))

(assert (=> b!194597 m!301011))

(assert (=> b!194265 d!66011))

(assert (=> b!194266 d!65973))

(assert (=> b!194266 d!65975))

(declare-fun d!66013 () Bool)

(declare-fun res!162726 () Bool)

(declare-fun e!133867 () Bool)

(assert (=> d!66013 (=> (not res!162726) (not e!133867))))

(assert (=> d!66013 (= res!162726 (= (size!4408 (buf!4891 thiss!1204)) (size!4408 (buf!4891 (_2!9051 lt!301936)))))))

(assert (=> d!66013 (= (isPrefixOf!0 thiss!1204 (_2!9051 lt!301936)) e!133867)))

(declare-fun b!194598 () Bool)

(declare-fun res!162724 () Bool)

(assert (=> b!194598 (=> (not res!162724) (not e!133867))))

(assert (=> b!194598 (= res!162724 (bvsle (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936)))))))

(declare-fun b!194599 () Bool)

(declare-fun e!133866 () Bool)

(assert (=> b!194599 (= e!133867 e!133866)))

(declare-fun res!162725 () Bool)

(assert (=> b!194599 (=> res!162725 e!133866)))

(assert (=> b!194599 (= res!162725 (= (size!4408 (buf!4891 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194600 () Bool)

(assert (=> b!194600 (= e!133866 (arrayBitRangesEq!0 (buf!4891 thiss!1204) (buf!4891 (_2!9051 lt!301936)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204))))))

(assert (= (and d!66013 res!162726) b!194598))

(assert (= (and b!194598 res!162724) b!194599))

(assert (= (and b!194599 (not res!162725)) b!194600))

(assert (=> b!194598 m!300979))

(assert (=> b!194598 m!300977))

(assert (=> b!194600 m!300979))

(assert (=> b!194600 m!300979))

(declare-fun m!301485 () Bool)

(assert (=> b!194600 m!301485))

(assert (=> b!194255 d!66013))

(declare-fun d!66015 () Bool)

(declare-fun res!162729 () Bool)

(declare-fun e!133869 () Bool)

(assert (=> d!66015 (=> (not res!162729) (not e!133869))))

(assert (=> d!66015 (= res!162729 (= (size!4408 (buf!4891 (_2!9051 lt!301936))) (size!4408 (buf!4891 (_2!9051 lt!301940)))))))

(assert (=> d!66015 (= (isPrefixOf!0 (_2!9051 lt!301936) (_2!9051 lt!301940)) e!133869)))

(declare-fun b!194601 () Bool)

(declare-fun res!162727 () Bool)

(assert (=> b!194601 (=> (not res!162727) (not e!133869))))

(assert (=> b!194601 (= res!162727 (bvsle (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))) (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301940))) (currentByte!9181 (_2!9051 lt!301940)) (currentBit!9176 (_2!9051 lt!301940)))))))

(declare-fun b!194602 () Bool)

(declare-fun e!133868 () Bool)

(assert (=> b!194602 (= e!133869 e!133868)))

(declare-fun res!162728 () Bool)

(assert (=> b!194602 (=> res!162728 e!133868)))

(assert (=> b!194602 (= res!162728 (= (size!4408 (buf!4891 (_2!9051 lt!301936))) #b00000000000000000000000000000000))))

(declare-fun b!194603 () Bool)

(assert (=> b!194603 (= e!133868 (arrayBitRangesEq!0 (buf!4891 (_2!9051 lt!301936)) (buf!4891 (_2!9051 lt!301940)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936)))))))

(assert (= (and d!66015 res!162729) b!194601))

(assert (= (and b!194601 res!162727) b!194602))

(assert (= (and b!194602 (not res!162728)) b!194603))

(assert (=> b!194601 m!300977))

(assert (=> b!194601 m!301029))

(assert (=> b!194603 m!300977))

(assert (=> b!194603 m!300977))

(declare-fun m!301487 () Bool)

(assert (=> b!194603 m!301487))

(assert (=> b!194257 d!66015))

(declare-fun d!66017 () Bool)

(declare-fun e!133870 () Bool)

(assert (=> d!66017 e!133870))

(declare-fun res!162730 () Bool)

(assert (=> d!66017 (=> (not res!162730) (not e!133870))))

(declare-fun lt!302592 () (_ BitVec 64))

(declare-fun lt!302591 () BitStream!7924)

(assert (=> d!66017 (= res!162730 (= (bvadd lt!302592 (bvsub lt!301951 lt!301958)) (bitIndex!0 (size!4408 (buf!4891 lt!302591)) (currentByte!9181 lt!302591) (currentBit!9176 lt!302591))))))

(assert (=> d!66017 (or (not (= (bvand lt!302592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301951 lt!301958) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302592 (bvsub lt!301951 lt!301958)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66017 (= lt!302592 (bitIndex!0 (size!4408 (buf!4891 (_2!9050 lt!301932))) (currentByte!9181 (_2!9050 lt!301932)) (currentBit!9176 (_2!9050 lt!301932))))))

(assert (=> d!66017 (= lt!302591 (_2!9051 (moveBitIndex!0 (_2!9050 lt!301932) (bvsub lt!301951 lt!301958))))))

(assert (=> d!66017 (moveBitIndexPrecond!0 (_2!9050 lt!301932) (bvsub lt!301951 lt!301958))))

(assert (=> d!66017 (= (withMovedBitIndex!0 (_2!9050 lt!301932) (bvsub lt!301951 lt!301958)) lt!302591)))

(declare-fun b!194604 () Bool)

(assert (=> b!194604 (= e!133870 (= (size!4408 (buf!4891 (_2!9050 lt!301932))) (size!4408 (buf!4891 lt!302591))))))

(assert (= (and d!66017 res!162730) b!194604))

(declare-fun m!301489 () Bool)

(assert (=> d!66017 m!301489))

(assert (=> d!66017 m!300989))

(declare-fun m!301491 () Bool)

(assert (=> d!66017 m!301491))

(declare-fun m!301493 () Bool)

(assert (=> d!66017 m!301493))

(assert (=> b!194246 d!66017))

(declare-fun d!66019 () Bool)

(declare-fun e!133871 () Bool)

(assert (=> d!66019 e!133871))

(declare-fun res!162731 () Bool)

(assert (=> d!66019 (=> (not res!162731) (not e!133871))))

(declare-fun lt!302598 () (_ BitVec 64))

(declare-fun lt!302596 () (_ BitVec 64))

(declare-fun lt!302593 () (_ BitVec 64))

(assert (=> d!66019 (= res!162731 (= lt!302598 (bvsub lt!302596 lt!302593)))))

(assert (=> d!66019 (or (= (bvand lt!302596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302593 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302596 lt!302593) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66019 (= lt!302593 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9049 lt!301945)))) ((_ sign_extend 32) (currentByte!9181 (_1!9049 lt!301945))) ((_ sign_extend 32) (currentBit!9176 (_1!9049 lt!301945)))))))

(declare-fun lt!302595 () (_ BitVec 64))

(declare-fun lt!302594 () (_ BitVec 64))

(assert (=> d!66019 (= lt!302596 (bvmul lt!302595 lt!302594))))

(assert (=> d!66019 (or (= lt!302595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302594 (bvsdiv (bvmul lt!302595 lt!302594) lt!302595)))))

(assert (=> d!66019 (= lt!302594 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66019 (= lt!302595 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9049 lt!301945)))))))

(assert (=> d!66019 (= lt!302598 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_1!9049 lt!301945))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_1!9049 lt!301945)))))))

(assert (=> d!66019 (invariant!0 (currentBit!9176 (_1!9049 lt!301945)) (currentByte!9181 (_1!9049 lt!301945)) (size!4408 (buf!4891 (_1!9049 lt!301945))))))

(assert (=> d!66019 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9049 lt!301945))) (currentByte!9181 (_1!9049 lt!301945)) (currentBit!9176 (_1!9049 lt!301945))) lt!302598)))

(declare-fun b!194605 () Bool)

(declare-fun res!162732 () Bool)

(assert (=> b!194605 (=> (not res!162732) (not e!133871))))

(assert (=> b!194605 (= res!162732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302598))))

(declare-fun b!194606 () Bool)

(declare-fun lt!302597 () (_ BitVec 64))

(assert (=> b!194606 (= e!133871 (bvsle lt!302598 (bvmul lt!302597 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194606 (or (= lt!302597 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302597 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302597)))))

(assert (=> b!194606 (= lt!302597 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9049 lt!301945)))))))

(assert (= (and d!66019 res!162731) b!194605))

(assert (= (and b!194605 res!162732) b!194606))

(declare-fun m!301495 () Bool)

(assert (=> d!66019 m!301495))

(declare-fun m!301497 () Bool)

(assert (=> d!66019 m!301497))

(assert (=> b!194267 d!66019))

(declare-fun d!66021 () Bool)

(declare-fun e!133872 () Bool)

(assert (=> d!66021 e!133872))

(declare-fun res!162733 () Bool)

(assert (=> d!66021 (=> (not res!162733) (not e!133872))))

(declare-fun lt!302610 () (_ BitVec 64))

(declare-fun lt!302605 () (_ BitVec 64))

(declare-fun lt!302608 () (_ BitVec 64))

(assert (=> d!66021 (= res!162733 (= lt!302610 (bvsub lt!302608 lt!302605)))))

(assert (=> d!66021 (or (= (bvand lt!302608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302608 lt!302605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66021 (= lt!302605 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9050 lt!301932)))) ((_ sign_extend 32) (currentByte!9181 (_2!9050 lt!301932))) ((_ sign_extend 32) (currentBit!9176 (_2!9050 lt!301932)))))))

(declare-fun lt!302607 () (_ BitVec 64))

(declare-fun lt!302606 () (_ BitVec 64))

(assert (=> d!66021 (= lt!302608 (bvmul lt!302607 lt!302606))))

(assert (=> d!66021 (or (= lt!302607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302606 (bvsdiv (bvmul lt!302607 lt!302606) lt!302607)))))

(assert (=> d!66021 (= lt!302606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66021 (= lt!302607 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9050 lt!301932)))))))

(assert (=> d!66021 (= lt!302610 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_2!9050 lt!301932))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_2!9050 lt!301932)))))))

(assert (=> d!66021 (invariant!0 (currentBit!9176 (_2!9050 lt!301932)) (currentByte!9181 (_2!9050 lt!301932)) (size!4408 (buf!4891 (_2!9050 lt!301932))))))

(assert (=> d!66021 (= (bitIndex!0 (size!4408 (buf!4891 (_2!9050 lt!301932))) (currentByte!9181 (_2!9050 lt!301932)) (currentBit!9176 (_2!9050 lt!301932))) lt!302610)))

(declare-fun b!194607 () Bool)

(declare-fun res!162734 () Bool)

(assert (=> b!194607 (=> (not res!162734) (not e!133872))))

(assert (=> b!194607 (= res!162734 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302610))))

(declare-fun b!194608 () Bool)

(declare-fun lt!302609 () (_ BitVec 64))

(assert (=> b!194608 (= e!133872 (bvsle lt!302610 (bvmul lt!302609 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194608 (or (= lt!302609 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302609 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302609)))))

(assert (=> b!194608 (= lt!302609 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9050 lt!301932)))))))

(assert (= (and d!66021 res!162733) b!194607))

(assert (= (and b!194607 res!162734) b!194608))

(declare-fun m!301501 () Bool)

(assert (=> d!66021 m!301501))

(declare-fun m!301503 () Bool)

(assert (=> d!66021 m!301503))

(assert (=> b!194267 d!66021))

(declare-fun d!66023 () Bool)

(assert (=> d!66023 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!194256 d!66023))

(declare-fun d!66027 () Bool)

(assert (=> d!66027 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9050 lt!301932)))) ((_ sign_extend 32) (currentByte!9181 (_1!9050 lt!301932))) ((_ sign_extend 32) (currentBit!9176 (_1!9050 lt!301932))) lt!301949) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9050 lt!301932)))) ((_ sign_extend 32) (currentByte!9181 (_1!9050 lt!301932))) ((_ sign_extend 32) (currentBit!9176 (_1!9050 lt!301932)))) lt!301949))))

(declare-fun bs!16408 () Bool)

(assert (= bs!16408 d!66027))

(declare-fun m!301507 () Bool)

(assert (=> bs!16408 m!301507))

(assert (=> b!194269 d!66027))

(declare-fun d!66029 () Bool)

(declare-fun lt!302685 () tuple2!16808)

(declare-fun lt!302686 () tuple2!16808)

(assert (=> d!66029 (and (= (_2!9049 lt!302685) (_2!9049 lt!302686)) (= (_1!9049 lt!302685) (_1!9049 lt!302686)))))

(declare-fun lt!302683 () Unit!13732)

(declare-fun lt!302684 () BitStream!7924)

(declare-fun lt!302687 () (_ BitVec 64))

(declare-fun lt!302682 () Bool)

(declare-fun choose!56 (BitStream!7924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16808 tuple2!16808 BitStream!7924 (_ BitVec 64) Bool BitStream!7924 (_ BitVec 64) tuple2!16808 tuple2!16808 BitStream!7924 (_ BitVec 64)) Unit!13732)

(assert (=> d!66029 (= lt!302683 (choose!56 (_1!9050 lt!301932) nBits!348 i!590 lt!301941 lt!302685 (tuple2!16809 (_1!9049 lt!302685) (_2!9049 lt!302685)) (_1!9049 lt!302685) (_2!9049 lt!302685) lt!302682 lt!302684 lt!302687 lt!302686 (tuple2!16809 (_1!9049 lt!302686) (_2!9049 lt!302686)) (_1!9049 lt!302686) (_2!9049 lt!302686)))))

(assert (=> d!66029 (= lt!302686 (readNBitsLSBFirstsLoopPure!0 lt!302684 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!302687))))

(assert (=> d!66029 (= lt!302687 (bvor lt!301941 (ite lt!302682 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66029 (= lt!302684 (withMovedBitIndex!0 (_1!9050 lt!301932) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!66029 (= lt!302682 (_2!9052 (readBitPure!0 (_1!9050 lt!301932))))))

(assert (=> d!66029 (= lt!302685 (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!301932) nBits!348 i!590 lt!301941))))

(assert (=> d!66029 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9050 lt!301932) nBits!348 i!590 lt!301941) lt!302683)))

(declare-fun bs!16411 () Bool)

(assert (= bs!16411 d!66029))

(declare-fun m!301519 () Bool)

(assert (=> bs!16411 m!301519))

(declare-fun m!301521 () Bool)

(assert (=> bs!16411 m!301521))

(assert (=> bs!16411 m!300985))

(assert (=> bs!16411 m!301001))

(assert (=> bs!16411 m!301021))

(assert (=> b!194258 d!66029))

(declare-datatypes ((tuple2!16834 0))(
  ( (tuple2!16835 (_1!9062 (_ BitVec 64)) (_2!9062 BitStream!7924)) )
))
(declare-fun lt!302721 () tuple2!16834)

(declare-fun d!66035 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16834)

(assert (=> d!66035 (= lt!302721 (readNBitsLSBFirstsLoop!0 lt!301935 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301950))))

(assert (=> d!66035 (= (readNBitsLSBFirstsLoopPure!0 lt!301935 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301950) (tuple2!16809 (_2!9062 lt!302721) (_1!9062 lt!302721)))))

(declare-fun bs!16413 () Bool)

(assert (= bs!16413 d!66035))

(declare-fun m!301525 () Bool)

(assert (=> bs!16413 m!301525))

(assert (=> b!194258 d!66035))

(declare-fun d!66039 () Bool)

(declare-fun e!133888 () Bool)

(assert (=> d!66039 e!133888))

(declare-fun res!162751 () Bool)

(assert (=> d!66039 (=> (not res!162751) (not e!133888))))

(declare-fun lt!302725 () (_ BitVec 64))

(declare-fun lt!302724 () BitStream!7924)

(assert (=> d!66039 (= res!162751 (= (bvadd lt!302725 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4408 (buf!4891 lt!302724)) (currentByte!9181 lt!302724) (currentBit!9176 lt!302724))))))

(assert (=> d!66039 (or (not (= (bvand lt!302725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302725 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66039 (= lt!302725 (bitIndex!0 (size!4408 (buf!4891 (_1!9050 lt!301932))) (currentByte!9181 (_1!9050 lt!301932)) (currentBit!9176 (_1!9050 lt!301932))))))

(assert (=> d!66039 (= lt!302724 (_2!9051 (moveBitIndex!0 (_1!9050 lt!301932) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!66039 (moveBitIndexPrecond!0 (_1!9050 lt!301932) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!66039 (= (withMovedBitIndex!0 (_1!9050 lt!301932) #b0000000000000000000000000000000000000000000000000000000000000001) lt!302724)))

(declare-fun b!194632 () Bool)

(assert (=> b!194632 (= e!133888 (= (size!4408 (buf!4891 (_1!9050 lt!301932))) (size!4408 (buf!4891 lt!302724))))))

(assert (= (and d!66039 res!162751) b!194632))

(declare-fun m!301527 () Bool)

(assert (=> d!66039 m!301527))

(declare-fun m!301529 () Bool)

(assert (=> d!66039 m!301529))

(declare-fun m!301531 () Bool)

(assert (=> d!66039 m!301531))

(declare-fun m!301535 () Bool)

(assert (=> d!66039 m!301535))

(assert (=> b!194258 d!66039))

(declare-fun d!66041 () Bool)

(assert (=> d!66041 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204)) lt!301949) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204))) lt!301949))))

(declare-fun bs!16414 () Bool)

(assert (= bs!16414 d!66041))

(declare-fun m!301537 () Bool)

(assert (=> bs!16414 m!301537))

(assert (=> b!194247 d!66041))

(declare-fun d!66045 () Bool)

(assert (=> d!66045 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!194247 d!66045))

(declare-fun d!66047 () Bool)

(assert (=> d!66047 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!301937)))

(declare-fun lt!302754 () Unit!13732)

(declare-fun choose!9 (BitStream!7924 array!9995 (_ BitVec 64) BitStream!7924) Unit!13732)

(assert (=> d!66047 (= lt!302754 (choose!9 (_2!9051 lt!301936) (buf!4891 (_2!9051 lt!301940)) lt!301937 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936)))))))

(assert (=> d!66047 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9051 lt!301936) (buf!4891 (_2!9051 lt!301940)) lt!301937) lt!302754)))

(declare-fun bs!16415 () Bool)

(assert (= bs!16415 d!66047))

(assert (=> bs!16415 m!300999))

(declare-fun m!301543 () Bool)

(assert (=> bs!16415 m!301543))

(assert (=> b!194247 d!66047))

(declare-fun d!66057 () Bool)

(assert (=> d!66057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 thiss!1204)) ((_ sign_extend 32) (currentBit!9176 thiss!1204)) lt!301949)))

(declare-fun lt!302755 () Unit!13732)

(assert (=> d!66057 (= lt!302755 (choose!9 thiss!1204 (buf!4891 (_2!9051 lt!301940)) lt!301949 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204))))))

(assert (=> d!66057 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4891 (_2!9051 lt!301940)) lt!301949) lt!302755)))

(declare-fun bs!16416 () Bool)

(assert (= bs!16416 d!66057))

(assert (=> bs!16416 m!301015))

(declare-fun m!301545 () Bool)

(assert (=> bs!16416 m!301545))

(assert (=> b!194247 d!66057))

(declare-fun d!66059 () Bool)

(declare-fun e!133894 () Bool)

(assert (=> d!66059 e!133894))

(declare-fun res!162759 () Bool)

(assert (=> d!66059 (=> (not res!162759) (not e!133894))))

(declare-fun lt!302761 () (_ BitVec 64))

(declare-fun lt!302756 () (_ BitVec 64))

(declare-fun lt!302759 () (_ BitVec 64))

(assert (=> d!66059 (= res!162759 (= lt!302761 (bvsub lt!302759 lt!302756)))))

(assert (=> d!66059 (or (= (bvand lt!302759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302756 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302759 lt!302756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66059 (= lt!302756 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301934)))) ((_ sign_extend 32) (currentByte!9181 (_1!9052 lt!301934))) ((_ sign_extend 32) (currentBit!9176 (_1!9052 lt!301934)))))))

(declare-fun lt!302758 () (_ BitVec 64))

(declare-fun lt!302757 () (_ BitVec 64))

(assert (=> d!66059 (= lt!302759 (bvmul lt!302758 lt!302757))))

(assert (=> d!66059 (or (= lt!302758 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302757 (bvsdiv (bvmul lt!302758 lt!302757) lt!302758)))))

(assert (=> d!66059 (= lt!302757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66059 (= lt!302758 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301934)))))))

(assert (=> d!66059 (= lt!302761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_1!9052 lt!301934))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_1!9052 lt!301934)))))))

(assert (=> d!66059 (invariant!0 (currentBit!9176 (_1!9052 lt!301934)) (currentByte!9181 (_1!9052 lt!301934)) (size!4408 (buf!4891 (_1!9052 lt!301934))))))

(assert (=> d!66059 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!301934))) (currentByte!9181 (_1!9052 lt!301934)) (currentBit!9176 (_1!9052 lt!301934))) lt!302761)))

(declare-fun b!194640 () Bool)

(declare-fun res!162760 () Bool)

(assert (=> b!194640 (=> (not res!162760) (not e!133894))))

(assert (=> b!194640 (= res!162760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302761))))

(declare-fun b!194641 () Bool)

(declare-fun lt!302760 () (_ BitVec 64))

(assert (=> b!194641 (= e!133894 (bvsle lt!302761 (bvmul lt!302760 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194641 (or (= lt!302760 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302760 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302760)))))

(assert (=> b!194641 (= lt!302760 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301934)))))))

(assert (= (and d!66059 res!162759) b!194640))

(assert (= (and b!194640 res!162760) b!194641))

(declare-fun m!301547 () Bool)

(assert (=> d!66059 m!301547))

(declare-fun m!301549 () Bool)

(assert (=> d!66059 m!301549))

(assert (=> b!194247 d!66059))

(declare-fun lt!302762 () tuple2!16834)

(declare-fun d!66063 () Bool)

(assert (=> d!66063 (= lt!302762 (readNBitsLSBFirstsLoop!0 (_1!9050 lt!301947) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301950))))

(assert (=> d!66063 (= (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!301947) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301950) (tuple2!16809 (_2!9062 lt!302762) (_1!9062 lt!302762)))))

(declare-fun bs!16418 () Bool)

(assert (= bs!16418 d!66063))

(declare-fun m!301551 () Bool)

(assert (=> bs!16418 m!301551))

(assert (=> b!194247 d!66063))

(declare-fun b!194701 () Bool)

(declare-fun e!133925 () Unit!13732)

(declare-fun Unit!13760 () Unit!13732)

(assert (=> b!194701 (= e!133925 Unit!13760)))

(declare-fun d!66065 () Bool)

(declare-fun e!133926 () Bool)

(assert (=> d!66065 e!133926))

(declare-fun res!162811 () Bool)

(assert (=> d!66065 (=> (not res!162811) (not e!133926))))

(declare-fun lt!302921 () tuple2!16810)

(assert (=> d!66065 (= res!162811 (isPrefixOf!0 (_1!9050 lt!302921) (_2!9050 lt!302921)))))

(declare-fun lt!302929 () BitStream!7924)

(assert (=> d!66065 (= lt!302921 (tuple2!16811 lt!302929 (_2!9051 lt!301940)))))

(declare-fun lt!302925 () Unit!13732)

(declare-fun lt!302924 () Unit!13732)

(assert (=> d!66065 (= lt!302925 lt!302924)))

(assert (=> d!66065 (isPrefixOf!0 lt!302929 (_2!9051 lt!301940))))

(assert (=> d!66065 (= lt!302924 (lemmaIsPrefixTransitive!0 lt!302929 (_2!9051 lt!301940) (_2!9051 lt!301940)))))

(declare-fun lt!302919 () Unit!13732)

(declare-fun lt!302918 () Unit!13732)

(assert (=> d!66065 (= lt!302919 lt!302918)))

(assert (=> d!66065 (isPrefixOf!0 lt!302929 (_2!9051 lt!301940))))

(assert (=> d!66065 (= lt!302918 (lemmaIsPrefixTransitive!0 lt!302929 thiss!1204 (_2!9051 lt!301940)))))

(declare-fun lt!302916 () Unit!13732)

(assert (=> d!66065 (= lt!302916 e!133925)))

(declare-fun c!9730 () Bool)

(assert (=> d!66065 (= c!9730 (not (= (size!4408 (buf!4891 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!302917 () Unit!13732)

(declare-fun lt!302922 () Unit!13732)

(assert (=> d!66065 (= lt!302917 lt!302922)))

(assert (=> d!66065 (isPrefixOf!0 (_2!9051 lt!301940) (_2!9051 lt!301940))))

(assert (=> d!66065 (= lt!302922 (lemmaIsPrefixRefl!0 (_2!9051 lt!301940)))))

(declare-fun lt!302931 () Unit!13732)

(declare-fun lt!302915 () Unit!13732)

(assert (=> d!66065 (= lt!302931 lt!302915)))

(assert (=> d!66065 (= lt!302915 (lemmaIsPrefixRefl!0 (_2!9051 lt!301940)))))

(declare-fun lt!302913 () Unit!13732)

(declare-fun lt!302914 () Unit!13732)

(assert (=> d!66065 (= lt!302913 lt!302914)))

(assert (=> d!66065 (isPrefixOf!0 lt!302929 lt!302929)))

(assert (=> d!66065 (= lt!302914 (lemmaIsPrefixRefl!0 lt!302929))))

(declare-fun lt!302926 () Unit!13732)

(declare-fun lt!302912 () Unit!13732)

(assert (=> d!66065 (= lt!302926 lt!302912)))

(assert (=> d!66065 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!66065 (= lt!302912 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!66065 (= lt!302929 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(assert (=> d!66065 (isPrefixOf!0 thiss!1204 (_2!9051 lt!301940))))

(assert (=> d!66065 (= (reader!0 thiss!1204 (_2!9051 lt!301940)) lt!302921)))

(declare-fun b!194702 () Bool)

(declare-fun lt!302928 () Unit!13732)

(assert (=> b!194702 (= e!133925 lt!302928)))

(declare-fun lt!302923 () (_ BitVec 64))

(assert (=> b!194702 (= lt!302923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!302927 () (_ BitVec 64))

(assert (=> b!194702 (= lt!302927 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9995 array!9995 (_ BitVec 64) (_ BitVec 64)) Unit!13732)

(assert (=> b!194702 (= lt!302928 (arrayBitRangesEqSymmetric!0 (buf!4891 thiss!1204) (buf!4891 (_2!9051 lt!301940)) lt!302923 lt!302927))))

(assert (=> b!194702 (arrayBitRangesEq!0 (buf!4891 (_2!9051 lt!301940)) (buf!4891 thiss!1204) lt!302923 lt!302927)))

(declare-fun lt!302920 () (_ BitVec 64))

(declare-fun lt!302930 () (_ BitVec 64))

(declare-fun b!194703 () Bool)

(assert (=> b!194703 (= e!133926 (= (_1!9050 lt!302921) (withMovedBitIndex!0 (_2!9050 lt!302921) (bvsub lt!302920 lt!302930))))))

(assert (=> b!194703 (or (= (bvand lt!302920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302920 lt!302930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194703 (= lt!302930 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301940))) (currentByte!9181 (_2!9051 lt!301940)) (currentBit!9176 (_2!9051 lt!301940))))))

(assert (=> b!194703 (= lt!302920 (bitIndex!0 (size!4408 (buf!4891 thiss!1204)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204)))))

(declare-fun b!194704 () Bool)

(declare-fun res!162812 () Bool)

(assert (=> b!194704 (=> (not res!162812) (not e!133926))))

(assert (=> b!194704 (= res!162812 (isPrefixOf!0 (_2!9050 lt!302921) (_2!9051 lt!301940)))))

(declare-fun b!194705 () Bool)

(declare-fun res!162813 () Bool)

(assert (=> b!194705 (=> (not res!162813) (not e!133926))))

(assert (=> b!194705 (= res!162813 (isPrefixOf!0 (_1!9050 lt!302921) thiss!1204))))

(assert (= (and d!66065 c!9730) b!194702))

(assert (= (and d!66065 (not c!9730)) b!194701))

(assert (= (and d!66065 res!162811) b!194705))

(assert (= (and b!194705 res!162813) b!194704))

(assert (= (and b!194704 res!162812) b!194703))

(assert (=> b!194702 m!300979))

(declare-fun m!301689 () Bool)

(assert (=> b!194702 m!301689))

(declare-fun m!301691 () Bool)

(assert (=> b!194702 m!301691))

(declare-fun m!301693 () Bool)

(assert (=> b!194704 m!301693))

(declare-fun m!301695 () Bool)

(assert (=> b!194703 m!301695))

(assert (=> b!194703 m!301029))

(assert (=> b!194703 m!300979))

(declare-fun m!301697 () Bool)

(assert (=> b!194705 m!301697))

(declare-fun m!301699 () Bool)

(assert (=> d!66065 m!301699))

(declare-fun m!301701 () Bool)

(assert (=> d!66065 m!301701))

(declare-fun m!301703 () Bool)

(assert (=> d!66065 m!301703))

(declare-fun m!301705 () Bool)

(assert (=> d!66065 m!301705))

(declare-fun m!301707 () Bool)

(assert (=> d!66065 m!301707))

(declare-fun m!301709 () Bool)

(assert (=> d!66065 m!301709))

(assert (=> d!66065 m!301031))

(declare-fun m!301711 () Bool)

(assert (=> d!66065 m!301711))

(declare-fun m!301713 () Bool)

(assert (=> d!66065 m!301713))

(declare-fun m!301715 () Bool)

(assert (=> d!66065 m!301715))

(declare-fun m!301717 () Bool)

(assert (=> d!66065 m!301717))

(assert (=> b!194247 d!66065))

(declare-fun d!66095 () Bool)

(assert (=> d!66095 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936))) lt!301937) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_2!9051 lt!301940)))) ((_ sign_extend 32) (currentByte!9181 (_2!9051 lt!301936))) ((_ sign_extend 32) (currentBit!9176 (_2!9051 lt!301936)))) lt!301937))))

(declare-fun bs!16421 () Bool)

(assert (= bs!16421 d!66095))

(declare-fun m!301719 () Bool)

(assert (=> bs!16421 m!301719))

(assert (=> b!194247 d!66095))

(declare-fun d!66097 () Bool)

(declare-fun lt!302932 () tuple2!16832)

(assert (=> d!66097 (= lt!302932 (readBit!0 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204))))))

(assert (=> d!66097 (= (readBitPure!0 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 thiss!1204) (currentBit!9176 thiss!1204))) (tuple2!16815 (_2!9061 lt!302932) (_1!9061 lt!302932)))))

(declare-fun bs!16422 () Bool)

(assert (= bs!16422 d!66097))

(declare-fun m!301721 () Bool)

(assert (=> bs!16422 m!301721))

(assert (=> b!194247 d!66097))

(declare-fun d!66099 () Bool)

(declare-fun lt!302933 () tuple2!16832)

(assert (=> d!66099 (= lt!302933 (readBit!0 lt!301960))))

(assert (=> d!66099 (= (readBitPure!0 lt!301960) (tuple2!16815 (_2!9061 lt!302933) (_1!9061 lt!302933)))))

(declare-fun bs!16423 () Bool)

(assert (= bs!16423 d!66099))

(declare-fun m!301723 () Bool)

(assert (=> bs!16423 m!301723))

(assert (=> b!194247 d!66099))

(declare-fun b!194706 () Bool)

(declare-fun e!133927 () Unit!13732)

(declare-fun Unit!13761 () Unit!13732)

(assert (=> b!194706 (= e!133927 Unit!13761)))

(declare-fun d!66101 () Bool)

(declare-fun e!133928 () Bool)

(assert (=> d!66101 e!133928))

(declare-fun res!162814 () Bool)

(assert (=> d!66101 (=> (not res!162814) (not e!133928))))

(declare-fun lt!302943 () tuple2!16810)

(assert (=> d!66101 (= res!162814 (isPrefixOf!0 (_1!9050 lt!302943) (_2!9050 lt!302943)))))

(declare-fun lt!302951 () BitStream!7924)

(assert (=> d!66101 (= lt!302943 (tuple2!16811 lt!302951 (_2!9051 lt!301940)))))

(declare-fun lt!302947 () Unit!13732)

(declare-fun lt!302946 () Unit!13732)

(assert (=> d!66101 (= lt!302947 lt!302946)))

(assert (=> d!66101 (isPrefixOf!0 lt!302951 (_2!9051 lt!301940))))

(assert (=> d!66101 (= lt!302946 (lemmaIsPrefixTransitive!0 lt!302951 (_2!9051 lt!301940) (_2!9051 lt!301940)))))

(declare-fun lt!302941 () Unit!13732)

(declare-fun lt!302940 () Unit!13732)

(assert (=> d!66101 (= lt!302941 lt!302940)))

(assert (=> d!66101 (isPrefixOf!0 lt!302951 (_2!9051 lt!301940))))

(assert (=> d!66101 (= lt!302940 (lemmaIsPrefixTransitive!0 lt!302951 (_2!9051 lt!301936) (_2!9051 lt!301940)))))

(declare-fun lt!302938 () Unit!13732)

(assert (=> d!66101 (= lt!302938 e!133927)))

(declare-fun c!9731 () Bool)

(assert (=> d!66101 (= c!9731 (not (= (size!4408 (buf!4891 (_2!9051 lt!301936))) #b00000000000000000000000000000000)))))

(declare-fun lt!302939 () Unit!13732)

(declare-fun lt!302944 () Unit!13732)

(assert (=> d!66101 (= lt!302939 lt!302944)))

(assert (=> d!66101 (isPrefixOf!0 (_2!9051 lt!301940) (_2!9051 lt!301940))))

(assert (=> d!66101 (= lt!302944 (lemmaIsPrefixRefl!0 (_2!9051 lt!301940)))))

(declare-fun lt!302953 () Unit!13732)

(declare-fun lt!302937 () Unit!13732)

(assert (=> d!66101 (= lt!302953 lt!302937)))

(assert (=> d!66101 (= lt!302937 (lemmaIsPrefixRefl!0 (_2!9051 lt!301940)))))

(declare-fun lt!302935 () Unit!13732)

(declare-fun lt!302936 () Unit!13732)

(assert (=> d!66101 (= lt!302935 lt!302936)))

(assert (=> d!66101 (isPrefixOf!0 lt!302951 lt!302951)))

(assert (=> d!66101 (= lt!302936 (lemmaIsPrefixRefl!0 lt!302951))))

(declare-fun lt!302948 () Unit!13732)

(declare-fun lt!302934 () Unit!13732)

(assert (=> d!66101 (= lt!302948 lt!302934)))

(assert (=> d!66101 (isPrefixOf!0 (_2!9051 lt!301936) (_2!9051 lt!301936))))

(assert (=> d!66101 (= lt!302934 (lemmaIsPrefixRefl!0 (_2!9051 lt!301936)))))

(assert (=> d!66101 (= lt!302951 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(assert (=> d!66101 (isPrefixOf!0 (_2!9051 lt!301936) (_2!9051 lt!301940))))

(assert (=> d!66101 (= (reader!0 (_2!9051 lt!301936) (_2!9051 lt!301940)) lt!302943)))

(declare-fun b!194707 () Bool)

(declare-fun lt!302950 () Unit!13732)

(assert (=> b!194707 (= e!133927 lt!302950)))

(declare-fun lt!302945 () (_ BitVec 64))

(assert (=> b!194707 (= lt!302945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!302949 () (_ BitVec 64))

(assert (=> b!194707 (= lt!302949 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(assert (=> b!194707 (= lt!302950 (arrayBitRangesEqSymmetric!0 (buf!4891 (_2!9051 lt!301936)) (buf!4891 (_2!9051 lt!301940)) lt!302945 lt!302949))))

(assert (=> b!194707 (arrayBitRangesEq!0 (buf!4891 (_2!9051 lt!301940)) (buf!4891 (_2!9051 lt!301936)) lt!302945 lt!302949)))

(declare-fun b!194708 () Bool)

(declare-fun lt!302952 () (_ BitVec 64))

(declare-fun lt!302942 () (_ BitVec 64))

(assert (=> b!194708 (= e!133928 (= (_1!9050 lt!302943) (withMovedBitIndex!0 (_2!9050 lt!302943) (bvsub lt!302942 lt!302952))))))

(assert (=> b!194708 (or (= (bvand lt!302942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302952 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302942 lt!302952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194708 (= lt!302952 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301940))) (currentByte!9181 (_2!9051 lt!301940)) (currentBit!9176 (_2!9051 lt!301940))))))

(assert (=> b!194708 (= lt!302942 (bitIndex!0 (size!4408 (buf!4891 (_2!9051 lt!301936))) (currentByte!9181 (_2!9051 lt!301936)) (currentBit!9176 (_2!9051 lt!301936))))))

(declare-fun b!194709 () Bool)

(declare-fun res!162815 () Bool)

(assert (=> b!194709 (=> (not res!162815) (not e!133928))))

(assert (=> b!194709 (= res!162815 (isPrefixOf!0 (_2!9050 lt!302943) (_2!9051 lt!301940)))))

(declare-fun b!194710 () Bool)

(declare-fun res!162816 () Bool)

(assert (=> b!194710 (=> (not res!162816) (not e!133928))))

(assert (=> b!194710 (= res!162816 (isPrefixOf!0 (_1!9050 lt!302943) (_2!9051 lt!301936)))))

(assert (= (and d!66101 c!9731) b!194707))

(assert (= (and d!66101 (not c!9731)) b!194706))

(assert (= (and d!66101 res!162814) b!194710))

(assert (= (and b!194710 res!162816) b!194709))

(assert (= (and b!194709 res!162815) b!194708))

(assert (=> b!194707 m!300977))

(declare-fun m!301725 () Bool)

(assert (=> b!194707 m!301725))

(declare-fun m!301727 () Bool)

(assert (=> b!194707 m!301727))

(declare-fun m!301729 () Bool)

(assert (=> b!194709 m!301729))

(declare-fun m!301731 () Bool)

(assert (=> b!194708 m!301731))

(assert (=> b!194708 m!301029))

(assert (=> b!194708 m!300977))

(declare-fun m!301733 () Bool)

(assert (=> b!194710 m!301733))

(declare-fun m!301735 () Bool)

(assert (=> d!66101 m!301735))

(assert (=> d!66101 m!301295))

(assert (=> d!66101 m!301703))

(declare-fun m!301737 () Bool)

(assert (=> d!66101 m!301737))

(declare-fun m!301739 () Bool)

(assert (=> d!66101 m!301739))

(declare-fun m!301741 () Bool)

(assert (=> d!66101 m!301741))

(assert (=> d!66101 m!301047))

(declare-fun m!301743 () Bool)

(assert (=> d!66101 m!301743))

(assert (=> d!66101 m!301713))

(declare-fun m!301745 () Bool)

(assert (=> d!66101 m!301745))

(declare-fun m!301747 () Bool)

(assert (=> d!66101 m!301747))

(assert (=> b!194247 d!66101))

(declare-fun d!66103 () Bool)

(declare-fun e!133929 () Bool)

(assert (=> d!66103 e!133929))

(declare-fun res!162817 () Bool)

(assert (=> d!66103 (=> (not res!162817) (not e!133929))))

(declare-fun lt!302959 () (_ BitVec 64))

(declare-fun lt!302954 () (_ BitVec 64))

(declare-fun lt!302957 () (_ BitVec 64))

(assert (=> d!66103 (= res!162817 (= lt!302959 (bvsub lt!302957 lt!302954)))))

(assert (=> d!66103 (or (= (bvand lt!302957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302957 lt!302954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66103 (= lt!302954 (remainingBits!0 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301957)))) ((_ sign_extend 32) (currentByte!9181 (_1!9052 lt!301957))) ((_ sign_extend 32) (currentBit!9176 (_1!9052 lt!301957)))))))

(declare-fun lt!302956 () (_ BitVec 64))

(declare-fun lt!302955 () (_ BitVec 64))

(assert (=> d!66103 (= lt!302957 (bvmul lt!302956 lt!302955))))

(assert (=> d!66103 (or (= lt!302956 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302955 (bvsdiv (bvmul lt!302956 lt!302955) lt!302956)))))

(assert (=> d!66103 (= lt!302955 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66103 (= lt!302956 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301957)))))))

(assert (=> d!66103 (= lt!302959 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9181 (_1!9052 lt!301957))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9176 (_1!9052 lt!301957)))))))

(assert (=> d!66103 (invariant!0 (currentBit!9176 (_1!9052 lt!301957)) (currentByte!9181 (_1!9052 lt!301957)) (size!4408 (buf!4891 (_1!9052 lt!301957))))))

(assert (=> d!66103 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!301957))) (currentByte!9181 (_1!9052 lt!301957)) (currentBit!9176 (_1!9052 lt!301957))) lt!302959)))

(declare-fun b!194711 () Bool)

(declare-fun res!162818 () Bool)

(assert (=> b!194711 (=> (not res!162818) (not e!133929))))

(assert (=> b!194711 (= res!162818 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302959))))

(declare-fun b!194712 () Bool)

(declare-fun lt!302958 () (_ BitVec 64))

(assert (=> b!194712 (= e!133929 (bvsle lt!302959 (bvmul lt!302958 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194712 (or (= lt!302958 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302958 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302958)))))

(assert (=> b!194712 (= lt!302958 ((_ sign_extend 32) (size!4408 (buf!4891 (_1!9052 lt!301957)))))))

(assert (= (and d!66103 res!162817) b!194711))

(assert (= (and b!194711 res!162818) b!194712))

(declare-fun m!301749 () Bool)

(assert (=> d!66103 m!301749))

(declare-fun m!301751 () Bool)

(assert (=> d!66103 m!301751))

(assert (=> b!194247 d!66103))

(declare-fun d!66105 () Bool)

(declare-fun lt!302960 () tuple2!16834)

(assert (=> d!66105 (= lt!302960 (readNBitsLSBFirstsLoop!0 (_1!9050 lt!301932) nBits!348 i!590 lt!301941))))

(assert (=> d!66105 (= (readNBitsLSBFirstsLoopPure!0 (_1!9050 lt!301932) nBits!348 i!590 lt!301941) (tuple2!16809 (_2!9062 lt!302960) (_1!9062 lt!302960)))))

(declare-fun bs!16424 () Bool)

(assert (= bs!16424 d!66105))

(declare-fun m!301753 () Bool)

(assert (=> bs!16424 m!301753))

(assert (=> b!194247 d!66105))

(declare-fun d!66107 () Bool)

(declare-fun e!133935 () Bool)

(assert (=> d!66107 e!133935))

(declare-fun res!162824 () Bool)

(assert (=> d!66107 (=> (not res!162824) (not e!133935))))

(declare-fun lt!302982 () tuple2!16814)

(declare-fun lt!302984 () tuple2!16814)

(assert (=> d!66107 (= res!162824 (= (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!302982))) (currentByte!9181 (_1!9052 lt!302982)) (currentBit!9176 (_1!9052 lt!302982))) (bitIndex!0 (size!4408 (buf!4891 (_1!9052 lt!302984))) (currentByte!9181 (_1!9052 lt!302984)) (currentBit!9176 (_1!9052 lt!302984)))))))

(declare-fun lt!302983 () BitStream!7924)

(declare-fun lt!302981 () Unit!13732)

(declare-fun choose!50 (BitStream!7924 BitStream!7924 BitStream!7924 tuple2!16814 tuple2!16814 BitStream!7924 Bool tuple2!16814 tuple2!16814 BitStream!7924 Bool) Unit!13732)

(assert (=> d!66107 (= lt!302981 (choose!50 lt!301960 (_2!9051 lt!301940) lt!302983 lt!302982 (tuple2!16815 (_1!9052 lt!302982) (_2!9052 lt!302982)) (_1!9052 lt!302982) (_2!9052 lt!302982) lt!302984 (tuple2!16815 (_1!9052 lt!302984) (_2!9052 lt!302984)) (_1!9052 lt!302984) (_2!9052 lt!302984)))))

(assert (=> d!66107 (= lt!302984 (readBitPure!0 lt!302983))))

(assert (=> d!66107 (= lt!302982 (readBitPure!0 lt!301960))))

(assert (=> d!66107 (= lt!302983 (BitStream!7925 (buf!4891 (_2!9051 lt!301940)) (currentByte!9181 lt!301960) (currentBit!9176 lt!301960)))))

(assert (=> d!66107 (invariant!0 (currentBit!9176 lt!301960) (currentByte!9181 lt!301960) (size!4408 (buf!4891 (_2!9051 lt!301940))))))

(assert (=> d!66107 (= (readBitPrefixLemma!0 lt!301960 (_2!9051 lt!301940)) lt!302981)))

(declare-fun b!194718 () Bool)

(assert (=> b!194718 (= e!133935 (= (_2!9052 lt!302982) (_2!9052 lt!302984)))))

(assert (= (and d!66107 res!162824) b!194718))

(declare-fun m!301765 () Bool)

(assert (=> d!66107 m!301765))

(declare-fun m!301767 () Bool)

(assert (=> d!66107 m!301767))

(assert (=> d!66107 m!301005))

(declare-fun m!301769 () Bool)

(assert (=> d!66107 m!301769))

(declare-fun m!301771 () Bool)

(assert (=> d!66107 m!301771))

(declare-fun m!301773 () Bool)

(assert (=> d!66107 m!301773))

(assert (=> b!194247 d!66107))

(declare-fun d!66113 () Bool)

(declare-fun lt!302985 () tuple2!16832)

(assert (=> d!66113 (= lt!302985 (readBit!0 (_1!9050 lt!301932)))))

(assert (=> d!66113 (= (readBitPure!0 (_1!9050 lt!301932)) (tuple2!16815 (_2!9061 lt!302985) (_1!9061 lt!302985)))))

(declare-fun bs!16425 () Bool)

(assert (= bs!16425 d!66113))

(declare-fun m!301775 () Bool)

(assert (=> bs!16425 m!301775))

(assert (=> b!194247 d!66113))

(declare-fun d!66115 () Bool)

(assert (=> d!66115 (= (invariant!0 (currentBit!9176 thiss!1204) (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301936)))) (and (bvsge (currentBit!9176 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9176 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9181 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301936)))) (and (= (currentBit!9176 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9181 thiss!1204) (size!4408 (buf!4891 (_2!9051 lt!301936))))))))))

(assert (=> b!194247 d!66115))

(assert (=> b!194268 d!66013))

(push 1)

(assert (not b!194571))

(assert (not b!194600))

(assert (not d!66039))

(assert (not b!194707))

(assert (not d!65977))

(assert (not b!194710))

(assert (not d!66041))

(assert (not d!66047))

(assert (not d!65991))

(assert (not d!66101))

(assert (not b!194567))

(assert (not b!194478))

(assert (not d!66001))

(assert (not d!65981))

(assert (not b!194564))

(assert (not d!66009))

(assert (not d!66017))

(assert (not d!66035))

(assert (not b!194463))

(assert (not d!66113))

(assert (not d!66029))

(assert (not d!65989))

(assert (not b!194574))

(assert (not d!66103))

(assert (not bm!3058))

(assert (not b!194562))

(assert (not d!66099))

(assert (not b!194603))

(assert (not d!66057))

(assert (not d!66059))

(assert (not d!65965))

(assert (not d!66107))

(assert (not b!194568))

(assert (not d!66019))

(assert (not b!194703))

(assert (not b!194601))

(assert (not d!66021))

(assert (not d!66063))

(assert (not b!194569))

(assert (not d!66065))

(assert (not d!65975))

(assert (not b!194464))

(assert (not b!194708))

(assert (not b!194704))

(assert (not b!194705))

(assert (not b!194476))

(assert (not d!66095))

(assert (not b!194598))

(assert (not b!194563))

(assert (not d!66011))

(assert (not d!66027))

(assert (not b!194462))

(assert (not d!66105))

(assert (not b!194573))

(assert (not d!65985))

(assert (not d!66097))

(assert (not d!65973))

(assert (not b!194702))

(assert (not b!194465))

(assert (not b!194709))

(assert (not b!194597))

(assert (not d!65963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

