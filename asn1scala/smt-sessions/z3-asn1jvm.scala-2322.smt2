; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59128 () Bool)

(assert start!59128)

(declare-fun b!270891 () Bool)

(declare-datatypes ((array!15100 0))(
  ( (array!15101 (arr!7559 (Array (_ BitVec 32) (_ BitVec 8))) (size!6572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11958 0))(
  ( (BitStream!11959 (buf!7040 array!15100) (currentByte!13014 (_ BitVec 32)) (currentBit!13009 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11958)

(declare-fun e!190763 () Bool)

(declare-fun w2!587 () BitStream!11958)

(declare-fun w1!591 () BitStream!11958)

(assert (=> b!270891 (= e!190763 (or (not (= ((_ sign_extend 24) (select (arr!7559 (buf!7040 w2!587)) (currentByte!13014 w1!591))) ((_ sign_extend 24) (select (arr!7559 (buf!7040 w3!25)) (currentByte!13014 w1!591))))) (bvsge (currentByte!13014 w1!591) #b00000000000000000000000000000000)))))

(assert (=> b!270891 (= (select (arr!7559 (buf!7040 w2!587)) (currentByte!13014 w1!591)) (select (arr!7559 (buf!7040 w3!25)) (currentByte!13014 w1!591)))))

(declare-datatypes ((Unit!19099 0))(
  ( (Unit!19100) )
))
(declare-fun lt!409657 () Unit!19099)

(declare-fun arrayRangesEqImpliesEq!164 (array!15100 array!15100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19099)

(assert (=> b!270891 (= lt!409657 (arrayRangesEqImpliesEq!164 (buf!7040 w2!587) (buf!7040 w3!25) #b00000000000000000000000000000000 (currentByte!13014 w1!591) (currentByte!13014 w2!587)))))

(declare-fun b!270892 () Bool)

(declare-fun e!190761 () Bool)

(assert (=> b!270892 (= e!190761 (not e!190763))))

(declare-fun res!225726 () Bool)

(assert (=> b!270892 (=> res!225726 e!190763)))

(assert (=> b!270892 (= res!225726 (or (bvsge (currentByte!13014 w1!591) (size!6572 (buf!7040 w1!591))) (bvsge (currentByte!13014 w1!591) (currentByte!13014 w2!587))))))

(declare-fun arrayRangesEq!1104 (array!15100 array!15100 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270892 (arrayRangesEq!1104 (buf!7040 w1!591) (buf!7040 w3!25) #b00000000000000000000000000000000 (currentByte!13014 w1!591))))

(declare-fun lt!409658 () Unit!19099)

(declare-fun arrayRangesEqTransitive!367 (array!15100 array!15100 array!15100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19099)

(assert (=> b!270892 (= lt!409658 (arrayRangesEqTransitive!367 (buf!7040 w1!591) (buf!7040 w2!587) (buf!7040 w3!25) #b00000000000000000000000000000000 (currentByte!13014 w1!591) (currentByte!13014 w2!587)))))

(declare-fun b!270893 () Bool)

(declare-fun e!190768 () Bool)

(declare-fun array_inv!6296 (array!15100) Bool)

(assert (=> b!270893 (= e!190768 (array_inv!6296 (buf!7040 w3!25)))))

(declare-fun res!225725 () Bool)

(assert (=> start!59128 (=> (not res!225725) (not e!190761))))

(declare-fun isPrefixOf!0 (BitStream!11958 BitStream!11958) Bool)

(assert (=> start!59128 (= res!225725 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59128 e!190761))

(declare-fun e!190765 () Bool)

(declare-fun inv!12 (BitStream!11958) Bool)

(assert (=> start!59128 (and (inv!12 w1!591) e!190765)))

(declare-fun e!190762 () Bool)

(assert (=> start!59128 (and (inv!12 w2!587) e!190762)))

(assert (=> start!59128 (and (inv!12 w3!25) e!190768)))

(declare-fun b!270894 () Bool)

(assert (=> b!270894 (= e!190765 (array_inv!6296 (buf!7040 w1!591)))))

(declare-fun b!270895 () Bool)

(declare-fun res!225727 () Bool)

(assert (=> b!270895 (=> (not res!225727) (not e!190761))))

(assert (=> b!270895 (= res!225727 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270896 () Bool)

(assert (=> b!270896 (= e!190762 (array_inv!6296 (buf!7040 w2!587)))))

(assert (= (and start!59128 res!225725) b!270895))

(assert (= (and b!270895 res!225727) b!270892))

(assert (= (and b!270892 (not res!225726)) b!270891))

(assert (= start!59128 b!270894))

(assert (= start!59128 b!270896))

(assert (= start!59128 b!270893))

(declare-fun m!403025 () Bool)

(assert (=> b!270892 m!403025))

(declare-fun m!403027 () Bool)

(assert (=> b!270892 m!403027))

(declare-fun m!403029 () Bool)

(assert (=> b!270893 m!403029))

(declare-fun m!403031 () Bool)

(assert (=> b!270891 m!403031))

(declare-fun m!403033 () Bool)

(assert (=> b!270891 m!403033))

(declare-fun m!403035 () Bool)

(assert (=> b!270891 m!403035))

(declare-fun m!403037 () Bool)

(assert (=> b!270895 m!403037))

(declare-fun m!403039 () Bool)

(assert (=> b!270894 m!403039))

(declare-fun m!403041 () Bool)

(assert (=> b!270896 m!403041))

(declare-fun m!403043 () Bool)

(assert (=> start!59128 m!403043))

(declare-fun m!403045 () Bool)

(assert (=> start!59128 m!403045))

(declare-fun m!403047 () Bool)

(assert (=> start!59128 m!403047))

(declare-fun m!403049 () Bool)

(assert (=> start!59128 m!403049))

(check-sat (not b!270895) (not b!270894) (not b!270893) (not b!270892) (not b!270891) (not b!270896) (not start!59128))
(check-sat)
(get-model)

(declare-fun d!92196 () Bool)

(assert (=> d!92196 (= (array_inv!6296 (buf!7040 w3!25)) (bvsge (size!6572 (buf!7040 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270893 d!92196))

(declare-fun d!92198 () Bool)

(declare-fun res!225780 () Bool)

(declare-fun e!190825 () Bool)

(assert (=> d!92198 (=> (not res!225780) (not e!190825))))

(assert (=> d!92198 (= res!225780 (= (size!6572 (buf!7040 w1!591)) (size!6572 (buf!7040 w2!587))))))

(assert (=> d!92198 (= (isPrefixOf!0 w1!591 w2!587) e!190825)))

(declare-fun b!270957 () Bool)

(declare-fun res!225781 () Bool)

(assert (=> b!270957 (=> (not res!225781) (not e!190825))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270957 (= res!225781 (bvsle (bitIndex!0 (size!6572 (buf!7040 w1!591)) (currentByte!13014 w1!591) (currentBit!13009 w1!591)) (bitIndex!0 (size!6572 (buf!7040 w2!587)) (currentByte!13014 w2!587) (currentBit!13009 w2!587))))))

(declare-fun b!270958 () Bool)

(declare-fun e!190826 () Bool)

(assert (=> b!270958 (= e!190825 e!190826)))

(declare-fun res!225779 () Bool)

(assert (=> b!270958 (=> res!225779 e!190826)))

(assert (=> b!270958 (= res!225779 (= (size!6572 (buf!7040 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270959 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15100 array!15100 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270959 (= e!190826 (arrayBitRangesEq!0 (buf!7040 w1!591) (buf!7040 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6572 (buf!7040 w1!591)) (currentByte!13014 w1!591) (currentBit!13009 w1!591))))))

(assert (= (and d!92198 res!225780) b!270957))

(assert (= (and b!270957 res!225781) b!270958))

(assert (= (and b!270958 (not res!225779)) b!270959))

(declare-fun m!403129 () Bool)

(assert (=> b!270957 m!403129))

(declare-fun m!403131 () Bool)

(assert (=> b!270957 m!403131))

(assert (=> b!270959 m!403129))

(assert (=> b!270959 m!403129))

(declare-fun m!403133 () Bool)

(assert (=> b!270959 m!403133))

(assert (=> start!59128 d!92198))

(declare-fun d!92236 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92236 (= (inv!12 w1!591) (invariant!0 (currentBit!13009 w1!591) (currentByte!13014 w1!591) (size!6572 (buf!7040 w1!591))))))

(declare-fun bs!23285 () Bool)

(assert (= bs!23285 d!92236))

(declare-fun m!403135 () Bool)

(assert (=> bs!23285 m!403135))

(assert (=> start!59128 d!92236))

(declare-fun d!92238 () Bool)

(assert (=> d!92238 (= (inv!12 w2!587) (invariant!0 (currentBit!13009 w2!587) (currentByte!13014 w2!587) (size!6572 (buf!7040 w2!587))))))

(declare-fun bs!23286 () Bool)

(assert (= bs!23286 d!92238))

(declare-fun m!403137 () Bool)

(assert (=> bs!23286 m!403137))

(assert (=> start!59128 d!92238))

(declare-fun d!92240 () Bool)

(assert (=> d!92240 (= (inv!12 w3!25) (invariant!0 (currentBit!13009 w3!25) (currentByte!13014 w3!25) (size!6572 (buf!7040 w3!25))))))

(declare-fun bs!23287 () Bool)

(assert (= bs!23287 d!92240))

(declare-fun m!403139 () Bool)

(assert (=> bs!23287 m!403139))

(assert (=> start!59128 d!92240))

(declare-fun d!92242 () Bool)

(declare-fun res!225786 () Bool)

(declare-fun e!190831 () Bool)

(assert (=> d!92242 (=> res!225786 e!190831)))

(assert (=> d!92242 (= res!225786 (= #b00000000000000000000000000000000 (currentByte!13014 w1!591)))))

(assert (=> d!92242 (= (arrayRangesEq!1104 (buf!7040 w1!591) (buf!7040 w3!25) #b00000000000000000000000000000000 (currentByte!13014 w1!591)) e!190831)))

(declare-fun b!270964 () Bool)

(declare-fun e!190832 () Bool)

(assert (=> b!270964 (= e!190831 e!190832)))

(declare-fun res!225787 () Bool)

(assert (=> b!270964 (=> (not res!225787) (not e!190832))))

(assert (=> b!270964 (= res!225787 (= (select (arr!7559 (buf!7040 w1!591)) #b00000000000000000000000000000000) (select (arr!7559 (buf!7040 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270965 () Bool)

(assert (=> b!270965 (= e!190832 (arrayRangesEq!1104 (buf!7040 w1!591) (buf!7040 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13014 w1!591)))))

(assert (= (and d!92242 (not res!225786)) b!270964))

(assert (= (and b!270964 res!225787) b!270965))

(declare-fun m!403141 () Bool)

(assert (=> b!270964 m!403141))

(declare-fun m!403143 () Bool)

(assert (=> b!270964 m!403143))

(declare-fun m!403145 () Bool)

(assert (=> b!270965 m!403145))

(assert (=> b!270892 d!92242))

(declare-fun d!92244 () Bool)

