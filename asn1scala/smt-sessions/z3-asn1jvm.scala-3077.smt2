; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70942 () Bool)

(assert start!70942)

(declare-fun res!263440 () Bool)

(declare-fun e!230811 () Bool)

(assert (=> start!70942 (=> (not res!263440) (not e!230811))))

(declare-fun lt!444079 () (_ BitVec 64))

(assert (=> start!70942 (= res!263440 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444079))))

(declare-datatypes ((array!20213 0))(
  ( (array!20214 (arr!9902 (Array (_ BitVec 32) (_ BitVec 8))) (size!8810 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20213)

(assert (=> start!70942 (= lt!444079 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8810 a!440))))))

(assert (=> start!70942 e!230811))

(declare-fun array_inv!8362 (array!20213) Bool)

(assert (=> start!70942 (array_inv!8362 a!440)))

(declare-fun b!320673 () Bool)

(declare-fun res!263439 () Bool)

(assert (=> b!320673 (=> (not res!263439) (not e!230811))))

(declare-fun arrayBitRangesEq!0 (array!20213 array!20213 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320673 (= res!263439 (arrayBitRangesEq!0 a!440 a!440 lt!444079 lt!444079))))

(declare-fun b!320674 () Bool)

(assert (=> b!320674 (= e!230811 (not (or (= ((_ sign_extend 32) (size!8810 a!440)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!444079 ((_ sign_extend 32) (size!8810 a!440)))))))))

(assert (=> b!320674 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444079)))

(declare-datatypes ((Unit!21982 0))(
  ( (Unit!21983) )
))
(declare-fun lt!444080 () Unit!21982)

(declare-fun rec!21 (array!20213 (_ BitVec 64)) Unit!21982)

(assert (=> b!320674 (= lt!444080 (rec!21 a!440 lt!444079))))

(assert (= (and start!70942 res!263440) b!320673))

(assert (= (and b!320673 res!263439) b!320674))

(declare-fun m!459021 () Bool)

(assert (=> start!70942 m!459021))

(declare-fun m!459023 () Bool)

(assert (=> b!320673 m!459023))

(declare-fun m!459025 () Bool)

(assert (=> b!320674 m!459025))

(declare-fun m!459027 () Bool)

(assert (=> b!320674 m!459027))

(check-sat (not b!320674) (not start!70942) (not b!320673))
(check-sat)
