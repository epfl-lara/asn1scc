; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39626 () Bool)

(assert start!39626)

(declare-fun b!179144 () Bool)

(declare-fun e!124638 () Bool)

(declare-datatypes ((array!9641 0))(
  ( (array!9642 (arr!5182 (Array (_ BitVec 32) (_ BitVec 8))) (size!4252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7612 0))(
  ( (BitStream!7613 (buf!4695 array!9641) (currentByte!8893 (_ BitVec 32)) (currentBit!8888 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7612)

(declare-fun array_inv!3993 (array!9641) Bool)

(assert (=> b!179144 (= e!124638 (array_inv!3993 (buf!4695 thiss!1204)))))

(declare-fun res!148649 () Bool)

(declare-fun e!124643 () Bool)

(assert (=> start!39626 (=> (not res!148649) (not e!124643))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39626 (= res!148649 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39626 e!124643))

(assert (=> start!39626 true))

(declare-fun inv!12 (BitStream!7612) Bool)

(assert (=> start!39626 (and (inv!12 thiss!1204) e!124638)))

(declare-fun b!179145 () Bool)

(declare-fun e!124642 () Bool)

(assert (=> b!179145 (= e!124643 (not e!124642))))

(declare-fun res!148659 () Bool)

(assert (=> b!179145 (=> res!148659 e!124642)))

(declare-fun lt!274677 () (_ BitVec 64))

(declare-fun lt!274668 () (_ BitVec 64))

(assert (=> b!179145 (= res!148659 (not (= lt!274677 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274668))))))

(declare-datatypes ((Unit!12884 0))(
  ( (Unit!12885) )
))
(declare-datatypes ((tuple2!15446 0))(
  ( (tuple2!15447 (_1!8368 Unit!12884) (_2!8368 BitStream!7612)) )
))
(declare-fun lt!274667 () tuple2!15446)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179145 (= lt!274677 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(assert (=> b!179145 (= lt!274668 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun e!124640 () Bool)

(assert (=> b!179145 e!124640))

(declare-fun res!148648 () Bool)

(assert (=> b!179145 (=> (not res!148648) (not e!124640))))

(assert (=> b!179145 (= res!148648 (= (size!4252 (buf!4695 thiss!1204)) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(declare-fun lt!274676 () Bool)

(declare-fun appendBit!0 (BitStream!7612 Bool) tuple2!15446)

(assert (=> b!179145 (= lt!274667 (appendBit!0 thiss!1204 lt!274676))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!179145 (= lt!274676 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179146 () Bool)

(declare-fun res!148647 () Bool)

(declare-fun e!124644 () Bool)

(assert (=> b!179146 (=> (not res!148647) (not e!124644))))

(declare-fun isPrefixOf!0 (BitStream!7612 BitStream!7612) Bool)

(assert (=> b!179146 (= res!148647 (isPrefixOf!0 thiss!1204 (_2!8368 lt!274667)))))

(declare-fun b!179147 () Bool)

(declare-fun e!124639 () Bool)

(declare-datatypes ((tuple2!15448 0))(
  ( (tuple2!15449 (_1!8369 BitStream!7612) (_2!8369 BitStream!7612)) )
))
(declare-fun lt!274675 () tuple2!15448)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179147 (= e!124639 (validate_offset_bit!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8369 lt!274675)))) ((_ sign_extend 32) (currentByte!8893 (_1!8369 lt!274675))) ((_ sign_extend 32) (currentBit!8888 (_1!8369 lt!274675)))))))

(declare-fun lt!274670 () tuple2!15448)

(declare-fun lt!274665 () tuple2!15446)

(declare-fun reader!0 (BitStream!7612 BitStream!7612) tuple2!15448)

(assert (=> b!179147 (= lt!274670 (reader!0 (_2!8368 lt!274667) (_2!8368 lt!274665)))))

(assert (=> b!179147 (= lt!274675 (reader!0 thiss!1204 (_2!8368 lt!274665)))))

(declare-fun e!124645 () Bool)

(assert (=> b!179147 e!124645))

(declare-fun res!148653 () Bool)

(assert (=> b!179147 (=> (not res!148653) (not e!124645))))

(declare-datatypes ((tuple2!15450 0))(
  ( (tuple2!15451 (_1!8370 BitStream!7612) (_2!8370 Bool)) )
))
(declare-fun lt!274673 () tuple2!15450)

(declare-fun lt!274679 () tuple2!15450)

(assert (=> b!179147 (= res!148653 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274673))) (currentByte!8893 (_1!8370 lt!274673)) (currentBit!8888 (_1!8370 lt!274673))) (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274679))) (currentByte!8893 (_1!8370 lt!274679)) (currentBit!8888 (_1!8370 lt!274679)))))))

(declare-fun lt!274672 () Unit!12884)

(declare-fun lt!274674 () BitStream!7612)

(declare-fun readBitPrefixLemma!0 (BitStream!7612 BitStream!7612) Unit!12884)

(assert (=> b!179147 (= lt!274672 (readBitPrefixLemma!0 lt!274674 (_2!8368 lt!274665)))))

(declare-fun readBitPure!0 (BitStream!7612) tuple2!15450)

(assert (=> b!179147 (= lt!274679 (readBitPure!0 (BitStream!7613 (buf!4695 (_2!8368 lt!274665)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204))))))

(assert (=> b!179147 (= lt!274673 (readBitPure!0 lt!274674))))

(declare-fun e!124637 () Bool)

(assert (=> b!179147 e!124637))

(declare-fun res!148655 () Bool)

(assert (=> b!179147 (=> (not res!148655) (not e!124637))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179147 (= res!148655 (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(assert (=> b!179147 (= lt!274674 (BitStream!7613 (buf!4695 (_2!8368 lt!274667)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun b!179148 () Bool)

(declare-fun res!148658 () Bool)

(assert (=> b!179148 (=> res!148658 e!124639)))

(declare-fun lt!274669 () (_ BitVec 64))

(assert (=> b!179148 (= res!148658 (or (not (= (size!4252 (buf!4695 (_2!8368 lt!274665))) (size!4252 (buf!4695 thiss!1204)))) (not (= lt!274669 (bvsub (bvadd lt!274668 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179149 () Bool)

(declare-fun res!148644 () Bool)

(assert (=> b!179149 (=> res!148644 e!124639)))

(assert (=> b!179149 (= res!148644 (not (invariant!0 (currentBit!8888 (_2!8368 lt!274665)) (currentByte!8893 (_2!8368 lt!274665)) (size!4252 (buf!4695 (_2!8368 lt!274665))))))))

(declare-fun b!179150 () Bool)

(declare-fun res!148651 () Bool)

(assert (=> b!179150 (=> res!148651 e!124639)))

(assert (=> b!179150 (= res!148651 (not (isPrefixOf!0 thiss!1204 (_2!8368 lt!274667))))))

(declare-fun b!179151 () Bool)

(assert (=> b!179151 (= e!124645 (= (_2!8370 lt!274673) (_2!8370 lt!274679)))))

(declare-fun b!179152 () Bool)

(assert (=> b!179152 (= e!124640 e!124644)))

(declare-fun res!148646 () Bool)

(assert (=> b!179152 (=> (not res!148646) (not e!124644))))

(declare-fun lt!274666 () (_ BitVec 64))

(declare-fun lt!274671 () (_ BitVec 64))

(assert (=> b!179152 (= res!148646 (= lt!274666 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274671)))))

(assert (=> b!179152 (= lt!274666 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(assert (=> b!179152 (= lt!274671 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun b!179153 () Bool)

(declare-fun res!148645 () Bool)

(assert (=> b!179153 (=> (not res!148645) (not e!124643))))

(assert (=> b!179153 (= res!148645 (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 thiss!1204))))))

(declare-fun b!179154 () Bool)

(declare-fun res!148650 () Bool)

(assert (=> b!179154 (=> res!148650 e!124639)))

(assert (=> b!179154 (= res!148650 (not (isPrefixOf!0 (_2!8368 lt!274667) (_2!8368 lt!274665))))))

(declare-fun b!179155 () Bool)

(declare-fun res!148652 () Bool)

(assert (=> b!179155 (=> (not res!148652) (not e!124643))))

(assert (=> b!179155 (= res!148652 (not (= i!590 nBits!348)))))

(declare-fun b!179156 () Bool)

(declare-fun e!124636 () Bool)

(declare-fun lt!274664 () tuple2!15450)

(assert (=> b!179156 (= e!124636 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274664))) (currentByte!8893 (_1!8370 lt!274664)) (currentBit!8888 (_1!8370 lt!274664))) lt!274666))))

(declare-fun b!179157 () Bool)

(assert (=> b!179157 (= e!124637 (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274665)))))))

(declare-fun b!179158 () Bool)

(assert (=> b!179158 (= e!124642 e!124639)))

(declare-fun res!148654 () Bool)

(assert (=> b!179158 (=> res!148654 e!124639)))

(assert (=> b!179158 (= res!148654 (not (= lt!274669 (bvsub (bvsub (bvadd lt!274677 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179158 (= lt!274669 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274665))) (currentByte!8893 (_2!8368 lt!274665)) (currentBit!8888 (_2!8368 lt!274665))))))

(assert (=> b!179158 (isPrefixOf!0 thiss!1204 (_2!8368 lt!274665))))

(declare-fun lt!274678 () Unit!12884)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7612 BitStream!7612 BitStream!7612) Unit!12884)

(assert (=> b!179158 (= lt!274678 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8368 lt!274667) (_2!8368 lt!274665)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15446)

(assert (=> b!179158 (= lt!274665 (appendBitsLSBFirstLoopTR!0 (_2!8368 lt!274667) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179159 () Bool)

(declare-fun res!148657 () Bool)

(assert (=> b!179159 (=> (not res!148657) (not e!124643))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179159 (= res!148657 (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))) ((_ sign_extend 32) (currentByte!8893 thiss!1204)) ((_ sign_extend 32) (currentBit!8888 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179160 () Bool)

(assert (=> b!179160 (= e!124644 e!124636)))

(declare-fun res!148656 () Bool)

(assert (=> b!179160 (=> (not res!148656) (not e!124636))))

(assert (=> b!179160 (= res!148656 (and (= (_2!8370 lt!274664) lt!274676) (= (_1!8370 lt!274664) (_2!8368 lt!274667))))))

(declare-fun readerFrom!0 (BitStream!7612 (_ BitVec 32) (_ BitVec 32)) BitStream!7612)

(assert (=> b!179160 (= lt!274664 (readBitPure!0 (readerFrom!0 (_2!8368 lt!274667) (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204))))))

(assert (= (and start!39626 res!148649) b!179159))

(assert (= (and b!179159 res!148657) b!179153))

(assert (= (and b!179153 res!148645) b!179155))

(assert (= (and b!179155 res!148652) b!179145))

(assert (= (and b!179145 res!148648) b!179152))

(assert (= (and b!179152 res!148646) b!179146))

(assert (= (and b!179146 res!148647) b!179160))

(assert (= (and b!179160 res!148656) b!179156))

(assert (= (and b!179145 (not res!148659)) b!179158))

(assert (= (and b!179158 (not res!148654)) b!179149))

(assert (= (and b!179149 (not res!148644)) b!179148))

(assert (= (and b!179148 (not res!148658)) b!179154))

(assert (= (and b!179154 (not res!148650)) b!179150))

(assert (= (and b!179150 (not res!148651)) b!179147))

(assert (= (and b!179147 res!148655) b!179157))

(assert (= (and b!179147 res!148653) b!179151))

(assert (= start!39626 b!179144))

(declare-fun m!279217 () Bool)

(assert (=> start!39626 m!279217))

(declare-fun m!279219 () Bool)

(assert (=> b!179154 m!279219))

(declare-fun m!279221 () Bool)

(assert (=> b!179149 m!279221))

(declare-fun m!279223 () Bool)

(assert (=> b!179156 m!279223))

(declare-fun m!279225 () Bool)

(assert (=> b!179147 m!279225))

(declare-fun m!279227 () Bool)

(assert (=> b!179147 m!279227))

(declare-fun m!279229 () Bool)

(assert (=> b!179147 m!279229))

(declare-fun m!279231 () Bool)

(assert (=> b!179147 m!279231))

(declare-fun m!279233 () Bool)

(assert (=> b!179147 m!279233))

(declare-fun m!279235 () Bool)

(assert (=> b!179147 m!279235))

(declare-fun m!279237 () Bool)

(assert (=> b!179147 m!279237))

(declare-fun m!279239 () Bool)

(assert (=> b!179147 m!279239))

(declare-fun m!279241 () Bool)

(assert (=> b!179147 m!279241))

(declare-fun m!279243 () Bool)

(assert (=> b!179153 m!279243))

(declare-fun m!279245 () Bool)

(assert (=> b!179145 m!279245))

(declare-fun m!279247 () Bool)

(assert (=> b!179145 m!279247))

(declare-fun m!279249 () Bool)

(assert (=> b!179145 m!279249))

(declare-fun m!279251 () Bool)

(assert (=> b!179150 m!279251))

(declare-fun m!279253 () Bool)

(assert (=> b!179160 m!279253))

(assert (=> b!179160 m!279253))

(declare-fun m!279255 () Bool)

(assert (=> b!179160 m!279255))

(declare-fun m!279257 () Bool)

(assert (=> b!179157 m!279257))

(assert (=> b!179152 m!279245))

(assert (=> b!179152 m!279247))

(declare-fun m!279259 () Bool)

(assert (=> b!179158 m!279259))

(declare-fun m!279261 () Bool)

(assert (=> b!179158 m!279261))

(declare-fun m!279263 () Bool)

(assert (=> b!179158 m!279263))

(declare-fun m!279265 () Bool)

(assert (=> b!179158 m!279265))

(declare-fun m!279267 () Bool)

(assert (=> b!179159 m!279267))

(declare-fun m!279269 () Bool)

(assert (=> b!179144 m!279269))

(assert (=> b!179146 m!279251))

(push 1)

(assert (not b!179145))

(assert (not b!179158))

(assert (not b!179159))

(assert (not b!179154))

(assert (not b!179149))

(assert (not b!179147))

(assert (not b!179160))

(assert (not b!179156))

(assert (not b!179150))

(assert (not b!179152))

(assert (not start!39626))

(assert (not b!179157))

(assert (not b!179153))

(assert (not b!179144))

(assert (not b!179146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62653 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62653 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8369 lt!274675)))) ((_ sign_extend 32) (currentByte!8893 (_1!8369 lt!274675))) ((_ sign_extend 32) (currentBit!8888 (_1!8369 lt!274675)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8369 lt!274675)))) ((_ sign_extend 32) (currentByte!8893 (_1!8369 lt!274675))) ((_ sign_extend 32) (currentBit!8888 (_1!8369 lt!274675)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15629 () Bool)

(assert (= bs!15629 d!62653))

(declare-fun m!279389 () Bool)

(assert (=> bs!15629 m!279389))

(assert (=> b!179147 d!62653))

(declare-fun d!62655 () Bool)

(declare-fun e!124718 () Bool)

(assert (=> d!62655 e!124718))

(declare-fun res!148777 () Bool)

(assert (=> d!62655 (=> (not res!148777) (not e!124718))))

(declare-fun lt!274819 () (_ BitVec 64))

(declare-fun lt!274815 () (_ BitVec 64))

(declare-fun lt!274818 () (_ BitVec 64))

(assert (=> d!62655 (= res!148777 (= lt!274815 (bvsub lt!274818 lt!274819)))))

(assert (=> d!62655 (or (= (bvand lt!274818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274818 lt!274819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62655 (= lt!274819 (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274679)))) ((_ sign_extend 32) (currentByte!8893 (_1!8370 lt!274679))) ((_ sign_extend 32) (currentBit!8888 (_1!8370 lt!274679)))))))

(declare-fun lt!274820 () (_ BitVec 64))

(declare-fun lt!274817 () (_ BitVec 64))

(assert (=> d!62655 (= lt!274818 (bvmul lt!274820 lt!274817))))

(assert (=> d!62655 (or (= lt!274820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274817 (bvsdiv (bvmul lt!274820 lt!274817) lt!274820)))))

(assert (=> d!62655 (= lt!274817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62655 (= lt!274820 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274679)))))))

(assert (=> d!62655 (= lt!274815 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8893 (_1!8370 lt!274679))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8888 (_1!8370 lt!274679)))))))

(assert (=> d!62655 (invariant!0 (currentBit!8888 (_1!8370 lt!274679)) (currentByte!8893 (_1!8370 lt!274679)) (size!4252 (buf!4695 (_1!8370 lt!274679))))))

(assert (=> d!62655 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274679))) (currentByte!8893 (_1!8370 lt!274679)) (currentBit!8888 (_1!8370 lt!274679))) lt!274815)))

