; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69944 () Bool)

(assert start!69944)

(declare-fun b!315986 () Bool)

(declare-fun res!259097 () Bool)

(declare-fun e!227136 () Bool)

(assert (=> b!315986 (=> (not res!259097) (not e!227136))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19475 0))(
  ( (array!19476 (arr!9543 (Array (_ BitVec 32) (_ BitVec 8))) (size!8460 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19475)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19475)

(declare-fun arrayBitRangesEq!0 (array!19475 array!19475 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315986 (= res!259097 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315987 () Bool)

(declare-fun res!259092 () Bool)

(assert (=> b!315987 (=> (not res!259092) (not e!227136))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315987 (= res!259092 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315988 () Bool)

(declare-fun res!259094 () Bool)

(assert (=> b!315988 (=> (not res!259094) (not e!227136))))

(declare-fun a3!79 () array!19475)

(assert (=> b!315988 (= res!259094 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315989 () Bool)

(declare-fun res!259096 () Bool)

(assert (=> b!315989 (=> (not res!259096) (not e!227136))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315989 (= res!259096 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315990 () Bool)

(declare-fun res!259093 () Bool)

(assert (=> b!315990 (=> (not res!259093) (not e!227136))))

(assert (=> b!315990 (= res!259093 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315991 () Bool)

(declare-fun res!259090 () Bool)

(assert (=> b!315991 (=> (not res!259090) (not e!227136))))

(assert (=> b!315991 (= res!259090 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315992 () Bool)

(declare-fun res!259095 () Bool)

(assert (=> b!315992 (=> (not res!259095) (not e!227136))))

(assert (=> b!315992 (= res!259095 (not (= i!1020 mid!82)))))

(declare-fun res!259091 () Bool)

(assert (=> start!69944 (=> (not res!259091) (not e!227136))))

(assert (=> start!69944 (= res!259091 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8460 a1!825) (size!8460 a2!825)) (= (size!8460 a2!825) (size!8460 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8460 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8460 a2!825))))))))

(assert (=> start!69944 e!227136))

(assert (=> start!69944 true))

(declare-fun array_inv!8012 (array!19475) Bool)

(assert (=> start!69944 (array_inv!8012 a1!825)))

(assert (=> start!69944 (array_inv!8012 a3!79)))

(assert (=> start!69944 (array_inv!8012 a2!825)))

(declare-fun b!315993 () Bool)

(assert (=> b!315993 (= e!227136 (not true))))

(assert (=> b!315993 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21675 0))(
  ( (Unit!21676) )
))
(declare-fun lt!442781 () Unit!21675)

(declare-fun arrayBitRangesEqDrop1!0 (array!19475 array!19475 (_ BitVec 64) (_ BitVec 64)) Unit!21675)

(assert (=> b!315993 (= lt!442781 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315993 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442780 () Unit!21675)

(declare-fun arrayBitRangesEqAppend!0 (array!19475 array!19475 (_ BitVec 64) (_ BitVec 64)) Unit!21675)

(assert (=> b!315993 (= lt!442780 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69944 res!259091) b!315986))

(assert (= (and b!315986 res!259097) b!315990))

(assert (= (and b!315990 res!259093) b!315991))

(assert (= (and b!315991 res!259090) b!315987))

(assert (= (and b!315987 res!259092) b!315989))

(assert (= (and b!315989 res!259096) b!315988))

(assert (= (and b!315988 res!259094) b!315992))

(assert (= (and b!315992 res!259095) b!315993))

(declare-fun m!453731 () Bool)

(assert (=> b!315989 m!453731))

(declare-fun m!453733 () Bool)

(assert (=> b!315987 m!453733))

(declare-fun m!453735 () Bool)

(assert (=> start!69944 m!453735))

(declare-fun m!453737 () Bool)

(assert (=> start!69944 m!453737))

(declare-fun m!453739 () Bool)

(assert (=> start!69944 m!453739))

(declare-fun m!453741 () Bool)

(assert (=> b!315986 m!453741))

(declare-fun m!453743 () Bool)

(assert (=> b!315988 m!453743))

(declare-fun m!453745 () Bool)

(assert (=> b!315990 m!453745))

(declare-fun m!453747 () Bool)

(assert (=> b!315993 m!453747))

(declare-fun m!453749 () Bool)

(assert (=> b!315993 m!453749))

(declare-fun m!453751 () Bool)

(assert (=> b!315993 m!453751))

(declare-fun m!453753 () Bool)

(assert (=> b!315993 m!453753))

(push 1)

(assert (not start!69944))

(assert (not b!315988))

(assert (not b!315990))

(assert (not b!315989))

(assert (not b!315987))

(assert (not b!315993))

(assert (not b!315986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

