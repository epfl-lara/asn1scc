; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73860 () Bool)

(assert start!73860)

(declare-fun res!268151 () Bool)

(declare-fun e!235888 () Bool)

(assert (=> start!73860 (=> (not res!268151) (not e!235888))))

(declare-datatypes ((array!21252 0))(
  ( (array!21253 (arr!10316 (Array (_ BitVec 32) (_ BitVec 8))) (size!9224 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21252)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21252)

(assert (=> start!73860 (= res!268151 (and (bvsle (size!9224 a1!688) (size!9224 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9224 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73860 e!235888))

(declare-fun array_inv!8776 (array!21252) Bool)

(assert (=> start!73860 (array_inv!8776 a1!688)))

(assert (=> start!73860 (array_inv!8776 a2!688)))

(assert (=> start!73860 true))

(declare-fun b!326578 () Bool)

(declare-fun e!235889 () Bool)

(assert (=> b!326578 (= e!235888 e!235889)))

(declare-fun res!268150 () Bool)

(assert (=> b!326578 (=> (not res!268150) (not e!235889))))

(declare-fun e!235892 () Bool)

(assert (=> b!326578 (= res!268150 e!235892)))

(declare-fun res!268152 () Bool)

(assert (=> b!326578 (=> res!268152 e!235892)))

(declare-datatypes ((tuple4!1400 0))(
  ( (tuple4!1401 (_1!13541 (_ BitVec 32)) (_2!13541 (_ BitVec 32)) (_3!1657 (_ BitVec 32)) (_4!700 (_ BitVec 32))) )
))
(declare-fun lt!448601 () tuple4!1400)

(assert (=> b!326578 (= res!268152 (bvsge (_1!13541 lt!448601) (_2!13541 lt!448601)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1400)

(assert (=> b!326578 (= lt!448601 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326579 () Bool)

(declare-fun arrayRangesEq!1848 (array!21252 array!21252 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326579 (= e!235892 (arrayRangesEq!1848 a1!688 a2!688 (_1!13541 lt!448601) (_2!13541 lt!448601)))))

(declare-fun b!326580 () Bool)

(assert (=> b!326580 (= e!235889 (and (not (= (_3!1657 lt!448601) (_4!700 lt!448601))) (or (bvslt (_3!1657 lt!448601) #b00000000000000000000000000000000) (bvsge (_3!1657 lt!448601) (size!9224 a2!688)))))))

(assert (= (and start!73860 res!268151) b!326578))

(assert (= (and b!326578 (not res!268152)) b!326579))

(assert (= (and b!326578 res!268150) b!326580))

(declare-fun m!464407 () Bool)

(assert (=> start!73860 m!464407))

(declare-fun m!464409 () Bool)

(assert (=> start!73860 m!464409))

(declare-fun m!464411 () Bool)

(assert (=> b!326578 m!464411))

(declare-fun m!464413 () Bool)

(assert (=> b!326579 m!464413))

(check-sat (not start!73860) (not b!326578) (not b!326579))
(check-sat)
(get-model)

(declare-fun d!107708 () Bool)

(assert (=> d!107708 (= (array_inv!8776 a1!688) (bvsge (size!9224 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73860 d!107708))

(declare-fun d!107710 () Bool)

(assert (=> d!107710 (= (array_inv!8776 a2!688) (bvsge (size!9224 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73860 d!107710))

(declare-fun d!107712 () Bool)

(assert (=> d!107712 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1401 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326578 d!107712))

(declare-fun d!107714 () Bool)

(declare-fun res!268166 () Bool)

(declare-fun e!235912 () Bool)

(assert (=> d!107714 (=> res!268166 e!235912)))

(assert (=> d!107714 (= res!268166 (= (_1!13541 lt!448601) (_2!13541 lt!448601)))))

(assert (=> d!107714 (= (arrayRangesEq!1848 a1!688 a2!688 (_1!13541 lt!448601) (_2!13541 lt!448601)) e!235912)))

(declare-fun b!326594 () Bool)

(declare-fun e!235913 () Bool)

(assert (=> b!326594 (= e!235912 e!235913)))

(declare-fun res!268167 () Bool)

(assert (=> b!326594 (=> (not res!268167) (not e!235913))))

(assert (=> b!326594 (= res!268167 (= (select (arr!10316 a1!688) (_1!13541 lt!448601)) (select (arr!10316 a2!688) (_1!13541 lt!448601))))))

(declare-fun b!326595 () Bool)

(assert (=> b!326595 (= e!235913 (arrayRangesEq!1848 a1!688 a2!688 (bvadd (_1!13541 lt!448601) #b00000000000000000000000000000001) (_2!13541 lt!448601)))))

(assert (= (and d!107714 (not res!268166)) b!326594))

(assert (= (and b!326594 res!268167) b!326595))

(declare-fun m!464423 () Bool)

(assert (=> b!326594 m!464423))

(declare-fun m!464425 () Bool)

(assert (=> b!326594 m!464425))

(declare-fun m!464427 () Bool)

(assert (=> b!326595 m!464427))

(assert (=> b!326579 d!107714))

(check-sat (not b!326595))
(check-sat)