(declare-fun b!179284 () Bool)

(declare-fun res!148778 () Bool)

(assert (=> b!179284 (=> (not res!148778) (not e!124718))))

(assert (=> b!179284 (= res!148778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274815))))

(declare-fun b!179285 () Bool)

(declare-fun lt!274816 () (_ BitVec 64))

(assert (=> b!179285 (= e!124718 (bvsle lt!274815 (bvmul lt!274816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179285 (or (= lt!274816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274816)))))

(assert (=> b!179285 (= lt!274816 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274679)))))))

(assert (= (and d!62655 res!148777) b!179284))

(assert (= (and b!179284 res!148778) b!179285))

(declare-fun m!279391 () Bool)

(assert (=> d!62655 m!279391))

(declare-fun m!279393 () Bool)

(assert (=> d!62655 m!279393))

(assert (=> b!179147 d!62655))

(declare-fun b!179299 () Bool)

(declare-fun e!124727 () Unit!12884)

(declare-fun lt!274875 () Unit!12884)

(assert (=> b!179299 (= e!124727 lt!274875)))

(declare-fun lt!274887 () (_ BitVec 64))

(assert (=> b!179299 (= lt!274887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!274888 () (_ BitVec 64))

(assert (=> b!179299 (= lt!274888 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9641 array!9641 (_ BitVec 64) (_ BitVec 64)) Unit!12884)

(assert (=> b!179299 (= lt!274875 (arrayBitRangesEqSymmetric!0 (buf!4695 thiss!1204) (buf!4695 (_2!8368 lt!274665)) lt!274887 lt!274888))))

(declare-fun arrayBitRangesEq!0 (array!9641 array!9641 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179299 (arrayBitRangesEq!0 (buf!4695 (_2!8368 lt!274665)) (buf!4695 thiss!1204) lt!274887 lt!274888)))

(declare-fun b!179300 () Bool)

(declare-fun lt!274879 () tuple2!15448)

(declare-fun lt!274886 () (_ BitVec 64))

(declare-fun lt!274890 () (_ BitVec 64))

(declare-fun e!124726 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7612 (_ BitVec 64)) BitStream!7612)

(assert (=> b!179300 (= e!124726 (= (_1!8369 lt!274879) (withMovedBitIndex!0 (_2!8369 lt!274879) (bvsub lt!274886 lt!274890))))))

(assert (=> b!179300 (or (= (bvand lt!274886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274890 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274886 lt!274890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179300 (= lt!274890 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274665))) (currentByte!8893 (_2!8368 lt!274665)) (currentBit!8888 (_2!8368 lt!274665))))))

(assert (=> b!179300 (= lt!274886 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun b!179301 () Bool)

(declare-fun res!148788 () Bool)

(assert (=> b!179301 (=> (not res!148788) (not e!124726))))

(assert (=> b!179301 (= res!148788 (isPrefixOf!0 (_2!8369 lt!274879) (_2!8368 lt!274665)))))

(declare-fun b!179302 () Bool)

(declare-fun Unit!12903 () Unit!12884)

(assert (=> b!179302 (= e!124727 Unit!12903)))

(declare-fun d!62657 () Bool)

(assert (=> d!62657 e!124726))

(declare-fun res!148790 () Bool)

(assert (=> d!62657 (=> (not res!148790) (not e!124726))))

(assert (=> d!62657 (= res!148790 (isPrefixOf!0 (_1!8369 lt!274879) (_2!8369 lt!274879)))))

(declare-fun lt!274881 () BitStream!7612)

(assert (=> d!62657 (= lt!274879 (tuple2!15449 lt!274881 (_2!8368 lt!274665)))))

(declare-fun lt!274885 () Unit!12884)

(declare-fun lt!274880 () Unit!12884)

(assert (=> d!62657 (= lt!274885 lt!274880)))

(assert (=> d!62657 (isPrefixOf!0 lt!274881 (_2!8368 lt!274665))))

(assert (=> d!62657 (= lt!274880 (lemmaIsPrefixTransitive!0 lt!274881 (_2!8368 lt!274665) (_2!8368 lt!274665)))))

(declare-fun lt!274891 () Unit!12884)

(declare-fun lt!274873 () Unit!12884)

(assert (=> d!62657 (= lt!274891 lt!274873)))

(assert (=> d!62657 (isPrefixOf!0 lt!274881 (_2!8368 lt!274665))))

(assert (=> d!62657 (= lt!274873 (lemmaIsPrefixTransitive!0 lt!274881 thiss!1204 (_2!8368 lt!274665)))))

(declare-fun lt!274889 () Unit!12884)

(assert (=> d!62657 (= lt!274889 e!124727)))

(declare-fun c!9279 () Bool)

(assert (=> d!62657 (= c!9279 (not (= (size!4252 (buf!4695 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!274882 () Unit!12884)

(declare-fun lt!274892 () Unit!12884)

(assert (=> d!62657 (= lt!274882 lt!274892)))

(assert (=> d!62657 (isPrefixOf!0 (_2!8368 lt!274665) (_2!8368 lt!274665))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7612) Unit!12884)

(assert (=> d!62657 (= lt!274892 (lemmaIsPrefixRefl!0 (_2!8368 lt!274665)))))

(declare-fun lt!274883 () Unit!12884)

(declare-fun lt!274878 () Unit!12884)

(assert (=> d!62657 (= lt!274883 lt!274878)))

(assert (=> d!62657 (= lt!274878 (lemmaIsPrefixRefl!0 (_2!8368 lt!274665)))))

(declare-fun lt!274874 () Unit!12884)

(declare-fun lt!274876 () Unit!12884)

(assert (=> d!62657 (= lt!274874 lt!274876)))

(assert (=> d!62657 (isPrefixOf!0 lt!274881 lt!274881)))

(assert (=> d!62657 (= lt!274876 (lemmaIsPrefixRefl!0 lt!274881))))

(declare-fun lt!274877 () Unit!12884)

(declare-fun lt!274884 () Unit!12884)

(assert (=> d!62657 (= lt!274877 lt!274884)))

(assert (=> d!62657 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62657 (= lt!274884 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62657 (= lt!274881 (BitStream!7613 (buf!4695 (_2!8368 lt!274665)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(assert (=> d!62657 (isPrefixOf!0 thiss!1204 (_2!8368 lt!274665))))

(assert (=> d!62657 (= (reader!0 thiss!1204 (_2!8368 lt!274665)) lt!274879)))

(declare-fun b!179303 () Bool)

(declare-fun res!148789 () Bool)

(assert (=> b!179303 (=> (not res!148789) (not e!124726))))

(assert (=> b!179303 (= res!148789 (isPrefixOf!0 (_1!8369 lt!274879) thiss!1204))))

(assert (= (and d!62657 c!9279) b!179299))

(assert (= (and d!62657 (not c!9279)) b!179302))

(assert (= (and d!62657 res!148790) b!179303))

(assert (= (and b!179303 res!148789) b!179301))

(assert (= (and b!179301 res!148788) b!179300))

(declare-fun m!279409 () Bool)

(assert (=> b!179301 m!279409))

(declare-fun m!279411 () Bool)

(assert (=> b!179303 m!279411))

(declare-fun m!279413 () Bool)

(assert (=> b!179300 m!279413))

(assert (=> b!179300 m!279259))

(assert (=> b!179300 m!279247))

(assert (=> b!179299 m!279247))

(declare-fun m!279415 () Bool)

(assert (=> b!179299 m!279415))

(declare-fun m!279417 () Bool)

(assert (=> b!179299 m!279417))

(declare-fun m!279419 () Bool)

(assert (=> d!62657 m!279419))

(declare-fun m!279421 () Bool)

(assert (=> d!62657 m!279421))

(declare-fun m!279423 () Bool)

(assert (=> d!62657 m!279423))

(declare-fun m!279425 () Bool)

(assert (=> d!62657 m!279425))

(declare-fun m!279427 () Bool)

(assert (=> d!62657 m!279427))

(declare-fun m!279429 () Bool)

(assert (=> d!62657 m!279429))

(declare-fun m!279431 () Bool)

(assert (=> d!62657 m!279431))

(assert (=> d!62657 m!279261))

(declare-fun m!279433 () Bool)

(assert (=> d!62657 m!279433))

(declare-fun m!279435 () Bool)

(assert (=> d!62657 m!279435))

(declare-fun m!279437 () Bool)

(assert (=> d!62657 m!279437))

(assert (=> b!179147 d!62657))

(declare-fun b!179304 () Bool)

(declare-fun e!124729 () Unit!12884)

(declare-fun lt!274895 () Unit!12884)

(assert (=> b!179304 (= e!124729 lt!274895)))

(declare-fun lt!274907 () (_ BitVec 64))

(assert (=> b!179304 (= lt!274907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!274908 () (_ BitVec 64))

(assert (=> b!179304 (= lt!274908 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(assert (=> b!179304 (= lt!274895 (arrayBitRangesEqSymmetric!0 (buf!4695 (_2!8368 lt!274667)) (buf!4695 (_2!8368 lt!274665)) lt!274907 lt!274908))))

(assert (=> b!179304 (arrayBitRangesEq!0 (buf!4695 (_2!8368 lt!274665)) (buf!4695 (_2!8368 lt!274667)) lt!274907 lt!274908)))

(declare-fun b!179305 () Bool)

(declare-fun lt!274906 () (_ BitVec 64))

(declare-fun lt!274899 () tuple2!15448)

(declare-fun lt!274910 () (_ BitVec 64))

(declare-fun e!124728 () Bool)

(assert (=> b!179305 (= e!124728 (= (_1!8369 lt!274899) (withMovedBitIndex!0 (_2!8369 lt!274899) (bvsub lt!274906 lt!274910))))))

(assert (=> b!179305 (or (= (bvand lt!274906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274906 lt!274910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179305 (= lt!274910 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274665))) (currentByte!8893 (_2!8368 lt!274665)) (currentBit!8888 (_2!8368 lt!274665))))))

(assert (=> b!179305 (= lt!274906 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(declare-fun b!179306 () Bool)

(declare-fun res!148791 () Bool)

(assert (=> b!179306 (=> (not res!148791) (not e!124728))))

(assert (=> b!179306 (= res!148791 (isPrefixOf!0 (_2!8369 lt!274899) (_2!8368 lt!274665)))))

(declare-fun b!179307 () Bool)

(declare-fun Unit!12904 () Unit!12884)

(assert (=> b!179307 (= e!124729 Unit!12904)))

(declare-fun d!62671 () Bool)

(assert (=> d!62671 e!124728))

(declare-fun res!148793 () Bool)

(assert (=> d!62671 (=> (not res!148793) (not e!124728))))

(assert (=> d!62671 (= res!148793 (isPrefixOf!0 (_1!8369 lt!274899) (_2!8369 lt!274899)))))

(declare-fun lt!274901 () BitStream!7612)

(assert (=> d!62671 (= lt!274899 (tuple2!15449 lt!274901 (_2!8368 lt!274665)))))

(declare-fun lt!274905 () Unit!12884)

(declare-fun lt!274900 () Unit!12884)

(assert (=> d!62671 (= lt!274905 lt!274900)))

(assert (=> d!62671 (isPrefixOf!0 lt!274901 (_2!8368 lt!274665))))

(assert (=> d!62671 (= lt!274900 (lemmaIsPrefixTransitive!0 lt!274901 (_2!8368 lt!274665) (_2!8368 lt!274665)))))

(declare-fun lt!274911 () Unit!12884)

(declare-fun lt!274893 () Unit!12884)

(assert (=> d!62671 (= lt!274911 lt!274893)))

(assert (=> d!62671 (isPrefixOf!0 lt!274901 (_2!8368 lt!274665))))

(assert (=> d!62671 (= lt!274893 (lemmaIsPrefixTransitive!0 lt!274901 (_2!8368 lt!274667) (_2!8368 lt!274665)))))

(declare-fun lt!274909 () Unit!12884)

(assert (=> d!62671 (= lt!274909 e!124729)))

(declare-fun c!9280 () Bool)

(assert (=> d!62671 (= c!9280 (not (= (size!4252 (buf!4695 (_2!8368 lt!274667))) #b00000000000000000000000000000000)))))

(declare-fun lt!274902 () Unit!12884)

(declare-fun lt!274912 () Unit!12884)

(assert (=> d!62671 (= lt!274902 lt!274912)))

(assert (=> d!62671 (isPrefixOf!0 (_2!8368 lt!274665) (_2!8368 lt!274665))))

(assert (=> d!62671 (= lt!274912 (lemmaIsPrefixRefl!0 (_2!8368 lt!274665)))))

(declare-fun lt!274903 () Unit!12884)

(declare-fun lt!274898 () Unit!12884)

(assert (=> d!62671 (= lt!274903 lt!274898)))

(assert (=> d!62671 (= lt!274898 (lemmaIsPrefixRefl!0 (_2!8368 lt!274665)))))

(declare-fun lt!274894 () Unit!12884)

(declare-fun lt!274896 () Unit!12884)

(assert (=> d!62671 (= lt!274894 lt!274896)))

(assert (=> d!62671 (isPrefixOf!0 lt!274901 lt!274901)))

(assert (=> d!62671 (= lt!274896 (lemmaIsPrefixRefl!0 lt!274901))))

(declare-fun lt!274897 () Unit!12884)

(declare-fun lt!274904 () Unit!12884)

(assert (=> d!62671 (= lt!274897 lt!274904)))

(assert (=> d!62671 (isPrefixOf!0 (_2!8368 lt!274667) (_2!8368 lt!274667))))

(assert (=> d!62671 (= lt!274904 (lemmaIsPrefixRefl!0 (_2!8368 lt!274667)))))

(assert (=> d!62671 (= lt!274901 (BitStream!7613 (buf!4695 (_2!8368 lt!274665)) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(assert (=> d!62671 (isPrefixOf!0 (_2!8368 lt!274667) (_2!8368 lt!274665))))

(assert (=> d!62671 (= (reader!0 (_2!8368 lt!274667) (_2!8368 lt!274665)) lt!274899)))

(declare-fun b!179308 () Bool)

(declare-fun res!148792 () Bool)

(assert (=> b!179308 (=> (not res!148792) (not e!124728))))

(assert (=> b!179308 (= res!148792 (isPrefixOf!0 (_1!8369 lt!274899) (_2!8368 lt!274667)))))

(assert (= (and d!62671 c!9280) b!179304))

(assert (= (and d!62671 (not c!9280)) b!179307))

(assert (= (and d!62671 res!148793) b!179308))

(assert (= (and b!179308 res!148792) b!179306))

(assert (= (and b!179306 res!148791) b!179305))

(declare-fun m!279441 () Bool)

(assert (=> b!179306 m!279441))

(declare-fun m!279443 () Bool)

(assert (=> b!179308 m!279443))

(declare-fun m!279445 () Bool)

(assert (=> b!179305 m!279445))

(assert (=> b!179305 m!279259))

(assert (=> b!179305 m!279245))

(assert (=> b!179304 m!279245))

(declare-fun m!279447 () Bool)

(assert (=> b!179304 m!279447))

(declare-fun m!279449 () Bool)

(assert (=> b!179304 m!279449))

(declare-fun m!279451 () Bool)

(assert (=> d!62671 m!279451))

(declare-fun m!279453 () Bool)

(assert (=> d!62671 m!279453))

(assert (=> d!62671 m!279423))

(declare-fun m!279455 () Bool)

(assert (=> d!62671 m!279455))

(declare-fun m!279457 () Bool)

(assert (=> d!62671 m!279457))

(declare-fun m!279459 () Bool)

(assert (=> d!62671 m!279459))

(declare-fun m!279461 () Bool)

(assert (=> d!62671 m!279461))

(assert (=> d!62671 m!279219))

(declare-fun m!279463 () Bool)

(assert (=> d!62671 m!279463))

(declare-fun m!279465 () Bool)

(assert (=> d!62671 m!279465))

(assert (=> d!62671 m!279437))

(assert (=> b!179147 d!62671))

(declare-fun d!62675 () Bool)

(assert (=> d!62675 (= (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274667)))) (and (bvsge (currentBit!8888 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8888 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8893 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274667)))) (and (= (currentBit!8888 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274667))))))))))

(assert (=> b!179147 d!62675))

(declare-fun d!62677 () Bool)

(declare-datatypes ((tuple2!15468 0))(
  ( (tuple2!15469 (_1!8379 Bool) (_2!8379 BitStream!7612)) )
))
(declare-fun lt!274918 () tuple2!15468)

(declare-fun readBit!0 (BitStream!7612) tuple2!15468)

(assert (=> d!62677 (= lt!274918 (readBit!0 lt!274674))))

(assert (=> d!62677 (= (readBitPure!0 lt!274674) (tuple2!15451 (_2!8379 lt!274918) (_1!8379 lt!274918)))))

(declare-fun bs!15633 () Bool)

(assert (= bs!15633 d!62677))

(declare-fun m!279467 () Bool)

(assert (=> bs!15633 m!279467))

(assert (=> b!179147 d!62677))

(declare-fun d!62679 () Bool)

(declare-fun e!124730 () Bool)

(assert (=> d!62679 e!124730))

(declare-fun res!148794 () Bool)

(assert (=> d!62679 (=> (not res!148794) (not e!124730))))

(declare-fun lt!274923 () (_ BitVec 64))

(declare-fun lt!274922 () (_ BitVec 64))

(declare-fun lt!274919 () (_ BitVec 64))

(assert (=> d!62679 (= res!148794 (= lt!274919 (bvsub lt!274922 lt!274923)))))

(assert (=> d!62679 (or (= (bvand lt!274922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274922 lt!274923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62679 (= lt!274923 (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274673)))) ((_ sign_extend 32) (currentByte!8893 (_1!8370 lt!274673))) ((_ sign_extend 32) (currentBit!8888 (_1!8370 lt!274673)))))))

(declare-fun lt!274924 () (_ BitVec 64))

(declare-fun lt!274921 () (_ BitVec 64))

(assert (=> d!62679 (= lt!274922 (bvmul lt!274924 lt!274921))))

(assert (=> d!62679 (or (= lt!274924 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274921 (bvsdiv (bvmul lt!274924 lt!274921) lt!274924)))))

(assert (=> d!62679 (= lt!274921 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62679 (= lt!274924 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274673)))))))

(assert (=> d!62679 (= lt!274919 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8893 (_1!8370 lt!274673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8888 (_1!8370 lt!274673)))))))

(assert (=> d!62679 (invariant!0 (currentBit!8888 (_1!8370 lt!274673)) (currentByte!8893 (_1!8370 lt!274673)) (size!4252 (buf!4695 (_1!8370 lt!274673))))))

(assert (=> d!62679 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274673))) (currentByte!8893 (_1!8370 lt!274673)) (currentBit!8888 (_1!8370 lt!274673))) lt!274919)))

(declare-fun b!179309 () Bool)

(declare-fun res!148795 () Bool)

(assert (=> b!179309 (=> (not res!148795) (not e!124730))))

(assert (=> b!179309 (= res!148795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274919))))

(declare-fun b!179310 () Bool)

(declare-fun lt!274920 () (_ BitVec 64))

(assert (=> b!179310 (= e!124730 (bvsle lt!274919 (bvmul lt!274920 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179310 (or (= lt!274920 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274920 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274920)))))

(assert (=> b!179310 (= lt!274920 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274673)))))))

(assert (= (and d!62679 res!148794) b!179309))

(assert (= (and b!179309 res!148795) b!179310))

(declare-fun m!279469 () Bool)

(assert (=> d!62679 m!279469))

(declare-fun m!279471 () Bool)

(assert (=> d!62679 m!279471))

(assert (=> b!179147 d!62679))

(declare-fun d!62681 () Bool)

(declare-fun lt!274925 () tuple2!15468)

(assert (=> d!62681 (= lt!274925 (readBit!0 (BitStream!7613 (buf!4695 (_2!8368 lt!274665)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204))))))

(assert (=> d!62681 (= (readBitPure!0 (BitStream!7613 (buf!4695 (_2!8368 lt!274665)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204))) (tuple2!15451 (_2!8379 lt!274925) (_1!8379 lt!274925)))))

(declare-fun bs!15634 () Bool)

(assert (= bs!15634 d!62681))

(declare-fun m!279473 () Bool)

(assert (=> bs!15634 m!279473))

(assert (=> b!179147 d!62681))

(declare-fun d!62683 () Bool)

(declare-fun e!124737 () Bool)

(assert (=> d!62683 e!124737))

(declare-fun res!148806 () Bool)

(assert (=> d!62683 (=> (not res!148806) (not e!124737))))

(declare-fun lt!274959 () tuple2!15450)

(declare-fun lt!274961 () tuple2!15450)

(assert (=> d!62683 (= res!148806 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274959))) (currentByte!8893 (_1!8370 lt!274959)) (currentBit!8888 (_1!8370 lt!274959))) (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274961))) (currentByte!8893 (_1!8370 lt!274961)) (currentBit!8888 (_1!8370 lt!274961)))))))

(declare-fun lt!274958 () BitStream!7612)

(declare-fun lt!274960 () Unit!12884)

(declare-fun choose!50 (BitStream!7612 BitStream!7612 BitStream!7612 tuple2!15450 tuple2!15450 BitStream!7612 Bool tuple2!15450 tuple2!15450 BitStream!7612 Bool) Unit!12884)

(assert (=> d!62683 (= lt!274960 (choose!50 lt!274674 (_2!8368 lt!274665) lt!274958 lt!274959 (tuple2!15451 (_1!8370 lt!274959) (_2!8370 lt!274959)) (_1!8370 lt!274959) (_2!8370 lt!274959) lt!274961 (tuple2!15451 (_1!8370 lt!274961) (_2!8370 lt!274961)) (_1!8370 lt!274961) (_2!8370 lt!274961)))))

(assert (=> d!62683 (= lt!274961 (readBitPure!0 lt!274958))))

(assert (=> d!62683 (= lt!274959 (readBitPure!0 lt!274674))))

(assert (=> d!62683 (= lt!274958 (BitStream!7613 (buf!4695 (_2!8368 lt!274665)) (currentByte!8893 lt!274674) (currentBit!8888 lt!274674)))))

(assert (=> d!62683 (invariant!0 (currentBit!8888 lt!274674) (currentByte!8893 lt!274674) (size!4252 (buf!4695 (_2!8368 lt!274665))))))

(assert (=> d!62683 (= (readBitPrefixLemma!0 lt!274674 (_2!8368 lt!274665)) lt!274960)))

(declare-fun b!179321 () Bool)

(assert (=> b!179321 (= e!124737 (= (_2!8370 lt!274959) (_2!8370 lt!274961)))))

(assert (= (and d!62683 res!148806) b!179321))

(declare-fun m!279483 () Bool)

(assert (=> d!62683 m!279483))

(declare-fun m!279485 () Bool)

(assert (=> d!62683 m!279485))

(assert (=> d!62683 m!279241))

(declare-fun m!279487 () Bool)

(assert (=> d!62683 m!279487))

(declare-fun m!279489 () Bool)

(assert (=> d!62683 m!279489))

(declare-fun m!279491 () Bool)

(assert (=> d!62683 m!279491))

(assert (=> b!179147 d!62683))

(declare-fun d!62689 () Bool)

(declare-fun e!124738 () Bool)

(assert (=> d!62689 e!124738))

(declare-fun res!148807 () Bool)

(assert (=> d!62689 (=> (not res!148807) (not e!124738))))

(declare-fun lt!274962 () (_ BitVec 64))

(declare-fun lt!274965 () (_ BitVec 64))

(declare-fun lt!274966 () (_ BitVec 64))

(assert (=> d!62689 (= res!148807 (= lt!274962 (bvsub lt!274965 lt!274966)))))

(assert (=> d!62689 (or (= (bvand lt!274965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274965 lt!274966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62689 (= lt!274966 (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274665)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274665))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274665)))))))

