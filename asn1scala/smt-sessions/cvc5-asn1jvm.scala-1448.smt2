; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39722 () Bool)

(assert start!39722)

(declare-fun b!179804 () Bool)

(declare-fun e!125019 () Bool)

(declare-fun e!125014 () Bool)

(assert (=> b!179804 (= e!125019 e!125014)))

(declare-fun res!149237 () Bool)

(assert (=> b!179804 (=> (not res!149237) (not e!125014))))

(declare-fun lt!275938 () (_ BitVec 64))

(declare-fun lt!275947 () (_ BitVec 64))

(assert (=> b!179804 (= res!149237 (= lt!275938 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275947)))))

(declare-datatypes ((array!9656 0))(
  ( (array!9657 (arr!5188 (Array (_ BitVec 32) (_ BitVec 8))) (size!4258 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7624 0))(
  ( (BitStream!7625 (buf!4701 array!9656) (currentByte!8911 (_ BitVec 32)) (currentBit!8906 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12935 0))(
  ( (Unit!12936) )
))
(declare-datatypes ((tuple2!15494 0))(
  ( (tuple2!15495 (_1!8392 Unit!12935) (_2!8392 BitStream!7624)) )
))
(declare-fun lt!275943 () tuple2!15494)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179804 (= lt!275938 (bitIndex!0 (size!4258 (buf!4701 (_2!8392 lt!275943))) (currentByte!8911 (_2!8392 lt!275943)) (currentBit!8906 (_2!8392 lt!275943))))))

(declare-fun thiss!1204 () BitStream!7624)

(assert (=> b!179804 (= lt!275947 (bitIndex!0 (size!4258 (buf!4701 thiss!1204)) (currentByte!8911 thiss!1204) (currentBit!8906 thiss!1204)))))

(declare-fun b!179805 () Bool)

(declare-fun res!149239 () Bool)

(declare-fun e!125016 () Bool)

(assert (=> b!179805 (=> (not res!149239) (not e!125016))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179805 (= res!149239 (invariant!0 (currentBit!8906 thiss!1204) (currentByte!8911 thiss!1204) (size!4258 (buf!4701 thiss!1204))))))

(declare-fun b!179806 () Bool)

(declare-fun res!149235 () Bool)

(assert (=> b!179806 (=> (not res!149235) (not e!125014))))

(declare-fun isPrefixOf!0 (BitStream!7624 BitStream!7624) Bool)

(assert (=> b!179806 (= res!149235 (isPrefixOf!0 thiss!1204 (_2!8392 lt!275943)))))

(declare-fun b!179807 () Bool)

(declare-fun e!125017 () Bool)

(declare-fun array_inv!3999 (array!9656) Bool)

(assert (=> b!179807 (= e!125017 (array_inv!3999 (buf!4701 thiss!1204)))))

(declare-fun b!179808 () Bool)

(declare-fun res!149231 () Bool)

(assert (=> b!179808 (=> (not res!149231) (not e!125016))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179808 (= res!149231 (validate_offset_bits!1 ((_ sign_extend 32) (size!4258 (buf!4701 thiss!1204))) ((_ sign_extend 32) (currentByte!8911 thiss!1204)) ((_ sign_extend 32) (currentBit!8906 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!149240 () Bool)

(assert (=> start!39722 (=> (not res!149240) (not e!125016))))

(assert (=> start!39722 (= res!149240 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39722 e!125016))

(assert (=> start!39722 true))

(declare-fun inv!12 (BitStream!7624) Bool)

(assert (=> start!39722 (and (inv!12 thiss!1204) e!125017)))

(declare-fun b!179809 () Bool)

(declare-fun e!125018 () Bool)

(assert (=> b!179809 (= e!125014 e!125018)))

(declare-fun res!149228 () Bool)

(assert (=> b!179809 (=> (not res!149228) (not e!125018))))

(declare-fun lt!275948 () Bool)

(declare-datatypes ((tuple2!15496 0))(
  ( (tuple2!15497 (_1!8393 BitStream!7624) (_2!8393 Bool)) )
))
(declare-fun lt!275946 () tuple2!15496)

(assert (=> b!179809 (= res!149228 (and (= (_2!8393 lt!275946) lt!275948) (= (_1!8393 lt!275946) (_2!8392 lt!275943))))))

(declare-fun readBitPure!0 (BitStream!7624) tuple2!15496)

(declare-fun readerFrom!0 (BitStream!7624 (_ BitVec 32) (_ BitVec 32)) BitStream!7624)

(assert (=> b!179809 (= lt!275946 (readBitPure!0 (readerFrom!0 (_2!8392 lt!275943) (currentBit!8906 thiss!1204) (currentByte!8911 thiss!1204))))))

(declare-fun b!179810 () Bool)

(declare-fun res!149236 () Bool)

(declare-fun e!125011 () Bool)

(assert (=> b!179810 (=> res!149236 e!125011)))

(declare-fun lt!275936 () (_ BitVec 64))

(declare-fun lt!275937 () tuple2!15494)

(declare-fun lt!275950 () (_ BitVec 64))

(assert (=> b!179810 (= res!149236 (or (not (= (size!4258 (buf!4701 (_2!8392 lt!275937))) (size!4258 (buf!4701 thiss!1204)))) (not (= lt!275936 (bvsub (bvadd lt!275950 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179811 () Bool)

(declare-fun res!149234 () Bool)

(assert (=> b!179811 (=> res!149234 e!125011)))

(assert (=> b!179811 (= res!149234 (not (invariant!0 (currentBit!8906 (_2!8392 lt!275937)) (currentByte!8911 (_2!8392 lt!275937)) (size!4258 (buf!4701 (_2!8392 lt!275937))))))))

(declare-fun b!179812 () Bool)

(declare-fun res!149226 () Bool)

(assert (=> b!179812 (=> (not res!149226) (not e!125016))))

(assert (=> b!179812 (= res!149226 (not (= i!590 nBits!348)))))

(declare-fun b!179813 () Bool)

(declare-fun e!125013 () Bool)

(assert (=> b!179813 (= e!125016 (not e!125013))))

(declare-fun res!149238 () Bool)

(assert (=> b!179813 (=> res!149238 e!125013)))

(declare-fun lt!275942 () (_ BitVec 64))

(assert (=> b!179813 (= res!149238 (not (= lt!275942 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275950))))))

(assert (=> b!179813 (= lt!275942 (bitIndex!0 (size!4258 (buf!4701 (_2!8392 lt!275943))) (currentByte!8911 (_2!8392 lt!275943)) (currentBit!8906 (_2!8392 lt!275943))))))

(assert (=> b!179813 (= lt!275950 (bitIndex!0 (size!4258 (buf!4701 thiss!1204)) (currentByte!8911 thiss!1204) (currentBit!8906 thiss!1204)))))

(assert (=> b!179813 e!125019))

(declare-fun res!149233 () Bool)

(assert (=> b!179813 (=> (not res!149233) (not e!125019))))

(assert (=> b!179813 (= res!149233 (= (size!4258 (buf!4701 thiss!1204)) (size!4258 (buf!4701 (_2!8392 lt!275943)))))))

(declare-fun appendBit!0 (BitStream!7624 Bool) tuple2!15494)

(assert (=> b!179813 (= lt!275943 (appendBit!0 thiss!1204 lt!275948))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!179813 (= lt!275948 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179814 () Bool)

(assert (=> b!179814 (= e!125011 true)))

(declare-datatypes ((tuple2!15498 0))(
  ( (tuple2!15499 (_1!8394 BitStream!7624) (_2!8394 BitStream!7624)) )
))
(declare-fun lt!275939 () tuple2!15498)

(assert (=> b!179814 (= (_2!8393 (readBitPure!0 (_1!8394 lt!275939))) lt!275948)))

(declare-fun lt!275951 () tuple2!15498)

(declare-fun reader!0 (BitStream!7624 BitStream!7624) tuple2!15498)

(assert (=> b!179814 (= lt!275951 (reader!0 (_2!8392 lt!275943) (_2!8392 lt!275937)))))

(assert (=> b!179814 (= lt!275939 (reader!0 thiss!1204 (_2!8392 lt!275937)))))

(declare-fun e!125020 () Bool)

(assert (=> b!179814 e!125020))

(declare-fun res!149232 () Bool)

(assert (=> b!179814 (=> (not res!149232) (not e!125020))))

(declare-fun lt!275944 () tuple2!15496)

(declare-fun lt!275945 () tuple2!15496)

(assert (=> b!179814 (= res!149232 (= (bitIndex!0 (size!4258 (buf!4701 (_1!8393 lt!275944))) (currentByte!8911 (_1!8393 lt!275944)) (currentBit!8906 (_1!8393 lt!275944))) (bitIndex!0 (size!4258 (buf!4701 (_1!8393 lt!275945))) (currentByte!8911 (_1!8393 lt!275945)) (currentBit!8906 (_1!8393 lt!275945)))))))

(declare-fun lt!275940 () Unit!12935)

(declare-fun lt!275949 () BitStream!7624)

(declare-fun readBitPrefixLemma!0 (BitStream!7624 BitStream!7624) Unit!12935)

(assert (=> b!179814 (= lt!275940 (readBitPrefixLemma!0 lt!275949 (_2!8392 lt!275937)))))

(assert (=> b!179814 (= lt!275945 (readBitPure!0 (BitStream!7625 (buf!4701 (_2!8392 lt!275937)) (currentByte!8911 thiss!1204) (currentBit!8906 thiss!1204))))))

(assert (=> b!179814 (= lt!275944 (readBitPure!0 lt!275949))))

(declare-fun e!125015 () Bool)

(assert (=> b!179814 e!125015))

(declare-fun res!149230 () Bool)

(assert (=> b!179814 (=> (not res!149230) (not e!125015))))

(assert (=> b!179814 (= res!149230 (invariant!0 (currentBit!8906 thiss!1204) (currentByte!8911 thiss!1204) (size!4258 (buf!4701 (_2!8392 lt!275943)))))))

(assert (=> b!179814 (= lt!275949 (BitStream!7625 (buf!4701 (_2!8392 lt!275943)) (currentByte!8911 thiss!1204) (currentBit!8906 thiss!1204)))))

(declare-fun b!179815 () Bool)

(assert (=> b!179815 (= e!125020 (= (_2!8393 lt!275944) (_2!8393 lt!275945)))))

(declare-fun b!179816 () Bool)

(declare-fun res!149241 () Bool)

(assert (=> b!179816 (=> res!149241 e!125011)))

(assert (=> b!179816 (= res!149241 (not (isPrefixOf!0 (_2!8392 lt!275943) (_2!8392 lt!275937))))))

(declare-fun b!179817 () Bool)

(assert (=> b!179817 (= e!125018 (= (bitIndex!0 (size!4258 (buf!4701 (_1!8393 lt!275946))) (currentByte!8911 (_1!8393 lt!275946)) (currentBit!8906 (_1!8393 lt!275946))) lt!275938))))

(declare-fun b!179818 () Bool)

(assert (=> b!179818 (= e!125015 (invariant!0 (currentBit!8906 thiss!1204) (currentByte!8911 thiss!1204) (size!4258 (buf!4701 (_2!8392 lt!275937)))))))

(declare-fun b!179819 () Bool)

(assert (=> b!179819 (= e!125013 e!125011)))

(declare-fun res!149227 () Bool)

(assert (=> b!179819 (=> res!149227 e!125011)))

(assert (=> b!179819 (= res!149227 (not (= lt!275936 (bvsub (bvsub (bvadd lt!275942 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179819 (= lt!275936 (bitIndex!0 (size!4258 (buf!4701 (_2!8392 lt!275937))) (currentByte!8911 (_2!8392 lt!275937)) (currentBit!8906 (_2!8392 lt!275937))))))

(assert (=> b!179819 (isPrefixOf!0 thiss!1204 (_2!8392 lt!275937))))

(declare-fun lt!275941 () Unit!12935)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7624 BitStream!7624 BitStream!7624) Unit!12935)

(assert (=> b!179819 (= lt!275941 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8392 lt!275943) (_2!8392 lt!275937)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7624 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15494)

(assert (=> b!179819 (= lt!275937 (appendBitsLSBFirstLoopTR!0 (_2!8392 lt!275943) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179820 () Bool)

(declare-fun res!149229 () Bool)

(assert (=> b!179820 (=> res!149229 e!125011)))

(assert (=> b!179820 (= res!149229 (not (isPrefixOf!0 thiss!1204 (_2!8392 lt!275943))))))

(assert (= (and start!39722 res!149240) b!179808))

(assert (= (and b!179808 res!149231) b!179805))

(assert (= (and b!179805 res!149239) b!179812))

(assert (= (and b!179812 res!149226) b!179813))

(assert (= (and b!179813 res!149233) b!179804))

(assert (= (and b!179804 res!149237) b!179806))

(assert (= (and b!179806 res!149235) b!179809))

(assert (= (and b!179809 res!149228) b!179817))

(assert (= (and b!179813 (not res!149238)) b!179819))

(assert (= (and b!179819 (not res!149227)) b!179811))

(assert (= (and b!179811 (not res!149234)) b!179810))

(assert (= (and b!179810 (not res!149236)) b!179816))

(assert (= (and b!179816 (not res!149241)) b!179820))

(assert (= (and b!179820 (not res!149229)) b!179814))

(assert (= (and b!179814 res!149230) b!179818))

(assert (= (and b!179814 res!149232) b!179815))

(assert (= start!39722 b!179807))

(declare-fun m!280165 () Bool)

(assert (=> b!179811 m!280165))

(declare-fun m!280167 () Bool)

(assert (=> b!179804 m!280167))

(declare-fun m!280169 () Bool)

(assert (=> b!179804 m!280169))

(declare-fun m!280171 () Bool)

(assert (=> start!39722 m!280171))

(declare-fun m!280173 () Bool)

(assert (=> b!179817 m!280173))

(declare-fun m!280175 () Bool)

(assert (=> b!179819 m!280175))

(declare-fun m!280177 () Bool)

(assert (=> b!179819 m!280177))

(declare-fun m!280179 () Bool)

(assert (=> b!179819 m!280179))

(declare-fun m!280181 () Bool)

(assert (=> b!179819 m!280181))

(declare-fun m!280183 () Bool)

(assert (=> b!179807 m!280183))

(declare-fun m!280185 () Bool)

(assert (=> b!179806 m!280185))

(declare-fun m!280187 () Bool)

(assert (=> b!179808 m!280187))

(declare-fun m!280189 () Bool)

(assert (=> b!179809 m!280189))

(assert (=> b!179809 m!280189))

(declare-fun m!280191 () Bool)

(assert (=> b!179809 m!280191))

(assert (=> b!179820 m!280185))

(declare-fun m!280193 () Bool)

(assert (=> b!179805 m!280193))

(declare-fun m!280195 () Bool)

(assert (=> b!179818 m!280195))

(declare-fun m!280197 () Bool)

(assert (=> b!179816 m!280197))

(assert (=> b!179813 m!280167))

(assert (=> b!179813 m!280169))

(declare-fun m!280199 () Bool)

(assert (=> b!179813 m!280199))

(declare-fun m!280201 () Bool)

(assert (=> b!179814 m!280201))

(declare-fun m!280203 () Bool)

(assert (=> b!179814 m!280203))

(declare-fun m!280205 () Bool)

(assert (=> b!179814 m!280205))

(declare-fun m!280207 () Bool)

(assert (=> b!179814 m!280207))

(declare-fun m!280209 () Bool)

(assert (=> b!179814 m!280209))

(declare-fun m!280211 () Bool)

(assert (=> b!179814 m!280211))

(declare-fun m!280213 () Bool)

(assert (=> b!179814 m!280213))

(declare-fun m!280215 () Bool)

(assert (=> b!179814 m!280215))

(declare-fun m!280217 () Bool)

(assert (=> b!179814 m!280217))

(push 1)

