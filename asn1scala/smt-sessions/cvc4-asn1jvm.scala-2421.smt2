; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61778 () Bool)

(assert start!61778)

(declare-fun b!277034 () Bool)

(declare-fun res!230099 () Bool)

(declare-fun e!196986 () Bool)

(assert (=> b!277034 (=> (not res!230099) (not e!196986))))

(declare-datatypes ((array!15875 0))(
  ( (array!15876 (arr!7866 (Array (_ BitVec 32) (_ BitVec 8))) (size!6870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12554 0))(
  ( (BitStream!12555 (buf!7338 array!15875) (currentByte!13594 (_ BitVec 32)) (currentBit!13589 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12554)

(declare-fun b2!124 () BitStream!12554)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277034 (= res!230099 (bvsle (bitIndex!0 (size!6870 (buf!7338 thiss!872)) (currentByte!13594 thiss!872) (currentBit!13589 thiss!872)) (bitIndex!0 (size!6870 (buf!7338 b2!124)) (currentByte!13594 b2!124) (currentBit!13589 b2!124))))))

(declare-fun b!277035 () Bool)

(declare-fun res!230101 () Bool)

(assert (=> b!277035 (=> (not res!230101) (not e!196986))))

(assert (=> b!277035 (= res!230101 (not (= (size!6870 (buf!7338 thiss!872)) #b00000000000000000000000000000000)))))

(declare-fun b!277036 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277036 (= e!196986 (not (invariant!0 (currentBit!13589 thiss!872) (currentByte!13594 thiss!872) (size!6870 (buf!7338 thiss!872)))))))

(declare-fun res!230100 () Bool)

(assert (=> start!61778 (=> (not res!230100) (not e!196986))))

(assert (=> start!61778 (= res!230100 (= (size!6870 (buf!7338 thiss!872)) (size!6870 (buf!7338 b2!124))))))

(assert (=> start!61778 e!196986))

(declare-fun e!196988 () Bool)

(declare-fun inv!12 (BitStream!12554) Bool)

(assert (=> start!61778 (and (inv!12 thiss!872) e!196988)))

(declare-fun e!196985 () Bool)

(assert (=> start!61778 (and (inv!12 b2!124) e!196985)))

(declare-fun b!277037 () Bool)

(declare-fun array_inv!6594 (array!15875) Bool)

(assert (=> b!277037 (= e!196985 (array_inv!6594 (buf!7338 b2!124)))))

(declare-fun b!277038 () Bool)

(assert (=> b!277038 (= e!196988 (array_inv!6594 (buf!7338 thiss!872)))))

(assert (= (and start!61778 res!230100) b!277034))

(assert (= (and b!277034 res!230099) b!277035))

(assert (= (and b!277035 res!230101) b!277036))

(assert (= start!61778 b!277038))

(assert (= start!61778 b!277037))

(declare-fun m!410241 () Bool)

(assert (=> b!277038 m!410241))

(declare-fun m!410243 () Bool)

(assert (=> start!61778 m!410243))

(declare-fun m!410245 () Bool)

(assert (=> start!61778 m!410245))

(declare-fun m!410247 () Bool)

(assert (=> b!277037 m!410247))

(declare-fun m!410249 () Bool)

(assert (=> b!277034 m!410249))

(declare-fun m!410251 () Bool)

(assert (=> b!277034 m!410251))

(declare-fun m!410253 () Bool)

(assert (=> b!277036 m!410253))

(push 1)

(assert (not b!277034))

(assert (not b!277038))

(assert (not start!61778))

(assert (not b!277037))

(assert (not b!277036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95590 () Bool)

(assert (=> d!95590 (= (array_inv!6594 (buf!7338 thiss!872)) (bvsge (size!6870 (buf!7338 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!277038 d!95590))

(declare-fun d!95592 () Bool)

(declare-fun e!196999 () Bool)

(assert (=> d!95592 e!196999))

(declare-fun res!230122 () Bool)

(assert (=> d!95592 (=> (not res!230122) (not e!196999))))

(declare-fun lt!415213 () (_ BitVec 64))

(declare-fun lt!415212 () (_ BitVec 64))

(declare-fun lt!415215 () (_ BitVec 64))

(assert (=> d!95592 (= res!230122 (= lt!415212 (bvsub lt!415213 lt!415215)))))

(assert (=> d!95592 (or (= (bvand lt!415213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415213 lt!415215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95592 (= lt!415215 (remainingBits!0 ((_ sign_extend 32) (size!6870 (buf!7338 thiss!872))) ((_ sign_extend 32) (currentByte!13594 thiss!872)) ((_ sign_extend 32) (currentBit!13589 thiss!872))))))

(declare-fun lt!415214 () (_ BitVec 64))

(declare-fun lt!415211 () (_ BitVec 64))

(assert (=> d!95592 (= lt!415213 (bvmul lt!415214 lt!415211))))

(assert (=> d!95592 (or (= lt!415214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415211 (bvsdiv (bvmul lt!415214 lt!415211) lt!415214)))))

(assert (=> d!95592 (= lt!415211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95592 (= lt!415214 ((_ sign_extend 32) (size!6870 (buf!7338 thiss!872))))))

(assert (=> d!95592 (= lt!415212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13594 thiss!872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13589 thiss!872))))))

(assert (=> d!95592 (invariant!0 (currentBit!13589 thiss!872) (currentByte!13594 thiss!872) (size!6870 (buf!7338 thiss!872)))))

(assert (=> d!95592 (= (bitIndex!0 (size!6870 (buf!7338 thiss!872)) (currentByte!13594 thiss!872) (currentBit!13589 thiss!872)) lt!415212)))

(declare-fun b!277059 () Bool)

(declare-fun res!230123 () Bool)

(assert (=> b!277059 (=> (not res!230123) (not e!196999))))

(assert (=> b!277059 (= res!230123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415212))))

(declare-fun b!277060 () Bool)

(declare-fun lt!415210 () (_ BitVec 64))

(assert (=> b!277060 (= e!196999 (bvsle lt!415212 (bvmul lt!415210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277060 (or (= lt!415210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415210)))))

(assert (=> b!277060 (= lt!415210 ((_ sign_extend 32) (size!6870 (buf!7338 thiss!872))))))

(assert (= (and d!95592 res!230122) b!277059))

(assert (= (and b!277059 res!230123) b!277060))

(declare-fun m!410267 () Bool)

(assert (=> d!95592 m!410267))

(assert (=> d!95592 m!410253))

(assert (=> b!277034 d!95592))

(declare-fun d!95602 () Bool)

(declare-fun e!197000 () Bool)

(assert (=> d!95602 e!197000))

(declare-fun res!230124 () Bool)

(assert (=> d!95602 (=> (not res!230124) (not e!197000))))

(declare-fun lt!415221 () (_ BitVec 64))

(declare-fun lt!415218 () (_ BitVec 64))

(declare-fun lt!415219 () (_ BitVec 64))

(assert (=> d!95602 (= res!230124 (= lt!415218 (bvsub lt!415219 lt!415221)))))

(assert (=> d!95602 (or (= (bvand lt!415219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415219 lt!415221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95602 (= lt!415221 (remainingBits!0 ((_ sign_extend 32) (size!6870 (buf!7338 b2!124))) ((_ sign_extend 32) (currentByte!13594 b2!124)) ((_ sign_extend 32) (currentBit!13589 b2!124))))))

(declare-fun lt!415220 () (_ BitVec 64))

(declare-fun lt!415217 () (_ BitVec 64))

(assert (=> d!95602 (= lt!415219 (bvmul lt!415220 lt!415217))))

(assert (=> d!95602 (or (= lt!415220 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415217 (bvsdiv (bvmul lt!415220 lt!415217) lt!415220)))))

(assert (=> d!95602 (= lt!415217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95602 (= lt!415220 ((_ sign_extend 32) (size!6870 (buf!7338 b2!124))))))

(assert (=> d!95602 (= lt!415218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13594 b2!124)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13589 b2!124))))))

(assert (=> d!95602 (invariant!0 (currentBit!13589 b2!124) (currentByte!13594 b2!124) (size!6870 (buf!7338 b2!124)))))

(assert (=> d!95602 (= (bitIndex!0 (size!6870 (buf!7338 b2!124)) (currentByte!13594 b2!124) (currentBit!13589 b2!124)) lt!415218)))

(declare-fun b!277061 () Bool)

(declare-fun res!230125 () Bool)

(assert (=> b!277061 (=> (not res!230125) (not e!197000))))

(assert (=> b!277061 (= res!230125 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415218))))

(declare-fun b!277062 () Bool)

(declare-fun lt!415216 () (_ BitVec 64))

(assert (=> b!277062 (= e!197000 (bvsle lt!415218 (bvmul lt!415216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277062 (or (= lt!415216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415216)))))

(assert (=> b!277062 (= lt!415216 ((_ sign_extend 32) (size!6870 (buf!7338 b2!124))))))

(assert (= (and d!95602 res!230124) b!277061))

(assert (= (and b!277061 res!230125) b!277062))

(declare-fun m!410269 () Bool)

(assert (=> d!95602 m!410269))

(declare-fun m!410271 () Bool)

(assert (=> d!95602 m!410271))

(assert (=> b!277034 d!95602))

(declare-fun d!95608 () Bool)

(assert (=> d!95608 (= (array_inv!6594 (buf!7338 b2!124)) (bvsge (size!6870 (buf!7338 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!277037 d!95608))

(declare-fun d!95610 () Bool)

(assert (=> d!95610 (= (invariant!0 (currentBit!13589 thiss!872) (currentByte!13594 thiss!872) (size!6870 (buf!7338 thiss!872))) (and (bvsge (currentBit!13589 thiss!872) #b00000000000000000000000000000000) (bvslt (currentBit!13589 thiss!872) #b00000000000000000000000000001000) (bvsge (currentByte!13594 thiss!872) #b00000000000000000000000000000000) (or (bvslt (currentByte!13594 thiss!872) (size!6870 (buf!7338 thiss!872))) (and (= (currentBit!13589 thiss!872) #b00000000000000000000000000000000) (= (currentByte!13594 thiss!872) (size!6870 (buf!7338 thiss!872)))))))))

(assert (=> b!277036 d!95610))

(declare-fun d!95614 () Bool)

(assert (=> d!95614 (= (inv!12 thiss!872) (invariant!0 (currentBit!13589 thiss!872) (currentByte!13594 thiss!872) (size!6870 (buf!7338 thiss!872))))))

(declare-fun bs!24109 () Bool)

(assert (= bs!24109 d!95614))

(assert (=> bs!24109 m!410253))

(assert (=> start!61778 d!95614))

(declare-fun d!95616 () Bool)

(assert (=> d!95616 (= (inv!12 b2!124) (invariant!0 (currentBit!13589 b2!124) (currentByte!13594 b2!124) (size!6870 (buf!7338 b2!124))))))

(declare-fun bs!24110 () Bool)

(assert (= bs!24110 d!95616))

(assert (=> bs!24110 m!410271))

(assert (=> start!61778 d!95616))

(push 1)