(declare-fun lt!274967 () (_ BitVec 64))

(declare-fun lt!274964 () (_ BitVec 64))

(assert (=> d!62689 (= lt!274965 (bvmul lt!274967 lt!274964))))

(assert (=> d!62689 (or (= lt!274967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274964 (bvsdiv (bvmul lt!274967 lt!274964) lt!274967)))))

(assert (=> d!62689 (= lt!274964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62689 (= lt!274967 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274665)))))))

(assert (=> d!62689 (= lt!274962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274665))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274665)))))))

(assert (=> d!62689 (invariant!0 (currentBit!8888 (_2!8368 lt!274665)) (currentByte!8893 (_2!8368 lt!274665)) (size!4252 (buf!4695 (_2!8368 lt!274665))))))

(assert (=> d!62689 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274665))) (currentByte!8893 (_2!8368 lt!274665)) (currentBit!8888 (_2!8368 lt!274665))) lt!274962)))

(declare-fun b!179322 () Bool)

(declare-fun res!148808 () Bool)

(assert (=> b!179322 (=> (not res!148808) (not e!124738))))

(assert (=> b!179322 (= res!148808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274962))))

(declare-fun b!179323 () Bool)

(declare-fun lt!274963 () (_ BitVec 64))

(assert (=> b!179323 (= e!124738 (bvsle lt!274962 (bvmul lt!274963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179323 (or (= lt!274963 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274963 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274963)))))

(assert (=> b!179323 (= lt!274963 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274665)))))))

