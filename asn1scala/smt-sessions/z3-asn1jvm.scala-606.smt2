; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17312 () Bool)

(assert start!17312)

(declare-fun res!69010 () Bool)

(declare-fun e!56065 () Bool)

(assert (=> start!17312 (=> (not res!69010) (not e!56065))))

(declare-datatypes ((array!3913 0))(
  ( (array!3914 (arr!2413 (Array (_ BitVec 32) (_ BitVec 8))) (size!1776 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3114 0))(
  ( (BitStream!3115 (buf!2166 array!3913) (currentByte!4306 (_ BitVec 32)) (currentBit!4301 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3114)

(assert (=> start!17312 (= res!69010 (and (bvsle ((_ sign_extend 32) (size!1776 (buf!2166 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4306 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4301 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1776 (buf!2166 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4306 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4301 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17312 e!56065))

(declare-fun e!56066 () Bool)

(declare-fun inv!12 (BitStream!3114) Bool)

(assert (=> start!17312 (and (inv!12 b!169) e!56066)))

(declare-fun b!83997 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!83997 (= e!56065 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4301 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4306 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (size!1776 (buf!2166 b!169)))))))))

(declare-fun b!83998 () Bool)

(declare-fun array_inv!1622 (array!3913) Bool)

(assert (=> b!83998 (= e!56066 (array_inv!1622 (buf!2166 b!169)))))

(assert (= (and start!17312 res!69010) b!83997))

(assert (= start!17312 b!83998))

(declare-fun m!130671 () Bool)

(assert (=> start!17312 m!130671))

(declare-fun m!130673 () Bool)

(assert (=> b!83997 m!130673))

(declare-fun m!130675 () Bool)

(assert (=> b!83998 m!130675))

(check-sat (not start!17312) (not b!83997) (not b!83998))
(check-sat)
(get-model)

(declare-fun d!26984 () Bool)

(assert (=> d!26984 (= (inv!12 b!169) (invariant!0 (currentBit!4301 b!169) (currentByte!4306 b!169) (size!1776 (buf!2166 b!169))))))

(declare-fun bs!6661 () Bool)

(assert (= bs!6661 d!26984))

(declare-fun m!130683 () Bool)

(assert (=> bs!6661 m!130683))

(assert (=> start!17312 d!26984))

(declare-fun d!26986 () Bool)

(assert (=> d!26986 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4301 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4306 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (size!1776 (buf!2166 b!169))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4301 b!169))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4301 b!169))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4306 b!169))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4306 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (size!1776 (buf!2166 b!169))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4301 b!169))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4306 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (size!1776 (buf!2166 b!169)))))))))))

(assert (=> b!83997 d!26986))

(declare-fun d!26988 () Bool)

(assert (=> d!26988 (= (array_inv!1622 (buf!2166 b!169)) (bvsge (size!1776 (buf!2166 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!83998 d!26988))

(check-sat (not d!26984))
(check-sat)
