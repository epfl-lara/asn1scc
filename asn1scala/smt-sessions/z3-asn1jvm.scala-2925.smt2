; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69714 () Bool)

(assert start!69714)

(declare-fun res!256767 () Bool)

(declare-fun e!225785 () Bool)

(assert (=> start!69714 (=> (not res!256767) (not e!225785))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19278 0))(
  ( (array!19279 (arr!9443 (Array (_ BitVec 32) (_ BitVec 8))) (size!8363 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19278)

(declare-fun a2!799 () array!19278)

(declare-fun a3!74 () array!19278)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69714 (= res!256767 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8363 a1!799) (size!8363 a2!799)) (= (size!8363 a2!799) (size!8363 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8363 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8363 a2!799))))))))

(assert (=> start!69714 e!225785))

(assert (=> start!69714 true))

(declare-fun array_inv!7915 (array!19278) Bool)

(assert (=> start!69714 (array_inv!7915 a1!799)))

(assert (=> start!69714 (array_inv!7915 a2!799)))

(assert (=> start!69714 (array_inv!7915 a3!74)))

(declare-fun b!313622 () Bool)

(declare-fun res!256769 () Bool)

(assert (=> b!313622 (=> (not res!256769) (not e!225785))))

(declare-fun arrayBitRangesEq!0 (array!19278 array!19278 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313622 (= res!256769 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313621 () Bool)

(declare-fun res!256768 () Bool)

(assert (=> b!313621 (=> (not res!256768) (not e!225785))))

(assert (=> b!313621 (= res!256768 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313620 () Bool)

(declare-fun res!256766 () Bool)

(assert (=> b!313620 (=> (not res!256766) (not e!225785))))

(assert (=> b!313620 (= res!256766 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313623 () Bool)

(assert (=> b!313623 (= e!225785 (not true))))

(assert (=> b!313623 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21547 0))(
  ( (Unit!21548) )
))
(declare-fun lt!442337 () Unit!21547)

(declare-fun rec!20 (array!19278 array!19278 array!19278 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21547)

(assert (=> b!313623 (= lt!442337 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(assert (= (and start!69714 res!256767) b!313620))

(assert (= (and b!313620 res!256766) b!313621))

(assert (= (and b!313621 res!256768) b!313622))

(assert (= (and b!313622 res!256769) b!313623))

(declare-fun m!451263 () Bool)

(assert (=> b!313622 m!451263))

(declare-fun m!451265 () Bool)

(assert (=> b!313623 m!451265))

(declare-fun m!451267 () Bool)

(assert (=> b!313623 m!451267))

(declare-fun m!451269 () Bool)

(assert (=> b!313620 m!451269))

(declare-fun m!451271 () Bool)

(assert (=> start!69714 m!451271))

(declare-fun m!451273 () Bool)

(assert (=> start!69714 m!451273))

(declare-fun m!451275 () Bool)

(assert (=> start!69714 m!451275))

(declare-fun m!451277 () Bool)

(assert (=> b!313621 m!451277))

(check-sat (not b!313620) (not b!313621) (not b!313622) (not b!313623) (not start!69714))
