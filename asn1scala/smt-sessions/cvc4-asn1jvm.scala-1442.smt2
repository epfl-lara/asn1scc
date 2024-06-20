; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39606 () Bool)

(assert start!39606)

(declare-fun b!178624 () Bool)

(declare-fun res!148168 () Bool)

(declare-fun e!124352 () Bool)

(assert (=> b!178624 (=> (not res!148168) (not e!124352))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9621 0))(
  ( (array!9622 (arr!5172 (Array (_ BitVec 32) (_ BitVec 8))) (size!4242 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7592 0))(
  ( (BitStream!7593 (buf!4685 array!9621) (currentByte!8883 (_ BitVec 32)) (currentBit!8878 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7592)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178624 (= res!148168 (validate_offset_bits!1 ((_ sign_extend 32) (size!4242 (buf!4685 thiss!1204))) ((_ sign_extend 32) (currentByte!8883 thiss!1204)) ((_ sign_extend 32) (currentBit!8878 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178625 () Bool)

(declare-fun res!148163 () Bool)

(declare-fun e!124346 () Bool)

(assert (=> b!178625 (=> res!148163 e!124346)))

(declare-datatypes ((Unit!12864 0))(
  ( (Unit!12865) )
))
(declare-datatypes ((tuple2!15400 0))(
  ( (tuple2!15401 (_1!8345 Unit!12864) (_2!8345 BitStream!7592)) )
))
(declare-fun lt!274253 () tuple2!15400)

(declare-fun lt!274251 () tuple2!15400)

(declare-fun isPrefixOf!0 (BitStream!7592 BitStream!7592) Bool)

(assert (=> b!178625 (= res!148163 (not (isPrefixOf!0 (_2!8345 lt!274253) (_2!8345 lt!274251))))))

(declare-fun b!178626 () Bool)

(declare-fun res!148157 () Bool)

(declare-fun e!124351 () Bool)

(assert (=> b!178626 (=> res!148157 e!124351)))

(declare-fun arrayBitRangesEq!0 (array!9621 array!9621 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178626 (= res!148157 (not (arrayBitRangesEq!0 (buf!4685 (_2!8345 lt!274253)) (buf!4685 (_2!8345 lt!274251)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4242 (buf!4685 (_2!8345 lt!274253))) (currentByte!8883 thiss!1204) (currentBit!8878 thiss!1204))))))))

(declare-fun b!178627 () Bool)

(declare-fun e!124348 () Bool)

(declare-fun e!124353 () Bool)

(assert (=> b!178627 (= e!124348 e!124353)))

(declare-fun res!148159 () Bool)

(assert (=> b!178627 (=> (not res!148159) (not e!124353))))

(declare-fun lt!274258 () (_ BitVec 64))

(declare-fun lt!274256 () (_ BitVec 64))

(assert (=> b!178627 (= res!148159 (= lt!274258 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274256)))))

(assert (=> b!178627 (= lt!274258 (bitIndex!0 (size!4242 (buf!4685 (_2!8345 lt!274253))) (currentByte!8883 (_2!8345 lt!274253)) (currentBit!8878 (_2!8345 lt!274253))))))

(assert (=> b!178627 (= lt!274256 (bitIndex!0 (size!4242 (buf!4685 thiss!1204)) (currentByte!8883 thiss!1204) (currentBit!8878 thiss!1204)))))

(declare-fun b!178628 () Bool)

(declare-fun e!124347 () Bool)

(assert (=> b!178628 (= e!124347 e!124346)))

(declare-fun res!148155 () Bool)

(assert (=> b!178628 (=> res!148155 e!124346)))

(declare-fun lt!274262 () (_ BitVec 64))

(declare-fun lt!274259 () (_ BitVec 64))

(assert (=> b!178628 (= res!148155 (not (= lt!274259 (bvsub (bvsub (bvadd lt!274262 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178628 (= lt!274259 (bitIndex!0 (size!4242 (buf!4685 (_2!8345 lt!274251))) (currentByte!8883 (_2!8345 lt!274251)) (currentBit!8878 (_2!8345 lt!274251))))))

(assert (=> b!178628 (isPrefixOf!0 thiss!1204 (_2!8345 lt!274251))))

(declare-fun lt!274257 () Unit!12864)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7592 BitStream!7592 BitStream!7592) Unit!12864)

(assert (=> b!178628 (= lt!274257 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8345 lt!274253) (_2!8345 lt!274251)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15400)

(assert (=> b!178628 (= lt!274251 (appendBitsLSBFirstLoopTR!0 (_2!8345 lt!274253) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178629 () Bool)

(declare-fun res!148156 () Bool)

(assert (=> b!178629 (=> res!148156 e!124346)))

(assert (=> b!178629 (= res!148156 (not (isPrefixOf!0 thiss!1204 (_2!8345 lt!274253))))))

(declare-fun b!178630 () Bool)

(declare-fun e!124349 () Bool)

(assert (=> b!178630 (= e!124353 e!124349)))

(declare-fun res!148165 () Bool)

(assert (=> b!178630 (=> (not res!148165) (not e!124349))))

(declare-datatypes ((tuple2!15402 0))(
  ( (tuple2!15403 (_1!8346 BitStream!7592) (_2!8346 Bool)) )
))
(declare-fun lt!274260 () tuple2!15402)

(declare-fun lt!274254 () Bool)

(assert (=> b!178630 (= res!148165 (and (= (_2!8346 lt!274260) lt!274254) (= (_1!8346 lt!274260) (_2!8345 lt!274253))))))

(declare-fun readBitPure!0 (BitStream!7592) tuple2!15402)

(declare-fun readerFrom!0 (BitStream!7592 (_ BitVec 32) (_ BitVec 32)) BitStream!7592)

(assert (=> b!178630 (= lt!274260 (readBitPure!0 (readerFrom!0 (_2!8345 lt!274253) (currentBit!8878 thiss!1204) (currentByte!8883 thiss!1204))))))

(declare-fun b!178631 () Bool)

(assert (=> b!178631 (= e!124346 e!124351)))

(declare-fun res!148158 () Bool)

(assert (=> b!178631 (=> res!148158 e!124351)))

(assert (=> b!178631 (= res!148158 (not (= (size!4242 (buf!4685 (_2!8345 lt!274253))) (size!4242 (buf!4685 (_2!8345 lt!274251))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178631 (invariant!0 (currentBit!8878 thiss!1204) (currentByte!8883 thiss!1204) (size!4242 (buf!4685 (_2!8345 lt!274253))))))

(declare-fun b!178632 () Bool)

(declare-fun res!148167 () Bool)

(assert (=> b!178632 (=> res!148167 e!124351)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178632 (= res!148167 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4242 (buf!4685 (_2!8345 lt!274253)))) ((_ sign_extend 32) (currentByte!8883 thiss!1204)) ((_ sign_extend 32) (currentBit!8878 thiss!1204)))))))

(declare-fun b!178634 () Bool)

(assert (=> b!178634 (= e!124351 true)))

(declare-fun lt!274255 () tuple2!15402)

(assert (=> b!178634 (= lt!274255 (readBitPure!0 (BitStream!7593 (buf!4685 (_2!8345 lt!274251)) (currentByte!8883 thiss!1204) (currentBit!8878 thiss!1204))))))

(declare-fun lt!274261 () tuple2!15402)

(assert (=> b!178634 (= lt!274261 (readBitPure!0 (BitStream!7593 (buf!4685 (_2!8345 lt!274253)) (currentByte!8883 thiss!1204) (currentBit!8878 thiss!1204))))))

(assert (=> b!178634 (invariant!0 (currentBit!8878 thiss!1204) (currentByte!8883 thiss!1204) (size!4242 (buf!4685 (_2!8345 lt!274251))))))

(declare-fun b!178635 () Bool)

(declare-fun res!148160 () Bool)

(assert (=> b!178635 (=> (not res!148160) (not e!124352))))

(assert (=> b!178635 (= res!148160 (not (= i!590 nBits!348)))))

(declare-fun b!178636 () Bool)

(declare-fun res!148169 () Bool)

(assert (=> b!178636 (=> (not res!148169) (not e!124352))))

(assert (=> b!178636 (= res!148169 (invariant!0 (currentBit!8878 thiss!1204) (currentByte!8883 thiss!1204) (size!4242 (buf!4685 thiss!1204))))))

(declare-fun b!178637 () Bool)

(declare-fun res!148164 () Bool)

(assert (=> b!178637 (=> res!148164 e!124346)))

(assert (=> b!178637 (= res!148164 (not (invariant!0 (currentBit!8878 (_2!8345 lt!274251)) (currentByte!8883 (_2!8345 lt!274251)) (size!4242 (buf!4685 (_2!8345 lt!274251))))))))

(declare-fun b!178638 () Bool)

(declare-fun res!148161 () Bool)

(assert (=> b!178638 (=> (not res!148161) (not e!124353))))

(assert (=> b!178638 (= res!148161 (isPrefixOf!0 thiss!1204 (_2!8345 lt!274253)))))

(declare-fun b!178639 () Bool)

(assert (=> b!178639 (= e!124349 (= (bitIndex!0 (size!4242 (buf!4685 (_1!8346 lt!274260))) (currentByte!8883 (_1!8346 lt!274260)) (currentBit!8878 (_1!8346 lt!274260))) lt!274258))))

(declare-fun b!178640 () Bool)

(declare-fun res!148170 () Bool)

(assert (=> b!178640 (=> res!148170 e!124346)))

(declare-fun lt!274252 () (_ BitVec 64))

(assert (=> b!178640 (= res!148170 (or (not (= (size!4242 (buf!4685 (_2!8345 lt!274251))) (size!4242 (buf!4685 thiss!1204)))) (not (= lt!274259 (bvsub (bvadd lt!274252 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178641 () Bool)

(declare-fun e!124350 () Bool)

(declare-fun array_inv!3983 (array!9621) Bool)

(assert (=> b!178641 (= e!124350 (array_inv!3983 (buf!4685 thiss!1204)))))

(declare-fun res!148162 () Bool)

(assert (=> start!39606 (=> (not res!148162) (not e!124352))))

(assert (=> start!39606 (= res!148162 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39606 e!124352))

(assert (=> start!39606 true))

(declare-fun inv!12 (BitStream!7592) Bool)

(assert (=> start!39606 (and (inv!12 thiss!1204) e!124350)))

(declare-fun b!178633 () Bool)

(assert (=> b!178633 (= e!124352 (not e!124347))))

(declare-fun res!148166 () Bool)

(assert (=> b!178633 (=> res!148166 e!124347)))

(assert (=> b!178633 (= res!148166 (not (= lt!274262 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274252))))))

(assert (=> b!178633 (= lt!274262 (bitIndex!0 (size!4242 (buf!4685 (_2!8345 lt!274253))) (currentByte!8883 (_2!8345 lt!274253)) (currentBit!8878 (_2!8345 lt!274253))))))

(assert (=> b!178633 (= lt!274252 (bitIndex!0 (size!4242 (buf!4685 thiss!1204)) (currentByte!8883 thiss!1204) (currentBit!8878 thiss!1204)))))

(assert (=> b!178633 e!124348))

(declare-fun res!148154 () Bool)

(assert (=> b!178633 (=> (not res!148154) (not e!124348))))

(assert (=> b!178633 (= res!148154 (= (size!4242 (buf!4685 thiss!1204)) (size!4242 (buf!4685 (_2!8345 lt!274253)))))))

(declare-fun appendBit!0 (BitStream!7592 Bool) tuple2!15400)

(assert (=> b!178633 (= lt!274253 (appendBit!0 thiss!1204 lt!274254))))

(assert (=> b!178633 (= lt!274254 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39606 res!148162) b!178624))

(assert (= (and b!178624 res!148168) b!178636))

(assert (= (and b!178636 res!148169) b!178635))

(assert (= (and b!178635 res!148160) b!178633))

(assert (= (and b!178633 res!148154) b!178627))

(assert (= (and b!178627 res!148159) b!178638))

(assert (= (and b!178638 res!148161) b!178630))

(assert (= (and b!178630 res!148165) b!178639))

(assert (= (and b!178633 (not res!148166)) b!178628))

(assert (= (and b!178628 (not res!148155)) b!178637))

(assert (= (and b!178637 (not res!148164)) b!178640))

(assert (= (and b!178640 (not res!148170)) b!178625))

(assert (= (and b!178625 (not res!148163)) b!178629))

(assert (= (and b!178629 (not res!148156)) b!178631))

(assert (= (and b!178631 (not res!148158)) b!178632))

(assert (= (and b!178632 (not res!148167)) b!178626))

(assert (= (and b!178626 (not res!148157)) b!178634))

(assert (= start!39606 b!178641))

(declare-fun m!278731 () Bool)

(assert (=> b!178637 m!278731))

(declare-fun m!278733 () Bool)

(assert (=> b!178627 m!278733))

(declare-fun m!278735 () Bool)

(assert (=> b!178627 m!278735))

(declare-fun m!278737 () Bool)

(assert (=> b!178624 m!278737))

(declare-fun m!278739 () Bool)

(assert (=> b!178634 m!278739))

(declare-fun m!278741 () Bool)

(assert (=> b!178634 m!278741))

(declare-fun m!278743 () Bool)

(assert (=> b!178634 m!278743))

(declare-fun m!278745 () Bool)

(assert (=> b!178632 m!278745))

(declare-fun m!278747 () Bool)

(assert (=> start!39606 m!278747))

(declare-fun m!278749 () Bool)

(assert (=> b!178639 m!278749))

(declare-fun m!278751 () Bool)

(assert (=> b!178641 m!278751))

(declare-fun m!278753 () Bool)

(assert (=> b!178629 m!278753))

(declare-fun m!278755 () Bool)

(assert (=> b!178630 m!278755))

(assert (=> b!178630 m!278755))

(declare-fun m!278757 () Bool)

(assert (=> b!178630 m!278757))

(declare-fun m!278759 () Bool)

(assert (=> b!178631 m!278759))

(declare-fun m!278761 () Bool)

(assert (=> b!178625 m!278761))

(declare-fun m!278763 () Bool)

(assert (=> b!178626 m!278763))

(declare-fun m!278765 () Bool)

(assert (=> b!178626 m!278765))

(declare-fun m!278767 () Bool)

(assert (=> b!178636 m!278767))

(assert (=> b!178638 m!278753))

(declare-fun m!278769 () Bool)

(assert (=> b!178628 m!278769))

(declare-fun m!278771 () Bool)

(assert (=> b!178628 m!278771))

(declare-fun m!278773 () Bool)

(assert (=> b!178628 m!278773))

(declare-fun m!278775 () Bool)

(assert (=> b!178628 m!278775))

(assert (=> b!178633 m!278733))

(assert (=> b!178633 m!278735))

(declare-fun m!278777 () Bool)

(assert (=> b!178633 m!278777))

(push 1)

(assert (not b!178632))

(assert (not b!178626))

(assert (not b!178634))

(assert (not b!178627))

(assert (not b!178641))

(assert (not b!178633))

(assert (not b!178636))

(assert (not b!178628))

(assert (not b!178639))

(assert (not b!178631))

(assert (not b!178638))

(assert (not b!178637))

(assert (not b!178625))

(assert (not b!178630))

(assert (not start!39606))

(assert (not b!178624))

(assert (not b!178629))

(check-sat)