(assert (= (and d!62689 res!148807) b!179322))

(assert (= (and b!179322 res!148808) b!179323))

(declare-fun m!279493 () Bool)

(assert (=> d!62689 m!279493))

(assert (=> d!62689 m!279221))

(assert (=> b!179158 d!62689))

(declare-fun d!62691 () Bool)

(declare-fun res!148816 () Bool)

(declare-fun e!124744 () Bool)

(assert (=> d!62691 (=> (not res!148816) (not e!124744))))

(assert (=> d!62691 (= res!148816 (= (size!4252 (buf!4695 thiss!1204)) (size!4252 (buf!4695 (_2!8368 lt!274665)))))))

(assert (=> d!62691 (= (isPrefixOf!0 thiss!1204 (_2!8368 lt!274665)) e!124744)))

(declare-fun b!179330 () Bool)

(declare-fun res!148817 () Bool)

(assert (=> b!179330 (=> (not res!148817) (not e!124744))))

(assert (=> b!179330 (= res!148817 (bvsle (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274665))) (currentByte!8893 (_2!8368 lt!274665)) (currentBit!8888 (_2!8368 lt!274665)))))))

(declare-fun b!179331 () Bool)

(declare-fun e!124743 () Bool)

(assert (=> b!179331 (= e!124744 e!124743)))

(declare-fun res!148815 () Bool)

(assert (=> b!179331 (=> res!148815 e!124743)))

(assert (=> b!179331 (= res!148815 (= (size!4252 (buf!4695 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!179332 () Bool)

(assert (=> b!179332 (= e!124743 (arrayBitRangesEq!0 (buf!4695 thiss!1204) (buf!4695 (_2!8368 lt!274665)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204))))))

(assert (= (and d!62691 res!148816) b!179330))

(assert (= (and b!179330 res!148817) b!179331))

(assert (= (and b!179331 (not res!148815)) b!179332))

(assert (=> b!179330 m!279247))

(assert (=> b!179330 m!279259))

(assert (=> b!179332 m!279247))

(assert (=> b!179332 m!279247))

(declare-fun m!279495 () Bool)

(assert (=> b!179332 m!279495))

(assert (=> b!179158 d!62691))

(declare-fun d!62693 () Bool)

(assert (=> d!62693 (isPrefixOf!0 thiss!1204 (_2!8368 lt!274665))))

(declare-fun lt!274970 () Unit!12884)

(declare-fun choose!30 (BitStream!7612 BitStream!7612 BitStream!7612) Unit!12884)

(assert (=> d!62693 (= lt!274970 (choose!30 thiss!1204 (_2!8368 lt!274667) (_2!8368 lt!274665)))))

(assert (=> d!62693 (isPrefixOf!0 thiss!1204 (_2!8368 lt!274667))))

(assert (=> d!62693 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8368 lt!274667) (_2!8368 lt!274665)) lt!274970)))

(declare-fun bs!15635 () Bool)

(assert (= bs!15635 d!62693))

(assert (=> bs!15635 m!279261))

(declare-fun m!279497 () Bool)

(assert (=> bs!15635 m!279497))

(assert (=> bs!15635 m!279251))

(assert (=> b!179158 d!62693))

(declare-fun b!179518 () Bool)

(declare-fun e!124850 () (_ BitVec 64))

(assert (=> b!179518 (= e!124850 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!179519 () Bool)

(declare-fun e!124847 () Bool)

(declare-fun lt!275537 () tuple2!15450)

(declare-fun lt!275548 () tuple2!15446)

(assert (=> b!179519 (= e!124847 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!275537))) (currentByte!8893 (_1!8370 lt!275537)) (currentBit!8888 (_1!8370 lt!275537))) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275548))) (currentByte!8893 (_2!8368 lt!275548)) (currentBit!8888 (_2!8368 lt!275548)))))))

