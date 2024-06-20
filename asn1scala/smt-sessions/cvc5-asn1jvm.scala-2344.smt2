; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59774 () Bool)

(assert start!59774)

(declare-fun res!227173 () Bool)

(declare-fun e!192783 () Bool)

(assert (=> start!59774 (=> (not res!227173) (not e!192783))))

(declare-datatypes ((array!15263 0))(
  ( (array!15264 (arr!7624 (Array (_ BitVec 32) (_ BitVec 8))) (size!6637 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12088 0))(
  ( (BitStream!12089 (buf!7105 array!15263) (currentByte!13112 (_ BitVec 32)) (currentBit!13107 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12088)

(assert (=> start!59774 (= res!227173 (not (= (size!6637 (buf!7105 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59774 e!192783))

(declare-fun e!192782 () Bool)

(declare-fun inv!12 (BitStream!12088) Bool)

(assert (=> start!59774 (and (inv!12 bs!71) e!192782)))

(declare-fun b!272890 () Bool)

(declare-fun lt!410752 () (_ BitVec 64))

(declare-fun lt!410753 () (_ BitVec 64))

(assert (=> b!272890 (= e!192783 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410752) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410753) (bvsle lt!410753 lt!410752)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272890 (= lt!410753 (bitIndex!0 (size!6637 (buf!7105 bs!71)) (currentByte!13112 bs!71) (currentBit!13107 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15263 array!15263 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272890 (arrayBitRangesEq!0 (buf!7105 bs!71) (buf!7105 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410752)))

(assert (=> b!272890 (= lt!410752 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6637 (buf!7105 bs!71)))))))

(declare-datatypes ((Unit!19253 0))(
  ( (Unit!19254) )
))
(declare-fun lt!410751 () Unit!19253)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15263) Unit!19253)

(assert (=> b!272890 (= lt!410751 (arrayBitEqImpliesRangesEqLemma!0 (buf!7105 bs!71)))))

(declare-fun b!272891 () Bool)

(declare-fun array_inv!6361 (array!15263) Bool)

(assert (=> b!272891 (= e!192782 (array_inv!6361 (buf!7105 bs!71)))))

(assert (= (and start!59774 res!227173) b!272890))

(assert (= start!59774 b!272891))

(declare-fun m!405783 () Bool)

(assert (=> start!59774 m!405783))

(declare-fun m!405785 () Bool)

(assert (=> b!272890 m!405785))

(declare-fun m!405787 () Bool)

(assert (=> b!272890 m!405787))

(declare-fun m!405789 () Bool)

(assert (=> b!272890 m!405789))

(declare-fun m!405791 () Bool)

(assert (=> b!272891 m!405791))

(push 1)

(assert (not b!272890))

(assert (not start!59774))

(assert (not b!272891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93338 () Bool)

(declare-fun e!192807 () Bool)

(assert (=> d!93338 e!192807))

(declare-fun res!227189 () Bool)

(assert (=> d!93338 (=> (not res!227189) (not e!192807))))

(declare-fun lt!410796 () (_ BitVec 64))

(declare-fun lt!410797 () (_ BitVec 64))

(declare-fun lt!410798 () (_ BitVec 64))

(assert (=> d!93338 (= res!227189 (= lt!410798 (bvsub lt!410797 lt!410796)))))

(assert (=> d!93338 (or (= (bvand lt!410797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410797 lt!410796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93338 (= lt!410796 (remainingBits!0 ((_ sign_extend 32) (size!6637 (buf!7105 bs!71))) ((_ sign_extend 32) (currentByte!13112 bs!71)) ((_ sign_extend 32) (currentBit!13107 bs!71))))))

(declare-fun lt!410801 () (_ BitVec 64))

(declare-fun lt!410799 () (_ BitVec 64))

(assert (=> d!93338 (= lt!410797 (bvmul lt!410801 lt!410799))))

(assert (=> d!93338 (or (= lt!410801 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410799 (bvsdiv (bvmul lt!410801 lt!410799) lt!410801)))))

(assert (=> d!93338 (= lt!410799 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93338 (= lt!410801 ((_ sign_extend 32) (size!6637 (buf!7105 bs!71))))))

(assert (=> d!93338 (= lt!410798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13112 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13107 bs!71))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93338 (invariant!0 (currentBit!13107 bs!71) (currentByte!13112 bs!71) (size!6637 (buf!7105 bs!71)))))

(assert (=> d!93338 (= (bitIndex!0 (size!6637 (buf!7105 bs!71)) (currentByte!13112 bs!71) (currentBit!13107 bs!71)) lt!410798)))

(declare-fun b!272912 () Bool)

(declare-fun res!227188 () Bool)

(assert (=> b!272912 (=> (not res!227188) (not e!192807))))

(assert (=> b!272912 (= res!227188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410798))))

(declare-fun b!272913 () Bool)

(declare-fun lt!410800 () (_ BitVec 64))

(assert (=> b!272913 (= e!192807 (bvsle lt!410798 (bvmul lt!410800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272913 (or (= lt!410800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410800)))))

(assert (=> b!272913 (= lt!410800 ((_ sign_extend 32) (size!6637 (buf!7105 bs!71))))))

(assert (= (and d!93338 res!227189) b!272912))

(assert (= (and b!272912 res!227188) b!272913))

(declare-fun m!405813 () Bool)

(assert (=> d!93338 m!405813))

(declare-fun m!405815 () Bool)

(assert (=> d!93338 m!405815))

(assert (=> b!272890 d!93338))

(declare-fun bm!4388 () Bool)

(declare-fun c!12576 () Bool)

(declare-fun lt!410834 () (_ BitVec 32))

(declare-datatypes ((tuple4!492 0))(
  ( (tuple4!493 (_1!12229 (_ BitVec 32)) (_2!12229 (_ BitVec 32)) (_3!1026 (_ BitVec 32)) (_4!246 (_ BitVec 32))) )
))
(declare-fun lt!410833 () tuple4!492)

(declare-fun lt!410832 () (_ BitVec 32))

(declare-fun call!4391 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4388 (= call!4391 (byteRangesEq!0 (select (arr!7624 (buf!7105 bs!71)) (_3!1026 lt!410833)) (select (arr!7624 (buf!7105 bs!71)) (_3!1026 lt!410833)) lt!410834 (ite c!12576 lt!410832 #b00000000000000000000000000001000)))))

(declare-fun b!272936 () Bool)

(declare-fun e!192828 () Bool)

(declare-fun arrayRangesEq!1139 (array!15263 array!15263 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272936 (= e!192828 (arrayRangesEq!1139 (buf!7105 bs!71) (buf!7105 bs!71) (_1!12229 lt!410833) (_2!12229 lt!410833)))))

(declare-fun b!272937 () Bool)

(declare-fun e!192825 () Bool)

(declare-fun e!192827 () Bool)

(assert (=> b!272937 (= e!192825 e!192827)))

(declare-fun res!227209 () Bool)

(assert (=> b!272937 (= res!227209 call!4391)))

(assert (=> b!272937 (=> (not res!227209) (not e!192827))))

(declare-fun b!272938 () Bool)

(declare-fun e!192829 () Bool)

(assert (=> b!272938 (= e!192829 (byteRangesEq!0 (select (arr!7624 (buf!7105 bs!71)) (_4!246 lt!410833)) (select (arr!7624 (buf!7105 bs!71)) (_4!246 lt!410833)) #b00000000000000000000000000000000 lt!410832))))

(declare-fun b!272939 () Bool)

(declare-fun e!192826 () Bool)

(assert (=> b!272939 (= e!192826 e!192825)))

(assert (=> b!272939 (= c!12576 (= (_3!1026 lt!410833) (_4!246 lt!410833)))))

(declare-fun d!93342 () Bool)

(declare-fun res!227211 () Bool)

(declare-fun e!192824 () Bool)

(assert (=> d!93342 (=> res!227211 e!192824)))

(assert (=> d!93342 (= res!227211 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410752))))

(assert (=> d!93342 (= (arrayBitRangesEq!0 (buf!7105 bs!71) (buf!7105 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410752) e!192824)))

(declare-fun b!272940 () Bool)

(assert (=> b!272940 (= e!192824 e!192826)))

(declare-fun res!227210 () Bool)

(assert (=> b!272940 (=> (not res!227210) (not e!192826))))

(assert (=> b!272940 (= res!227210 e!192828)))

(declare-fun res!227208 () Bool)

(assert (=> b!272940 (=> res!227208 e!192828)))

(assert (=> b!272940 (= res!227208 (bvsge (_1!12229 lt!410833) (_2!12229 lt!410833)))))

(assert (=> b!272940 (= lt!410832 ((_ extract 31 0) (bvsrem lt!410752 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272940 (= lt!410834 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!492)

(assert (=> b!272940 (= lt!410833 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410752))))

(declare-fun b!272941 () Bool)

(assert (=> b!272941 (= e!192825 call!4391)))

(declare-fun b!272942 () Bool)

(declare-fun res!227212 () Bool)

(assert (=> b!272942 (= res!227212 (= lt!410832 #b00000000000000000000000000000000))))

(assert (=> b!272942 (=> res!227212 e!192829)))

(assert (=> b!272942 (= e!192827 e!192829)))

(assert (= (and d!93342 (not res!227211)) b!272940))

(assert (= (and b!272940 (not res!227208)) b!272936))

(assert (= (and b!272940 res!227210) b!272939))

(assert (= (and b!272939 c!12576) b!272941))

(assert (= (and b!272939 (not c!12576)) b!272937))

(assert (= (and b!272937 res!227209) b!272942))

(assert (= (and b!272942 (not res!227212)) b!272938))

(assert (= (or b!272941 b!272937) bm!4388))

(declare-fun m!405825 () Bool)

(assert (=> bm!4388 m!405825))

(assert (=> bm!4388 m!405825))

(assert (=> bm!4388 m!405825))

(assert (=> bm!4388 m!405825))

(declare-fun m!405827 () Bool)

(assert (=> bm!4388 m!405827))

(declare-fun m!405829 () Bool)

(assert (=> b!272936 m!405829))

(declare-fun m!405831 () Bool)

(assert (=> b!272938 m!405831))

(assert (=> b!272938 m!405831))

(assert (=> b!272938 m!405831))

(assert (=> b!272938 m!405831))

(declare-fun m!405833 () Bool)

(assert (=> b!272938 m!405833))

(declare-fun m!405835 () Bool)

(assert (=> b!272940 m!405835))

(assert (=> b!272890 d!93342))

(declare-fun d!93348 () Bool)

(declare-fun e!192834 () Bool)

(assert (=> d!93348 e!192834))

(declare-fun res!227217 () Bool)

(assert (=> d!93348 (=> (not res!227217) (not e!192834))))

(declare-fun lt!410849 () (_ BitVec 64))

(declare-fun lt!410847 () (_ BitVec 64))

(assert (=> d!93348 (= res!227217 (or (= lt!410849 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410847 (bvsdiv (bvmul lt!410849 lt!410847) lt!410849))))))

(assert (=> d!93348 (= lt!410847 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93348 (= lt!410849 ((_ sign_extend 32) (size!6637 (buf!7105 bs!71))))))

(declare-fun lt!410848 () Unit!19253)

(declare-fun choose!44 (array!15263) Unit!19253)

(assert (=> d!93348 (= lt!410848 (choose!44 (buf!7105 bs!71)))))

(assert (=> d!93348 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7105 bs!71)) lt!410848)))

(declare-fun b!272947 () Bool)

(assert (=> b!272947 (= e!192834 (arrayBitRangesEq!0 (buf!7105 bs!71) (buf!7105 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6637 (buf!7105 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93348 res!227217) b!272947))

(declare-fun m!405837 () Bool)

(assert (=> d!93348 m!405837))

(declare-fun m!405839 () Bool)

(assert (=> b!272947 m!405839))

(assert (=> b!272890 d!93348))

(declare-fun d!93350 () Bool)

(assert (=> d!93350 (= (inv!12 bs!71) (invariant!0 (currentBit!13107 bs!71) (currentByte!13112 bs!71) (size!6637 (buf!7105 bs!71))))))

(declare-fun bs!23545 () Bool)

(assert (= bs!23545 d!93350))

(assert (=> bs!23545 m!405815))

(assert (=> start!59774 d!93350))

(declare-fun d!93352 () Bool)

(assert (=> d!93352 (= (array_inv!6361 (buf!7105 bs!71)) (bvsge (size!6637 (buf!7105 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272891 d!93352))

(push 1)

(assert (not bm!4388))

(assert (not b!272936))

(assert (not d!93348))

(assert (not b!272947))

(assert (not d!93350))

(assert (not b!272938))

(assert (not d!93338))

(assert (not b!272940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

