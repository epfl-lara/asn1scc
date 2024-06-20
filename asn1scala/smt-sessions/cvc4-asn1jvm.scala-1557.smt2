; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43642 () Bool)

(assert start!43642)

(declare-fun b!207359 () Bool)

(declare-fun e!141749 () Bool)

(declare-fun e!141741 () Bool)

(assert (=> b!207359 (= e!141749 e!141741)))

(declare-fun res!173978 () Bool)

(assert (=> b!207359 (=> res!173978 e!141741)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!323641 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!323651 () (_ BitVec 64))

(assert (=> b!207359 (= res!173978 (not (= lt!323651 (bvsub (bvsub (bvadd lt!323641 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!10425 0))(
  ( (array!10426 (arr!5514 (Array (_ BitVec 32) (_ BitVec 8))) (size!4584 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8276 0))(
  ( (BitStream!8277 (buf!5089 array!10425) (currentByte!9607 (_ BitVec 32)) (currentBit!9602 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14762 0))(
  ( (Unit!14763) )
))
(declare-datatypes ((tuple2!17778 0))(
  ( (tuple2!17779 (_1!9544 Unit!14762) (_2!9544 BitStream!8276)) )
))
(declare-fun lt!323639 () tuple2!17778)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207359 (= lt!323651 (bitIndex!0 (size!4584 (buf!5089 (_2!9544 lt!323639))) (currentByte!9607 (_2!9544 lt!323639)) (currentBit!9602 (_2!9544 lt!323639))))))

(declare-fun thiss!1204 () BitStream!8276)

(declare-fun isPrefixOf!0 (BitStream!8276 BitStream!8276) Bool)

(assert (=> b!207359 (isPrefixOf!0 thiss!1204 (_2!9544 lt!323639))))

(declare-fun lt!323644 () Unit!14762)

(declare-fun lt!323642 () tuple2!17778)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8276 BitStream!8276 BitStream!8276) Unit!14762)

(assert (=> b!207359 (= lt!323644 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9544 lt!323642) (_2!9544 lt!323639)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8276 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17778)

(assert (=> b!207359 (= lt!323639 (appendBitsLSBFirstLoopTR!0 (_2!9544 lt!323642) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207360 () Bool)

(declare-fun e!141748 () Bool)

(declare-fun e!141742 () Bool)

(assert (=> b!207360 (= e!141748 e!141742)))

(declare-fun res!173973 () Bool)

(assert (=> b!207360 (=> (not res!173973) (not e!141742))))

(declare-fun lt!323643 () Bool)

(declare-datatypes ((tuple2!17780 0))(
  ( (tuple2!17781 (_1!9545 BitStream!8276) (_2!9545 Bool)) )
))
(declare-fun lt!323645 () tuple2!17780)

(assert (=> b!207360 (= res!173973 (and (= (_2!9545 lt!323645) lt!323643) (= (_1!9545 lt!323645) (_2!9544 lt!323642))))))

(declare-fun readBitPure!0 (BitStream!8276) tuple2!17780)

(declare-fun readerFrom!0 (BitStream!8276 (_ BitVec 32) (_ BitVec 32)) BitStream!8276)

(assert (=> b!207360 (= lt!323645 (readBitPure!0 (readerFrom!0 (_2!9544 lt!323642) (currentBit!9602 thiss!1204) (currentByte!9607 thiss!1204))))))

(declare-fun b!207361 () Bool)

(declare-fun e!141746 () Bool)

(declare-fun lt!323649 () tuple2!17780)

(declare-fun lt!323637 () tuple2!17780)

(assert (=> b!207361 (= e!141746 (= (_2!9545 lt!323649) (_2!9545 lt!323637)))))

(declare-fun b!207362 () Bool)

(declare-fun res!173971 () Bool)

(assert (=> b!207362 (=> res!173971 e!141741)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207362 (= res!173971 (not (invariant!0 (currentBit!9602 (_2!9544 lt!323639)) (currentByte!9607 (_2!9544 lt!323639)) (size!4584 (buf!5089 (_2!9544 lt!323639))))))))

(declare-fun b!207363 () Bool)

(declare-fun res!173963 () Bool)

(declare-fun e!141747 () Bool)

(assert (=> b!207363 (=> (not res!173963) (not e!141747))))

(assert (=> b!207363 (= res!173963 (not (= i!590 nBits!348)))))

(declare-fun b!207364 () Bool)

(assert (=> b!207364 (= e!141747 (not e!141749))))

(declare-fun res!173965 () Bool)

(assert (=> b!207364 (=> res!173965 e!141749)))

(declare-fun lt!323654 () (_ BitVec 64))

(assert (=> b!207364 (= res!173965 (not (= lt!323641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323654))))))

(assert (=> b!207364 (= lt!323641 (bitIndex!0 (size!4584 (buf!5089 (_2!9544 lt!323642))) (currentByte!9607 (_2!9544 lt!323642)) (currentBit!9602 (_2!9544 lt!323642))))))

(assert (=> b!207364 (= lt!323654 (bitIndex!0 (size!4584 (buf!5089 thiss!1204)) (currentByte!9607 thiss!1204) (currentBit!9602 thiss!1204)))))

(declare-fun e!141750 () Bool)

(assert (=> b!207364 e!141750))

(declare-fun res!173968 () Bool)

(assert (=> b!207364 (=> (not res!173968) (not e!141750))))

(assert (=> b!207364 (= res!173968 (= (size!4584 (buf!5089 thiss!1204)) (size!4584 (buf!5089 (_2!9544 lt!323642)))))))

(declare-fun appendBit!0 (BitStream!8276 Bool) tuple2!17778)

(assert (=> b!207364 (= lt!323642 (appendBit!0 thiss!1204 lt!323643))))

(assert (=> b!207364 (= lt!323643 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207366 () Bool)

(declare-fun lt!323636 () (_ BitVec 64))

(assert (=> b!207366 (= e!141742 (= (bitIndex!0 (size!4584 (buf!5089 (_1!9545 lt!323645))) (currentByte!9607 (_1!9545 lt!323645)) (currentBit!9602 (_1!9545 lt!323645))) lt!323636))))

(declare-fun b!207367 () Bool)

(assert (=> b!207367 (= e!141741 (or (not (= (size!4584 (buf!5089 (_2!9544 lt!323642))) (size!4584 (buf!5089 (_2!9544 lt!323639))))) (bvsge ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17782 0))(
  ( (tuple2!17783 (_1!9546 BitStream!8276) (_2!9546 (_ BitVec 64))) )
))
(declare-fun lt!323638 () tuple2!17782)

(declare-datatypes ((tuple2!17784 0))(
  ( (tuple2!17785 (_1!9547 BitStream!8276) (_2!9547 BitStream!8276)) )
))
(declare-fun lt!323653 () tuple2!17784)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17782)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207367 (= lt!323638 (readNBitsLSBFirstsLoopPure!0 (_1!9547 lt!323653) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323650 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207367 (validate_offset_bits!1 ((_ sign_extend 32) (size!4584 (buf!5089 (_2!9544 lt!323639)))) ((_ sign_extend 32) (currentByte!9607 thiss!1204)) ((_ sign_extend 32) (currentBit!9602 thiss!1204)) lt!323650)))

(declare-fun lt!323646 () Unit!14762)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8276 array!10425 (_ BitVec 64)) Unit!14762)

(assert (=> b!207367 (= lt!323646 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5089 (_2!9544 lt!323639)) lt!323650))))

(assert (=> b!207367 (= (_2!9545 (readBitPure!0 (_1!9547 lt!323653))) lt!323643)))

(declare-fun lt!323640 () tuple2!17784)

(declare-fun reader!0 (BitStream!8276 BitStream!8276) tuple2!17784)

(assert (=> b!207367 (= lt!323640 (reader!0 (_2!9544 lt!323642) (_2!9544 lt!323639)))))

(assert (=> b!207367 (= lt!323653 (reader!0 thiss!1204 (_2!9544 lt!323639)))))

(assert (=> b!207367 e!141746))

(declare-fun res!173967 () Bool)

(assert (=> b!207367 (=> (not res!173967) (not e!141746))))

(assert (=> b!207367 (= res!173967 (= (bitIndex!0 (size!4584 (buf!5089 (_1!9545 lt!323649))) (currentByte!9607 (_1!9545 lt!323649)) (currentBit!9602 (_1!9545 lt!323649))) (bitIndex!0 (size!4584 (buf!5089 (_1!9545 lt!323637))) (currentByte!9607 (_1!9545 lt!323637)) (currentBit!9602 (_1!9545 lt!323637)))))))

(declare-fun lt!323648 () Unit!14762)

(declare-fun lt!323652 () BitStream!8276)

(declare-fun readBitPrefixLemma!0 (BitStream!8276 BitStream!8276) Unit!14762)

(assert (=> b!207367 (= lt!323648 (readBitPrefixLemma!0 lt!323652 (_2!9544 lt!323639)))))

(assert (=> b!207367 (= lt!323637 (readBitPure!0 (BitStream!8277 (buf!5089 (_2!9544 lt!323639)) (currentByte!9607 thiss!1204) (currentBit!9602 thiss!1204))))))

(assert (=> b!207367 (= lt!323649 (readBitPure!0 lt!323652))))

(declare-fun e!141745 () Bool)

(assert (=> b!207367 e!141745))

(declare-fun res!173964 () Bool)

(assert (=> b!207367 (=> (not res!173964) (not e!141745))))

(assert (=> b!207367 (= res!173964 (invariant!0 (currentBit!9602 thiss!1204) (currentByte!9607 thiss!1204) (size!4584 (buf!5089 (_2!9544 lt!323642)))))))

(assert (=> b!207367 (= lt!323652 (BitStream!8277 (buf!5089 (_2!9544 lt!323642)) (currentByte!9607 thiss!1204) (currentBit!9602 thiss!1204)))))

(declare-fun b!207368 () Bool)

(assert (=> b!207368 (= e!141750 e!141748)))

(declare-fun res!173972 () Bool)

(assert (=> b!207368 (=> (not res!173972) (not e!141748))))

(declare-fun lt!323647 () (_ BitVec 64))

(assert (=> b!207368 (= res!173972 (= lt!323636 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323647)))))

(assert (=> b!207368 (= lt!323636 (bitIndex!0 (size!4584 (buf!5089 (_2!9544 lt!323642))) (currentByte!9607 (_2!9544 lt!323642)) (currentBit!9602 (_2!9544 lt!323642))))))

(assert (=> b!207368 (= lt!323647 (bitIndex!0 (size!4584 (buf!5089 thiss!1204)) (currentByte!9607 thiss!1204) (currentBit!9602 thiss!1204)))))

(declare-fun b!207369 () Bool)

(declare-fun res!173977 () Bool)

(assert (=> b!207369 (=> res!173977 e!141741)))

(assert (=> b!207369 (= res!173977 (not (isPrefixOf!0 thiss!1204 (_2!9544 lt!323642))))))

(declare-fun b!207370 () Bool)

(declare-fun res!173976 () Bool)

(assert (=> b!207370 (=> res!173976 e!141741)))

(assert (=> b!207370 (= res!173976 (or (not (= (size!4584 (buf!5089 (_2!9544 lt!323639))) (size!4584 (buf!5089 thiss!1204)))) (not (= lt!323651 (bvsub (bvadd lt!323654 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207371 () Bool)

(assert (=> b!207371 (= e!141745 (invariant!0 (currentBit!9602 thiss!1204) (currentByte!9607 thiss!1204) (size!4584 (buf!5089 (_2!9544 lt!323639)))))))

(declare-fun b!207372 () Bool)

(declare-fun res!173970 () Bool)

(assert (=> b!207372 (=> (not res!173970) (not e!141748))))

(assert (=> b!207372 (= res!173970 (isPrefixOf!0 thiss!1204 (_2!9544 lt!323642)))))

(declare-fun b!207373 () Bool)

(declare-fun res!173966 () Bool)

(assert (=> b!207373 (=> res!173966 e!141741)))

(assert (=> b!207373 (= res!173966 (not (isPrefixOf!0 (_2!9544 lt!323642) (_2!9544 lt!323639))))))

(declare-fun b!207374 () Bool)

(declare-fun e!141740 () Bool)

(assert (=> b!207374 (= e!141740 e!141747)))

(declare-fun res!173969 () Bool)

(assert (=> b!207374 (=> (not res!173969) (not e!141747))))

(assert (=> b!207374 (= res!173969 (validate_offset_bits!1 ((_ sign_extend 32) (size!4584 (buf!5089 thiss!1204))) ((_ sign_extend 32) (currentByte!9607 thiss!1204)) ((_ sign_extend 32) (currentBit!9602 thiss!1204)) lt!323650))))

(assert (=> b!207374 (= lt!323650 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207375 () Bool)

(declare-fun res!173975 () Bool)

(assert (=> b!207375 (=> (not res!173975) (not e!141747))))

(assert (=> b!207375 (= res!173975 (invariant!0 (currentBit!9602 thiss!1204) (currentByte!9607 thiss!1204) (size!4584 (buf!5089 thiss!1204))))))

(declare-fun b!207365 () Bool)

(declare-fun e!141743 () Bool)

(declare-fun array_inv!4325 (array!10425) Bool)

(assert (=> b!207365 (= e!141743 (array_inv!4325 (buf!5089 thiss!1204)))))

(declare-fun res!173974 () Bool)

(assert (=> start!43642 (=> (not res!173974) (not e!141740))))

(assert (=> start!43642 (= res!173974 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43642 e!141740))

(assert (=> start!43642 true))

(declare-fun inv!12 (BitStream!8276) Bool)

(assert (=> start!43642 (and (inv!12 thiss!1204) e!141743)))

(assert (= (and start!43642 res!173974) b!207374))

(assert (= (and b!207374 res!173969) b!207375))

(assert (= (and b!207375 res!173975) b!207363))

(assert (= (and b!207363 res!173963) b!207364))

(assert (= (and b!207364 res!173968) b!207368))

(assert (= (and b!207368 res!173972) b!207372))

(assert (= (and b!207372 res!173970) b!207360))

(assert (= (and b!207360 res!173973) b!207366))

(assert (= (and b!207364 (not res!173965)) b!207359))

(assert (= (and b!207359 (not res!173978)) b!207362))

(assert (= (and b!207362 (not res!173971)) b!207370))

(assert (= (and b!207370 (not res!173976)) b!207373))

(assert (= (and b!207373 (not res!173966)) b!207369))

(assert (= (and b!207369 (not res!173977)) b!207367))

(assert (= (and b!207367 res!173964) b!207371))

(assert (= (and b!207367 res!173967) b!207361))

(assert (= start!43642 b!207365))

(declare-fun m!319087 () Bool)

(assert (=> start!43642 m!319087))

(declare-fun m!319089 () Bool)

(assert (=> b!207360 m!319089))

(assert (=> b!207360 m!319089))

(declare-fun m!319091 () Bool)

(assert (=> b!207360 m!319091))

(declare-fun m!319093 () Bool)

(assert (=> b!207373 m!319093))

(declare-fun m!319095 () Bool)

(assert (=> b!207366 m!319095))

(declare-fun m!319097 () Bool)

(assert (=> b!207367 m!319097))

(declare-fun m!319099 () Bool)

(assert (=> b!207367 m!319099))

(declare-fun m!319101 () Bool)

(assert (=> b!207367 m!319101))

(declare-fun m!319103 () Bool)

(assert (=> b!207367 m!319103))

(declare-fun m!319105 () Bool)

(assert (=> b!207367 m!319105))

(declare-fun m!319107 () Bool)

(assert (=> b!207367 m!319107))

(declare-fun m!319109 () Bool)

(assert (=> b!207367 m!319109))

(declare-fun m!319111 () Bool)

(assert (=> b!207367 m!319111))

(declare-fun m!319113 () Bool)

(assert (=> b!207367 m!319113))

(declare-fun m!319115 () Bool)

(assert (=> b!207367 m!319115))

(declare-fun m!319117 () Bool)

(assert (=> b!207367 m!319117))

(declare-fun m!319119 () Bool)

(assert (=> b!207367 m!319119))

(declare-fun m!319121 () Bool)

(assert (=> b!207367 m!319121))

(declare-fun m!319123 () Bool)

(assert (=> b!207365 m!319123))

(declare-fun m!319125 () Bool)

(assert (=> b!207372 m!319125))

(declare-fun m!319127 () Bool)

(assert (=> b!207364 m!319127))

(declare-fun m!319129 () Bool)

(assert (=> b!207364 m!319129))

(declare-fun m!319131 () Bool)

(assert (=> b!207364 m!319131))

(declare-fun m!319133 () Bool)

(assert (=> b!207371 m!319133))

(declare-fun m!319135 () Bool)

(assert (=> b!207374 m!319135))

(declare-fun m!319137 () Bool)

(assert (=> b!207359 m!319137))

(declare-fun m!319139 () Bool)

(assert (=> b!207359 m!319139))

(declare-fun m!319141 () Bool)

(assert (=> b!207359 m!319141))

(declare-fun m!319143 () Bool)

(assert (=> b!207359 m!319143))

(assert (=> b!207369 m!319125))

(declare-fun m!319145 () Bool)

(assert (=> b!207375 m!319145))

(assert (=> b!207368 m!319127))

(assert (=> b!207368 m!319129))

(declare-fun m!319147 () Bool)

(assert (=> b!207362 m!319147))

(push 1)

(assert (not b!207374))

(assert (not b!207368))

(assert (not b!207373))

(assert (not b!207359))

(assert (not b!207365))

(assert (not b!207375))

(assert (not b!207372))

(assert (not b!207366))

(assert (not b!207362))

(assert (not b!207360))

(assert (not b!207364))

(assert (not b!207369))

(assert (not start!43642))

(assert (not b!207367))

(assert (not b!207371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