(declare-fun call!2933 () Bool)

(declare-fun bm!2930 () Bool)

(declare-fun c!9300 () Bool)

(assert (=> bm!2930 (= call!2933 (isPrefixOf!0 (_2!8368 lt!274667) (ite c!9300 (_2!8368 lt!274667) (_2!8368 lt!275548))))))

(declare-fun b!179520 () Bool)

(declare-fun e!124848 () Bool)

(declare-fun lt!275546 () (_ BitVec 64))

(assert (=> b!179520 (= e!124848 (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274667)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274667))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274667))) lt!275546))))

(declare-fun b!179521 () Bool)

(declare-fun res!148970 () Bool)

(assert (=> b!179521 (= res!148970 call!2933)))

(declare-fun e!124843 () Bool)

(assert (=> b!179521 (=> (not res!148970) (not e!124843))))

(declare-fun b!179522 () Bool)

(declare-fun e!124851 () tuple2!15446)

(declare-fun Unit!12905 () Unit!12884)

(assert (=> b!179522 (= e!124851 (tuple2!15447 Unit!12905 (_2!8368 lt!274667)))))

(declare-fun lt!275519 () Unit!12884)

(assert (=> b!179522 (= lt!275519 (lemmaIsPrefixRefl!0 (_2!8368 lt!274667)))))

(assert (=> b!179522 call!2933))

(declare-fun lt!275508 () Unit!12884)

(assert (=> b!179522 (= lt!275508 lt!275519)))

(declare-fun b!179523 () Bool)

(declare-fun e!124844 () Bool)

(declare-fun e!124849 () Bool)

(assert (=> b!179523 (= e!124844 e!124849)))

(declare-fun res!148971 () Bool)

(assert (=> b!179523 (=> (not res!148971) (not e!124849))))

(declare-datatypes ((tuple2!15470 0))(
  ( (tuple2!15471 (_1!8380 BitStream!7612) (_2!8380 (_ BitVec 64))) )
))
(declare-fun lt!275530 () tuple2!15470)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179523 (= res!148971 (= (_2!8380 lt!275530) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!275514 () tuple2!15448)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15470)

(assert (=> b!179523 (= lt!275530 (readNBitsLSBFirstsLoopPure!0 (_1!8369 lt!275514) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!275524 () Unit!12884)

(declare-fun lt!275547 () Unit!12884)

(assert (=> b!179523 (= lt!275524 lt!275547)))

(declare-fun lt!275501 () tuple2!15446)

(assert (=> b!179523 (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!275501)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274667))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274667))) lt!275546)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7612 array!9641 (_ BitVec 64)) Unit!12884)

(assert (=> b!179523 (= lt!275547 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8368 lt!274667) (buf!4695 (_2!8368 lt!275501)) lt!275546))))

(assert (=> b!179523 e!124848))

(declare-fun res!148965 () Bool)

(assert (=> b!179523 (=> (not res!148965) (not e!124848))))

(assert (=> b!179523 (= res!148965 (and (= (size!4252 (buf!4695 (_2!8368 lt!274667))) (size!4252 (buf!4695 (_2!8368 lt!275501)))) (bvsge lt!275546 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179523 (= lt!275546 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!179523 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!179523 (= lt!275514 (reader!0 (_2!8368 lt!274667) (_2!8368 lt!275501)))))

(declare-fun b!179524 () Bool)

(declare-fun e!124846 () Bool)

(declare-fun lt!275534 () tuple2!15470)

(declare-fun lt!275513 () tuple2!15448)

(assert (=> b!179524 (= e!124846 (= (_1!8380 lt!275534) (_2!8369 lt!275513)))))

(declare-fun b!179525 () Bool)

(assert (=> b!179525 (= e!124850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!179526 () Bool)

(declare-fun res!148967 () Bool)

(assert (=> b!179526 (= res!148967 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275548))) (currentByte!8893 (_2!8368 lt!275548)) (currentBit!8888 (_2!8368 lt!275548))) (bvadd (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!179526 (=> (not res!148967) (not e!124843))))

(declare-fun b!179527 () Bool)

(declare-fun res!148976 () Bool)

(assert (=> b!179527 (=> (not res!148976) (not e!124844))))

(assert (=> b!179527 (= res!148976 (isPrefixOf!0 (_2!8368 lt!274667) (_2!8368 lt!275501)))))

(declare-fun d!62695 () Bool)

(assert (=> d!62695 e!124844))

(declare-fun res!148975 () Bool)

(assert (=> d!62695 (=> (not res!148975) (not e!124844))))

(assert (=> d!62695 (= res!148975 (invariant!0 (currentBit!8888 (_2!8368 lt!275501)) (currentByte!8893 (_2!8368 lt!275501)) (size!4252 (buf!4695 (_2!8368 lt!275501)))))))

(assert (=> d!62695 (= lt!275501 e!124851)))

(assert (=> d!62695 (= c!9300 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62695 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62695 (= (appendBitsLSBFirstLoopTR!0 (_2!8368 lt!274667) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!275501)))

(declare-fun b!179517 () Bool)

(declare-fun res!148969 () Bool)

(assert (=> b!179517 (=> (not res!148969) (not e!124844))))

(assert (=> b!179517 (= res!148969 (= (size!4252 (buf!4695 (_2!8368 lt!274667))) (size!4252 (buf!4695 (_2!8368 lt!275501)))))))

(declare-fun b!179528 () Bool)

(declare-fun res!148974 () Bool)

(assert (=> b!179528 (=> (not res!148974) (not e!124844))))

(declare-fun lt!275526 () (_ BitVec 64))

(declare-fun lt!275531 () (_ BitVec 64))

(assert (=> b!179528 (= res!148974 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275501))) (currentByte!8893 (_2!8368 lt!275501)) (currentBit!8888 (_2!8368 lt!275501))) (bvsub lt!275531 lt!275526)))))

(assert (=> b!179528 (or (= (bvand lt!275531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275531 lt!275526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179528 (= lt!275526 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!275539 () (_ BitVec 64))

(declare-fun lt!275522 () (_ BitVec 64))

(assert (=> b!179528 (= lt!275531 (bvadd lt!275539 lt!275522))))

(assert (=> b!179528 (or (not (= (bvand lt!275539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275522 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!275539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!275539 lt!275522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179528 (= lt!275522 ((_ sign_extend 32) nBits!348))))

(assert (=> b!179528 (= lt!275539 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(declare-fun b!179529 () Bool)

(assert (=> b!179529 (= lt!275537 (readBitPure!0 (readerFrom!0 (_2!8368 lt!275548) (currentBit!8888 (_2!8368 lt!274667)) (currentByte!8893 (_2!8368 lt!274667)))))))

(declare-fun lt!275510 () Bool)

(declare-fun res!148972 () Bool)

(assert (=> b!179529 (= res!148972 (and (= (_2!8370 lt!275537) lt!275510) (= (_1!8370 lt!275537) (_2!8368 lt!275548))))))

(assert (=> b!179529 (=> (not res!148972) (not e!124847))))

(assert (=> b!179529 (= e!124843 e!124847)))

(declare-fun b!179530 () Bool)

(declare-fun e!124845 () Bool)

(declare-fun lt!275507 () tuple2!15450)

(declare-fun lt!275532 () tuple2!15450)

(assert (=> b!179530 (= e!124845 (= (_2!8370 lt!275507) (_2!8370 lt!275532)))))

(declare-fun b!179531 () Bool)

(declare-fun lt!275541 () tuple2!15446)

(assert (=> b!179531 (= e!124851 (tuple2!15447 (_1!8368 lt!275541) (_2!8368 lt!275541)))))

(assert (=> b!179531 (= lt!275510 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179531 (= lt!275548 (appendBit!0 (_2!8368 lt!274667) lt!275510))))

(declare-fun res!148973 () Bool)

(assert (=> b!179531 (= res!148973 (= (size!4252 (buf!4695 (_2!8368 lt!274667))) (size!4252 (buf!4695 (_2!8368 lt!275548)))))))

(assert (=> b!179531 (=> (not res!148973) (not e!124843))))

(assert (=> b!179531 e!124843))

(declare-fun lt!275538 () tuple2!15446)

(assert (=> b!179531 (= lt!275538 lt!275548)))

(assert (=> b!179531 (= lt!275541 (appendBitsLSBFirstLoopTR!0 (_2!8368 lt!275538) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!275499 () Unit!12884)

(assert (=> b!179531 (= lt!275499 (lemmaIsPrefixTransitive!0 (_2!8368 lt!274667) (_2!8368 lt!275538) (_2!8368 lt!275541)))))

(assert (=> b!179531 (isPrefixOf!0 (_2!8368 lt!274667) (_2!8368 lt!275541))))

(declare-fun lt!275500 () Unit!12884)

(assert (=> b!179531 (= lt!275500 lt!275499)))

(assert (=> b!179531 (invariant!0 (currentBit!8888 (_2!8368 lt!274667)) (currentByte!8893 (_2!8368 lt!274667)) (size!4252 (buf!4695 (_2!8368 lt!275538))))))

(declare-fun lt!275542 () BitStream!7612)

(assert (=> b!179531 (= lt!275542 (BitStream!7613 (buf!4695 (_2!8368 lt!275538)) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))))))

(assert (=> b!179531 (invariant!0 (currentBit!8888 lt!275542) (currentByte!8893 lt!275542) (size!4252 (buf!4695 (_2!8368 lt!275541))))))

(declare-fun lt!275536 () BitStream!7612)

(assert (=> b!179531 (= lt!275536 (BitStream!7613 (buf!4695 (_2!8368 lt!275541)) (currentByte!8893 lt!275542) (currentBit!8888 lt!275542)))))

(assert (=> b!179531 (= lt!275507 (readBitPure!0 lt!275542))))

(assert (=> b!179531 (= lt!275532 (readBitPure!0 lt!275536))))

(declare-fun lt!275527 () Unit!12884)

(assert (=> b!179531 (= lt!275527 (readBitPrefixLemma!0 lt!275542 (_2!8368 lt!275541)))))

(declare-fun res!148966 () Bool)

(assert (=> b!179531 (= res!148966 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!275507))) (currentByte!8893 (_1!8370 lt!275507)) (currentBit!8888 (_1!8370 lt!275507))) (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!275532))) (currentByte!8893 (_1!8370 lt!275532)) (currentBit!8888 (_1!8370 lt!275532)))))))

(assert (=> b!179531 (=> (not res!148966) (not e!124845))))

(assert (=> b!179531 e!124845))

(declare-fun lt!275540 () Unit!12884)

(assert (=> b!179531 (= lt!275540 lt!275527)))

(declare-fun lt!275523 () tuple2!15448)

(assert (=> b!179531 (= lt!275523 (reader!0 (_2!8368 lt!274667) (_2!8368 lt!275541)))))

(declare-fun lt!275551 () tuple2!15448)

(assert (=> b!179531 (= lt!275551 (reader!0 (_2!8368 lt!275538) (_2!8368 lt!275541)))))

(declare-fun lt!275518 () tuple2!15450)

(assert (=> b!179531 (= lt!275518 (readBitPure!0 (_1!8369 lt!275523)))))

(assert (=> b!179531 (= (_2!8370 lt!275518) lt!275510)))

(declare-fun lt!275498 () Unit!12884)

(declare-fun Unit!12906 () Unit!12884)

(assert (=> b!179531 (= lt!275498 Unit!12906)))

(declare-fun lt!275535 () (_ BitVec 64))

(assert (=> b!179531 (= lt!275535 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275506 () (_ BitVec 64))

(assert (=> b!179531 (= lt!275506 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275517 () Unit!12884)

(assert (=> b!179531 (= lt!275517 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8368 lt!274667) (buf!4695 (_2!8368 lt!275541)) lt!275506))))

(assert (=> b!179531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!275541)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274667))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274667))) lt!275506)))

(declare-fun lt!275512 () Unit!12884)

(assert (=> b!179531 (= lt!275512 lt!275517)))

(declare-fun lt!275550 () tuple2!15470)

(assert (=> b!179531 (= lt!275550 (readNBitsLSBFirstsLoopPure!0 (_1!8369 lt!275523) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275535))))

(declare-fun lt!275516 () (_ BitVec 64))

(assert (=> b!179531 (= lt!275516 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!275502 () Unit!12884)

(assert (=> b!179531 (= lt!275502 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8368 lt!275538) (buf!4695 (_2!8368 lt!275541)) lt!275516))))

(assert (=> b!179531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!275541)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!275538))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!275538))) lt!275516)))

(declare-fun lt!275552 () Unit!12884)

(assert (=> b!179531 (= lt!275552 lt!275502)))

(declare-fun lt!275520 () tuple2!15470)

(assert (=> b!179531 (= lt!275520 (readNBitsLSBFirstsLoopPure!0 (_1!8369 lt!275551) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!275535 (ite (_2!8370 lt!275518) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!275533 () tuple2!15470)

(assert (=> b!179531 (= lt!275533 (readNBitsLSBFirstsLoopPure!0 (_1!8369 lt!275523) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275535))))

(declare-fun c!9299 () Bool)

(assert (=> b!179531 (= c!9299 (_2!8370 (readBitPure!0 (_1!8369 lt!275523))))))

(declare-fun lt!275511 () tuple2!15470)

(assert (=> b!179531 (= lt!275511 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8369 lt!275523) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!275535 e!124850)))))

(declare-fun lt!275543 () Unit!12884)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12884)

(assert (=> b!179531 (= lt!275543 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8369 lt!275523) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275535))))

(assert (=> b!179531 (and (= (_2!8380 lt!275533) (_2!8380 lt!275511)) (= (_1!8380 lt!275533) (_1!8380 lt!275511)))))

(declare-fun lt!275509 () Unit!12884)

(assert (=> b!179531 (= lt!275509 lt!275543)))

(assert (=> b!179531 (= (_1!8369 lt!275523) (withMovedBitIndex!0 (_2!8369 lt!275523) (bvsub (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275541))) (currentByte!8893 (_2!8368 lt!275541)) (currentBit!8888 (_2!8368 lt!275541))))))))

(declare-fun lt!275503 () Unit!12884)

(declare-fun Unit!12907 () Unit!12884)

(assert (=> b!179531 (= lt!275503 Unit!12907)))

(assert (=> b!179531 (= (_1!8369 lt!275551) (withMovedBitIndex!0 (_2!8369 lt!275551) (bvsub (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275538))) (currentByte!8893 (_2!8368 lt!275538)) (currentBit!8888 (_2!8368 lt!275538))) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275541))) (currentByte!8893 (_2!8368 lt!275541)) (currentBit!8888 (_2!8368 lt!275541))))))))

(declare-fun lt!275515 () Unit!12884)

(declare-fun Unit!12908 () Unit!12884)

(assert (=> b!179531 (= lt!275515 Unit!12908)))

(assert (=> b!179531 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))) (bvsub (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275538))) (currentByte!8893 (_2!8368 lt!275538)) (currentBit!8888 (_2!8368 lt!275538))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!275549 () Unit!12884)

(declare-fun Unit!12909 () Unit!12884)

(assert (=> b!179531 (= lt!275549 Unit!12909)))

(assert (=> b!179531 (= (_2!8380 lt!275550) (_2!8380 lt!275520))))

(declare-fun lt!275529 () Unit!12884)

(declare-fun Unit!12910 () Unit!12884)

(assert (=> b!179531 (= lt!275529 Unit!12910)))

(assert (=> b!179531 (invariant!0 (currentBit!8888 (_2!8368 lt!275541)) (currentByte!8893 (_2!8368 lt!275541)) (size!4252 (buf!4695 (_2!8368 lt!275541))))))

(declare-fun lt!275545 () Unit!12884)

(declare-fun Unit!12911 () Unit!12884)

(assert (=> b!179531 (= lt!275545 Unit!12911)))

(assert (=> b!179531 (= (size!4252 (buf!4695 (_2!8368 lt!274667))) (size!4252 (buf!4695 (_2!8368 lt!275541))))))

(declare-fun lt!275521 () Unit!12884)

(declare-fun Unit!12912 () Unit!12884)

(assert (=> b!179531 (= lt!275521 Unit!12912)))

(assert (=> b!179531 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275541))) (currentByte!8893 (_2!8368 lt!275541)) (currentBit!8888 (_2!8368 lt!275541))) (bvsub (bvadd (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275553 () Unit!12884)

(declare-fun Unit!12913 () Unit!12884)

(assert (=> b!179531 (= lt!275553 Unit!12913)))

(declare-fun lt!275528 () Unit!12884)

(declare-fun Unit!12914 () Unit!12884)

(assert (=> b!179531 (= lt!275528 Unit!12914)))

(assert (=> b!179531 (= lt!275513 (reader!0 (_2!8368 lt!274667) (_2!8368 lt!275541)))))

(declare-fun lt!275504 () (_ BitVec 64))

(assert (=> b!179531 (= lt!275504 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275525 () Unit!12884)

(assert (=> b!179531 (= lt!275525 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8368 lt!274667) (buf!4695 (_2!8368 lt!275541)) lt!275504))))

(assert (=> b!179531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!275541)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274667))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274667))) lt!275504)))

(declare-fun lt!275505 () Unit!12884)

(assert (=> b!179531 (= lt!275505 lt!275525)))

(assert (=> b!179531 (= lt!275534 (readNBitsLSBFirstsLoopPure!0 (_1!8369 lt!275513) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!148968 () Bool)

(assert (=> b!179531 (= res!148968 (= (_2!8380 lt!275534) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!179531 (=> (not res!148968) (not e!124846))))

(assert (=> b!179531 e!124846))

(declare-fun lt!275544 () Unit!12884)

(declare-fun Unit!12915 () Unit!12884)

(assert (=> b!179531 (= lt!275544 Unit!12915)))

(declare-fun b!179532 () Bool)

(assert (=> b!179532 (= e!124849 (= (_1!8380 lt!275530) (_2!8369 lt!275514)))))

(assert (= (and d!62695 c!9300) b!179522))

(assert (= (and d!62695 (not c!9300)) b!179531))

(assert (= (and b!179531 res!148973) b!179526))

(assert (= (and b!179526 res!148967) b!179521))

(assert (= (and b!179521 res!148970) b!179529))

(assert (= (and b!179529 res!148972) b!179519))

(assert (= (and b!179531 res!148966) b!179530))

(assert (= (and b!179531 c!9299) b!179518))

(assert (= (and b!179531 (not c!9299)) b!179525))

(assert (= (and b!179531 res!148968) b!179524))

(assert (= (or b!179522 b!179521) bm!2930))

(assert (= (and d!62695 res!148975) b!179517))

(assert (= (and b!179517 res!148969) b!179528))

(assert (= (and b!179528 res!148974) b!179527))

(assert (= (and b!179527 res!148976) b!179523))

(assert (= (and b!179523 res!148965) b!179520))

(assert (= (and b!179523 res!148971) b!179532))

(declare-fun m!279781 () Bool)

(assert (=> b!179520 m!279781))

(declare-fun m!279783 () Bool)

(assert (=> b!179527 m!279783))

(declare-fun m!279785 () Bool)

(assert (=> b!179526 m!279785))

(assert (=> b!179526 m!279245))

(declare-fun m!279787 () Bool)

(assert (=> b!179528 m!279787))

(assert (=> b!179528 m!279245))

(declare-fun m!279789 () Bool)

(assert (=> bm!2930 m!279789))

(declare-fun m!279791 () Bool)

(assert (=> b!179523 m!279791))

(declare-fun m!279793 () Bool)

(assert (=> b!179523 m!279793))

(declare-fun m!279795 () Bool)

(assert (=> b!179523 m!279795))

(declare-fun m!279797 () Bool)

(assert (=> b!179523 m!279797))

(declare-fun m!279799 () Bool)

(assert (=> b!179523 m!279799))

(declare-fun m!279801 () Bool)

(assert (=> b!179523 m!279801))

(assert (=> b!179522 m!279451))

(declare-fun m!279803 () Bool)

(assert (=> b!179529 m!279803))

(assert (=> b!179529 m!279803))

(declare-fun m!279805 () Bool)

(assert (=> b!179529 m!279805))

(declare-fun m!279807 () Bool)

(assert (=> b!179531 m!279807))

(declare-fun m!279809 () Bool)

(assert (=> b!179531 m!279809))

(declare-fun m!279811 () Bool)

(assert (=> b!179531 m!279811))

(declare-fun m!279813 () Bool)

(assert (=> b!179531 m!279813))

(declare-fun m!279815 () Bool)

(assert (=> b!179531 m!279815))

(declare-fun m!279817 () Bool)

(assert (=> b!179531 m!279817))

(declare-fun m!279819 () Bool)

(assert (=> b!179531 m!279819))

(declare-fun m!279821 () Bool)

(assert (=> b!179531 m!279821))

(assert (=> b!179531 m!279801))

(declare-fun m!279823 () Bool)

(assert (=> b!179531 m!279823))

(declare-fun m!279825 () Bool)

(assert (=> b!179531 m!279825))

(declare-fun m!279827 () Bool)

(assert (=> b!179531 m!279827))

(declare-fun m!279829 () Bool)

(assert (=> b!179531 m!279829))

(declare-fun m!279831 () Bool)

(assert (=> b!179531 m!279831))

(declare-fun m!279833 () Bool)

(assert (=> b!179531 m!279833))

(declare-fun m!279835 () Bool)

(assert (=> b!179531 m!279835))

(declare-fun m!279837 () Bool)

(assert (=> b!179531 m!279837))

(declare-fun m!279839 () Bool)

(assert (=> b!179531 m!279839))

(declare-fun m!279841 () Bool)

(assert (=> b!179531 m!279841))

(declare-fun m!279843 () Bool)

(assert (=> b!179531 m!279843))

(declare-fun m!279845 () Bool)

(assert (=> b!179531 m!279845))

(declare-fun m!279847 () Bool)

(assert (=> b!179531 m!279847))

(declare-fun m!279849 () Bool)

(assert (=> b!179531 m!279849))

(declare-fun m!279851 () Bool)

(assert (=> b!179531 m!279851))

(assert (=> b!179531 m!279245))

(declare-fun m!279853 () Bool)

(assert (=> b!179531 m!279853))

(assert (=> b!179531 m!279793))

(assert (=> b!179531 m!279845))

(declare-fun m!279855 () Bool)

(assert (=> b!179531 m!279855))

(declare-fun m!279857 () Bool)

(assert (=> b!179531 m!279857))

(declare-fun m!279859 () Bool)

(assert (=> b!179531 m!279859))

(declare-fun m!279861 () Bool)

(assert (=> b!179531 m!279861))

(declare-fun m!279863 () Bool)

(assert (=> b!179531 m!279863))

(declare-fun m!279865 () Bool)

(assert (=> b!179531 m!279865))

(declare-fun m!279867 () Bool)

(assert (=> b!179531 m!279867))

(declare-fun m!279869 () Bool)

(assert (=> b!179519 m!279869))

(assert (=> b!179519 m!279785))

(declare-fun m!279871 () Bool)

(assert (=> d!62695 m!279871))

(assert (=> b!179158 d!62695))

(declare-fun d!62767 () Bool)

(assert (=> d!62767 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))) ((_ sign_extend 32) (currentByte!8893 thiss!1204)) ((_ sign_extend 32) (currentBit!8888 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))) ((_ sign_extend 32) (currentByte!8893 thiss!1204)) ((_ sign_extend 32) (currentBit!8888 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15645 () Bool)

(assert (= bs!15645 d!62767))

(declare-fun m!279873 () Bool)

(assert (=> bs!15645 m!279873))

(assert (=> b!179159 d!62767))

(declare-fun d!62769 () Bool)

(assert (=> d!62769 (= (invariant!0 (currentBit!8888 (_2!8368 lt!274665)) (currentByte!8893 (_2!8368 lt!274665)) (size!4252 (buf!4695 (_2!8368 lt!274665)))) (and (bvsge (currentBit!8888 (_2!8368 lt!274665)) #b00000000000000000000000000000000) (bvslt (currentBit!8888 (_2!8368 lt!274665)) #b00000000000000000000000000001000) (bvsge (currentByte!8893 (_2!8368 lt!274665)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8893 (_2!8368 lt!274665)) (size!4252 (buf!4695 (_2!8368 lt!274665)))) (and (= (currentBit!8888 (_2!8368 lt!274665)) #b00000000000000000000000000000000) (= (currentByte!8893 (_2!8368 lt!274665)) (size!4252 (buf!4695 (_2!8368 lt!274665))))))))))

(assert (=> b!179149 d!62769))

(declare-fun d!62771 () Bool)

(assert (=> d!62771 (= (array_inv!3993 (buf!4695 thiss!1204)) (bvsge (size!4252 (buf!4695 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!179144 d!62771))

(declare-fun d!62773 () Bool)

(declare-fun e!124852 () Bool)

(assert (=> d!62773 e!124852))

(declare-fun res!148977 () Bool)

(assert (=> d!62773 (=> (not res!148977) (not e!124852))))

(declare-fun lt!275554 () (_ BitVec 64))

(declare-fun lt!275558 () (_ BitVec 64))

(declare-fun lt!275557 () (_ BitVec 64))

(assert (=> d!62773 (= res!148977 (= lt!275554 (bvsub lt!275557 lt!275558)))))

(assert (=> d!62773 (or (= (bvand lt!275557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275557 lt!275558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62773 (= lt!275558 (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274667)))) ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274667))) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274667)))))))

(declare-fun lt!275559 () (_ BitVec 64))

(declare-fun lt!275556 () (_ BitVec 64))

(assert (=> d!62773 (= lt!275557 (bvmul lt!275559 lt!275556))))

(assert (=> d!62773 (or (= lt!275559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275556 (bvsdiv (bvmul lt!275559 lt!275556) lt!275559)))))

(assert (=> d!62773 (= lt!275556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62773 (= lt!275559 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(assert (=> d!62773 (= lt!275554 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8893 (_2!8368 lt!274667))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8888 (_2!8368 lt!274667)))))))

(assert (=> d!62773 (invariant!0 (currentBit!8888 (_2!8368 lt!274667)) (currentByte!8893 (_2!8368 lt!274667)) (size!4252 (buf!4695 (_2!8368 lt!274667))))))

(assert (=> d!62773 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))) lt!275554)))

(declare-fun b!179533 () Bool)

(declare-fun res!148978 () Bool)

(assert (=> b!179533 (=> (not res!148978) (not e!124852))))

(assert (=> b!179533 (= res!148978 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275554))))

(declare-fun b!179534 () Bool)

(declare-fun lt!275555 () (_ BitVec 64))

(assert (=> b!179534 (= e!124852 (bvsle lt!275554 (bvmul lt!275555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179534 (or (= lt!275555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275555)))))

(assert (=> b!179534 (= lt!275555 ((_ sign_extend 32) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(assert (= (and d!62773 res!148977) b!179533))

(assert (= (and b!179533 res!148978) b!179534))

(declare-fun m!279875 () Bool)

(assert (=> d!62773 m!279875))

(declare-fun m!279877 () Bool)

(assert (=> d!62773 m!279877))

(assert (=> b!179145 d!62773))

(declare-fun d!62775 () Bool)

(declare-fun e!124853 () Bool)

(assert (=> d!62775 e!124853))

(declare-fun res!148979 () Bool)

(assert (=> d!62775 (=> (not res!148979) (not e!124853))))

(declare-fun lt!275560 () (_ BitVec 64))

(declare-fun lt!275564 () (_ BitVec 64))

(declare-fun lt!275563 () (_ BitVec 64))

(assert (=> d!62775 (= res!148979 (= lt!275560 (bvsub lt!275563 lt!275564)))))

(assert (=> d!62775 (or (= (bvand lt!275563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275564 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275563 lt!275564) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62775 (= lt!275564 (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))) ((_ sign_extend 32) (currentByte!8893 thiss!1204)) ((_ sign_extend 32) (currentBit!8888 thiss!1204))))))

(declare-fun lt!275565 () (_ BitVec 64))

(declare-fun lt!275562 () (_ BitVec 64))

(assert (=> d!62775 (= lt!275563 (bvmul lt!275565 lt!275562))))

(assert (=> d!62775 (or (= lt!275565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275562 (bvsdiv (bvmul lt!275565 lt!275562) lt!275565)))))

(assert (=> d!62775 (= lt!275562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62775 (= lt!275565 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))))))

(assert (=> d!62775 (= lt!275560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8893 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8888 thiss!1204))))))

(assert (=> d!62775 (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 thiss!1204)))))

(assert (=> d!62775 (= (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)) lt!275560)))

(declare-fun b!179535 () Bool)

(declare-fun res!148980 () Bool)

(assert (=> b!179535 (=> (not res!148980) (not e!124853))))

(assert (=> b!179535 (= res!148980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275560))))

(declare-fun b!179536 () Bool)

(declare-fun lt!275561 () (_ BitVec 64))

(assert (=> b!179536 (= e!124853 (bvsle lt!275560 (bvmul lt!275561 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179536 (or (= lt!275561 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275561 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275561)))))

(assert (=> b!179536 (= lt!275561 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))))))

(assert (= (and d!62775 res!148979) b!179535))

(assert (= (and b!179535 res!148980) b!179536))

(assert (=> d!62775 m!279873))

(assert (=> d!62775 m!279243))

(assert (=> b!179145 d!62775))

(declare-fun b!179547 () Bool)

(declare-fun res!148992 () Bool)

(declare-fun e!124859 () Bool)

(assert (=> b!179547 (=> (not res!148992) (not e!124859))))

(declare-fun lt!275574 () tuple2!15446)

(assert (=> b!179547 (= res!148992 (isPrefixOf!0 thiss!1204 (_2!8368 lt!275574)))))

(declare-fun d!62777 () Bool)

(assert (=> d!62777 e!124859))

(declare-fun res!148991 () Bool)

(assert (=> d!62777 (=> (not res!148991) (not e!124859))))

(assert (=> d!62777 (= res!148991 (= (size!4252 (buf!4695 thiss!1204)) (size!4252 (buf!4695 (_2!8368 lt!275574)))))))

(declare-fun choose!16 (BitStream!7612 Bool) tuple2!15446)

(assert (=> d!62777 (= lt!275574 (choose!16 thiss!1204 lt!274676))))

(assert (=> d!62777 (validate_offset_bit!0 ((_ sign_extend 32) (size!4252 (buf!4695 thiss!1204))) ((_ sign_extend 32) (currentByte!8893 thiss!1204)) ((_ sign_extend 32) (currentBit!8888 thiss!1204)))))

(assert (=> d!62777 (= (appendBit!0 thiss!1204 lt!274676) lt!275574)))

(declare-fun b!179548 () Bool)

(declare-fun e!124858 () Bool)

(assert (=> b!179548 (= e!124859 e!124858)))

(declare-fun res!148989 () Bool)

(assert (=> b!179548 (=> (not res!148989) (not e!124858))))

(declare-fun lt!275577 () tuple2!15450)

(assert (=> b!179548 (= res!148989 (and (= (_2!8370 lt!275577) lt!274676) (= (_1!8370 lt!275577) (_2!8368 lt!275574))))))

(assert (=> b!179548 (= lt!275577 (readBitPure!0 (readerFrom!0 (_2!8368 lt!275574) (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204))))))

(declare-fun b!179546 () Bool)

(declare-fun res!148990 () Bool)

(assert (=> b!179546 (=> (not res!148990) (not e!124859))))

(declare-fun lt!275575 () (_ BitVec 64))

(declare-fun lt!275576 () (_ BitVec 64))

(assert (=> b!179546 (= res!148990 (= (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275574))) (currentByte!8893 (_2!8368 lt!275574)) (currentBit!8888 (_2!8368 lt!275574))) (bvadd lt!275575 lt!275576)))))

(assert (=> b!179546 (or (not (= (bvand lt!275575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275576 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!275575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!275575 lt!275576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179546 (= lt!275576 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!179546 (= lt!275575 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun b!179549 () Bool)

(assert (=> b!179549 (= e!124858 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!275577))) (currentByte!8893 (_1!8370 lt!275577)) (currentBit!8888 (_1!8370 lt!275577))) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!275574))) (currentByte!8893 (_2!8368 lt!275574)) (currentBit!8888 (_2!8368 lt!275574)))))))

(assert (= (and d!62777 res!148991) b!179546))

(assert (= (and b!179546 res!148990) b!179547))

(assert (= (and b!179547 res!148992) b!179548))

(assert (= (and b!179548 res!148989) b!179549))

(declare-fun m!279879 () Bool)

(assert (=> d!62777 m!279879))

(declare-fun m!279881 () Bool)

(assert (=> d!62777 m!279881))

(declare-fun m!279883 () Bool)

(assert (=> b!179549 m!279883))

(declare-fun m!279885 () Bool)

(assert (=> b!179549 m!279885))

(declare-fun m!279887 () Bool)

(assert (=> b!179548 m!279887))

(assert (=> b!179548 m!279887))

(declare-fun m!279889 () Bool)

(assert (=> b!179548 m!279889))

(declare-fun m!279891 () Bool)

(assert (=> b!179547 m!279891))

(assert (=> b!179546 m!279885))

(assert (=> b!179546 m!279247))

(assert (=> b!179145 d!62777))

(declare-fun d!62779 () Bool)

(declare-fun e!124860 () Bool)

(assert (=> d!62779 e!124860))

(declare-fun res!148993 () Bool)

(assert (=> d!62779 (=> (not res!148993) (not e!124860))))

(declare-fun lt!275582 () (_ BitVec 64))

(declare-fun lt!275578 () (_ BitVec 64))

(declare-fun lt!275581 () (_ BitVec 64))

(assert (=> d!62779 (= res!148993 (= lt!275578 (bvsub lt!275581 lt!275582)))))

(assert (=> d!62779 (or (= (bvand lt!275581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275581 lt!275582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62779 (= lt!275582 (remainingBits!0 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274664)))) ((_ sign_extend 32) (currentByte!8893 (_1!8370 lt!274664))) ((_ sign_extend 32) (currentBit!8888 (_1!8370 lt!274664)))))))

(declare-fun lt!275583 () (_ BitVec 64))

(declare-fun lt!275580 () (_ BitVec 64))

(assert (=> d!62779 (= lt!275581 (bvmul lt!275583 lt!275580))))

(assert (=> d!62779 (or (= lt!275583 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275580 (bvsdiv (bvmul lt!275583 lt!275580) lt!275583)))))

(assert (=> d!62779 (= lt!275580 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62779 (= lt!275583 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274664)))))))

(assert (=> d!62779 (= lt!275578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8893 (_1!8370 lt!274664))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8888 (_1!8370 lt!274664)))))))

(assert (=> d!62779 (invariant!0 (currentBit!8888 (_1!8370 lt!274664)) (currentByte!8893 (_1!8370 lt!274664)) (size!4252 (buf!4695 (_1!8370 lt!274664))))))

(assert (=> d!62779 (= (bitIndex!0 (size!4252 (buf!4695 (_1!8370 lt!274664))) (currentByte!8893 (_1!8370 lt!274664)) (currentBit!8888 (_1!8370 lt!274664))) lt!275578)))

(declare-fun b!179550 () Bool)

(declare-fun res!148994 () Bool)

(assert (=> b!179550 (=> (not res!148994) (not e!124860))))

(assert (=> b!179550 (= res!148994 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275578))))

(declare-fun b!179551 () Bool)

(declare-fun lt!275579 () (_ BitVec 64))

(assert (=> b!179551 (= e!124860 (bvsle lt!275578 (bvmul lt!275579 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179551 (or (= lt!275579 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275579 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275579)))))

(assert (=> b!179551 (= lt!275579 ((_ sign_extend 32) (size!4252 (buf!4695 (_1!8370 lt!274664)))))))

(assert (= (and d!62779 res!148993) b!179550))

(assert (= (and b!179550 res!148994) b!179551))

(declare-fun m!279893 () Bool)

(assert (=> d!62779 m!279893))

(declare-fun m!279895 () Bool)

(assert (=> d!62779 m!279895))

(assert (=> b!179156 d!62779))

(declare-fun d!62781 () Bool)

(declare-fun res!148996 () Bool)

(declare-fun e!124862 () Bool)

(assert (=> d!62781 (=> (not res!148996) (not e!124862))))

(assert (=> d!62781 (= res!148996 (= (size!4252 (buf!4695 thiss!1204)) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(assert (=> d!62781 (= (isPrefixOf!0 thiss!1204 (_2!8368 lt!274667)) e!124862)))

(declare-fun b!179552 () Bool)

(declare-fun res!148997 () Bool)

(assert (=> b!179552 (=> (not res!148997) (not e!124862))))

(assert (=> b!179552 (= res!148997 (bvsle (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667)))))))

(declare-fun b!179553 () Bool)

(declare-fun e!124861 () Bool)

(assert (=> b!179553 (= e!124862 e!124861)))

(declare-fun res!148995 () Bool)

(assert (=> b!179553 (=> res!148995 e!124861)))

(assert (=> b!179553 (= res!148995 (= (size!4252 (buf!4695 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!179554 () Bool)

(assert (=> b!179554 (= e!124861 (arrayBitRangesEq!0 (buf!4695 thiss!1204) (buf!4695 (_2!8368 lt!274667)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4252 (buf!4695 thiss!1204)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204))))))

(assert (= (and d!62781 res!148996) b!179552))

(assert (= (and b!179552 res!148997) b!179553))

(assert (= (and b!179553 (not res!148995)) b!179554))

(assert (=> b!179552 m!279247))

(assert (=> b!179552 m!279245))

(assert (=> b!179554 m!279247))

(assert (=> b!179554 m!279247))

(declare-fun m!279897 () Bool)

(assert (=> b!179554 m!279897))

(assert (=> b!179146 d!62781))

(declare-fun d!62783 () Bool)

(assert (=> d!62783 (= (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274665)))) (and (bvsge (currentBit!8888 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8888 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8893 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274665)))) (and (= (currentBit!8888 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274665))))))))))

(assert (=> b!179157 d!62783))

(assert (=> b!179152 d!62773))

(assert (=> b!179152 d!62775))

(declare-fun d!62785 () Bool)

(assert (=> d!62785 (= (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 thiss!1204))) (and (bvsge (currentBit!8888 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8888 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8893 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8893 thiss!1204) (size!4252 (buf!4695 thiss!1204))) (and (= (currentBit!8888 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8893 thiss!1204) (size!4252 (buf!4695 thiss!1204)))))))))

(assert (=> b!179153 d!62785))

(declare-fun d!62787 () Bool)

(assert (=> d!62787 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 thiss!1204))))))

(declare-fun bs!15646 () Bool)

(assert (= bs!15646 d!62787))

(assert (=> bs!15646 m!279243))

(assert (=> start!39626 d!62787))

(declare-fun d!62789 () Bool)

(declare-fun res!148999 () Bool)

(declare-fun e!124864 () Bool)

(assert (=> d!62789 (=> (not res!148999) (not e!124864))))

(assert (=> d!62789 (= res!148999 (= (size!4252 (buf!4695 (_2!8368 lt!274667))) (size!4252 (buf!4695 (_2!8368 lt!274665)))))))

(assert (=> d!62789 (= (isPrefixOf!0 (_2!8368 lt!274667) (_2!8368 lt!274665)) e!124864)))

(declare-fun b!179555 () Bool)

(declare-fun res!149000 () Bool)

(assert (=> b!179555 (=> (not res!149000) (not e!124864))))

(assert (=> b!179555 (= res!149000 (bvsle (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667))) (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274665))) (currentByte!8893 (_2!8368 lt!274665)) (currentBit!8888 (_2!8368 lt!274665)))))))

(declare-fun b!179556 () Bool)

(declare-fun e!124863 () Bool)

(assert (=> b!179556 (= e!124864 e!124863)))

(declare-fun res!148998 () Bool)

(assert (=> b!179556 (=> res!148998 e!124863)))

(assert (=> b!179556 (= res!148998 (= (size!4252 (buf!4695 (_2!8368 lt!274667))) #b00000000000000000000000000000000))))

(declare-fun b!179557 () Bool)

(assert (=> b!179557 (= e!124863 (arrayBitRangesEq!0 (buf!4695 (_2!8368 lt!274667)) (buf!4695 (_2!8368 lt!274665)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4252 (buf!4695 (_2!8368 lt!274667))) (currentByte!8893 (_2!8368 lt!274667)) (currentBit!8888 (_2!8368 lt!274667)))))))

(assert (= (and d!62789 res!148999) b!179555))

(assert (= (and b!179555 res!149000) b!179556))

(assert (= (and b!179556 (not res!148998)) b!179557))

(assert (=> b!179555 m!279245))

(assert (=> b!179555 m!279259))

(assert (=> b!179557 m!279245))

(assert (=> b!179557 m!279245))

(declare-fun m!279899 () Bool)

(assert (=> b!179557 m!279899))

(assert (=> b!179154 d!62789))

(declare-fun d!62791 () Bool)

(declare-fun lt!275584 () tuple2!15468)

(assert (=> d!62791 (= lt!275584 (readBit!0 (readerFrom!0 (_2!8368 lt!274667) (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204))))))

(assert (=> d!62791 (= (readBitPure!0 (readerFrom!0 (_2!8368 lt!274667) (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204))) (tuple2!15451 (_2!8379 lt!275584) (_1!8379 lt!275584)))))

(declare-fun bs!15647 () Bool)

(assert (= bs!15647 d!62791))

(assert (=> bs!15647 m!279253))

(declare-fun m!279901 () Bool)

(assert (=> bs!15647 m!279901))

(assert (=> b!179160 d!62791))

(declare-fun d!62793 () Bool)

(declare-fun e!124867 () Bool)

(assert (=> d!62793 e!124867))

(declare-fun res!149004 () Bool)

(assert (=> d!62793 (=> (not res!149004) (not e!124867))))

(assert (=> d!62793 (= res!149004 (invariant!0 (currentBit!8888 (_2!8368 lt!274667)) (currentByte!8893 (_2!8368 lt!274667)) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(assert (=> d!62793 (= (readerFrom!0 (_2!8368 lt!274667) (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204)) (BitStream!7613 (buf!4695 (_2!8368 lt!274667)) (currentByte!8893 thiss!1204) (currentBit!8888 thiss!1204)))))

(declare-fun b!179560 () Bool)

(assert (=> b!179560 (= e!124867 (invariant!0 (currentBit!8888 thiss!1204) (currentByte!8893 thiss!1204) (size!4252 (buf!4695 (_2!8368 lt!274667)))))))

(assert (= (and d!62793 res!149004) b!179560))

(assert (=> d!62793 m!279877))

(assert (=> b!179560 m!279229))

(assert (=> b!179160 d!62793))

(assert (=> b!179150 d!62781))

(push 1)

(assert (not d!62787))

(assert (not d!62681))

(assert (not d!62779))

(assert (not b!179305))

(assert (not d!62653))

(assert (not b!179552))

(assert (not d!62767))

(assert (not b!179560))

(assert (not b!179522))

(assert (not b!179555))

(assert (not b!179546))

(assert (not b!179303))

(assert (not d!62773))

(assert (not b!179308))

(assert (not b!179332))

(assert (not d!62777))

(assert (not d!62693))

(assert (not d!62683))

(assert (not d!62677))

(assert (not b!179557))

(assert (not d!62657))

(assert (not b!179549))

(assert (not b!179547))

(assert (not b!179526))

(assert (not b!179528))

(assert (not d!62775))

(assert (not b!179306))

(assert (not d!62689))

(assert (not b!179520))

(assert (not b!179304))

(assert (not d!62793))

(assert (not d!62679))

(assert (not d!62695))

(assert (not bm!2930))

(assert (not b!179531))

(assert (not d!62671))

(assert (not b!179527))

(assert (not d!62655))

(assert (not b!179299))

(assert (not b!179529))

(assert (not b!179519))

(assert (not d!62791))

(assert (not b!179300))

(assert (not b!179523))

(assert (not b!179330))

(assert (not b!179548))

(assert (not b!179301))

(assert (not b!179554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

